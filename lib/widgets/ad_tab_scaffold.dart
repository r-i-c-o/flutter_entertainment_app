import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarot/repositories/card_description_observer.dart';

class AdTabScaffold extends StatefulWidget {
  final CupertinoTabBar tabBar;
  final IndexedWidgetBuilder tabBuilder;
  final List<CardDescriptionObserver> observers;

  const AdTabScaffold({
    Key? key,
    required this.tabBar,
    required this.tabBuilder,
    required this.observers,
  }) : super(key: key);
  @override
  AdTabScaffoldState createState() => AdTabScaffoldState();

  static AdTabScaffoldState? of(BuildContext context) {
    return context.findAncestorStateOfType<AdTabScaffoldState>();
  }
}

class AdTabScaffoldState extends State<AdTabScaffold> {
  late final ValueNotifier<int> _controller;
  late final ValueNotifier<bool> _showBanner;

  void setPage(int index) => _controller.value = index;

  void checkBanner(int indexOfObserver, bool isCardDescription) {
    _showBanner.value =
        !(_controller.value == indexOfObserver && isCardDescription);
  }

  @override
  void initState() {
    super.initState();
    _controller = ValueNotifier(widget.tabBar.currentIndex);
    _showBanner = ValueNotifier(true);
    widget.observers.forEach((element) {
      element.state = this;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _showBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: _controller,
              builder: (_, value, __) => _TabSwitchingView(
                currentTabIndex: value,
                tabCount: widget.tabBar.items.length,
                tabBuilder: widget.tabBuilder,
              ),
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: _controller,
            builder: (_, value, __) => widget.tabBar.copyWith(
              currentIndex: value,
              onTap: (int newIndex) {
                _controller.value = newIndex;
                widget.tabBar.onTap?.call(newIndex);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TabSwitchingView extends StatefulWidget {
  const _TabSwitchingView({
    required this.currentTabIndex,
    required this.tabCount,
    required this.tabBuilder,
  }) : assert(tabCount > 0);

  final int currentTabIndex;
  final int tabCount;
  final IndexedWidgetBuilder tabBuilder;

  @override
  _TabSwitchingViewState createState() => _TabSwitchingViewState();
}

class _TabSwitchingViewState extends State<_TabSwitchingView> {
  final List<bool> shouldBuildTab = <bool>[];
  final List<FocusScopeNode> tabFocusNodes = <FocusScopeNode>[];

  final List<FocusScopeNode> discardedNodes = <FocusScopeNode>[];

  @override
  void initState() {
    super.initState();
    shouldBuildTab.addAll(List<bool>.filled(widget.tabCount, false));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _focusActiveTab();
  }

  @override
  void didUpdateWidget(_TabSwitchingView oldWidget) {
    super.didUpdateWidget(oldWidget);

    final int lengthDiff = widget.tabCount - shouldBuildTab.length;
    if (lengthDiff > 0) {
      shouldBuildTab.addAll(List<bool>.filled(lengthDiff, false));
    } else if (lengthDiff < 0) {
      shouldBuildTab.removeRange(widget.tabCount, shouldBuildTab.length);
    }
    _focusActiveTab();
  }

  void _focusActiveTab() {
    if (tabFocusNodes.length != widget.tabCount) {
      if (tabFocusNodes.length > widget.tabCount) {
        discardedNodes.addAll(tabFocusNodes.sublist(widget.tabCount));
        tabFocusNodes.removeRange(widget.tabCount, tabFocusNodes.length);
      } else {
        tabFocusNodes.addAll(
          List<FocusScopeNode>.generate(
            widget.tabCount - tabFocusNodes.length,
            (int index) => FocusScopeNode(),
          ),
        );
      }
    }
    FocusScope.of(context).setFirstFocus(tabFocusNodes[widget.currentTabIndex]);
  }

  @override
  void dispose() {
    for (final FocusScopeNode focusScopeNode in tabFocusNodes) {
      focusScopeNode.dispose();
    }
    for (final FocusScopeNode focusScopeNode in discardedNodes) {
      focusScopeNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: List<Widget>.generate(widget.tabCount, (int index) {
        final bool active = index == widget.currentTabIndex;
        shouldBuildTab[index] = active || shouldBuildTab[index];

        return HeroMode(
          enabled: active,
          child: Offstage(
            offstage: !active,
            child: TickerMode(
              enabled: active,
              child: FocusScope(
                node: tabFocusNodes[index],
                child: Builder(builder: (BuildContext context) {
                  return shouldBuildTab[index]
                      ? widget.tabBuilder(context, index)
                      : Container();
                }),
              ),
            ),
          ),
        );
      }),
    );
  }
}

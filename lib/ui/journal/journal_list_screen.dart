import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarot/repositories/navigation_helper.dart';
import 'package:tarot/models/spread_categories_info.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/ui/journal/journal_bloc.dart';
import 'package:tarot/ui/journal/journal_button_stream.dart';
import 'package:tarot/ui/saved_detail/saved_detail_screen.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/gradient_blur.dart';
import 'package:tarot/widgets/inner_shadow.dart';

class JournalListScreen extends StatefulWidget with PlanetScreenMixin {
  static const routeName = '/journalList';
  const JournalListScreen({Key? key}) : super(key: key);

  @override
  _JournalListScreenState createState() => _JournalListScreenState();

  @override
  PlanetOffset? get planetOne => journalList_1;

  @override
  PlanetOffset? get planetTwo => journalList_2;

  @override
  String? get screenRouteName => routeName;
}

class _JournalListScreenState extends State<JournalListScreen> {
  late final JournalBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = JournalBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTopBar(
          shrink: true,
          title: 'My Journal',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: StreamBuilder<bool>(
              stream: bloc.buttonMode,
              initialData: true,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  bool isCardOfDay = snapshot.data!;
                  return Row(
                    children: [
                      SavedTypeTab(
                        title: 'DAILY CARDS',
                        active: isCardOfDay,
                        onTap: () => bloc.getCardsOfDay(),
                      ),
                      SavedTypeTab(
                        title: 'SPREADS',
                        active: !isCardOfDay,
                        onTap: () => bloc.getSpreads(),
                      ),
                    ],
                  );
                }
                return Container();
              }),
        ),
        Expanded(
          child: StreamBuilder<Future<List<SavedSpread>>>(
            stream: bloc.savedList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Container();
              if (snapshot.hasError) {
                return Center(child: Text('Error occurred'));
              }
              if (snapshot.hasData) {
                final list = snapshot.data!;
                //..sort((a, b) => b.date.compareTo(a.date));
                return FutureBuilder<List<SavedSpread>>(
                  future: list,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Container();
                    if (snapshot.hasError) {
                      return Center(child: Text('Error occurred'));
                    }
                    if (snapshot.hasData) {
                      final list = snapshot.data!
                        ..sort((a, b) => b.date.compareTo(a.date));
                      if (list.isNotEmpty)
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final item = list[index];
                            return SavedSpreadItem(
                              spreadCategory: item.spreadType,
                              spreadName: item.spreadName,
                              emotion: item.emotion,
                              question: item.question,
                              date: item.date,
                              onPressed: () {
                                Navigator.of(context).push(
                                  PlanetMaterialPageRoute(
                                    widget: SavedDetailScreen(
                                      savedSpread: item,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      else
                        return Center(child: Text('No saved spreads.'));
                    } else
                      return Center(child: CircularProgressIndicator());
                  },
                );
              } else
                return Center(child: CircularProgressIndicator());
            },
          ),
          /*child: StreamBuilder<List<SavedSpread>>(
            stream: bloc.savedList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Container();
              if (snapshot.hasError) {
                return Center(child: Text('Error occurred'));
              }
              if (snapshot.hasData) {
                final list = snapshot.data!
                  ..sort((a, b) => b.date.compareTo(a.date));
                if (list.isNotEmpty)
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return SavedSpreadItem(
                        spreadCategory: item.spreadType,
                        spreadName: item.spreadName,
                        emotion: item.emotion,
                        question: item.question,
                        date: item.date,
                        onPressed: () {
                          NavigationHelper.instance.tabbedPush(
                            PlanetPage.Journal,
                            MaterialPageRoute(
                              builder: (context) => SavedDetailScreen(
                                savedSpread: item,
                              ),
                              settings: RouteSettings(
                                  name: SavedDetailScreen.routeName),
                            ),
                          );
                        },
                      );
                    },
                  );
                else
                  return Center(child: Text('No saved spreads.'));
              } else
                return Center(child: CircularProgressIndicator());
            },
          ),*/
        ),
      ],
    );
  }
}

class SavedTypeTab extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool active;

  const SavedTypeTab(
      {Key? key, required this.title, this.onTap, required this.active})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget content = GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: active
                ? AppColors.mainMenuListBackground
                : Colors.white.withOpacity(0.16),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: AppColors.mainShadow,
                      offset: Offset(
                        0.0,
                        5.0,
                      ),
                      blurRadius: 5,
                      spreadRadius: 0.1,
                    ),
                  ]
                : null,
            borderRadius: BorderRadius.circular(16.0),
          ),
          clipBehavior: Clip.hardEdge,
          child: active
              ? InnerShadow(
                  shadowSize: 24.0,
                  shadowColor: AppColors.mainShadow,
                  child: content,
                )
              : content,
        ),
      ),
    );
  }
}

class SavedSpreadItem extends StatelessWidget {
  final String? spreadName;
  final int spreadCategory;
  final int emotion;
  final String question;
  final int date;
  final VoidCallback onPressed;
  const SavedSpreadItem({
    Key? key,
    this.spreadName,
    required this.emotion,
    required this.question,
    required this.date,
    required this.onPressed,
    required this.spreadCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: GestureDetector(
        onTap: onPressed,
        child: GradientBlur(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      tabsInfo[spreadCategory].img,
                      width: 20.0,
                      height: 20.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      tabsInfo[spreadCategory].title,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: AppColors.semiTransparentWhiteText,
                      ),
                    ),
                    Spacer(),
                    Text(
                      DateFormat('MM.dd.yyyy')
                          .format(DateTime.fromMillisecondsSinceEpoch(date)),
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: AppColors.semiTransparentWhiteText,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (spreadName ?? 'Card of the Day').toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                            Text(
                              'My question:',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColors.semiTransparentWhiteText,
                              ),
                            ),
                            Text(question),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/emotions/$emotion.png',
                        width: 64.0,
                        height: 64.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Divider(
                    height: 2.0,
                    thickness: 2.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('View details',
                          style: TextStyle(color: Colors.orange)),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/repositories/navigation_helper.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/ui/handbook_articles/article_base.dart';
import 'package:tarot/ui/handbook_articles/bad_cards.dart';
import 'package:tarot/ui/handbook_articles/best_cards_love.dart';
import 'package:tarot/models/handbook_suit_data.dart';
import 'package:tarot/ui/handbook_articles/how_choose_spread.dart';
import 'package:tarot/ui/handbook_articles/how_tarot_works.dart';
import 'package:tarot/ui/handbook_articles/how_to_question.dart';
import 'package:tarot/ui/handbook_articles/read_celtic.dart';
import 'package:tarot/ui/handbook_articles/seven_tips.dart';
import 'package:tarot/ui/handbook_articles/suit_description.dart';
import 'package:tarot/ui/handbook_articles/unlock_secrets.dart';
import 'package:tarot/ui/handbook_card_description/handbook_card_description.dart';
import 'package:tarot/theme/app_colors.dart';
import 'package:tarot/widgets/gradient_blur.dart';
import 'package:tarot/widgets/gradient_inner_shadow.dart';

class HandBookScreen extends StatelessWidget with PlanetScreenMixin {
  HandBookScreen({Key? key})
      : nav = GetIt.I.get<NavigationHelper>(),
        super(key: key);

  final NavigationHelper nav;
  static const String routeName = '/handbook';

  @override
  PlanetOffset? get planetOne => handbook_1;

  @override
  PlanetOffset? get planetTwo => handbook_2;

  @override
  String? get screenRouteName => routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 250.0,
              backgroundColor: Color(0xFF142431),
              foregroundColor: AppColors.textColor,
              title: Text(
                'Tarot Handbook',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/handbook_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    nav.onBackPressed();
                  },
                ),
              ),
              pinned: true,
              bottom: DecoratedTabBar(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.appBarColor.withOpacity(0.0),
                      AppColors.appBarColor,
                    ],
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.semiTransparentWhiteText,
                      width: 2.0,
                    ),
                  ),
                ),
                tabBar: TabBar(
                  unselectedLabelColor: AppColors.semiTransparentWhiteText,
                  labelColor: AppColors.colorAccent,
                  tabs: [
                    Tab(
                      text: 'Lessons',
                    ),
                    Tab(
                      text: 'Articles',
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              LessonsPage(),
              ArticlesPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  DecoratedTabBar({required this.tabBar, required this.decoration});

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}

class LessonsPage extends StatelessWidget {
  LessonsPage({Key? key}) : super(key: key);

  final List<HandbookSuitData> _spreadData = [
    HandbookSuitData.major(),
    HandbookSuitData.cups(),
    HandbookSuitData.swords(),
    HandbookSuitData.pentacles(),
    HandbookSuitData.wands(),
  ];

  Iterable<Widget> _generateChildren(BuildContext context) sync* {
    for (HandbookSuitData suit in _spreadData) {
      yield GestureDetector(
        onTap: () {
          final suitScreen = SuitDescription(suit: suit);
          Navigator.of(context).push(
            PlanetMaterialPageRoute(
              widget: suitScreen,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Stack(
            children: [
              GradientBlur(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        suit.img,
                        width: 64.0,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tarot: ${suit.title}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              suit.meaning,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: AppColors.semiTransparentWhiteText),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.0),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 12.0,
                top: 12.0,
                child: Icon(
                  Icons.arrow_right_alt,
                  color: Colors.orange,
                  size: 32.0,
                ),
              )
            ],
          ),
        ),
      );
      yield Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            '${suit.title} Cards Descrition',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      );
      yield CardsPageView(
        cardOffset: suit.cardsOffset,
        cards: suit.cards,
      );
    }
  }

  /*List<Widget> _generateChildren(BuildContext context) {
    List<Widget> children = [];
    _spreadData.forEach((suit) {
      children.add(
        GestureDetector(
          onTap: () {
            final suitScreen = SuitDescription(suit: suit);
            Navigator.of(context).push(
              PlanetPage.HandbookRelated,
              MaterialPageRoute(
                builder: (context) => suitScreen,
                settings: RouteSettings(name: suitScreen.routeName),
              ),
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Stack(
              children: [
                GradientBlur(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          suit.img,
                          width: 64.0,
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tarot: ${suit.title}',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                              Text(
                                suit.meaning,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: AppColors.semiTransparentWhiteText),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 12.0,
                  top: 12.0,
                  child: Icon(
                    Icons.arrow_right_alt,
                    color: Colors.orange,
                    size: 32.0,
                  ),
                )
              ],
            ),
          ),
        ),
      );
      children.add(
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '${suit.title} Cards Descrition',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      );
      children.add(CardsPageView(
        cardOffset: suit.cardsOffset,
        cards: suit.cards,
      ));
    });
    return children;
  }*/

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: _generateChildren(context).toList(),
      physics: BouncingScrollPhysics(),
    );
  }
}

class ArticlesPage extends StatelessWidget {
  ArticlesPage({Key? key}) : super(key: key);

  final List<ArticleBase> _articles = [
    HowTarotWorks(),
    AboutCelticCross(),
    BestCardsForLove(),
    UnlockingSecrets(),
    BadCards(),
    SevenTips(),
    HowToQuestion(),
    HowChooseSpread(),
  ];

  final List<String> _assets = [
    'article_how_works.jpeg',
    'article_cross.jpeg',
    'article_question.png',
    'article_love.png',
    'article_unlock.jpeg',
    'article_bad.jpeg',
    'article_bg.png',
    'article_question.png',
    'article_choose_spread.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _articles.length,
      itemBuilder: (context, index) {
        final article = _articles[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PlanetMaterialPageRoute(
                  widget: article,
                ),
              );
            },
            child: GradientInnerShadow(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/articles/${_assets[index]}',
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    indent: 24.0,
                    endIndent: 24.0,
                    color: AppColors.semiTransparentWhiteText,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Read article',
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
        );
      },
    );
  }
}

class CardsPageView extends StatefulWidget {
  final List<TarotCard> cards;
  final int cardOffset;
  const CardsPageView({Key? key, required this.cards, required this.cardOffset})
      : super(key: key);

  @override
  _CardsPageViewState createState() => _CardsPageViewState();
}

class _CardsPageViewState extends State<CardsPageView> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            physics: BouncingScrollPhysics(),
            itemCount: widget.cards.length,
            itemBuilder: (context, index) => AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                double page;
                //TODO remove this hack after fixing https://github.com/flutter/flutter/issues/85867
                try {
                  page = controller.page ?? 0.0;
                } catch (e) {
                  page = 0.0;
                }
                return Transform.scale(
                  scale: 1.0 - (page - index).abs().clamp(0.0, 0.2),
                  child: child,
                );
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PlanetMaterialPageRoute(
                      widget: HandbookCardDescription(
                        cardIndex: index + widget.cardOffset,
                      ),
                    ),
                  );
                },
                child: Image.asset(
                    CardFacesDirectory.cardFace(widget.cards[index].imgAsset)),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            double page;
            //TODO remove this hack after fixing https://github.com/flutter/flutter/issues/85867
            try {
              page = controller.page ?? 0.0;
            } catch (e) {
              page = 0.0;
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.cards[page.toInt()].name),
            );
          },
        ),
      ],
    );
  }
}

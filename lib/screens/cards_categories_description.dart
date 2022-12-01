import 'package:flutter/material.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/screens/single_category_cards_grid.dart';
import 'package:tarot/widgets/appbar.dart';
import 'package:tarot/widgets/gradient_border.dart';

class CardsCategoriesDescription extends StatelessWidget
    with PlanetScreenMixin {
  @override
  PlanetOffset? get planetOne => handbook_1;

  @override
  PlanetOffset? get planetTwo => handbook_2;

  @override
  String? get screenRouteName => '/handbook_cards_categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTopBar(title: 'Cards Descriptions'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CardCategoryItem(
                      title: 'Major\nArcana',
                      onTap: () {
                        Navigator.of(context).push(
                          PlanetMaterialPageRoute.withSettings(
                            widget: SingleCategoryCardsGrid(
                              category: CardCategories.major(),
                            ),
                            settings:
                                RouteSettings(name: '/handbook_cards_major'),
                          ),
                        );
                      },
                      imgAsset:
                          'assets/images/cards_faces/blue/highpriestess.png',
                    ),
                    CardCategoryItem(
                      title: 'Minor\nArcana',
                      subtitle: 'Cups',
                      onTap: () {
                        Navigator.of(context).push(
                          PlanetMaterialPageRoute.withSettings(
                            widget: SingleCategoryCardsGrid(
                              category: CardCategories.cups(),
                            ),
                            settings:
                                RouteSettings(name: '/handbook_cards_cups'),
                          ),
                        );
                      },
                      imgAsset: 'assets/images/cards_faces/blue/aceofcups.png',
                    ),
                    CardCategoryItem(
                      title: 'Minor\nArcana',
                      subtitle: 'Swords',
                      onTap: () {
                        Navigator.of(context).push(
                          PlanetMaterialPageRoute.withSettings(
                            widget: SingleCategoryCardsGrid(
                              category: CardCategories.swords(),
                            ),
                            settings:
                                RouteSettings(name: '/handbook_cards_swords'),
                          ),
                        );
                      },
                      imgAsset:
                          'assets/images/cards_faces/blue/aceofswords.png',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    CardCategoryItem(
                      title: 'Minor\nArcana',
                      subtitle: 'Pentacles',
                      onTap: () {
                        Navigator.of(context).push(
                          PlanetMaterialPageRoute.withSettings(
                            widget: SingleCategoryCardsGrid(
                              category: CardCategories.pentacles(),
                            ),
                            settings: RouteSettings(
                                name: '/handbook_cards_pentacles'),
                          ),
                        );
                      },
                      imgAsset:
                          'assets/images/cards_faces/blue/aceofpentacles.png',
                    ),
                    CardCategoryItem(
                      title: 'Minor\nArcana',
                      subtitle: 'Wands',
                      onTap: () {
                        Navigator.of(context).push(
                          PlanetMaterialPageRoute.withSettings(
                            widget: SingleCategoryCardsGrid(
                              category: CardCategories.wands(),
                            ),
                            settings:
                                RouteSettings(name: '/handbook_cards_wands'),
                          ),
                        );
                      },
                      imgAsset: 'assets/images/cards_faces/blue/aceofwands.png',
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardCategoryItem extends StatelessWidget {
  final String imgAsset;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CardCategoryItem(
      {Key? key,
      required this.imgAsset,
      required this.title,
      this.subtitle = '',
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                FittedBox(
                  fit: BoxFit.none,
                  child: Image.asset(
                    imgAsset,
                    width: 200.0,
                    height: 280.0,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0x000000FF),
                          Color(0xFF0000FF).withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4.0,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFDBC087),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: GradientBorder(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

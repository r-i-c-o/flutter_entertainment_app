import 'package:flutter/material.dart';
import 'package:tarot/repositories/card_faces_directory.dart';
import 'package:tarot/models/tarot_card/cards.dart';
import 'package:tarot/models/tarot_card/tarot_card.dart';
import 'package:tarot/planets/default_positions.dart';
import 'package:tarot/planets/planet_page_route.dart';
import 'package:tarot/planets/planet_position.dart';
import 'package:tarot/planets/planet_screen.dart';
import 'package:tarot/ui/handbook_card_description/handbook_card_description.dart';
import 'package:tarot/widgets/appbar.dart';

class SingleCategoryCardsGrid extends StatefulWidget with PlanetScreenMixin {
  final CardCategories category;

  SingleCategoryCardsGrid({Key? key, required this.category}) : super(key: key);

  @override
  _SingleCategoryCardsGridState createState() => _SingleCategoryCardsGridState();

  @override
  PlanetOffset? get planetOne => handbook_1;

  @override
  PlanetOffset? get planetTwo => handbook_2;

  @override
  String? get screenRouteName => null;
}

class _SingleCategoryCardsGridState extends State<SingleCategoryCardsGrid> {
  ScrollController _controller = ScrollController();
  List<TarotCard> _cards = [];
  int _cardIndexOffset = 0;

  @override
  void initState() {
    super.initState();
    _cards = widget.category.cards;
    _cardIndexOffset = widget.category.cardIndexOffset;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80.0),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => AnimatedOpacity(
            opacity: _controller.hasClients ? (1.0 - _controller.offset / 50.0).clamp(0.0, 1.0).toDouble() : 1.0,
            duration: const Duration(seconds: 0),
            child: child,
          ),
          child: AppTopBar(title: widget.category.title),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 5 / 7,
          ),
          itemCount: _cards.length,
          itemBuilder: (context, index) {
            return CardGridItem(
              title: _cards[index].name,
              imgAsset: CardFacesDirectory.cardFaceDirectory() + _cards[index].imgAsset,
              onTap: () {
                Navigator.of(context).push(
                  PlanetMaterialPageRoute(
                    widget: HandbookCardDescription(
                      cardIndex: index + _cardIndexOffset,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CardGridItem extends StatelessWidget {
  final String imgAsset;
  final String title;
  final VoidCallback? onTap;

  const CardGridItem({Key? key, required this.imgAsset, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Image.asset(
                imgAsset,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0x0000176B),
                        Color(0xFF00176B).withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 4.0,
                left: 0.0,
                right: 0.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFDBC087),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardCategories {
  final String title;
  final List<TarotCard> cards;
  final int cardIndexOffset;

  CardCategories.major()
      : title = 'Major Arcana',
        cards = majorArcana(),
        cardIndexOffset = 0;

  CardCategories.cups()
      : title = 'Minor Arcana: Cups',
        cards = cups(),
        cardIndexOffset = 22;

  CardCategories.swords()
      : title = 'Minor Arcana: Swords',
        cards = swords(),
        cardIndexOffset = 36;

  CardCategories.pentacles()
      : title = 'Minor Arcana: Pentacles',
        cards = pentacles(),
        cardIndexOffset = 50;

  CardCategories.wands()
      : title = 'Minor Arcana: Wands',
        cards = wands(),
        cardIndexOffset = 64;
}

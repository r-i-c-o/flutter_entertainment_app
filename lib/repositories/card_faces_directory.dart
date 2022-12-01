// Utility class for many card decks. Default is set to 'blue'
class CardFacesDirectory {
  static String cardFaceDirectory() => 'assets/images/cards_faces/blue/';
  static String cardFace(String imgAsset) => "${cardFaceDirectory()}$imgAsset";
}

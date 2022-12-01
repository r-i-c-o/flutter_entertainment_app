import 'package:floor/floor.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';

@dao
abstract class SavedDao {
  @insert
  Future<void> addToSaved(SavedSpread spread);

  @Query('SELECT * FROM saved')
  Future<List<SavedSpread>?> getSavedAmount();
}

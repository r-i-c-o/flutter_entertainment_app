import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:tarot/saved_db/saved_dao.dart';
import 'package:tarot/models/saved_spread/saved_spread.dart';

part 'saved_database.g.dart';

@Database(version: 1, entities: [SavedSpread])
abstract class SavedDatabase extends FloorDatabase {
  SavedDao get dao;
}

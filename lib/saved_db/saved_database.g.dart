// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorSavedDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SavedDatabaseBuilder databaseBuilder(String name) =>
      _$SavedDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SavedDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$SavedDatabaseBuilder(null);
}

class _$SavedDatabaseBuilder {
  _$SavedDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$SavedDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SavedDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SavedDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$SavedDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SavedDatabase extends SavedDatabase {
  _$SavedDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SavedDao? _daoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `saved` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `spreadName` TEXT, `spreadType` INTEGER NOT NULL, `emotion` INTEGER NOT NULL, `date` INTEGER NOT NULL, `question` TEXT NOT NULL, `note` TEXT NOT NULL, `labels` TEXT NOT NULL, `cardsJson` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SavedDao get dao {
    return _daoInstance ??= _$SavedDao(database, changeListener);
  }
}

class _$SavedDao extends SavedDao {
  _$SavedDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _savedSpreadInsertionAdapter = InsertionAdapter(
            database,
            'saved',
            (SavedSpread item) => <String, Object?>{
                  'id': item.id,
                  'spreadName': item.spreadName,
                  'spreadType': item.spreadType,
                  'emotion': item.emotion,
                  'date': item.date,
                  'question': item.question,
                  'note': item.note,
                  'labels': item.labels,
                  'cardsJson': item.cardsJson
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SavedSpread> _savedSpreadInsertionAdapter;

  @override
  Future<List<SavedSpread>?> getSavedAmount() async {
    return _queryAdapter.queryList('SELECT * FROM saved',
        mapper: (Map<String, Object?> row) => SavedSpread(
            row['spreadType'] as int,
            row['spreadName'] as String?,
            row['emotion'] as int,
            row['date'] as int,
            row['question'] as String,
            row['note'] as String,
            row['labels'] as String,
            row['cardsJson'] as String));
  }

  @override
  Stream<List<SavedSpread>> getSaved() {
    return _queryAdapter.queryListStream('SELECT * FROM saved',
        mapper: (Map<String, Object?> row) => SavedSpread(
            row['spreadType'] as int,
            row['spreadName'] as String?,
            row['emotion'] as int,
            row['date'] as int,
            row['question'] as String,
            row['note'] as String,
            row['labels'] as String,
            row['cardsJson'] as String),
        queryableName: 'saved',
        isView: false);
  }

  @override
  Future<void> addToSaved(SavedSpread spread) async {
    await _savedSpreadInsertionAdapter.insert(spread, OnConflictStrategy.abort);
  }
}

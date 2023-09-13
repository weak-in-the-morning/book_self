import 'dart:io';

import 'package:app/logic/get_book_data.dart';
import 'package:uuid/uuid.dart';
import 'package:app/data/book_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class DatabaseHelper {
  static const String _databaseName = "BookSelfDatabase1.db"; // DB名
  static const int _databaseVersion = 1; // スキーマのバージョン指定

  final String table = 'books'; // テーブル名

  static String columnId = 'id'; // カラム名: id
  static String columnName = 'name'; // カラム名: name
  static String columnNum = 'num'; // カラム名: num
  static String columnService = 'service'; // カラム名: service
  static String columnHasRead = 'has_read'; // カラム名: has_read
  static String columnFavorite = 'favorite'; // カラム名: favorite
  static String columnTag = 'tag'; // カラム名: tag
  static String columnMemo = 'memo'; // カラム名: memo
  static String columnCreated = 'created_at'; // カラム名: created_at
  static String columnUpdated = 'updated_at'; // カラム名: updated_at
  static String columnUrlSearch = 'url_search'; // カラム名: url_search
  static String columnUrlImage = 'url_image'; // カラム名: url_image

  // DatabaseHelper クラスを定義
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Databaseクラス型のstatic変数_databaseを宣言
  // クラスはインスタンス化しない
  static Database? _database;

  // databaseメソッド定義
  // 非同期処理
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // データベース接続
  _initDatabase() async {
    // アプリケーションのドキュメントディレクトリのパスを取得
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // 取得パスを基に、データベースのパスを生成
    String path = join(documentsDirectory.path, _databaseName);

    // データベース接続
    return await openDatabase(path,
        version: _databaseVersion,
        // テーブル作成メソッドの呼び出し
        onCreate: _onCreate);
  }

  // テーブル作成
  // 引数:dbの名前
  // 引数:スキーマーのversion
  // スキーマーのバージョンはテーブル変更時にバージョンを上げる（テーブル・カラム追加・変更・削除など）
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId TEXT PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnNum INTEGER NOT NULL,
            $columnService TEXT NOT NULL,
            $columnHasRead INTEGER NOT NULL,
            $columnFavorite INTEGER NOT NULL,
            $columnTag TEXT,
            $columnMemo TEXT,
            $columnCreated TEXT NOT NULL,
            $columnUpdated TEXT NOT NULL,
            $columnUrlSearch TEXT,
            $columnUrlImage TEXT
          )
          ''');
  }

  // 登録処理
  // BookDataのidはデフォルトの空文字列から変更せずに渡す
  Future<int> insert(BookData book) async {
    Database? db = await instance.database;
    const uuid = Uuid();
    final String now = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    final int hasReadInt = book.hasRead ? 1 : 0;
    final int favoriteInt = book.favorite ? 1 : 0;
    String urlImage = await getBookImageUrl(book.name);
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: uuid.v4(),
      DatabaseHelper.columnName: book.name,
      DatabaseHelper.columnNum: book.num,
      DatabaseHelper.columnService: book.service,
      DatabaseHelper.columnHasRead: hasReadInt,
      DatabaseHelper.columnFavorite: favoriteInt,
      DatabaseHelper.columnTag: book.tag,
      DatabaseHelper.columnMemo: book.memo,
      DatabaseHelper.columnCreated: now,
      DatabaseHelper.columnUpdated: now,
      DatabaseHelper.columnUrlSearch: book.urlSearch,
      DatabaseHelper.columnUrlImage: urlImage,
    };
    return await db!.insert(table, row);
  }

  // 照会処理
  Future<List<BookData>> queryAllRows() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> rows = await db!.query(table);
    List<BookData> books = [];
    for (Map<String, dynamic> row in rows) {
      BookData book = await mapToBookData(row);
      books.add(book);
    }
    return books;
  }

  // レコード数を確認
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // 本の名前から曖昧検索
  Future<List<BookData>> searchName(String name) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> rows = await db!.rawQuery(
        "SELECT * FROM $table WHERE $columnName LIKE ? ORDER BY $columnUpdated",
        ['%$name%']);
    List<BookData> books = [];
    for (Map<String, dynamic> row in rows) {
      BookData book = await mapToBookData(row);
      books.add(book);
    }
    return books;
  }

  // 更新処理
  Future<int> update(BookData book) async {
    Database? db = await instance.database;
    String id = book.id;
    final String now = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    final int hasReadInt = book.hasRead ? 1 : 0;
    final int favoriteInt = book.favorite ? 1 : 0;
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: book.name,
      DatabaseHelper.columnNum: book.num,
      DatabaseHelper.columnService: book.service,
      DatabaseHelper.columnHasRead: hasReadInt,
      DatabaseHelper.columnFavorite: favoriteInt,
      DatabaseHelper.columnTag: book.tag,
      DatabaseHelper.columnMemo: book.memo,
      DatabaseHelper.columnUpdated: now,
      DatabaseHelper.columnUrlSearch: book.urlSearch,
    };
    return await db!
        .update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // 削除処理
  Future<int> deleteId(String id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteName(String name) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnName = ?', whereArgs: [name]);
  }

  Future<BookData> mapToBookData(Map<String, dynamic> row) async {
    bool hasRead = (row[columnHasRead] == 1) ? true : false;
    bool favorite = (row[columnFavorite] == 1) ? true : false;
    BookData book = BookData(
      id: row[columnId],
      name: row[columnName],
      num: row[columnNum],
      service: row[columnService],
      hasRead: hasRead,
      favorite: favorite,
      tag: row[columnTag],
      memo: row[columnMemo],
      urlSearch: row[columnUrlSearch],
      urlImage: row[columnUrlImage],
    );
    return book;
  }
}

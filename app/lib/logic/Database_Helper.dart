// Database_Helper.dart

import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class DatabaseHelper {
  static final String _databaseName = "BookSelfDatabase.db"; // DB名
  static final int _databaseVersion = 1; // スキーマのバージョン指定

  static final String table = 'books'; // テーブル名

  static final String columnId = 'id'; // カラム名: id
  static final String columnName = 'name'; // カラム名: name
  static final String columnNum = 'num'; // カラム名: num
  static final String columnService = 'service'; // カラム名: service
  static final String columnHas_read = 'has_read'; // カラム名: has_read
  static final String columnFavorite = 'favorite'; // カラム名: favorite
  static final String columnTag = 'tag'; // カラム名: tag
  static final String columnMemo = 'memo'; // カラム名: memo
  static final String columnCreated = 'created_at'; // カラム名: created_at
  static final String columnUpdated = 'updated_at'; // カラム名: updated_at
  static final String columnUrl_search = 'url_search'; // カラム名: url_search
  static final String columnUrl_image = 'url_image'; // カラム名: url_image

  // DatabaseHelper クラスを定義
  DatabaseHelper._privateConstructor();
  // DatabaseHelper._privateConstructor() コンストラクタを使用して生成されたインスタンスを返すように定義
  // DatabaseHelper クラスのインスタンスは、常に同じものであるという保証
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Databaseクラス型のstatic変数_databaseを宣言
  // クラスはインスタンス化しない
  static Database? _database;

  // databaseメソッド定義
  // 非同期処理
  Future<Database?> get database async {
    // _databaseがNULLか判定
    // NULLの場合、_initDatabaseを呼び出しデータベースの初期化し、_databaseに返す
    // NULLでない場合、そのまま_database変数を返す
    // これにより、データベースを初期化する処理は、最初にデータベースを参照するときにのみ実行されるようになります。
    // このような実装を「遅延初期化 (lazy initialization)」と呼びます。
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
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnNum INTEGER NOT NULL,
            $columnService TEXT NOT NULL,
            $columnHas_read INTEGER NOT NULL,
            $columnFavorite INTEGER NOT NULL,
            $columnTag TEXT,
            $columnMemo TEXT,
            $columnCreated TEXT NOT NULL,
            $columnUpdated TEXT NOT NULL,
            $columnUrl_search TEXT,
            $columnUrl_image TEXT
          )
          ''');
  }

  // 登録処理
  Future<int> insert(BookData book) async {
    Database? db = await instance.database;
    final String now = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    final int has_read_int = book.has_read ? 1 : 0;
    final int favorite_int = book.favorite ? 1 : 0;
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: book.name,
      DatabaseHelper.columnNum: book.num,
      DatabaseHelper.columnService: book.service,
      DatabaseHelper.columnHas_read: has_read_int,
      DatabaseHelper.columnFavorite: favorite_int,
      DatabaseHelper.columnTag: book.tag,
      DatabaseHelper.columnMemo: book.memo,
      DatabaseHelper.columnCreated: now,
      DatabaseHelper.columnUpdated: now,
      DatabaseHelper.columnUrl_search: book.url_search,
      DatabaseHelper.columnUrl_image: book.url_image,
    };
    return await db!.insert(table, row);
  }

  // 照会処理
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  // レコード数を確認
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // 更新処理
  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!
        .update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // 削除処理
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  // 時刻のformat
  Future<DateTime> stringToDateTime(String time) async {
    return DateFormat("yyyy-MM-dd HH:mm:ss").parse(time);
  }

  Future<String> dateTimeToString(DateTime time) async {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(time);
  }

  // boolのformat
  Future<int> boolToInt(bool b) async {
    return b ? 1 : 0;
  }

  Future<bool> intToBool(int i) async {
    return i == 0 ? false : true;
  }
}

class BookData {
  int id = 0;
  String name = "";
  int num = 0;
  String service = "";
  bool has_read = false;
  bool favorite = false;
  String tag = "";
  String memo = "";
  DateTime created = DateTime.now();
  DateTime updated = DateTime.now();
  String url_search = "";
  String url_image = "";

  BookData(
      this.id,
      this.name,
      this.num,
      this.service,
      this.has_read,
      this.favorite,
      this.tag,
      this.memo,
      this.created,
      this.updated,
      this.url_search,
      this.url_image);
}

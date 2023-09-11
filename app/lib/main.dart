import 'package:app/logic/Database_Helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // DatabaseHelper クラスのインスタンス取得
  final dbHelper = DatabaseHelper.instance;

  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLiteデモ'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: Text(
                '登録',
                style: TextStyle(fontSize: 35),
              ),
              onPressed: _insert,
            ),
            ElevatedButton(
              child: Text(
                '照会',
                style: TextStyle(fontSize: 35),
              ),
              onPressed: _query,
            ),
            ElevatedButton(
              child: Text(
                '更新',
                style: TextStyle(fontSize: 35),
              ),
              onPressed: _update,
            ),
            ElevatedButton(
              child: Text(
                '削除',
                style: TextStyle(fontSize: 35),
              ),
              onPressed: _delete,
            ),
          ],
        ),
      ),
    );
  }

  // 登録ボタンクリック
  void _insert() async {
    // row to insert
    BookData book;

    final id = await dbHelper.insert(book);
    print('登録しました。id: $id');
  }

  // 照会ボタンクリック
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('全てのデータを照会しました。');
    allRows.forEach(print);
  }

  // 更新ボタンクリック
  void _update() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: '鈴木　一郎',
      DatabaseHelper.columnNum: 48
    };
    final rowsAffected = await dbHelper.update(row);
    print('更新しました。 ID：$rowsAffected ');
  }

  // 削除ボタンクリック
  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id!);
    print('削除しました。 $rowsDeleted ID: $id');
  }
}

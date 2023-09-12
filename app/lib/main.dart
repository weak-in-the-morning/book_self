// main.dart
import 'package:app/logic/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/data/book_data.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // DatabaseHelper クラスのインスタンス取得
  final dbHelper = DatabaseHelper.instance;

  late BookData book = new BookData(
    1,
    'Book Title',
    123,
    'Service Name',
    false,
    false,
    'Tag Name',
    'Some memo text',
    DateTime.now(),
    DateTime.now(),
    'Search URL',
    'Image URL',
  );

  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLiteデモ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '名前',
              ),
              onChanged: (text) {
                book.name = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'サービス',
              ),
              onChanged: (text) {
                book.service = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '巻数',
              ),
              onChanged: (text) {
                book.num = int.parse(text);
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'URL',
              ),
              onChanged: (text) {
                book.urlSearch = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'タグ',
              ),
              onChanged: (text) {
                book.tag = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'メモ',
              ),
              onChanged: (text) {
                book.memo = text;
              },
            ),
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
    final rowsAffected = await dbHelper.update(book);
    print('更新しました。 ID：$rowsAffected ');
  }

  // 削除ボタンクリック
  void _delete() async {
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id!);
    print('削除しました。 $rowsDeleted ID: $id');
  }
}

import 'dart:math';

import 'package:app/data/book_data.dart';
import 'package:app/logic/database.dart';
import 'package:app/view/components/app_button.dart';
import 'package:app/view/components/input_field.dart';
import 'package:flutter/material.dart';

//以下サンプル画像
const sampleImgPath =
    'https://asset.watch.impress.co.jp/img/gmw/docs/1510/331/1_l.jpg';

const sampleLabel = 'ワンピース';

const sampleImgPath2 = 'https://cdn.kdkw.jp/cover_500/199999/199999410133.jpg';

const sampleLabel2 = 'ガンダム';

const sampleImgPath3 =
    'https://storage.mantan-web.jp/images/2020/11/16/20201116dog00m200027000c/001_size6.jpg';

const sampleLabel3 = 'ラブライブ';

/*
class BookList extends StatelessWidget {
  const BookList({super.key});
  @override
  Widget build(BuildContext context) {
    final dbHelper = DatabaseHelper.instance;
    const axisCount = 3;
    final TextEditingController searchFieldController = TextEditingController();
    return FutureBuilder<List<BookData>>(
      future: dbHelper.queryAllRows(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text('Loading!'));
        } else if (snapshot.error != null) {
          return const Center(child: Text('Error occurred!'));
        } else {
          final books = snapshot.data!;
          return Column(
            children: [
              Row(
                children: [
                  InputField(
                    formTitle: '検索',
                    controller: searchFieldController,
                    isSelectedEbook: true,
                  ),
                  AppButton.outlined(label: '検索', onTap: (){})
                ],
              ),
              Flexible(
                child: GridView.count(
                  crossAxisCount: axisCount,
                  children: [
                    if (books.isEmpty)
                      const Center(child: Text('data not found')),
                    for (int i = 0; i < books.length; i++) ...[
                      _Book(
                        imagePath: sampleImgPath,
                        label: books[i].name,
                      ),
                    ]
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
*/
class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final dbHelper = DatabaseHelper.instance;
  final TextEditingController searchFieldController = TextEditingController();
  late Future<List<BookData>?> booksFuture;

  @override
  void initState() {
    super.initState();
    booksFuture = dbHelper.queryAllRows();
  }

  _updateBooks() {
    if (searchFieldController.text.isEmpty ||
        searchFieldController.text == '') {
      setState(() {
        booksFuture = dbHelper.queryAllRows();
      });
    } else {
      setState(() {
        booksFuture = dbHelper.searchName(searchFieldController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const axisCount = 3;
    return FutureBuilder<List<BookData>>(
      future: dbHelper.queryAllRows(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text('Loading!'));
        } else if (snapshot.error != null) {
          return const Center(child: Text('Error occurred!'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data found'));
        } else {
          final books = snapshot.data ?? [];
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: InputField(
                      formTitle: '検索',
                      controller: searchFieldController,
                      isSelectedEbook: true,
                    ),
                  ),
                  AppButton.outlined(
                      label: '検索',
                      onTap: () {
                        _updateBooks();
                      })
                ],
              ),
              Flexible(
                child: GridView.count(
                  crossAxisCount: axisCount,
                  children: [
                    if (books.isEmpty)
                      const Center(child: Text('data not found')),
                    for (int i = 0; i < books.length; i++) ...[
                      _Book(
                        imagePath: sampleImgPath,
                        label: books[i].name,
                      ),
                    ]
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class _Book extends StatelessWidget {
  const _Book({required this.imagePath, required this.label});

  final String imagePath;
  final String label;
  @override
  Widget build(BuildContext context) {
    final imgWidth = MediaQuery.of(context).size.width / 8;
    final dialogImageWidth = MediaQuery.of(context).size.width / 2;
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      imagePath,
                      width: dialogImageWidth,
                    ),
                    Text(label),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton.outlined(
                          label: '閉じる',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: [
            Transform.rotate(
              angle: 10 * pi / 180,
              child: Image.network(
                imagePath,
                width: imgWidth,
                height: imgWidth * 2,
              ),
            ),
            Text(label, style: const TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}

import 'package:app/view/components/books_row.dart';
import 'package:flutter/material.dart';

class BooksMatrix extends StatelessWidget {
  const BooksMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    const double firstPadding = 96;
    const double secondPadding = 60;
    const double thirdPadding = 60;
    const double fourthPadding = 60;
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('My本棚'),

            Padding(
              padding: EdgeInsets.only(top: firstPadding),
              child: BooksRow(imgPaths: [
                  'https://image.mechacomi.jp/contents/001fr2hw.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hx.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hy.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hz.jpg',
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: secondPadding),
              child: BooksRow(imgPaths: [
                  'https://image.mechacomi.jp/contents/001fr2hw.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hx.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hy.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hz.jpg',
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: thirdPadding),
              child: BooksRow(imgPaths: [
                  'https://image.mechacomi.jp/contents/001fr2hw.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hx.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hy.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hz.jpg',
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: fourthPadding),
              child: BooksRow(imgPaths: [
                  'https://image.mechacomi.jp/contents/001fr2hw.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hx.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hy.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hz.jpg',
                ]
              )
            )
        ]
      ),]
    );
  }
}
import 'package:app/view/components/books_row.dart';
import 'package:flutter/material.dart';

class BooksMatrix extends StatelessWidget {
  const BooksMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = MediaQuery.of(context).size.height / 72;
    final topGap =  MediaQuery.of(context).size.height / 12;
    // final topPadding = (mediaHeight - padding) / 6.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('My本棚'),

            Padding(
              padding: EdgeInsets.only(top: topGap),
              child: const BooksRow(imagePaths: [
                  'https://image.mechacomi.jp/contents/001fr2hw.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hx.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hy.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hz.jpg',
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: gap),
              child: const BooksRow(imagePaths: [
                  'https://image.mechacomi.jp/contents/001fr2hw.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hx.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hy.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hz.jpg',
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: gap),
              child: const BooksRow(imagePaths: [
                  'https://image.mechacomi.jp/contents/001fr2hw.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hx.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hy.jpg',
                  'https://image.mechacomi.jp/contents/001fr2hz.jpg',
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: gap),
              child: const BooksRow(imagePaths: [
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
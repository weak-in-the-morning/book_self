import 'dart:math';

import 'package:app/view/components/app_button.dart';
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

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    const axisCount = 3;
    return GridView.count(
      crossAxisCount: axisCount,
      children: [
        // sample画像を繰り返し表示する3種類 * 50 = 150個描画されている
        for (int i = 0; i < 50; i++) ...[
          const _book(
            imagePath: sampleImgPath,
            label: sampleLabel,
          ),
          const _book(
            imagePath: sampleImgPath2,
            label: sampleLabel2,
          ),
          const _book(
            imagePath: sampleImgPath3,
            label: sampleLabel3,
          ),
        ]
      ],
    );
  }
}

// ignore: camel_case_types
class _book extends StatelessWidget {
  const _book({required this.imagePath, required this.label});

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
            Text(
              label,
              style: const TextStyle(fontSize: 12)
            )
          ],
        ),
      ),
    );
  }
}

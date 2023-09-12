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

class BookInBookshelf extends StatelessWidget {
  final String imagePath;
  // final String imgSrc;

  const BookInBookshelf({
    super.key, 
    required this.imagePath, 
    // required this.imgSrc,
    });

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final imageWidth = (mediaWidth - mediaWidth * 5 / 24) / 4;
    final imageHeight = (mediaHeight - mediaHeight * 5 / 16) / 4;

    return 
      TextButton(
        onPressed: () {},
        child: Container(
            decoration: BoxDecoration(
            // color: AppColors.cobaltGreen, 

            // border:  Border.all(
            //     width: 2,
            //     color: AppColors.cobaltGreen 
            //     ), 
            borderRadius: BorderRadius.circular(2), 
          ), 
          width: imageWidth,
          height: imageHeight,
          child: Image.network(
            imagePath,
            width: imageWidth,
            height: imageHeight,
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:app/view/components/ebook_button.dart';

class Ebooks extends StatelessWidget {
  // final String label;
  // final GestureTapCallback onPressed;

  const Ebooks({
    super.key, 
    // required this.label, 
    });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
              '電子書籍サービス'
            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            EbookButton(
              label: 'まんがセゾン', 
              imgSrc: 'assets/images/Sezon.jpg'
            ),
            EbookButton(
              label: 'Kindle', 
              imgSrc: 'assets/images/Kindle.png'
            ),
            EbookButton(
              label: 'DMMブックス', 
              imgSrc: 'assets/images/DMMBooks.png'
            ),
    
            EbookButton(
              label: '楽天ブックス', 
              imgSrc: 'assets/images/RakutenBooks.png'
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EbookButton(
              label: 'BOOK☆WALKER', 
              imgSrc: 'assets/images/BookWalker.png'
            ),
            EbookButton(
              label: 'BookLive', 
              imgSrc: 'assets/images/BookLive.png'
            ),
            EbookButton(
              label: 'eBookJapan', 
              imgSrc: 'assets/images/EbookJapan.png'
            ),
    
            EbookButton(
              label: '少年ジャンプ+', 
              imgSrc: 'assets/images/JumpPlus.png'
            ),
          ],
        )
      ]
    );
  }
}
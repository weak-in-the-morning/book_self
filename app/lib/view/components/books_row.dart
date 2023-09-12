import 'package:app/view/components/book_in_bookshelf.dart';
import 'package:flutter/material.dart';

class BooksRow extends StatelessWidget {
  final List<String> imgPaths;
  const BooksRow({
    super.key,
    required this.imgPaths,
    });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BookInBookshelf(imgPath: 'https://image.mechacomi.jp/contents/001fr2hw.jpg'),
        BookInBookshelf(imgPath: 'https://image.mechacomi.jp/contents/001fr2hx.jpg'),
        BookInBookshelf(imgPath: 'https://image.mechacomi.jp/contents/001fr2hy.jpg'),
        BookInBookshelf(imgPath: 'https://image.mechacomi.jp/contents/001fr2hz.jpg'),
      ]
    );
  }
}
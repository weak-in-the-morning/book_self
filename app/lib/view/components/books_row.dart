import 'package:app/view/components/book_in_bookshelf.dart';
import 'package:flutter/material.dart';

class BooksRow extends StatelessWidget {
  final List<String> imagePaths;
  const BooksRow({
    super.key,
    required this.imagePaths,
    });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BookInBookshelf(imagePath: 'https://image.mechacomi.jp/contents/001fr2hw.jpg'),
        BookInBookshelf(imagePath: 'https://image.mechacomi.jp/contents/001fr2hx.jpg'),
        BookInBookshelf(imagePath: 'https://image.mechacomi.jp/contents/001fr2hy.jpg'),
        BookInBookshelf(imagePath: 'https://image.mechacomi.jp/contents/001fr2hz.jpg'),
      ]
    );
  }
}
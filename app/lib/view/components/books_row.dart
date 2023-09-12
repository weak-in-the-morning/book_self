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
    final rowGap = MediaQuery.of(context).size.height / 72;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: rowGap),
          child: BookInBookshelf(imagePath: imagePaths[0]),
        ),
        Padding(
          padding: EdgeInsets.only(right: rowGap),
          child: BookInBookshelf(imagePath: imagePaths[1]),
        ),
        Padding(
          padding: EdgeInsets.only(right: rowGap),
          child: BookInBookshelf(imagePath: imagePaths[2]),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: BookInBookshelf(imagePath: imagePaths[3]),
        ),
      ]
    );
  }
}
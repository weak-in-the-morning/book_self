import 'package:app/view/components/books_matrix.dart';
import 'package:flutter/material.dart';

class Bookshelf extends StatelessWidget {
  const Bookshelf({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/backgroundOfBookshelf.jpg'),
          fit: BoxFit.cover,
        )),
      child: const Center(
        child: BooksMatrix()
        )
      );
  }
}
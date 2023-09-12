import 'package:app/view/design_system.dart';
import 'package:app/view/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:app/view/pages/bookshelf.dart';
import 'package:app/view/pages/book_list.dart';
import 'package:app/view/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Book Self',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _pageIndex = 0;

  final List<Widget> _pages = [
    const Bookshelf(),
    Register(),
    const BookList(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(
        title: 'BookSelef',
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomAppBarComponent(
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}

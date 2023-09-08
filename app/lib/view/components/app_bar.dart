import 'package:app/data/colors.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({
    super.key,
    this.title = "",
  });

  final String title;
  @override
  Size get preferredSize {
    return const Size(double.infinity, 58);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: Text(title)),
      backgroundColor: AppColors.cobaltGreen,
    );
  }
}

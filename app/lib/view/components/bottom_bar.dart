import 'package:app/data/colors.dart';
import 'package:flutter/material.dart';

class BottomAppBarComponent extends StatelessWidget {
  const BottomAppBarComponent({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: AppColors.ecruBeige,
            size: 36,
          ),
          label: 'Bookshelf',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: AppColors.ecruBeige,
            size: 36,
          ),
          label: 'Register',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: AppColors.ecruBeige,
              size: 36,
            ),
            label: 'Index'),
      ],
      backgroundColor: AppColors.cobaltGreen,
      type: BottomNavigationBarType.fixed,
    );
  }
}

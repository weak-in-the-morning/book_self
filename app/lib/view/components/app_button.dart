import 'package:app/data/colors.dart';
import 'package:flutter/material.dart';

/// AppButtonのコンポーネントです
/// factoryで実装しているので呼び出し方は以下の2つです.
///
/// 黄色背景緑文字を使う時
/// AppButton.filled(label: '', onTap: (){処理内容})
///
/// 緑背景縁取りありを使う時
/// AppButton.outlined(label:'', onTap: (){処理内容})

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onTap,
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
  });

  factory AppButton.filled({
    required String label,
    required Function()? onTap,
    Key? key,
  }) {
    return AppButton(
      label: label,
      borderColor: AppColors.ecruBeige,
      backgroundColor: AppColors.ecruBeige,
      textColor: AppColors.cobaltGreen,
      onTap: onTap,
      key: key,
    );
  }

  factory AppButton.outlined({
    required String label,
    required Function()? onTap,
    Key? key,
  }) {
    return AppButton(
      label: label,
      borderColor: AppColors.ecruBeige,
      backgroundColor: AppColors.cobaltGreen,
      textColor: AppColors.ecruBeige,
      onTap: onTap,
      key: key,
    );
  }

  final String label;
  final Function()? onTap;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

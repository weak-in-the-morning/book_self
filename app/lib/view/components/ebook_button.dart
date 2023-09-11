import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EbookButton extends HookWidget {
  final String label;
  final String imgSrc;

  const EbookButton({
    super.key, 
    required this.label, 
    required this.imgSrc,
    });

  @override
  Widget build(BuildContext context) {
    final isSelected = useState<bool>(false);
    return 
      TextButton(
        onPressed: () {
          isSelected.value = !isSelected.value;
        },
        child: Container(
           decoration: BoxDecoration(
           border:  Border.all(
              width: 2,
              color: isSelected.value ? Colors.grey : Colors.black.withOpacity(0)
              ), 
            borderRadius: BorderRadius.circular(5) 
          ), 
          width: 96,
          height: 96,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgSrc,
                width: 48,
                height: 48,
                ),
              Text(label),
              ],
            ),
        ),
      );
  }
}

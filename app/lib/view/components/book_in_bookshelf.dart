import 'package:app/view/components/app_button.dart';
import 'package:flutter/material.dart';

class BookInBookshelf extends StatelessWidget {
  final String imagePath;

  const BookInBookshelf({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaHeight = MediaQuery.of(context).size.height;
    final imageWidth = 70.0;
    final imageHeight = 100.0;
    final dialogImageWidth = mediaWidth - 32;

    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      imagePath,
                      width: dialogImageWidth,
                    ),
                    // Text(label),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton.outlined(
                          label: '閉じる',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
        width: imageWidth,
        height: imageHeight,
        child: Image.network(
          imagePath,
          width: imageWidth,
          height: imageHeight,
        ),
      ),
    );
  }
}

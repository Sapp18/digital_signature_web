import 'package:flutter/material.dart';
import 'package:pca_web/theme/my_colors.dart';
import 'package:pca_web/tools/tools.dart';

class TextRichWith3Widget extends StatelessWidget {
  final Color? color;
  final String text1;
  final String text2;
  final String text3;
  const TextRichWith3Widget({
    Key? key,
    required this.text1,
    this.text2 = '',
    this.text3 = '',
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              text: text1,
              style: const TextStyle(
                fontFamily: fontFamily,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: text2,
                  style: TextStyle(
                    color: color ?? MyColors.primary,
                    fontFamily: fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: text3,
                  style: const TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

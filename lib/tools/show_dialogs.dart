import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pca_web/theme/my_colors.dart';
import 'package:pca_web/tools/tools.dart';

class ShowDialogs {
  //Dialogo para dibujar firma digital
  static void digitalSignatureDisplayDialog(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1)).then(
      (value) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: MyColors.iQBlack,
            scrollable: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(
                15,
              ),
            ),
            titlePadding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  tooltip: 'Cerrar',
                  icon: const Icon(
                    color: MyColors.iqError,
                    Icons.close,
                    size: 25,
                  ),
                ),
              ],
            ),
            contentPadding: const EdgeInsets.all(0),
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: SvgPicture.asset(
                      IconsSvgRoutes.touchApp,
                      color: Colors.white,
                      height: 35,
                      width: 26,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Desliza tu dedo para dibujar tu firma',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

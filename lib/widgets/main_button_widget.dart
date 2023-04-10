import 'package:flutter/material.dart';
import 'package:pca_web/theme/my_colors.dart';

class MainButtonWidget extends StatelessWidget {
  final Color? borderColor;
  final Color? buttonColor;
  final Color? disabledColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final Widget child;

  const MainButtonWidget({
    Key? key,
    required this.child,
    required this.onPressed,
    this.borderColor,
    this.borderRadius,
    this.buttonColor,
    this.disabledColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonColor == null
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: MyColors.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 4),
              ),
            ),
            child: MaterialButton(
              disabledColor: MyColors.iQGris2,
              disabledTextColor: MyColors.iQGris1,
              onPressed: onPressed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 4),
                ),
                side: BorderSide(
                  color: borderColor ?? Colors.transparent,
                ),
              ),
              child: child,
            ),
          )
        : MaterialButton(
            height: height,
            minWidth: width,
            color: buttonColor,
            disabledColor: MyColors.iQGris2,
            disabledTextColor: MyColors.iQGris1,
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 4),
              ),
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
              ),
            ),
            child: child,
          );
  }
}

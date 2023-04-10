import 'package:flutter/material.dart';
import 'package:pca_web/tools/tools.dart';

class PageNotFoundView extends StatelessWidget {
  const PageNotFoundView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Text(
            'Error 404 - Página no encontrada',
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pca_web/router/router.dart';
import 'package:pca_web/services/services.dart';
import 'package:pca_web/tools/tools.dart';
import 'package:pca_web/view/views.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Flurorouter.rootRoute,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: Flurorouter.router.generator,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      title: webName,
      builder: (_, child) => DigitalSignatureView(),
      theme: ThemeData.dark(),
    );
  }
}

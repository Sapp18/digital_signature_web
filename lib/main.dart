import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:pca_web/router/router.dart';
import 'package:pca_web/services/services.dart';
import 'package:pca_web/tools/tools.dart';

void main() {
  Flurorouter.configureRoutes();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Flurorouter.digitalSignatureRoute,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: Flurorouter.router.generator,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      title: webName,
      theme: ThemeData.dark(),
    );
  }
}

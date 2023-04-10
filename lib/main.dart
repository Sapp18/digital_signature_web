import 'package:flutter/material.dart';
import 'package:pca_web/router/router.dart';
import 'package:pca_web/services/services.dart';
import 'package:pca_web/tools/tools.dart';
import 'package:pca_web/view/views.dart';

void main() {
  Flurorouter.configureRoutes();

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

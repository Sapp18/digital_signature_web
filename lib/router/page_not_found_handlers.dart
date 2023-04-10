import 'package:fluro/fluro.dart';
import 'package:pca_web/view/views.dart';

class PageNotFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, params) {
    return const PageNotFoundView();
  });
}

import 'package:fluro/fluro.dart';
import 'package:pca_web/view/prueba.dart';
import 'package:pca_web/view/views.dart';

class DigitalSignatureHandlers {
  static Handler user = Handler(handlerFunc: (context, params) {
    print(params);

    print(params['uid']?.first);
    if (params['uid']?.first != null) {
      if (params['uid']?.first == ':uid') {
        return PruebaPage();
      } else {
        return DigitalSignatureView();
      }
    } else {
      return PruebaPage();
    }
  });
}

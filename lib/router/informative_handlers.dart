import 'package:fluro/fluro.dart';
import 'package:pca_web/view/views.dart';

class InformativeHandlers {
  static Handler linkNotFound = Handler(handlerFunc: (context, params) {
    return const LinkNotFoundView();
  });

  static Handler anErrorOcurred = Handler(handlerFunc: (context, params) {
    return const AnErrorOcurredView();
  });

  static Handler signatureSent = Handler(handlerFunc: (context, params) {
    return const SignatureSentView();
  });
}

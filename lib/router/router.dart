import 'package:fluro/fluro.dart';
import 'package:pca_web/router/page_not_found_handlers.dart';
import 'package:pca_web/router/digital_signature_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  // Signature Router
  static String digitalSignatureRoute = '/signature/users/:token';

  static void configureRoutes() {
    // Signature
    router.define(
      digitalSignatureRoute,
      handler: DigitalSignatureHandlers.user,
      transitionType: TransitionType.fadeIn,
    );
    // 404
    router.notFoundHandler = PageNotFoundHandlers.noPageFound;
  }
}

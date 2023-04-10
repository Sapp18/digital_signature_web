import 'package:fluro/fluro.dart';
import 'package:pca_web/router/page_not_found_handlers.dart';
import 'package:pca_web/router/digital_signature_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // Signature Router
  static String digitalSignatureRoute = '/stock/:uid/contract/:token';
// http://localhost:36361/#/stock/3/contract/1d73f8263cf7aa68957fe9048293784f
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

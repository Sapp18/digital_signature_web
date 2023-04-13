import 'package:fluro/fluro.dart';
import 'package:pca_web/router/informative_handlers.dart';
import 'package:pca_web/router/digital_signature_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // Signature Router
  static String anErrorOcurred = '/anErrorOcurred';
  static String digitalSignatureRoute = '/stock/:stock_id/contract/:key';
// http://localhost:36361/#/stock/3/contract/1d73f8263cf7aa68957fe9048293784f
  static String signatureSent = '/signatureSent';
  static void configureRoutes() {
    // Digital Signature
    router.define(
      digitalSignatureRoute,
      handler: DigitalSignatureHandlers.user,
      transitionType: TransitionType.fadeIn,
    );
    // An Error Ocurred
    router.define(
      anErrorOcurred,
      handler: InformativeHandlers.anErrorOcurred,
      transitionType: TransitionType.fadeIn,
    );
    // Signature Sent
    router.define(
      signatureSent,
      handler: InformativeHandlers.signatureSent,
      transitionType: TransitionType.fadeIn,
    );
    // 404
    router.notFoundHandler = InformativeHandlers.linkNotFound;
  }
}

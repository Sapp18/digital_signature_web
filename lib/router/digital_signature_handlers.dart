import 'package:fluro/fluro.dart';
import 'package:pca_web/view/views.dart';

class DigitalSignatureHandlers {
  static Handler user = Handler(handlerFunc: (context, params) {
    print(params);
    print(params['stock_id']?.first);
    if (params['stock_id']?.first != null && params['key']?.first != null) {
      return DigitalSignatureView(
        stockId: params['stock_id']!.first,
        token: params['key']!.first,
      );
    } else {
      return const LinkNotFoundView();
    }
    // if (params['key']?.first != null) {
    //   if (params['key']?.first == ':key') {
    //     return PageNotFoundView();
    //   } else {
    //     return DigitalSignatureView();
    //   }
    // } else {
    //   return PageNotFoundView();
    // }
  });
}

import 'package:fluro/fluro.dart';
import 'package:pca_web/view/views.dart';

class DigitalSignatureHandlers {
  static Handler user = Handler(handlerFunc: (context, params) {
    return const DigitalSignatureView();

    // final authProvider = Provider.of<AuthProvider>(context!);
    // if (authProvider.authStatus == AuthStatus.authenticated) {
    //   print(params);
    //   if (params['uid']?.first != null) {
    //     return UserView(uid: params['uid']!.first);
    //   } else {
    //     return UsersView();
    //   }
    // } else {
    //   return const PageNotFoundView();
    // }
  });
}

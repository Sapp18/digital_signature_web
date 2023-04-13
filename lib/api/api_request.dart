// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, unused_element

import 'package:pca_web/api/apis.dart';

class _ApiRequest {
  final POST = _POST();
}

_ApiRequest ApiRequest = _ApiRequest();

class _POST {
  //Signature
  final String _signContract = '/external/stock/:stock_id/contract/:key';

  Future<ApiResponse> moralPersonDocument(stockId, key, {data}) {
    return API.post(
      _routeBuilder(_signContract, {'stock_id': stockId, 'key': key}),
      data: data,
    );
  }
}

String _routeBuilder(String route, Map parameters) {
  for (var entry in parameters.entries) {
    route = route.replaceAll(':${entry.key}', entry.value.toString());
  }
  return route;
}

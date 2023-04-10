import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class DigitalSignatureProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isSigned = false;
  Uint8List? showSigned;
  Uint8List? signature;

  SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
  );

  SignatureController get controller => _controller;
  set controller(SignatureController value) {
    _controller = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isSigned => _isSigned;
  set isSigned(bool value) {
    _isSigned = value;
    notifyListeners();
  }

  Future<Uint8List?> exportSignature({Color? bckColor}) async {
    final exportController = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: bckColor ?? Colors.transparent,
      points: controller.points,
    );
    final signature = await exportController.toPngBytes();
    exportController.dispose();
    return signature;
  }
}

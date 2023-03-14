import 'dart:async';
import 'dart:math';

import 'imc_state.dart';

class BlocPatternController {
  final _imcStreamController = StreamController<ImcState>()
    ..add(
      ImcState(imc: 0),
    );

  Stream<ImcState> get imcOut => _imcStreamController.stream;

  Future<void> calculateImc(
      {required double weight, required double height}) async {
    _imcStreamController.add(ImcState(imc: 0));

    await Future.delayed(const Duration(seconds: 1));

    final imc = weight / pow(height, 2);

    _imcStreamController.add(ImcState(imc: imc));

  }
  void dispose() {
    _imcStreamController.close();
  }
}

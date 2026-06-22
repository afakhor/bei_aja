import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

// Definisikan tanda tangan fungsi C++ di Dart
typedef CalculateChangeC = Double Function(Double currentPrice, Double previousClose);
typedef CalculateChangeDart = double Function(double currentPrice, double previousClose);

class FinanceBridge {
  late DynamicLibrary _nativeLib;
  late CalculateChangeDart calculateChange;

  FinanceBridge() {
    // Load library berdasarkan OS
    _nativeLib = Platform.isAndroid
        ? DynamicLibrary.open('libfinance_engine.so')
        : DynamicLibrary.process();

    // Hubungkan fungsi Dart ke fungsi C++
    calculateChange = _nativeLib
        .lookup<NativeFunction<CalculateChangeC>>('calculate_percentage_change')
        .asFunction<CalculateChangeDart>();
  }
}

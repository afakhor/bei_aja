import 'package:flutter/material.dart';
import 'finance_bridge.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final financeBridge = FinanceBridge();

  @override
  Widget build(BuildContext context) {
    // Contoh harga saham BBRI
    double prevClose = 4500.0;
    double currentPrice = 4620.0;
    
    // Panggil fungsi C++ via FFI
    double change = financeBridge.calculateChange(currentPrice, prevClose);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('RTI Clone Market')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BBRI', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Rp $currentPrice', style: TextStyle(fontSize: 32)),
              Text(
                '${change >= 0 ? "+" : ""}${change.toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 20, 
                  color: change >= 0 ? Colors.green : Colors.red
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

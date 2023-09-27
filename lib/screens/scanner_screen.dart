import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String _scanBarcode = "";

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#42f5ef", "Cancel", true, ScanMode.QR);
    print(barcodeScanRes);

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("GetX, Dio, Provider", selectionColor: Colors.blue),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text("The value obtained after scanning is"),
          const SizedBox(
            height: 20,
          ),
          Text(_scanBarcode),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: scanBarcodeNormal,
            child: const Text("Scan either QR of Barcode"),
          ),
        ],
      )),
    );
  }
}

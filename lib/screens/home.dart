import '../imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Scan')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AiBarcodeScanner(
                  controller: MobileScannerController(
                    formats: [BarcodeFormat.qrCode],
                  ),
                  validator: (value) {
                    return value.barcodes.first.rawValue?.contains("your_prefix") ?? false;
                  },
                  onDetect: (BarcodeCapture capture) {
                    // This callback is only called if the validation is successful
                    print('Valid barcode detected: ${capture.barcodes.first.rawValue}');
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          },
          child: Text('Сканировать QR код'),
        ),
      ),
    );
  }
}

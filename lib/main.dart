import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diamond Key App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const WebViewDemo(),
    );
  }
}

class WebViewDemo extends StatefulWidget {
  const WebViewDemo({super.key});

  @override
  State<WebViewDemo> createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: ((progress) => {}),
        onPageStarted: ((url) => {}),
        onPageFinished: ((url) => {}),
      ))
      ..loadRequest(Uri.parse('https://www.diamondkeyboutique.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Diamond Key Boutique'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

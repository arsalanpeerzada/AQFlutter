import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class privacyPolicy extends StatefulWidget {
  const privacyPolicy({super.key});

  @override
  State<privacyPolicy> createState() => _privacyPolicyState();
}

class _privacyPolicyState extends State<privacyPolicy> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(
        Uri.parse('https://www.teniqs.com/quranapp/privacypolicy.html'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF003D35),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set your desired icon and color
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

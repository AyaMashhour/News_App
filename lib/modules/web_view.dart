import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

class WebView extends StatelessWidget {
  final String url;

  WebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        body: Webview(url: url));
  }
}

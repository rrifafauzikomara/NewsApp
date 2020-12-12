import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared/widget/widget.dart';

class ArticleWebView extends StatelessWidget {
  final String url;

  const ArticleWebView({@required this.url});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}

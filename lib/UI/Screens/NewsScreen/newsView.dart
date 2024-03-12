import 'package:flutter/material.dart';
import 'package:flutter_news/providers/newprovider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final String url;
  const NewsWebView({super.key, required this.url});

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    final provider = Provider.of<NewsProvider>(context, listen: false);
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          provider.updateLoading(true);
        },
        onPageFinished: (url) {
          provider.updateLoading(false);
        },
      ))
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News"),
        ),
        body: Consumer<NewsProvider>(builder: (context, provider, child) {
          return provider.isNewsViewLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : WebViewWidget(controller: controller);
        }));
  }
}

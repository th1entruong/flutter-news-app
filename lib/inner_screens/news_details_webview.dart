import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewDetailsWebView extends StatefulWidget {
  const NewDetailsWebView({Key? key}) : super(key: key);

  @override
  State<NewDetailsWebView> createState() => _NewDetailsWebViewState();
}

class _NewDetailsWebViewState extends State<NewDetailsWebView> {
  late WebViewController _viewViewController;
  double _progress = 0.0;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return WillPopScope(
      onWillPop: () async {
        if (await _viewViewController.canGoBack()) {
          _viewViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'URL',
            style: TextStyle(
              color: color,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progress,
              color: _progress == 1.0 ? Colors.transparent : Colors.blue,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            Expanded(
              child: WebView(
                initialUrl:
                    "https://viblo.asia/p/gioi-thieu-ve-flutter-bWrZnNxrZxw",
                zoomEnabled: true,
                onProgress: (progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
                onWebViewCreated: (controller) {
                  _viewViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

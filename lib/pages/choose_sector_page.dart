// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:e_chipta/model/games_response.dart';
import 'package:e_chipta/pages/choose_seat_page.dart';
import 'package:e_chipta/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// #enddocregion platform_imports

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';

const String kLocalExamplePage = '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body>

<h1>Local demo page</h1>
<p>
  This is an example page used to demonstrate how to load a local file or HTML
  string using the <a href="https://pub.dev/packages/webview_flutter">Flutter
  webview</a> plugin.
</p>

</body>
</html>
''';

const String kTransparentBackgroundPage = '''
  <!DOCTYPE html>
  <html>
  <head>
    <title>Transparent background test</title>
  </head>
  <style type="text/css">
    body { background: transparent; margin: 0; padding: 0; }
    #container { position: relative; margin: 0; padding: 0; width: 100vw; height: 100vh; }
    #shape { background: red; width: 200px; height: 200px; margin: 0; padding: 0; position: absolute; top: calc(50% - 100px); left: calc(50% - 100px); }
    p { text-align: center; }
  </style>
  <body>
    <div id="container">
      <p>Transparent background test</p>
      <div id="shape"></div>
    </div>
  </body>
  </html>
''';

const String kLogExamplePage = '''
<!DOCTYPE html>
<html lang="en">
<head>
<title>Load file or HTML string example</title>
</head>
<body onload="console.log('Logging that the page is loading.')">

<h1>Local demo page</h1>
<p>
  This page is used to test the forwarding of console logs to Dart.
</p>

<style>
    .btn-group button {
      padding: 24px; 24px;
      display: block;
      width: 25%;
      margin: 5px 0px 0px 0px;
    }
</style>

<div class="btn-group">
    <button onclick="console.error('This is an error message.')">Error</button>
    <button onclick="console.warn('This is a warning message.')">Warning</button>
    <button onclick="console.info('This is a info message.')">Info</button>
    <button onclick="console.debug('This is a debug message.')">Debug</button>
    <button onclick="console.log('This is a log message.')">Log</button>
</div>

</body>
</html>
''';

class ChooseSectorPage extends StatefulWidget {
  const ChooseSectorPage({super.key, required this.game});
  final Match game ;


  @override
  State<ChooseSectorPage> createState() => _ChooseSectorPageState();
}

class _ChooseSectorPageState extends State<ChooseSectorPage> {
  late final WebViewController _controller;
  var data;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
          onHttpAuthRequest: (HttpAuthRequest request) {},
        ),
      )
      ..addJavaScriptChannel(
        'eventSector',
        onMessageReceived: (JavaScriptMessage message) {

             data  = jsonDecode(message.message);
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseSeatPage(sectorId: message.message,match: widget.game,)));



          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),

          );
        },
      )
      ..loadRequest(Uri.parse('https://select-ticket.echipta.uz/'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primary,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.white,
          ),
          onPressed: () {

            Navigator.pop(context);
          },
        ),
        title: Text(
          "Sektorni tanlang",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.height * .02,
              color: Colors.white),
        ),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      ),
      body: Column(
        children: [
          SizedBox(
            width: width * .8,
            height: height * .14,
            child: InkWell(
              onTap: () {
                print('tapped');
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseSectorPage()));*/
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: height * .03),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(height * .033),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                                width: height * .05,
                                height: height * .05,
                                child: Image.network(
                                    widget.game.mainTeam.image)),
                            SizedBox(
                              height: height * .009,
                            ),
                            Text(
                              widget.game.mainTeam.name,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontSize: height * .017,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '17:00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * .024,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              '30-mart',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height * .013,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                width: height * .05,
                                height: height * .05,
                                child: Image.asset(
                                    widget.game.secondTeam.image)),
                            SizedBox(
                              height: height * .009,
                            ),
                            Text(
                              widget.game.secondTeam.name,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontSize: height * .017,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'Bobur arena',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                        fontSize: height * .017,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('id is :${data['id']}');
            },
            child: InteractiveViewer(
              panEnabled: false,
              // Set it to false to prevent panning.
              // boundaryMargin: EdgeInsets.all(80),
              minScale: 0.5,
              maxScale: 4,
              child: Container(
                width: width,
                height: height * .7,
                child: WebViewWidget(controller: _controller),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectorTypeWidget(color: teal,type: 'Birinchi',),
              SectorTypeWidget(color: Colors.green,type: 'Ikkinchi',),
              SectorTypeWidget(color: Colors.blue,type: 'Uchinchi',),
              SectorTypeWidget(color: Colors.orange,type: 'Vip',),
              SectorTypeWidget(color: Colors.purple,type: 'FAN',),
              SectorTypeWidget(color: Colors.red,type: 'Mehmon',),

            ],
          ),
        ],
      ),
    );
  }

  Widget favoriteButton() {
    return FloatingActionButton(
      onPressed: () async {
        final String? url = await _controller.currentUrl();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Favorited $url')),
          );
        }
      },
      child: const Icon(Icons.favorite),
    );
  }
}

class SectorTypeWidget extends StatelessWidget {
  const SectorTypeWidget({
    required this.type,
    required this.color,
    super.key,

  });
 final String type;
 final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
      margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        type,
        style: TextStyle(fontFamily: 'Poppins',color: Colors.white),
      ),
    );
  }
}

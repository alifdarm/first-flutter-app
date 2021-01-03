import 'dart:async';

import 'package:submission/web_scrap.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 8,
        child: Post(),
      ),
    );
  }
}

class DetailNews extends StatefulWidget {

  final String linkSource;
  final String category;
  DetailNews({@required this.linkSource, @required this.category});

  @override
  _DetailNewsState createState() => new _DetailNewsState(linkSource, category);
}

class _DetailNewsState extends State<DetailNews> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  String linkSource;
  String category;

  _DetailNewsState(this.linkSource, this.category);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        actions: [

        ],
      ),
      body: WebView(
        initialUrl: linkSource,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              child: Image.asset('images/logo.png', scale: 2,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Author : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Text("Muhammad Alif Darmamulia\n "),
                Text("Email :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Text("alifm26072000@gmail.com\n"),
                Text("App Purposes :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text("Memenuhi submission akhir kelas Dicoding: Membuat Aplikasi Flutter untuk Pemula\n"
                  ,textAlign: TextAlign.center,),
                ),
                Text("Reach Me :\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {launch('https://github.com/alif338');},
                      child: Icon(MdiIcons.github),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {launch('https://www.instagram.com/aliefdharm/');},
                      child: Icon(MdiIcons.instagram),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {launch('https://www.linkedin.com/in/muhammad-alif-d-4aaa561a9/');},
                      child: Icon(MdiIcons.linkedin),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



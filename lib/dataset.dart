import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:submission/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Pages extends StatefulWidget {

  final String linkSource;
  final String category;
  Pages({@required this.linkSource, @required this.category});

  @override
  _PageState createState() => new _PageState(linkSource, category);
}

class _PageState extends State<Pages> {
  String linkSource;
  String category;

  _PageState(this.linkSource, this.category);

  List<String> title = List();
  List<String> post = List();
  List<String> link = List();
  List<String> image = List();

  void _initialPage() async {
    final response = await http.get(linkSource);
    dom.Document doc = parser.parse(response.body);
    final document = doc.getElementsByClassName("col-12 col-md-8 col-lg-8 py-3 border-bottom-hidden");
    setState(() {
      title = document.map((title) =>
      title.getElementsByTagName("a")[0].innerHtml)
          .toList();
      post = document.map((content) =>
      content.getElementsByTagName("P")[0].innerHtml)
          .toList();
      link = document.map((e) =>
      e.getElementsByTagName("a")[0].attributes['href'])
          .toList();
      image = document.map((img) =>
      img.getElementsByTagName("img")[0].attributes['src'])
          .toList();
    });
  }
  @override
  // ignore: must_call_super
  void initState() {
    _initialPage();
  }
  @override
  Widget build(BuildContext context) {

    return image.length==0?  SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.blue : Colors.blueGrey,
          ),
        );
      },
    ): ListView.builder(
      itemCount: image.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            child: FadeInAnimation(
              child: InkWell(
                onTap: () async {
                  dynamic url = link[index];
                  if(await canLaunch(url))
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailNews(linkSource: url, category: category,)
                        )
                      );
                  else{
                    print('error');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 4.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Image.network(image[index]),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(title[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(
                            post[index],
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



import 'package:flutter/material.dart';

class DetailNews extends StatelessWidget {
  final String linkSource;

  DetailNews({@required this.linkSource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: <Widget>[
                Image.asset("name"),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),

                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dataset.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'main.dart';

class Post extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BERITA ITB',style: TextStyle(fontSize: 16.0),),
        bottom: PreferredSize(
            child: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text('Berita Utama'),
                  ),
                  Tab(
                    child: Text('Utama'),
                  ),
                  Tab(
                    child: Text('Penelitian'),
                  ),
                  Tab(
                    child: Text('Akademik'),
                  ),
                  Tab(
                    child: Text('Institusi'),
                  ),
                  Tab(
                    child: Text('Profil'),
                  ),
                  Tab(
                    child: Text('MoU'),
                  ),
                  Tab(
                    child: Text('Obituari'),
                  ),
                ]),
            preferredSize: Size.fromHeight(30.0)),

      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        children: List.generate(source.length, (index) =>
          Container(
            child: Pages(linkSource: source[index], category: category[index],),
          )
        )
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                padding: EdgeInsets.all(0),
                child: Expanded(
                  flex: 1,
                  child: Image.asset('images/plawid.jpg'),
                ),
              ),
            ),
            ListTile(
              title: Text('Social Media ITB')
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(MdiIcons.instagram),
                  Text('  Instagram'),
                ],
              ),
              onTap: () {
                launch('https://www.instagram.com/itb1920/');
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(MdiIcons.facebook),
                  Text('  Facebook'),
                ],
              ),
              onTap: () {
                launch('https://www.facebook.com/institutteknologibandung');
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(MdiIcons.twitter),
                  Text('  Twitter'),
                ],
              ),
              onTap: () {
                launch('https://twitter.com/itbofficial');
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(MdiIcons.youtube),
                  Text('  Youtube'),
                ],
              ),
              onTap: () {
                launch('https://www.youtube.com/user/itbofficial');
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Tentang Aplikasi  '),
                  Icon(MdiIcons.information),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context) => About()
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

var source = [
  'https://www.itb.ac.id/news/index/category/home',
  'https://www.itb.ac.id/news/index/category/life',
  'https://www.itb.ac.id/news/index/category/penelitian',
  'https://www.itb.ac.id/news/index/category/fakultas',
  'https://www.itb.ac.id/news/index/category/institusi',
  'https://www.itb.ac.id/news/index/category/profil',
  'https://www.itb.ac.id/news/index/category/mou',
  'https://www.itb.ac.id/news/index/category/obituari'
];

var category = [
  'Berita Utama',
  'Utama',
  'Penelitian',
  'Akademik',
  'Institusi',
  'Profil',
  'MoU',
  'Obituari'
];

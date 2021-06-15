import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 1: School',
    key: GlobalKey<NavigatorState>(),
  ),
  BrowseScreen(
  ),
  Text(
    'Index 3: School',
    key: GlobalKey<NavigatorState>(),
  ),
];

int _selectedIndex = 0;

final GlobalKey<NavigatorState> navikey= GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        children: List<Widget>.generate(_widgetOptions.length, (index) => _widgetOptions[index]),
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class BrowseScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      key: navikey,
      navigationBar: CupertinoNavigationBar(
        // Try removing opacity to observe the lack of a blur effect and of sliding content.
        backgroundColor: CupertinoColors.systemGrey5,
        middle: Text('Sample Code'),
        leading: Icon(Icons.search,size: 20,),
      ),
      child: Center(child: GestureDetector(onTap: (){
        Navigator.push(
          navikey.currentContext,
          CupertinoPageRoute(builder: (context) => BrowseScreen2()),
        );
      },child: Text("Mydata"))),
    );
  }
}

class BrowseScreen2 extends StatelessWidget {
  const BrowseScreen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // Try removing opacity to observe the lack of a blur effect and of sliding content.
        backgroundColor: CupertinoColors.systemGrey5,
        middle: Text('Sample Code'),
        leading: Container(child: Icon(Icons.arrow_back_ios_rounded,size: 20,)),
      ),
      child: Material(
        child: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: 100,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {

            return ListTile(
              title: Text(index.toString()),
              onTap: (){
                Navigator.push(
                  navikey.currentContext,
                  CupertinoPageRoute(builder: (context) => BrowseScreen3()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class BrowseScreen3 extends StatelessWidget {
  const BrowseScreen3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // Try removing opacity to observe the lack of a blur effect and of sliding content.
        backgroundColor: CupertinoColors.systemGrey5,
        middle: Text('Sample Code'),
        leading: Container(child: Icon(Icons.arrow_back_ios_rounded,size: 20,)),
      ),
      child: Center(child: Material(child: Text("Mydata"))),
    );
  }
}

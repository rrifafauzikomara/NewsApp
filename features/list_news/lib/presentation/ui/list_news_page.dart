import 'package:flutter/material.dart';

class ListNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('News App', style: TextStyle(color: Colors.black)),
      ),
      body: Center(child: Text('Home')),
    );
  }
}

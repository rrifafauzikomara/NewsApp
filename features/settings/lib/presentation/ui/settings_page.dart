import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/widget/widget.dart';

class SettingsPage extends StatelessWidget {
  static const String title = 'Settings';

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: Text('Dark Theme'),
            trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {
                // print
              },
            ),
          ),
        ),
        Material(
          child: ListTile(
            title: Text('Language'),
            trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {
                // print
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

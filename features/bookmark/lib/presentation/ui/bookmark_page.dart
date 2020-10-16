import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dependencies/dependencies.dart';
import 'package:shared/common/common.dart';
import 'package:shared/widget/widget.dart';

class BookmarkPage extends StatelessWidget {
  Widget _settingIcons() {
    return IconButton(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      onPressed: () =>
          Modular.to.pushNamed(Modular.get<NamedRoutes>().settingsPage),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Modular.get<LocaleKeys>().bookmarkTitle.tr()),
        leading: _settingIcons(),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        middle: Text(Modular.get<LocaleKeys>().bookmarkTitle.tr()),
        trailing: _settingIcons(),
      ),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Text(Modular.get<LocaleKeys>().bookmarkTitle.tr()),
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

import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/presentation/bloc/bloc.dart';
import 'package:shared/common/common.dart';
import 'package:shared/widget/widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkTheme = false;
  bool _isIndonesia = false;

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Modular.get<LocaleKeys>().settingTitle.tr()),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        middle: Text(Modular.get<LocaleKeys>().settingTitle.tr()),
      ),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    var local = context.locale.toString();
    return BlocProvider(
      create: (context) =>
          context.bloc<SettingsBloc>()..add(CheckLanguage(locale: local)),
      child: ListView(
        children: [
          Material(
            child: ListTile(
              title: Text(Modular.get<LocaleKeys>().settingTheme.tr()),
              trailing: Switch.adaptive(
                value: _isDarkTheme,
                onChanged: (value) {
                  setState(() {
                    _isDarkTheme = value;
                    context
                        .bloc<SettingsBloc>()
                        .add(ChangeTheme(isDarkTheme: _isDarkTheme));
                  });
                },
              ),
            ),
          ),
          BlocListener<SettingsBloc, SettingsState>(
            listener: (context, state) {
              if (state is EnglishLanguageState) {
                context.locale =
                    EasyLocalization.of(context).supportedLocales[0];
              } else if (state is IndonesiaLanguageState) {
                context.locale =
                    EasyLocalization.of(context).supportedLocales[1];
              }
            },
            child: Material(
              child: ListTile(
                title: Text(Modular.get<LocaleKeys>().settingLanguage.tr()),
                trailing: Switch.adaptive(
                  value: _isIndonesia,
                  onChanged: (value) {
                    setState(() {
                      _isIndonesia = value;
                      context
                          .bloc<SettingsBloc>()
                          .add(ChangeLanguage(isEnglish: _isIndonesia));
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
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

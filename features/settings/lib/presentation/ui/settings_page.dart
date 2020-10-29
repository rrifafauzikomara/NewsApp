import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/presentation/bloc/setting/bloc.dart';
import 'package:settings/presentation/bloc/theme/bloc.dart';
import 'package:shared/common/common.dart';
import 'package:shared/widget/widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
    Modular.get<SettingsBloc>().add(GetLanguage());
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: Text(Modular.get<LocaleKeys>().settingTheme.tr()),
            trailing: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch.adaptive(
                  value: state is ThemeState ? state.isDarkTheme : false,
                  onChanged: (value) {
                    Modular.get<ThemeBloc>()
                        .add(ThemeChanged(isDarkTheme: value));
                  },
                );
              },
            ),
          ),
        ),
        BlocListener<SettingsBloc, SettingsState>(
          listener: (context, state) {
            if (state is EnglishLanguageState) {
              context.locale = context.supportedLocales[0];
            } else if (state is IndonesiaLanguageState) {
              context.locale = context.supportedLocales[1];
            }
          },
          child: Material(
            child: ListTile(
              title: Text(Modular.get<LocaleKeys>().settingLanguage.tr()),
              trailing: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return Switch.adaptive(
                    value: state is LanguageState ? state.isActive : false,
                    onChanged: (value) {
                      setState(() {
                        Modular.get<SettingsBloc>()
                            .add(ChangeLanguage(isEnglish: value));
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<SettingsBloc>(),
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }
}

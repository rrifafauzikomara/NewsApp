import 'package:dependencies/dependencies.dart';
import 'package:settings/presentation/bloc/bloc.dart';
import 'package:shared/common/common.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(Initial());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is ChangeTheme) {
      yield* _changeTheme(event.isDarkTheme);
    } else if (event is ChangeLanguage) {
      yield* _changeLanguage(event.isEnglish);
    }
  }

  Stream<SettingsState> _changeTheme(bool isDarkTheme) async* {
    if (isDarkTheme) {
      yield ThemeState(theme: darkTheme, isDarkTheme: isDarkTheme);
    } else {
      yield ThemeState(theme: lightTheme, isDarkTheme: isDarkTheme);
    }
  }

  Stream<SettingsState> _changeLanguage(bool isEnglish) async* {}
}

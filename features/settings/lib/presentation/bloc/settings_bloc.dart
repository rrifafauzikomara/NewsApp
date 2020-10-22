import 'package:dependencies/dependencies.dart';
import 'package:settings/presentation/bloc/bloc.dart';

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
    yield ThemeState(isDarkTheme: isDarkTheme);
  }

  Stream<SettingsState> _changeLanguage(bool isEnglish) async* {
    if (isEnglish)
      yield IndonesiaLanguageState();
    else
      yield EnglishLanguageState();
  }
}

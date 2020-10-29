import 'package:dependencies/dependencies.dart';
import 'package:settings/presentation/bloc/setting/bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(Initial());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is ChangeLanguage) {
      if (event.isEnglish)
        yield IndonesiaLanguageState();
      else
        yield EnglishLanguageState();
    }
  }
}

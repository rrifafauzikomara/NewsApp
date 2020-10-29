import 'package:core/local/shared_pref_helper.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:settings/presentation/bloc/setting/bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPrefHelper prefHelper;

  SettingsBloc({@required this.prefHelper}) : super(Initial());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is ChangeLanguage) {
      await prefHelper.saveValueIndonesianLanguage(event.isEnglish);
      if (event.isEnglish)
        yield IndonesiaLanguageState();
      else
        yield EnglishLanguageState();
    } else if (event is GetLanguage) {
      var isIndonesian = await prefHelper.getValueIndonesianLanguage();
      yield LanguageState(isActive: isIndonesian);
    }
  }
}

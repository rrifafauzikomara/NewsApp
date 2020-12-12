import 'package:core/local/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:settings/presentation/bloc/language/language_event.dart';
import 'package:settings/presentation/bloc/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SharedPrefHelper prefHelper;

  LanguageBloc({@required this.prefHelper})
      : super(InitialLanguage(isIndonesian: false));

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is LanguageChanged) {
      await prefHelper.saveValueIndonesianLanguage(event.isIndonesian);
      if (event.isIndonesian)
        yield EnglishLanguageState();
      else
        yield IndonesiaLanguageState();
      yield InitialLanguage(isIndonesian: event.isIndonesian);
    } else if (event is GetLanguage) {
      var isIndonesian = await prefHelper.getValueIndonesianLanguage();
      yield InitialLanguage(isIndonesian: isIndonesian);
    }
  }
}

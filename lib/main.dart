export 'package:flutter/material.dart';
import 'package:flash_cards/objectbox.g.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:forui/forui.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'main.dart';

export 'package:colornames/colornames.dart';
export 'package:flash_cards/features/dashboard.dart';
export 'package:flash_cards/features/cards/new_flash_group_dialog.dart';
export 'package:flash_cards/features/cards/flash_card_ui.dart';
export 'package:flash_cards/features/cards/new_flash_card_dialog.dart';
export 'package:flash_cards/features/cards/flash_cards_page.dart';
export 'package:flash_cards/features/cards/flash_groups_page.dart';
export 'package:flash_cards/domain/models/question.dart';
export 'package:flash_cards/_archive/questions/questions_bloc.dart';
export 'package:flash_cards/_archive/questions/questions_page.dart';
export 'package:flash_cards/domain/models/quiz.dart';
export 'package:flash_cards/_archive/quizzes/quizzes_bloc.dart';
export 'package:flash_cards/_archive/quizzes/quizzes_page.dart';
export 'package:flash_cards/domain/repositories/settings_repository.dart';
export 'package:flash_cards/features/settings/settings_page.dart';
export 'package:flash_cards/features/stats/stats_page.dart';
export 'package:flash_cards/features/study_timer/sessions.dart';
export 'package:flash_cards/features/study_timer/studies.dart';
export 'package:flash_cards/features/study_timer/study_timer.dart';
export 'utils/navigator.dart';
export 'package:states_rebuilder/states_rebuilder.dart';
export 'utils/api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    storage = await openStore(
      directory: '${(await getApplicationDocumentsDirectory()).path}/cards',
    );
  } catch (e) {
    print(e);
  }
  runApp(App());
}

mixin AppBloc {
  bool get dark => settingsRepository.dark;
  ThemeMode get themeMode => settingsRepository.themeMode;
}

class App extends UI with AppBloc {
  @override
  void didMountWidget(context) => FlutterNativeSplash.remove();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator.navigatorKey,
      themeMode: themeMode,
      home: DashboardPage(),
      builder: (context, child) {
        return FTheme(
          data: switch (dark) {
            true => FThemes.yellow.dark,
            false => FThemes.yellow.light,
          },
          child: child!,
        );
      },
    );
  }
}

late Store storage;

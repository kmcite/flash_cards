import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:manager/collection.dart';
import 'package:objectbox/objectbox.dart';

import 'main.dart';

export 'package:colornames/colornames.dart';
export 'package:flash_cards/features/app.dart';
export 'package:flash_cards/features/dashboard/dashboard.dart';
export 'package:flash_cards/flash_groups/create_new_flash_group.dart';
export 'package:flash_cards/flash_cards/flash_card_ui.dart';
export 'package:flash_cards/flash_cards/create_new_flash_card.dart';
export 'package:flash_cards/flash_cards/flash_cards_page.dart';
export 'package:flash_cards/flash_groups/flash_groups_page.dart';
export 'package:flash_cards/features/questions/question.dart';
export 'package:flash_cards/features/questions/questions_bloc.dart';
export 'package:flash_cards/features/questions/questions_page.dart';
export 'package:flash_cards/features/quizzes/quiz.dart';
export 'package:flash_cards/features/quizzes/quizzes_bloc.dart';
export 'package:flash_cards/features/quizzes/quizzes_page.dart';
export 'package:flash_cards/settings/settings.dart';
export 'package:flash_cards/settings/settings_page.dart';
export 'package:flash_cards/stats/stats_page.dart';
export 'package:flash_cards/study_timer/sessions.dart';
export 'package:flash_cards/study_timer/studies.dart';
export 'package:flash_cards/study_timer/study_timer.dart';
export 'navigator.dart';
export 'package:manager/manager.dart';

void main() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  await Model.initialize();
  runApp(App());
}

late Box storage;

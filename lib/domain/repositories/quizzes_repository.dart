import 'package:flash_cards/utils/api.dart';

import '../models/quiz.dart';

class QuizzesRepository with CRUD<Quiz> {}

final quizzesRepository = QuizzesRepository();

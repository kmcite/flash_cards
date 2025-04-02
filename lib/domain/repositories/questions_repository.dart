import 'package:flash_cards/main.dart';

class QuestionsRepository with CRUD<Question> {}

final questionsRepository = QuestionsRepository();

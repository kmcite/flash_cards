import 'package:manager/collection.dart';

import '../../main.dart';

final questionsBloc = QuestionsBloc();

class QuestionsBloc {
  final questionsRM = RM.injectStream(
    () => questionsRepository.watch(),
    initialState: questionsRepository.getAll(),
  );

  bool get waiting => questionsRM.isWaiting;

  List<Question> get questions => questionsRM.state;

  void put(Question question) {
    questionsRepository.put(question);
  }

  void delete(Question question) {
    questionsRepository.delete(question.id);
  }
}

final questionsRepository = QuestionsRepository(
  fromJson: Question.fromJson,
);

class QuestionsRepository extends Collection<Question> {
  QuestionsRepository({required super.fromJson});
}

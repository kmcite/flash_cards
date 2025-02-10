import 'package:manager/collection.dart';

import '../../main.dart';

final QuizzesBloc quizzesBloc = QuizzesBloc();

class QuizzesBloc {
  final quizzesRM = RM.injectStream(
    () => quizzesRepository.watch(),
    initialState: quizzesRepository.getAll(),
  );
  List<Quiz> get quizzes => quizzesRM.state;

  void put(Quiz quiz) {
    quizzesRepository.put(quiz);
  }

  void delete(Quiz quiz) {
    quizzesRepository.delete(quiz.id);
  }

  Quiz? get(quizID) => quizzesRepository.get(quizID);
}

final quizzesRepository = QuizzesRepository(fromJson: Quiz.fromJson);

class QuizzesRepository extends Collection<Quiz> {
  QuizzesRepository({required super.fromJson});
}

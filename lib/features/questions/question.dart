import 'package:manager/collection.dart';

class Question extends Model {
  String title = '';
  String a = '';
  String b = '';
  String c = '';
  String d = '';
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'a': a,
      'b': b,
      'c': c,
      'd': d,
    };
  }

  Question();
  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    title = json['title'] ?? '';
    a = json['a'] ?? '';
    b = json['b'] ?? '';
    c = json['c'] ?? '';
    d = json['d'] ?? '';
  }
}

// class QuestionsState with _$QuestionsState {
//   const factory QuestionsState({
//     @Default(<String, Question>{}) final Map<String, Question> cache,
//     @Default(QuestionsStatus.success) final QuestionsStatus questionsStatus,
//   }) = _QuestionsState;

//   factory QuestionsState.fromJson(json) => _$QuestionsStateFromJson(json);
// }

enum QuestionsStatus { loading, success, error }

import 'package:objectbox/objectbox.dart';

@Entity()
class Question {
  @Id(assignable: true)
  int id = 0;
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

enum QuestionsStatus { loading, success, error }

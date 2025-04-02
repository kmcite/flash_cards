import 'package:flash_cards/main.dart';

class Quiz {
  int id = 0;
  String? title;
  String? author;
  Duration? duration;
  String? difficultyLevel;
  String? chapter;
  String? instructions;
  Map<String, dynamic>? metadata;
  List<UserScore>? userScores;
  bool? randomizeQuestions;
  bool? isPublic;
  String? accessCode;
  DateTime? dateCreated;
  DateTime? lastModified;
  List<Question>? questions;

  Quiz();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'duration': duration?.inMilliseconds,
      'difficultyLevel': difficultyLevel,
      'chapter': chapter,
      'instructions': instructions,
      'metadata': metadata,
      'userScores': userScores?.map((e) => e.toJson()).toList(),
      'randomizeQuestions': randomizeQuestions,
      'isPublic': isPublic,
      'accessCode': accessCode,
      'dateCreated': dateCreated?.toIso8601String(),
      'lastModified': lastModified?.toIso8601String(),
      'questions': questions?.map((e) => e.toJson()).toList(),
    };
  }

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    title = json['title'];
    author = json['author'];
    duration = json['duration'] != null
        ? Duration(milliseconds: json['duration'])
        : null;
    difficultyLevel = json['difficultyLevel'];
    chapter = json['chapter'];
    instructions = json['instructions'];
    metadata = json['metadata'];
    userScores = (json['userScores'] as List?)
        ?.map((e) => UserScore.fromJson(e))
        .toList();
    randomizeQuestions = json['randomizeQuestions'];
    isPublic = json['isPublic'];
    accessCode = json['accessCode'];
    dateCreated = json['dateCreated'] != null
        ? DateTime.parse(json['dateCreated'])
        : null;
    lastModified = json['lastModified'] != null
        ? DateTime.parse(json['lastModified'])
        : null;
    questions =
        (json['questions'] as List?)?.map((e) => Question.fromJson(e)).toList();
  }
}

class UserScore {
  String? username;
  int? score;
  DateTime? timestamp;

  UserScore();

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'score': score,
      'timestamp': timestamp?.toIso8601String(),
    };
  }

  static UserScore fromJson(Map<String, dynamic> json) {
    var userScore = UserScore();
    userScore.username = json['username'];
    userScore.score = json['score'];
    userScore.timestamp =
        json['timestamp'] != null ? DateTime.parse(json['timestamp']) : null;
    return userScore;
  }
}

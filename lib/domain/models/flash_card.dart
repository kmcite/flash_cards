import 'package:objectbox/objectbox.dart';

import 'flash_group.dart';

@Entity()
class FlashCard {
  @Id(assignable: true)
  int id = 0;

  String explaination = '';
  String question = '';
  String answer = '';

  final flashGroups = ToMany<FlashGroup>();
}

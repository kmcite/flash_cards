import 'package:objectbox/objectbox.dart';

import 'flash_card.dart';

@Entity()
class FlashGroup {
  @Id(assignable: true)
  int id = 0;
  String name = '';
  final flashCards = ToMany<FlashCard>();
  FlashGroup();
}

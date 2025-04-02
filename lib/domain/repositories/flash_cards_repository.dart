import 'package:flash_cards/domain/models/flash_card.dart';
import 'package:flash_cards/main.dart';

final flashCardsRepository = FlashCardsRepository();

class FlashCardsRepository with CRUD<FlashCard> {
  FlashCard flashCard([FlashCard? flashCard]) {
    if (flashCard != null) {
      single.state = flashCard;
      single.notify();
    }
    return single.state;
  }
}

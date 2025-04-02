import 'package:flash_cards/domain/models/flash_group.dart';
import 'package:flash_cards/main.dart';

class FlashGroupsRepository with CRUD<FlashGroup> {
  FlashGroup flashGroup([FlashGroup? flashGroup]) {
    if (flashGroup != null) {
      single.state = flashGroup;
      single.notify();
    }
    return single.state;
  }
}

final flashGroupsRepository = FlashGroupsRepository();

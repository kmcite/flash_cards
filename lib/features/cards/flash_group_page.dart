import 'package:flash_cards/domain/models/flash_group.dart';
import 'package:flash_cards/domain/repositories/flash_groups_repository.dart';
import 'package:flash_cards/main.dart';
import 'package:forui/forui.dart';

final flashGroupRepository = FlashGroupRepository();

class FlashGroupRepository {
  int id = 0;
}

final flashGroupBloc = FlashGroupBloc();

class FlashGroupBloc {
  final flashGroupRM = RM.inject(
    () => flashGroupsRepository.get(flashGroupRepository.id),
  );
  FlashGroup flashGroup([FlashGroup? value]) {
    if (value != null) {
      flashGroupRM
        ..state = value
        ..notify();
    }
    return flashGroupRM.state!;
  }
}

class FlashGroupPage extends UI {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      content: 'content'.text(),
    );
  }
}

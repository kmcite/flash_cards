import 'package:flash_cards/flash_groups/flash_groups_repository.dart';
import 'package:flash_cards/main.dart';
import 'package:forui/forui.dart';

final flashGroupRepository = FlashGroupRepository();

class FlashGroupRepository {
  String id = '';
}

final flashGroupBloc = FlashGroupBloc();

class FlashGroupBloc {
  final flashGroupRM = RM.inject(
    () => flashGroupsRepository.get(flashGroupRepository.id)!,
  );
  FlashGroup flashGroup([FlashGroup? value]) {
    if (value != null) {
      flashGroupRM
        ..state = value
        ..notify();
    }
    return flashGroupRM.state;
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

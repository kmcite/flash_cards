// import 'package:shadcn_ui/shadcn_ui.dart';

// import '../../main.dart';

import 'package:flash_cards/domain/models/flash_card.dart';
import 'package:flash_cards/domain/models/flash_group.dart';
import 'package:flash_cards/domain/repositories/flash_cards_repository.dart';
import 'package:flash_cards/domain/repositories/flash_groups_repository.dart';
import 'package:flash_cards/main.dart';
import 'package:forui/forui.dart';

mixin NewFlashCardBloc {
  final flashCardRM = RM.inject(() => FlashCard());

  FlashCard flashCard([FlashCard? _flashCard]) {
    if (_flashCard != null) {
      flashCardRM
        ..state = _flashCard
        ..notify();
    }
    return flashCardRM.state;
  }

  List<FlashGroup> get groups => flashGroupsRepository.getAll();

  void success() {
    flashCardsRepository.put(flashCard());
    cancel();
  }

  void cancel() => navigator.back();

  void flashGroup(FlashGroup _flashGroup) {
    flashCard(flashCard()..flashGroups.add(_flashGroup));
  }

  void answer(String answer) => flashCard(flashCard()..answer = answer);
  void question(String question) => flashCard(flashCard()..question = question);
  void explaination(String explaination) {
    flashCard(flashCard()..explaination = explaination);
  }
}

class NewFlashCardDialog extends UI with NewFlashCardBloc {
  NewFlashCardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return FDialog(
      title: 'New FlashCard'.text(),
      direction: Axis.horizontal,
      actions: [
        FButton.icon(
          style: FButtonStyle.destructive,
          child: FIcon(FAssets.icons.saveOff),
          onPress: cancel,
        ),
        FButton.icon(
          style: FButtonStyle.primary,
          child: FIcon(FAssets.icons.save),
          onPress: success,
        ),
      ],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FTileGroup(
            label: 'Group of Flashes'.text(),
            children: groups.map(
              (flashGroup) {
                return FTile(
                  title: flashGroup.name.text(),
                  onPress: () {
                    this.flashGroup(flashGroup);
                  },
                );
              },
            ).toList(),
          ),
          FTextField(
            label: 'Question'.text(),
            initialValue: flashCard().question,
            minLines: 2,
            maxLines: 3,
            onChange: question,
          ),
          FTextField(
            label: 'Answer'.text(),
            initialValue: flashCard().answer,
            minLines: 2,
            maxLines: 3,
            onChange: answer,
          ),
          FTextField(
            label: 'Explaination'.text(),
            initialValue: flashCard().explaination,
            onChange: explaination,
            minLines: 2,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

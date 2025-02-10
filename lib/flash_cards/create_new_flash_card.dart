// import 'package:shadcn_ui/shadcn_ui.dart';

// import '../../main.dart';

import 'package:flash_cards/flash_groups/flash_groups_repository.dart';
import 'package:flash_cards/main.dart';
import 'package:forui/forui.dart';

import 'flash_cards_repository.dart';

final newFlashCardBloc = NewFlashCardBloc();

class NewFlashCardBloc {
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

  Future<void> openCreateNewFlashCardDialog() async {
    final flashCard = await navigator.toDialog<FlashCard>(NewFlashCardDialog());
    if (flashCard != null) {
      flashCardsRepository.put(flashCard);
    }
  }

  void success() => navigator.back(flashCard());
  void cancel() => navigator.back();

  void flashGroup(FlashGroup _flashGroup) =>
      flashCard(flashCard()..flashGroup = _flashGroup);
  void answer(String answer) => flashCard(flashCard()..answer = answer);
  void question(String question) => flashCard(flashCard()..question = question);
  void explaination(String explaination) =>
      flashCard(flashCard()..explaination = explaination);
}

class NewFlashCardDialog extends UI {
  const NewFlashCardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return FDialog(
      title: 'New FlashCard'.text(),
      direction: Axis.horizontal,
      actions: [
        FButton.icon(
          child: FIcon(FAssets.icons.saveOff),
          onPress: newFlashCardBloc.cancel,
        ),
        FButton.icon(
          child: FIcon(FAssets.icons.save),
          onPress: newFlashCardBloc.success,
        ),
      ],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FTileGroup(
            children: newFlashCardBloc.groups
                .map(
                  (flashGroup) => FTile(
                    title: flashGroup.name.text(),
                    onPress: () => newFlashCardBloc.flashGroup(flashGroup),
                  ),
                )
                .toList(),
          ),
          FTextField(
            initialValue: newFlashCardBloc.flashCard().question,
            minLines: 2,
            maxLines: 3,
            onChange: newFlashCardBloc.question,
          ),
          FTextField(
            initialValue: newFlashCardBloc.flashCard().answer,
            minLines: 2,
            maxLines: 3,
            onChange: newFlashCardBloc.answer,
          ),
          FTextField(
            initialValue: newFlashCardBloc.flashCard().explaination,
            onChange: newFlashCardBloc.explaination,
            minLines: 2,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

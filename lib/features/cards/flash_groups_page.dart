import 'package:flash_cards/domain/models/flash_card.dart';
import 'package:flash_cards/domain/models/flash_group.dart';
import 'package:flash_cards/domain/repositories/flash_cards_repository.dart';
import 'package:forui/forui.dart';

import '../../main.dart';
import '../../domain/repositories/flash_groups_repository.dart';

mixin FlashGroupsBloc {
  final flashGroupsRM = RM.injectStream(
    flashGroupsRepository.watch,
    initialState: flashGroupsRepository.getAll(),
  );
  List<FlashGroup> get groups => flashGroupsRM.state;

  void put(FlashGroup group) => flashGroupsRepository.put(group);

  void remove(FlashGroup group) => flashGroupsRepository.remove(group.id);

  FlashGroup? get(int flashGroupId) => flashGroupsRepository.get(flashGroupId);
  void details(FlashGroup group) {
    flashGroupsRepository.flashGroup(group);
    navigator.to(FlashCardsPage());
  }

  Future<void> openCreateNewFlashGroupDialog() async {
    final flashGroup =
        await navigator.toDialog<FlashGroup>(NewFlashGroupDialog());
    if (flashGroup != null) {
      flashGroupsRepository.put(flashGroup);
    }
  }

  Future<void> openCreateNewFlashCardDialog() async {
    final flashCard = await navigator.toDialog<FlashCard>(NewFlashCardDialog());
    if (flashCard != null) {
      flashCardsRepository.put(flashCard);
    }
  }
}

class FlashGroupsPage extends UI with FlashGroupsBloc {
  FlashGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'flash groups'.text(),
        actions: [
          FButton.icon(
            onPress: openCreateNewFlashCardDialog,
            child: FIcon(FAssets.icons.file),
          ),
          FButton.icon(
            onPress: openCreateNewFlashGroupDialog,
            child: FIcon(FAssets.icons.folder),
          ),
        ],
      ),
      content: FTileGroup.builder(
        label: 'Group of Flashes'.text(),
        description: 'list of flash groups'.text(),
        divider: FTileDivider.full,
        count: groups.length,
        tileBuilder: (context, index) {
          final flashGroup = groups[index];
          return FTile(
            title: flashGroup.name.text(),
            subtitle: flashGroup.flashCards.length.text(),
            suffixIcon: FButton.icon(
              onPress: () => details(flashGroup),
              child: FIcon(FAssets.icons.doorOpen),
            ),
          );
        },
      ),
    );
  }
}

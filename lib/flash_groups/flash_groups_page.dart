import 'package:flash_cards/flash_groups/flash_group_page.dart';
import 'package:forui/forui.dart';

import '../main.dart';
import 'flash_groups_repository.dart';

final flashGroupsBloc = FlashGroupsBloc();

class FlashGroupsBloc {
  final flashGroupsRM = RM.injectStream(
    flashGroupsRepository.watch,
    initialState: flashGroupsRepository.getAll(),
  );
  List<FlashGroup> get groups => flashGroupsRM.state;

  void put(FlashGroup group) => flashGroupsRepository.put(group);

  void delete(FlashGroup group) => flashGroupsRepository.delete(group.id);

  FlashGroup? get(String flashGroupId) =>
      flashGroupsRepository.get(flashGroupId);
}

class FlashGroupsPage extends UI {
  const FlashGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'flash groups'.text(),
        actions: [
          FButton.icon(
            onPress: newFlashCardBloc.openCreateNewFlashCardDialog,
            child: FIcon(FAssets.icons.file),
          ),
          FButton.icon(
            onPress: newFlashGroupBloc.openCreateNewFlashGroupDialog,
            child: FIcon(FAssets.icons.folder),
          ),
        ],
      ),
      content: FTileGroup.builder(
        label: 'Group of Flashes'.text(),
        description: 'list of flash groups'.text(),
        divider: FTileDivider.full,
        count: flashGroupsBloc.groups.length,
        tileBuilder: (context, index) {
          final flashGroup = flashGroupsBloc.groups[index];
          return FTile(
            title: flashGroup.name.text(),
            subtitle: flashGroup.flashCards.length.text(),
            suffixIcon: FButton.icon(
              onPress: () {
                RM.navigate.to(
                  FlashGroupPage(),
                );
              },
              child: const Icon(Icons.open_in_new),
            ),
          );
        },
      ),
    );
  }
}

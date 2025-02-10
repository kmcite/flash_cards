import 'package:forui/forui.dart';

import '../main.dart';
import 'flash_cards_repository.dart';
import '../flash_groups/flash_groups_repository.dart';

final flashCardsRM = FlashCardsBloc();

class FlashCardsBloc {
  final flashCardsRM = RM.injectStream(
    flashCardsRepository.watch,
    initialState: flashCardsRepository.getAll(),
  );
  List<FlashCard> get cards => flashCardsRM.state;

  FlashCard? get(String id) => flashCardsRepository.get(id);
  void put(FlashCard flashCard) => flashCardsRepository.put(flashCard);
}

Future<void> editFlashGroupName(String flashGroupId) async {
  final name = await RM.navigate.toDialog<String>(
    Dialog(
      child: FTextField(
        initialValue: flashGroupsBloc.get(flashGroupId)?.name,
        onSubmit: RM.navigate.back,
      ).pad(),
    ),
  );
  if (name != null) {
    final flashGroup = flashGroupsBloc.get(flashGroupId);
    if (flashGroup != null) {
      flashGroupsBloc.put(flashGroup..name = name);
    }
  }
}

Future<void> editFlashCardGroup(String flashCardId) async {
  final flashGroup = await RM.navigate.toDialog<FlashGroup>(
    Dialog(
      child: FTileGroup(
        children: flashGroupsBloc.groups
            .map(
              (eachFlashGroup) => FTile(
                title: eachFlashGroup.name.text(),
                onPress: () {
                  RM.navigate.back(eachFlashGroup);
                },
              ),
            )
            .toList(),
      ).pad(),
    ),
  );
  if (flashGroup != null) {
    final flashCard = flashCardsRM.get(flashCardId);
    if (flashCard != null) {
      flashCardsRM.put(flashCard..flashGroup = flashGroup);
    }
  }
}

class FlashCardsPage extends UI {
  const FlashCardsPage({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    final flashGroup = flashGroupsBloc.get(id);
    if (flashGroup != null)
      return Scaffold(
        appBar: AppBar(
          title: flashGroup.name.text(),
          actions: [
            // ShadButton(
            //   onPressed: () => editFlashGroupName(id),
            //   icon: Icon(Icons.edit_document),
            // ),
          ],
        ),
        // body: ListView(
        //   children: flashGroup.flashCards.map(
        //     (flashCard) {
        //       return FlashCardUI(
        //         id: flashCard.id,
        //       );
        //     },
        //   ).toList(),
        // ),
        // floatingActionButton: ShadButton(
        //   // tooltip: 'FlashCard',
        //   onPressed: createNewFlashCard,
        //   icon: Icon(Icons.create),
        // ),
      );
    return FlashGroupBuilder(
      id: id,
      builder: (flashGroup) {
        return switch (id) {
          // ignore: constant_pattern_never_matches_value_type
          '' => Scaffold(
              appBar: AppBar(
                title: 'Ungrouped'.text(),
              ),
              // body: PageView.builder(
              //   itemCount: flashCardsRM()
              //       .where(
              //         (efc) => efc.flashGroupId == flashGroupId,
              //       )
              //       .length,
              //   itemBuilder: (context, index) {
              //     final flashCard = flashCardsRM()
              //         .where(
              //           (efc) => efc.flashGroupId == flashGroupId,
              //         )
              //         .toList()[index];
              //     return FlashCardUI(
              //       flashCardId: flashCard.id,
              //     );
              //   },
              // ),
            ),
          _ => () {
              flashGroup!;
              return Scaffold(
                appBar: AppBar(
                  title: flashGroup.name.text(),
                  backgroundColor: flashGroup.color,
                  actions: [
                    // ShadButton(
                    //   onPressed: () => editFlashGroupName(id),
                    //   icon: Icon(Icons.edit_document),
                    // ),
                  ],
                ),
                // body: ListView(
                //   children: flashGroup.flashCards.map(
                //     (flashCard) {
                //       return FlashCardUI(
                //         id: flashCard.id,
                //       );
                //     },
                //   ).toList(),
                // ),
              );
            }(),
        };
      },
    );
  }
}

class FlashGroupBuilder extends UI {
  final String id;
  final Widget Function(FlashGroup? flashGroup) builder;
  const FlashGroupBuilder({
    super.key,
    required this.id,
    required this.builder,
  });
  @override
  Widget build(BuildContext context) {
    final flashGroup = flashGroupsBloc.get(id);
    return builder(flashGroup);
  }
}

class FlashCardBuilder extends UI {
  final String id;
  final Widget Function(FlashCard? flashCard) builder;
  const FlashCardBuilder({
    super.key,
    required this.id,
    required this.builder,
  });
  @override
  Widget build(BuildContext context) {
    final flashCard = flashCardsRM.get(id);
    return builder(flashCard);
  }
}

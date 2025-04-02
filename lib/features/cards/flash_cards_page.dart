import 'package:flash_cards/domain/models/flash_card.dart';
import 'package:flash_cards/domain/models/flash_group.dart';
import 'package:flash_cards/domain/repositories/flash_groups_repository.dart';
import 'package:forui/forui.dart';

import '../../main.dart';
import '../../domain/repositories/flash_cards_repository.dart';

mixin class FlashCardsBloc {
  final flashCardsRM = RM.injectStream(
    flashCardsRepository.watch,
    initialState: flashCardsRepository.getAll(),
  );

  Injected<FlashGroup> get flashGroupRM => flashGroupsRepository.single;
  FlashGroup get flashGroup => flashGroupRM.state;

  Iterable<FlashCard> get cards {
    return flashCardsRM.state.where(
      (fc) {
        return fc.flashGroups.any((fg) => fg.id == flashGroup.id);
      },
    );
  }

  FlashCard? get(int id) => flashCardsRepository.get(id);
  void put(FlashCard flashCard) => flashCardsRepository.put(flashCard);
  void getCardById(int id) {}
  void getGroupById(int id) {}
}

Future<void> editFlashGroupName(int flashGroupId) async {
  // final name = await RM.navigate.toDialog<String>(
  //   Dialog(
  //     child: FTextField(
  //       initialValue: flashGroupsBloc.get(flashGroupId)?.name,
  //       onSubmit: RM.navigate.back,
  //     ).pad(),
  //   ),
  // );
  // if (name != null) {
  //   final flashGroup = flashGroupsBloc.get(flashGroupId);
  //   if (flashGroup != null) {
  //     flashGroupsBloc.put(flashGroup..name = name);
  //   }
  // }
}

Future<void> editFlashCardGroup(int flashCardId) async {
  // final flashGroup = await RM.navigate.toDialog<FlashGroup>(
  //   Dialog(
  //     child: FTileGroup(
  //       children: flashGroupsBloc.groups.map(
  //         (eachFlashGroup) {
  //           return FTile(
  //             title: eachFlashGroup.name.text(),
  //             onPress: () {
  //               RM.navigate.back(eachFlashGroup);
  //             },
  //           );
  //         },
  //       ).toList(),
  //     ).pad(),
  //   ),
  // );
  // if (flashGroup != null) {
  //   final flashCard = flashCardsRM.get(flashCardId);
  //   if (flashCard != null) {
  //     flashCardsRM.put(flashCard..flashGroup = flashGroup);
  //   }
  // }
}

class FlashCardsPage extends UI with FlashCardsBloc {
  FlashCardsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: flashGroup.name.text(),
        prefixActions: [
          FButton.icon(
            onPress: () {
              navigator.back();
            },
            child: FIcon(FAssets.icons.arrowLeft),
          ),
        ],
        suffixActions: [
          FButton.icon(
            onPress: () {
              // editFlashGroupName(id);
            },
            child: FIcon(FAssets.icons.penTool),
          ),
        ],
      ),
      content: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards.elementAt(index);
          return FTile(
            title: card.text(),
          );
        },
      ),
    );

    // if (flashGroup != null)
    //   return Scaffold(
    //       // body: ListView(
    //       //   children: flashGroup.flashCards.map(
    //       //     (flashCard) {
    //       //       return FlashCardUI(
    //       //         id: flashCard.id,
    //       //       );
    //       //     },
    //       //   ).toList(),
    //       // ),
    //       // floatingActionButton: ShadButton(
    //       //   // tooltip: 'FlashCard',
    //       //   onPressed: createNewFlashCard,
    //       //   icon: Icon(Icons.create),
    //       // ),
    //       );
    // return FlashGroupBuilder(
    //   id: id,
    //   builder: (flashGroup) {
    //     return switch (id) {
    //       // ignore: constant_pattern_never_matches_value_type
    //       '' => Scaffold(
    //           appBar: AppBar(
    //             title: 'Ungrouped'.text(),
    //           ),
    //           // body: PageView.builder(
    //           //   itemCount: flashCardsRM()
    //           //       .where(
    //           //         (efc) => efc.flashGroupId == flashGroupId,
    //           //       )
    //           //       .length,
    //           //   itemBuilder: (context, index) {
    //           //     final flashCard = flashCardsRM()
    //           //         .where(
    //           //           (efc) => efc.flashGroupId == flashGroupId,
    //           //         )
    //           //         .toList()[index];
    //           //     return FlashCardUI(
    //           //       flashCardId: flashCard.id,
    //           //     );
    //           //   },
    //           // ),
    //         ),
    //       _ => () {
    //           flashGroup!;
    //           return Scaffold(
    //             appBar: AppBar(
    //               title: flashGroup.name.text(),
    //               backgroundColor: flashGroup.color,
    //               actions: [
    //                 // ShadButton(
    //                 //   onPressed: () => editFlashGroupName(id),
    //                 //   icon: Icon(Icons.edit_document),
    //                 // ),
    //               ],
    //             ),
    //             // body: ListView(
    //             //   children: flashGroup.flashCards.map(
    //             //     (flashCard) {
    //             //       return FlashCardUI(
    //             //         id: flashCard.id,
    //             //       );
    //             //     },
    //             //   ).toList(),
    //             // ),
    //           );
    //         }(),
    //     };
    //   },
    // );
  }
}

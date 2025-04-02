// import '../main.dart';

// final editingRM = RM.inject(() => false);
// bool editing([bool? _editing]) =>
//     _editing != null ? editingRM.state = _editing : editingRM.state;

// class FlashCardUI extends UI {
//   const FlashCardUI({
//     super.key,
//     required this.id,
//   });
//   final int id;
//   @override
//   Widget build(BuildContext context) {
//     return FlashCardBuilder(
//       id: id,
//       builder: (flashCard) {
//         if (flashCard == null) return CircularProgressIndicator().center();
//         return Card(
//           child: ListTile(
//             title: Column(
//               children: [
//                 TextFormField(
//                   initialValue: flashCard.question,
//                   onChanged: (question) => editQuestionOfFlashCard(
//                     id,
//                     question,
//                   ),
//                 ).pad(),
//                 TextFormField(
//                   initialValue: flashCard.answer,
//                   onChanged: (answer) => editAnswerOfFlashCard(
//                     id,
//                     answer,
//                   ),
//                 ).pad(),
//                 TextFormField(
//                   initialValue: flashCard.explaination,
//                   onChanged: (explaination) => editExplainationOfFlashCard(
//                     id,
//                     explaination,
//                   ),
//                 ).pad(),
//               ],
//             ),
//           ),
//         ).pad();
//       },
//     );
//   }
// }

// Future<void> editQuestionOfFlashCard(
//   int flashCardId,
//   String question,
// ) async {
//   final flashCard = flashCardsRM.byId(flashCardId);
//   if (flashCard == null) return;
//   flashCardsRM.put(
//     flashCard..question = question,
//   );
// }

// Future<void> editAnswerOfFlashCard(
//   int flashCardId,
//   String answer,
// ) async {
//   final flashCard = flashCardsRM.byId(flashCardId);
//   if (flashCard == null) return;
//   flashCardsRM.put(
//     flashCard..answer = answer,
//   );
// }

// Future<void> editExplainationOfFlashCard(
//   int flashCardId,
//   String explaination,
// ) async {
//   final flashCard = flashCardsRM.byId(flashCardId);
//   if (flashCard == null) return;
//   flashCardsRM.put(
//     flashCard..explaination = explaination,
//   );
// }

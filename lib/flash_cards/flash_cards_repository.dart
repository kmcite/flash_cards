import 'package:flash_cards/flash_groups/flash_groups_repository.dart';
import 'package:manager/collection.dart';

final flashCardsRepository = FlashCardsRepository(fromJson: FlashCard.fromJson);

class FlashCardsRepository extends Collection<FlashCard> {
  FlashCardsRepository({required super.fromJson});
}

class FlashCard extends Model {
  String? _flashGroupId;

  FlashGroup? get flashGroup => flashGroupsRepository.get(_flashGroupId ?? '');
  set flashGroup(FlashGroup? value) => _flashGroupId = value?.id;

  String explaination = '';
  String question = '';
  String answer = '';
  FlashCard();
  FlashCard.fromJson(json) {
    id = json['id'] ?? '';
    _flashGroupId = json['_flashGroupId'] ?? null;
    explaination = json['explaination'] ?? '';
    question = json['question'] ?? '';
    answer = json['answer'] ?? '';
  }
  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        '_flashGroupId': _flashGroupId,
        'explaination': explaination,
        'question': question,
        'answer': answer,
      };
}

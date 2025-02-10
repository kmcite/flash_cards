import 'package:flash_cards/flash_cards/flash_cards_repository.dart';
import 'package:flash_cards/main.dart';
import 'package:manager/collection.dart';

class FlashGroupsRepository extends Collection<FlashGroup> {
  FlashGroupsRepository({required super.fromJson});
}

final flashGroupsRepository =
    FlashGroupsRepository(fromJson: FlashGroup.fromJson);

class FlashGroup extends Model {
  String name = '';
  String _flashCards = '';
  int _colorIndex = 0;

  List<FlashCard> get flashCards => [];
  MaterialColor get color => Colors.primaries.elementAt(_colorIndex);
  set color(MaterialColor color) =>
      _colorIndex = Colors.primaries.indexOf(color);

  FlashGroup();
  FlashGroup.fromJson(json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    _flashCards = json['_flashCards'] ?? '';
    _colorIndex = json['_colorIndex'] ?? 0;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      '_flashCards': _flashCards,
      '_colorIndex': _colorIndex,
    };
  }
}

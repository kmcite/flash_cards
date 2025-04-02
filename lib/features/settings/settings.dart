import 'package:flash_cards/main.dart';

class Settings {
  int _themeModeIndex = 2;
  ThemeMode get themeMode => ThemeMode.values.elementAt(_themeModeIndex);
  set themeMode(ThemeMode value) {
    _themeModeIndex = value.index;
  }

  Map<String, dynamic> toJson() {
    return {
      '_themeModeIndex': _themeModeIndex,
    };
  }

  Settings();
  Settings.fromJson(Map<String, dynamic> json) {
    _themeModeIndex = json['_themeModeIndex'] ?? 1;
  }
}

final settingsRepository = RM.inject(() => Settings());

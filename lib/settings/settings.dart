import 'package:flash_cards/main.dart';
import 'package:manager/collection.dart';

class Settings extends Model {
  int _themeModeIndex = 1;
  ThemeMode get themeMode => ThemeMode.values.elementAt(_themeModeIndex);
  set themeMode(ThemeMode value) {
    _themeModeIndex = value.index;
  }

  @override
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

final settingsBloc = SettingsBloc();

class SettingsBloc {
  final settingsRM = RM.inject(Settings.new);

  Settings get settings => settingsRM.state;
  set settings(Settings settings) => settingsRM
    ..state = settings
    ..notify();

  ThemeMode get themeMode => settings.themeMode;
  void putThemeMode(ThemeMode? themeMode) {
    settings = settings..themeMode = themeMode!;
  }
}

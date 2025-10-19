import 'package:forui/forui.dart';

import '../../main.dart';

mixin SettingsBloc on UI {
  ThemeMode get themeMode => settingsRepository.themeMode;
  void putThemeMode(ThemeMode themeMode) {
    settingsRepository.put(themeMode);
  }
}

class SettingsPage extends UI with SettingsBloc {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'Settings'.text(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FTileGroup(
            children: [
              ThemeMode.light,
              ThemeMode.dark,
            ].map(
              (eachMode) {
                return FTile(
                  suffix: eachMode == themeMode ? Icon(FIcons.check) : null,
                  title: eachMode.name.toUpperCase().text(),
                  enabled: eachMode != themeMode,
                  onPress: () => putThemeMode(eachMode),
                );
              },
            ).toList(),
          ).pad(),
        ],
      ),
    );
  }
}

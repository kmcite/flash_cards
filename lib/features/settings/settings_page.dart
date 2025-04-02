import 'package:forui/forui.dart';

import '../../main.dart';

mixin class SettingsBloc {
  ThemeMode get themeMode => settingsRepository.state.themeMode;
  void putThemeMode(ThemeMode themeMode) {
    settingsRepository
      ..state = (settingsRepository.state..themeMode = themeMode)
      ..notify();
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
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FTileGroup(
            children: [
              ThemeMode.light,
              ThemeMode.dark,
            ].map(
              (eachMode) {
                return FTile(
                  suffixIcon:
                      eachMode == themeMode ? FIcon(FAssets.icons.check) : null,
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

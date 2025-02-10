import 'package:forui/forui.dart';

import '../main.dart';

class SettingsPage extends UI {
  const SettingsPage({super.key});

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
                  suffixIcon: eachMode == settingsBloc.themeMode
                      ? FIcon(FAssets.icons.check)
                      : null,
                  title: eachMode.name.toUpperCase().text(),
                  enabled: eachMode != settingsBloc.themeMode,
                  onPress: () => settingsBloc.putThemeMode(eachMode),
                );
              },
            ).toList(),
          ).pad(),
        ],
      ),
    );
  }
}

import 'package:flash_cards/main.dart';
import 'package:forui/forui.dart';

class DashboardPage extends UI {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      content: DashboardParts.values.map(
        (part) {
          return part.page;
        },
      ).elementAt(
        dashboardIndex(),
      ),
      footer: FBottomNavigationBar(
        index: dashboardIndex(),
        onChange: dashboardIndex,
        children: DashboardParts.values.map(
          (part) {
            return FBottomNavigationBarItem(
              icon: FIcon(part.icon),
              label: part.description.text(),
            );
          },
        ).toList(),
      ),
    );
  }
}

final dashboardIndexRM = RM.inject(() => 0);

int dashboardIndex([int? destination]) {
  if (destination != null) dashboardIndexRM.state = destination;
  return dashboardIndexRM.state;
}

enum DashboardParts { flashCards, studyTimer, stats, settings }

extension Utils on DashboardParts {
  SvgAsset get icon => switch (this) {
        DashboardParts.flashCards => FAssets.icons.idCard,
        DashboardParts.studyTimer => FAssets.icons.timer,
        DashboardParts.stats => FAssets.icons.info,
        DashboardParts.settings => FAssets.icons.settings,
      };
  String get description => switch (this) {
        DashboardParts.flashCards => 'cards',
        DashboardParts.studyTimer => 'timer',
        DashboardParts.stats => 'info',
        DashboardParts.settings => 'settings',
      };
  Widget get page => switch (this) {
        DashboardParts.flashCards => FlashGroupsPage(),
        DashboardParts.studyTimer => SettingsPage(),
        DashboardParts.stats => SettingsPage(),
        DashboardParts.settings => SettingsPage(),
      };
}

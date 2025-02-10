import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:forui/forui.dart';

import '../main.dart';

class App extends UI {
  @override
  void didMountWidget(BuildContext context) {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator.navigatorKey,
      themeMode: settingsBloc.themeMode,
      home: DashboardPage(),
      builder: (context, child) => FTheme(
        data: switch (settingsBloc.themeMode == ThemeMode.dark) {
          true => FThemes.yellow.dark,
          false => FThemes.yellow.light,
        },
        child: child!,
      ),
    );
  }
}

import 'package:forui/forui.dart';

import '../../main.dart';

class StatsPage extends UI {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'Stats'.text(),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: lastSevenDays
                .map(
                  (e) => Column(
                    children: [
                      Container(
                        // color: settingsBloc.materialColor,
                        height: e.durationOfStudy.toDouble(),
                        width: 30,
                        child: '${e.durationOfStudy} '.text().pad(),
                      ).pad()
                    ],
                  ),
                )
                .toList(),
          ).pad()
        ],
      ),
    );
  }
}

final lastSevenDays = <Day>[
  Day(
    durationOfStudy: 77,
  ),
  Day(
    durationOfStudy: 171,
  ),
  Day(
    durationOfStudy: 672,
  ),
  Day(
    durationOfStudy: 273,
  ),
  Day(
    durationOfStudy: 169,
  ),
  // Day(
  //   durationOfStudy: 337,
  // ),
  // Day(
  //   durationOfStudy: 190,
  // ),
];

class Day {
  int durationOfStudy = 0;
  Day({
    this.durationOfStudy = 0,
  });
}

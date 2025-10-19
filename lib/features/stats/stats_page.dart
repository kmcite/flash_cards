import 'package:forui/forui.dart';

import '../../main.dart';

mixin StatsBloc on UI {
  Iterable<Day> get lastSevenDays => daysRepository.lastSevenDays;
}

class StatsPage extends UI with StatsBloc {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'Stats'.text(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (lastSevenDays.isEmpty) Text('No data.'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: lastSevenDays.map(
              (day) {
                return Column(
                  children: [
                    Container(
                      height: day.durationOfStudy.toDouble(),
                      width: 30,
                      child: '${day.durationOfStudy} '.text().pad(),
                    ).pad()
                  ],
                );
              },
            ).toList(),
          ).pad()
        ],
      ),
    );
  }
}

class Day {
  int durationOfStudy = 0;
  Day({
    this.durationOfStudy = 0,
  });
  @override
  String toString() {
    return 'Day(durationOfStudy: $durationOfStudy)';
  }
}

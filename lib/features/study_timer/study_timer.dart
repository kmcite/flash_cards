// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flash_cards/main.dart';
import 'package:forui/forui.dart';

class StudyTimerPage extends UI with TimerBloc {
  StudyTimerPage({super.key});

  @override
  void didUnmountWidget() {
    stop();
  }

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'Timer'.text(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formatted(),
            style: context.theme.typography.xl6,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isRunning)
                FButton.icon(
                  child: Icon(FIcons.play),
                  style: FButtonStyle.primary(),
                  onPress: start,
                ).pad()
              else ...[
                FButton.icon(
                  child: Icon(FIcons.pause),
                  style: FButtonStyle.outline(),
                  onPress: pause,
                ).pad(),
                FButton.icon(
                  style: FButtonStyle.destructive(),
                  child: Icon(FIcons.refreshCw),
                  onPress: reset,
                ).pad(),
              ]
            ],
          ),
        ],
      ),
    );
  }
}

mixin class TimerBloc {
  Timer? _timer;
  final ticksRM = RM.inject(() => 0);
  final runningRM = RM.inject(() => false);

  int get seconds => ticksRM.state;
  String formatted() {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  bool get isRunning => runningRM.state;

  void start() {
    if (isRunning) return; // Prevent multiple timers from starting
    runningRM.state = true;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        ticksRM.state++;
        if (ticksRM.state >= 3600) {
          stop();
        }
      },
    );
  }

  void pause() {
    if (!isRunning) return; // Prevent pausing if already paused
    runningRM.state = false;
    _timer?.cancel();
  }

  void reset() {
    stop(); // Ensure timer is stopped before resetting
    daysRepository.put(Day(durationOfStudy: ticksRM.state));
    ticksRM.state = 0;
  }

  void stop() {
    runningRM.state = false;
    _timer?.cancel();
    _timer = null; // Clean up the timer reference
  }
}

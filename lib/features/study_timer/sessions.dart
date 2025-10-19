// import 'package:flash_cards/main.dart';

// // part 'sessions.freezed.dart';
// // part 'sessions.g.dart';

// // Stream<int> ticker() {
// //   return Stream.periodic(const Duration(seconds: 1), (x) => x + 1);
// // }

// enum SessionStatus { none, isInitial, isPaused, isRunning, isCompleted }

// final sessionsRM = RM.injectStream(
//   sessionsRepository.watch,
//   initialState: sessionsRepository.getAll(),
// );

// List<Day> get lsd => sessionsRM.state.map(
//       (element) {
//         return Day(durationOfStudy: element.duration);
//       },
//     ).toList();

// @Entity()
// class Session {
//   @Id(assignable: true)
//   int id = 0;
//   @Property(type: PropertyType.date)
//   DateTime startedOn = DateTime.now();
//   int duration = 0;
//   int statusIndex = 0;

//   @Transient()
//   SessionStatus get sessionStatus => SessionStatus.values[statusIndex];
//   @Transient()
//   set sessionStatus(SessionStatus value) => statusIndex = value.index;
// }

// final sessionsRepository = SessionsRepository();

// class SessionsRepository extends CRUD<Session> {}

// // late final _timerStateRM = RM.inject<Session>(
// //   () => Session()..startedOn = DateTime.now(),
// //   sideEffects: SideEffects(
// //     dispose: () => _tickerSubscription?.cancel(),
// //   ),
// // );
// // StreamSubscription<int>? _tickerSubscription;
// // int get duration => _timerStateRM.state.duration;
// // Session get session => _timerStateRM.state;
// // void start() {
// //   _timerStateRM.state = session
// //     ..duration = duration
// //     ..sessionStatus = SessionStatus.isRunning;
// //   _tickerSubscription?.cancel();
// //   _tickerSubscription = ticker().listen(
// //     (duration) => _tick(duration),
// //   );
// // }

// // void pause() {
// //   if (_timerStateRM.state.sessionStatus == SessionStatus.isRunning) {
// //     _tickerSubscription?.pause();
// //     _timerStateRM.state = session
// //       ..duration = duration
// //       ..sessionStatus = SessionStatus.isPaused;
// //   }
// // }

// // void resume() {
// //   if (_timerStateRM.state.sessionStatus == SessionStatus.isPaused) {
// //     _tickerSubscription?.resume();
// //     _timerStateRM.state = session
// //       ..duration = duration
// //       ..sessionStatus = SessionStatus.isRunning;
// //   }
// // }

// // void reset() {
// //   _tickerSubscription?.cancel();
// //   sessionsRepository.put(_timerStateRM.state);
// //   _timerStateRM.state = session
// //     ..duration = 0
// //     ..sessionStatus = SessionStatus.isInitial;
// // }

// // void _tick(int duration) {
// //   if (duration > 0) {
// //     _timerStateRM.state = session
// //       ..sessionStatus = SessionStatus.isRunning
// //       ..duration = duration;
// //   } else {
// //     _timerStateRM.state = session
// //       ..sessionStatus = SessionStatus.none
// //       ..duration = 0;
// //   }
// // }

import 'package:flash_cards/main.dart';

final daysRepository = DaysRepository();

class DaysRepository {
  final days = <Day>[
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
  ];
  Iterable<Day> getAll() => days;
  Iterable<Day> get lastSevenDays => days.take(7);
  void put(Day day) => days.add(day);
}

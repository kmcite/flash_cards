// import 'package:flash_cards/main.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

// class StudyTimerPage extends UI {
//   const StudyTimerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListenableBuilder(
//       listenable: timerBloc,
//       builder: (_, __) => Scaffold(
//         appBar: AppBar(),
//         body: _Body(),
//       ),
//     );
//   }
// }

// class _Body extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           '${(timerBloc.seconds / 60).floor().toString().padLeft(2, '0')}:${(timerBloc.seconds % 60).floor().toString().padLeft(2, '0')}',
//           style: Theme.of(context).textTheme.displayLarge,
//         ),
//         _Buttons(),
//       ],
//     );
//   }
// }

// class _Buttons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         if (!timerBloc.running)
//           ShadButton(
//             icon: const Icon(Icons.play_arrow),
//             onPressed: timerBloc.start,
//           )
//         else ...[
//           ShadButton(
//             icon: const Icon(Icons.pause),
//             onPressed: timerBloc.pause,
//           ),
//           ShadButton(
//             icon: const Icon(Icons.replay),
//             onPressed: timerBloc.reset,
//           ),
//         ]
//       ],
//     );
//   }
// }

// final timerBloc = TimerBloc();

// class TimerBloc with ChangeNotifier {
//   TimerBloc() {
//     Timer.periodic(
//       1.seconds,
//       (timer) {
//         if (running) {
//           notifyListeners();
//           ticks++;
//         }
//       },
//     );
//   }

//   int ticks = 0;
//   int get seconds => ticks;
//   bool running = false;

//   void start() {
//     running = true;
//     notifyListeners();
//   }

//   void pause() {
//     running = false;
//     notifyListeners();
//   }

//   void reset() {
//     ticks = 0;
//     running = false;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';
import 'package:sliding_puzzle/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/themes/themes.dart';
import 'package:sliding_puzzle/timer/timer.dart';

void main() {

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => PuzzleCubit(5)..onPuzzleInitialized()
        ),
        BlocProvider(
          create: (context) => TimerCubit()..startTimer(),
        )
      ],
      child: MaterialApp(
        theme: lightTheme,
        home: PuzzleScreen(),
      ),
    );
  }
}

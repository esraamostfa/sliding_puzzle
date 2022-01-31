import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/view/image_puzzle_board.dart';
import 'package:sliding_puzzle/timer/timer.dart';



class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle'),
        actions: [
          //DropdownButton(items: items, onChanged: onChanged)
          IconButton(
              onPressed: (){

              },
              icon: const Icon(
                Icons.category_outlined
              )),
          IconButton(
              iconSize: 35,
              icon: const Icon(
                  Icons.refresh_sharp
              ),
              onPressed: () {
                PuzzleCubit.get(context).onPuzzleReset();
                TimerCubit.get(context).resetTimer();
                TimerCubit.get(context).startTimer();
              }
          )
        ],
      ),
      body: BlocConsumer<PuzzleCubit, PuzzleState>(
        listener: (BuildContext context, state) {
          if(state.puzzle.isComplete()) {
            TimerCubit.get(context).stopTimer();
          }
        },
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PuzzleBoard(),
            //ImagePuzzleBoard(),
            if (state.puzzle.isComplete())
              const Text("Nice, You did it!"),
            TimerWidget()
          ],
        ),
      )
    );
  }
}

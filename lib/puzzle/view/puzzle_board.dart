import 'package:flutter/material.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/models/models.dart';
import 'package:sliding_puzzle/puzzle/view/image_piece.dart';

class PuzzleBoard extends StatelessWidget {
  const PuzzleBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return BlocConsumer<PuzzleCubit, PuzzleState> (
      listener: (context, state) {},
      builder: (context, state) {
        Puzzle puzzle = state.puzzle;

      return Center(
        child: GridView.builder(
            shrinkWrap: true ,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: puzzle.getDimension(),
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
            itemCount: puzzle.tiles.length,
            itemBuilder: (context, index) => TileWidget(puzzle.tiles[index])
        ),
      ); },
    );
  }
}

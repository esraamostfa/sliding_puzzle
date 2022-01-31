import 'package:flutter/material.dart';
import 'package:sliding_puzzle/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class TileWidget extends StatelessWidget {

  final Tile tileModel;

  const TileWidget(
      this.tileModel,
      {Key? key}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(!tileModel.isWhitespace) {
      return BlocConsumer<PuzzleCubit, PuzzleState>(
        listener: (context, state) {},
        builder: (context, state) => InkWell(
          onTap: () {
            PuzzleCubit.get(context).onTileTapped(tileModel);
          },
          child: SizedBox(
            child: Card(
              color: Colors.blue,
              elevation: 3,
              shape: RoundedRectangleBorder(
                //side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(7.0)
              ),
              child: Center(
                child: Text(
                  tileModel.value.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return const SizedBox();
  }

}

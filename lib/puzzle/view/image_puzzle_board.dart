//import 'dart:html';

import 'package:flutter/cupertino.dart';

import 'image_piece.dart';

class ImagePuzzleBoard extends StatefulWidget {
  const ImagePuzzleBoard({Key? key}) : super(key: key);

  @override
  State<ImagePuzzleBoard> createState() => _ImagePuzzleBoardState();
}

class _ImagePuzzleBoardState extends State<ImagePuzzleBoard> {

  List<Widget> pieces = [];

  // here we will split the image into small pieces using the rows and columns defined above; each piece will be added to a stack
  void splitImage() async {
    Image image = Image.asset("assets/images/simple_dash_medium.png");
    Size imageSize = Size(image.width!, image.height!);
    for (int x = 0; x < 5; x++) {
      for (int y = 0; y < 5; y++) {
        pieces.add(PuzzlePiece(key: GlobalKey(),
            image: image,
            imageSize: imageSize,
            row: x,
            col: y,
            maxRow: 5,
            maxCol: 5));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    splitImage();
    return Center(
        child: Stack(children: pieces)
    );
  }
}

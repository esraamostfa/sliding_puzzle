import 'dart:math';
import 'package:flutter/material.dart';
class PuzzlePiece extends StatefulWidget {

  final Image image;
  final Size imageSize;
  final int row;
  final int col;
  final int maxRow;
  final int maxCol;

  const PuzzlePiece({
    Key? key,
        required this.image,
        required this.imageSize,
        required this.row,
        required this.col,
        required this.maxRow,
        required this.maxCol
      }) : super(key: key);

  @override
  PuzzlePieceState createState() {
    return new PuzzlePieceState();
  }
}
class PuzzlePieceState extends State<PuzzlePiece> {
  double? top;
  double? left;
  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width;
    final imageHeight = MediaQuery.of(context).size.height
        * MediaQuery.of(context).size.width / widget.imageSize.width;
    final pieceWidth = imageWidth / widget.maxCol;
    final pieceHeight = imageHeight / widget.maxRow;
    if (top == null) {
      top = Random().nextInt((imageHeight - pieceHeight).ceil()).toDouble();
      top = top! - widget.row * pieceHeight;
    }
    if (left == null) {
      left = Random().nextInt((imageWidth - pieceWidth).ceil()).toDouble();
      left = left! - widget.col * pieceWidth;
    }
    return Positioned(
        top: top,
        left: left,
      width: imageWidth,
      child: ClipPath(
        child: CustomPaint(
            foregroundPainter: PuzzlePiecePainter(
                widget.row,
                widget.col,
                widget.maxRow,
                widget.maxCol
            ),
            child: widget.image
        ),
        clipper: PuzzlePieceClipper(
            widget.row,
            widget.col,
            widget.maxRow,
            widget.maxCol
        ),
      ),
    );
  }
}
// this class is used to clip the image to the puzzle piece path
class PuzzlePieceClipper extends CustomClipper<Path> {
  final int row;
  final int col;
  final int maxRow;
  final int maxCol;
  PuzzlePieceClipper(this.row, this.col, this.maxRow, this.maxCol);
  @override
  Path getClip(Size size) {
    return getPiecePath(size, row, col, maxRow, maxCol);
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
// this class is used to draw a border around the clipped image
class PuzzlePiecePainter extends CustomPainter {
  final int row;
  final int col;
  final int maxRow;
  final int maxCol;
  PuzzlePiecePainter(this.row, this.col, this.maxRow, this.maxCol);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color(0x80FFFFFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawPath(getPiecePath(size, row, col, maxRow, maxCol), paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// this is the path used to clip the image and, then, to draw a border around it; here we actually draw the puzzle piece
  Path getPiecePath(Size size, int row, int col, int maxRow, int maxCol) {
    final width = size.width / maxCol;
    final height = size.height / maxRow;
    final offsetX = col * width;
    final offsetY = row * height;
    final bumpSize = height / 4;
    var path = Path();
    path.moveTo(offsetX, offsetY);
    if (row == 0) {
      // top side piece
      path.lineTo(offsetX + width, offsetY);
    } else {
      // top bump
      path.lineTo(offsetX + width / 3, offsetY);
      path.cubicTo(offsetX + width / 6, offsetY - bumpSize, offsetX + width / 6 * 5, offsetY - bumpSize, offsetX + width / 3 * 2, offsetY);
    }
    if (col == 0) {
      // left side piece
      path.close();
    } else {
      // left bump
      path.lineTo(offsetX, offsetY + height / 3 * 2);
      path.cubicTo(offsetX - bumpSize, offsetY + height / 6 * 5, offsetX - bumpSize, offsetY + height / 6, offsetX, offsetY + height / 3);
      path.close();
    }
    return path;
  }
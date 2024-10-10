import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class CanvasExample extends StatefulWidget {
  final String imageUrl;

  const CanvasExample({required this.imageUrl});

  @override
  _CanvasExampleState createState() => _CanvasExampleState();
}

class _CanvasExampleState extends State<CanvasExample> {
  ui.Image? _image;
  double _splitPoint = 0.0;
  double _xOffsetTop = 0.0;
  double _yOffsetTop = 0.0;
  double _xOffsetBottom = 0.0;
  double _yOffsetBottom = 0.0;
  double _rotationTop = 0.0;
  double _rotationBottom = 0.0;
  bool _isTopSelected = true;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final completer = Completer<ui.Image>();
    final image = NetworkImage(widget.imageUrl);
    final stream = image.resolve(ImageConfiguration.empty);
    stream.addListener(ImageStreamListener((info, _) {
      completer.complete(info.image);
    }));
    _image = await completer.future;
    setState(() {});
  }

  void splitImage(double point) {
    setState(() {
      _splitPoint = point;
    });
  }

  void reset() {
    setState(() {
      _splitPoint = 0.0;
      _splitPoint = 0.0;
      _xOffsetTop = 0.0;
      _yOffsetTop = 0.0;
      _xOffsetBottom = 0.0;
      _yOffsetBottom = 0.0;
      _rotationTop = 0.0;
      _rotationBottom = 0.0;
    });
  }

  void moveImage(double xOffset, double yOffset) {
    setState(() {
      if (_isTopSelected) {
        _xOffsetTop += xOffset;
        _yOffsetTop += yOffset;
      } else {
        _xOffsetBottom += xOffset;
        _yOffsetBottom += yOffset;
      }
    });
  }

  void rotateImage(double rotation) {
    setState(() {
      if (_isTopSelected) {
        _rotationTop += rotation;
      } else {
        _rotationBottom += rotation;
      }
    });
  }

  void toggleSelectedPart() {
    setState(() {
      _isTopSelected = !_isTopSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTapDown: (details) {
          print('Long press');
          final splitPoint = details.localPosition.dy;
          splitImage(splitPoint);
        },
        onLongPress: toggleSelectedPart,
        child: _image == null
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: CustomPaint(
                  painter: _CanvasPainter(
                    image: _image!,
                    splitPoint: _splitPoint,
                    xOffsetTop: _xOffsetTop,
                    yOffsetTop: _yOffsetTop,
                    rotationTop: _rotationTop,
                    xOffsetBottom: _xOffsetBottom,
                    yOffsetBottom: _yOffsetBottom,
                    rotationBottom: _rotationBottom,
                  ),
                  size: Size.infinite, // Розмір на весь екран
                ),
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => reset(),
            child: const Icon(Icons.restore),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => moveImage(0, -10),
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => moveImage(0, 10),
            child: const Icon(Icons.arrow_downward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => moveImage(-10, 0),
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => moveImage(10, 0),
            child: const Icon(Icons.arrow_forward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => rotateImage(-0.001),
            child: const Icon(Icons.rotate_left),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => rotateImage(0.001),
            child: const Icon(Icons.rotate_right),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _CanvasPainter extends CustomPainter {
  _CanvasPainter({
    required this.image,
    required this.xOffsetTop,
    required this.yOffsetTop,
    required this.rotationTop,
    required this.xOffsetBottom,
    required this.yOffsetBottom,
    required this.rotationBottom,
    this.splitPoint = 0.0,
  }) {
    drawSplitLine = splitPoint == 0.0 ? false : true;
    this.splitPoint = splitPoint == 0.0 ? image.height / 2 : splitPoint;
  }

  final ui.Image image;
  late double splitPoint;
  final double xOffsetTop;
  final double yOffsetTop;
  final double rotationTop;
  final double xOffsetBottom;
  final double yOffsetBottom;
  final double rotationBottom;

  bool drawSplitLine = false;

  @override
  void paint(Canvas canvas, Size size) {
    final imageSize = Size(image.width.toDouble(), image.height.toDouble());

    // Масштабування зображення для відповідності розмірам екрану, зберігаючи пропорції
    final double scaleX = size.width / imageSize.width;
    final double scaleY = size.height / imageSize.height;
    final double scale = scaleX < scaleY ? scaleX : scaleY;

    // Обчислюємо розміри верхньої та нижньої частин зображення після поділу
    final double topHeight = splitPoint;
    final double bottomHeight = imageSize.height - splitPoint;

    // Центрування зображення
    final double scaledWidth = imageSize.width * scale;
    final double scaledTopHeight = topHeight * scale;
    final double scaledBottomHeight = bottomHeight * scale;
    final double xCenterOffset = (size.width - scaledWidth) / 2;

    // Малюємо верхню частину зображення
    canvas.save();
    canvas.translate(size.width / 2, splitPoint * scale); // Центруємо по X та Y на точку розділу
    canvas.rotate(rotationTop); // Поворот верхньої частини
    canvas.translate(-size.width / 2, -splitPoint * scale); // Повертаємо назад по осі

    // Визначаємо прямокутник для верхньої частини
    final topRect = Rect.fromLTWH(
      xCenterOffset + xOffsetTop,
      yOffsetTop,
      scaledWidth,
      scaledTopHeight, // Масштабована висота верхньої частини
    );

    // Малюємо верхню частину зображення без розтягування
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, imageSize.width, topHeight), // Верхня частина оригінального зображення
      topRect,
      Paint(),
    );
    canvas.restore();

    // Малюємо нижню частину зображення
    canvas.save();
    canvas.translate(size.width / 2, splitPoint * scale); // Центруємо по X і Y на точку розділу
    canvas.rotate(rotationBottom); // Поворот нижньої частини
    canvas.translate(-size.width / 2, -splitPoint * scale); // Повертаємо назад по осі

    // Визначаємо прямокутник для нижньої частини
    final bottomRect = Rect.fromLTWH(
      xCenterOffset + xOffsetBottom,
      splitPoint * scale + yOffsetBottom,
      scaledWidth,
      scaledBottomHeight, // Масштабована висота нижньої частини
    );

    // Малюємо нижню частину зображення без розтягування
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, topHeight, imageSize.width, bottomHeight), // Нижня частина оригінального зображення
      bottomRect,
      Paint(),
    );
    canvas.restore();

    if (drawSplitLine) {
      final paint = Paint()
        ..color = Colors.red
        ..strokeWidth = 2;
      canvas.drawLine(
        Offset(0, splitPoint * scale),
        Offset(size.width, splitPoint * scale),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_CanvasPainter oldDelegate) {
    return image != oldDelegate.image ||
        splitPoint != oldDelegate.splitPoint ||
        xOffsetTop != oldDelegate.xOffsetTop ||
        yOffsetTop != oldDelegate.yOffsetTop ||
        rotationTop != oldDelegate.rotationTop ||
        xOffsetBottom != oldDelegate.xOffsetBottom ||
        yOffsetBottom != oldDelegate.yOffsetBottom ||
        rotationBottom != oldDelegate.rotationBottom;
  }
}

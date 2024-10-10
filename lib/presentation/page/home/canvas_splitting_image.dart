import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/page/home/image_state.dart';
import 'package:provider/provider.dart';

class CanvasSplittingImage extends StatelessWidget {
  const CanvasSplittingImage({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageState>(
      create: (context) => ImageState()..loadImage(imageUrl),
      child: Consumer<ImageState>(
        builder: (context, imageState, _) => Scaffold(
          body: GestureDetector(
            onLongPress: imageState.toggleSelectedPart,
            onDoubleTapDown: (details) {
              final splitPoint = details.localPosition.dy;
              imageState.splitImage(splitPoint);
            },
            child: imageState.image == null
                ? const CircularProgressIndicator()
                : Center(
                    child: CustomPaint(
                      painter: _CanvasPainter.fromImageState(imageState),
                      size: Size.infinite,
                    ),
                  ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => imageState.reset(),
                child: const Icon(Icons.remove),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => imageState.moveImage(0, -10),
                child: const Icon(Icons.arrow_upward),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => imageState.moveImage(0, 10),
                child: const Icon(Icons.arrow_downward),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => imageState.moveImage(-10, 0),
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => imageState.moveImage(10, 0),
                child: const Icon(Icons.arrow_forward),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => imageState.rotateImage(-0.01), // 1mm -0.001
                child: const Icon(Icons.rotate_left),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () => imageState.rotateImage(0.01), // 1mm 0.001
                child: const Icon(Icons.rotate_right),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
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

  factory _CanvasPainter.fromImageState(ImageState imageState) {
    return _CanvasPainter(
      image: imageState.image!,
      splitPoint: imageState.splitPoint,
      xOffsetTop: imageState.xOffsetTop,
      yOffsetTop: imageState.yOffsetTop,
      rotationTop: imageState.rotationTop,
      xOffsetBottom: imageState.xOffsetBottom,
      yOffsetBottom: imageState.yOffsetBottom,
      rotationBottom: imageState.rotationBottom,
    );
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

    final double rotationCenterX = size.width / 2;
    final double rotationCenterY = splitPoint * scale;

    // Малюємо верхню частину зображення
    canvas.save();
    canvas.translate(rotationCenterX, rotationCenterY); // Переміщаємося до точки обертання
    canvas.rotate(rotationTop); // Виконуємо обертання навколо центру обертання
    canvas.translate(-rotationCenterX, -rotationCenterY); // Повертаємося назад після обертання

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
    canvas.translate(rotationCenterX, rotationCenterY); // Переміщаємося до точки обертання
    canvas.rotate(rotationBottom); // Виконуємо обертання навколо центру обертання
    canvas.translate(-rotationCenterX, -rotationCenterY); // Повертаємося назад після обертання

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

      canvas.drawCircle(
        Offset(rotationCenterX, rotationCenterY),
        4,
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

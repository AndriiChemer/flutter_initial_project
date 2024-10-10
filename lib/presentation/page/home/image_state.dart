import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImageState with ChangeNotifier {
  ui.Image? image;
  double splitPoint = 0.0;
  double xOffsetTop = 0.0;
  double yOffsetTop = 0.0;
  double xOffsetBottom = 0.0;
  double yOffsetBottom = 0.0;
  double rotationTop = 0.0;
  double rotationBottom = 0.0;
  bool isTopSelected = true;

  Future<void> loadImage(String imageUrl) async {
    final completer = Completer<ui.Image>();
    final networkImage = NetworkImage(imageUrl);
    final stream = networkImage.resolve(ImageConfiguration.empty);

    stream.addListener(
      ImageStreamListener((info, _) {
        completer.complete(info.image);
      }),
    );

    image = await completer.future;

    notifyListeners();
  }

  void splitImage(double point) {
    splitPoint = point;
    notifyListeners();
  }

  void reset() {
    splitPoint = 0.0;
    splitPoint = 0.0;
    xOffsetTop = 0.0;
    yOffsetTop = 0.0;
    xOffsetBottom = 0.0;
    yOffsetBottom = 0.0;
    rotationTop = 0.0;
    rotationBottom = 0.0;
    notifyListeners();
  }

  void moveImage(double xOffset, double yOffset) {
    if (isTopSelected) {
      xOffsetTop += xOffset;
      yOffsetTop += yOffset;
    } else {
      xOffsetBottom += xOffset;
      yOffsetBottom += yOffset;
    }
    notifyListeners();
  }

  void rotateImage(double rotation) {
    if (isTopSelected) {
      rotationTop += rotation;
    } else {
      rotationBottom += rotation;
    }
    notifyListeners();
  }

  void toggleSelectedPart() {
    isTopSelected = !isTopSelected;
    notifyListeners();
  }
}

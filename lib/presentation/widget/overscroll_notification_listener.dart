import 'package:flutter/material.dart';

/// Use for pagination
class OverscrollNotificationListener extends StatelessWidget {
  const OverscrollNotificationListener({
    required this.child,
    required this.onNotification,
    super.key,
    this.notifyBefore = 500,
  });

  final Widget child;
  final VoidCallback onNotification;
  final double notifyBefore;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        final shouldNotify = notification.metrics.extentAfter <= notifyBefore &&
            notification.depth == 0;
        if (shouldNotify) {
          onNotification();
        }

        return false;
      },
      child: child,
    );
  }
}

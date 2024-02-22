import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/dimens.dart';

const _titleWidth = 50.0;
const _titleHeight = 20.0;
const _zero = 0.0;

class AnimatedFloatButton extends HookWidget {
  const AnimatedFloatButton({
    required this.duration,
    required this.bottom,
    required this.title,
    required this.icon,
    this.action,
    super.key,
  });

  final Duration duration;
  final double bottom;
  final String title;
  final Widget icon;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    final isUiBuildState = useState(false);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isUiBuildState.value = true;
      });
      // animationController.
    });

    return AnimatedPositioned(
      duration: duration,
      bottom: isUiBuildState.value ? bottom : -20,
      right: Dimens.twenty,
      child: Row(
        children: [
          AnimatedSize(
            duration: duration,
            child: SizedBox(
              width: isUiBuildState.value ? _titleWidth : _zero,
              height: _titleHeight,
              child: Text(title),
            ),
          ),
          FloatingActionButton(
            heroTag: title,
            onPressed: action,
            child: icon,
          ),
        ],
      ),
    );
  }
}

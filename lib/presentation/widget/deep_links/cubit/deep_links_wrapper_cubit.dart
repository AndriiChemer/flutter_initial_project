import 'package:cached_annotation/cached_annotation.dart';
import 'package:iteo_libraries_example/domain/deep_link/use_case/deep_link_stream_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/deep_links/cubit/deep_links_wrapper_action.dart';

class DeepLinksWrapperCubit extends SafeActionCubit<Object, DeepLinksWrapperAction> {
  DeepLinksWrapperCubit(this._deepLinkStreamUseCase) : super(Object());

  final DeepLinkStreamUseCase _deepLinkStreamUseCase;

  StreamSubscription? _deepLinksSubscription;

  void startListening() {
    if (_deepLinksSubscription != null) {
      return;
    }

    _deepLinksSubscription = _deepLinkStreamUseCase()
        .where((uri) => uri.path.isNotEmpty)
        .map((uri) => uri.path)
        .listen(_onDispatchPath);
  }

  void _onDispatchPath(String path) =>
      dispatch(DeepLinksWrapperActionRedirectToPage(path));

  @override
  Future<void> close() async {
    await _deepLinksSubscription?.cancel();
    return super.close();
  }
}

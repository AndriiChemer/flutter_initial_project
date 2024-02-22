import 'package:iteo_libraries_example/domain/deep_link/use_case/trigger_deep_links_use_case.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_cubit.dart';

class MoreNavigationPageCubit extends SafeCubit<void> {
  MoreNavigationPageCubit(this._triggerDeepLinksUseCase) : super(null);

  final TriggerDeepLinksUseCase _triggerDeepLinksUseCase;

  void openDeepLinkPage() {
    final uri = Uri.parse('https://test.com/deeplinks/123/User1');
    _triggerDeepLinksUseCase(uri);
  }
}

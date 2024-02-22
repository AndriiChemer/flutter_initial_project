import 'package:iteo_libraries_example/domain/deep_link/deep_link_repository.dart';

class TriggerDeepLinksUseCase {
  const TriggerDeepLinksUseCase(this._repository);

  final DeepLinkRepository _repository;

  void call(Uri uri) => _repository.triggerDeepLink(uri);
}

import 'package:iteo_libraries_example/domain/deep_link/deep_link_repository.dart';
import 'package:rxdart/rxdart.dart';

class DeepLinkStreamUseCase {
  const DeepLinkStreamUseCase(this._repository);

  final DeepLinkRepository _repository;

  Stream<Uri> call() async* {
    final initialLink = await _repository.initialDeepLink;

    if (initialLink != null) {
      yield initialLink;
    }

    yield* _repository.deepLinkStream.whereNotNull();
  }
}

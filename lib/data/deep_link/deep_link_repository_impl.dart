import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/deep_link/deep_link_repository.dart';
import 'package:rxdart/rxdart.dart';
// import 'package:uni_links/uni_links.dart';

class DeepLinkRepositoryImpl implements DeepLinkRepository, Disposable {
  final _deepLinksStreamController = BehaviorSubject<Uri>();
  
  @override
  Stream<Uri?> get deepLinkStream => const Stream.empty();
  // Stream<Uri?> get deepLinkStream => uriLinkStream.mergeWith([_deepLinksStreamController.stream]);

  @override
  Future<Uri?> get initialDeepLink async {
    try {
      // return await getInitialUri();
      return null;
    } on FormatException {
      return null;
    } on PlatformException {
      return null;
    }
  }

  @override
  void triggerDeepLink(Uri uri) {
    _deepLinksStreamController.add(uri);
  }

  @override
  FutureOr onDispose() {
    _deepLinksStreamController.close();
  }
}

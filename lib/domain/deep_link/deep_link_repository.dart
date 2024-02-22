abstract class DeepLinkRepository {
  Future<Uri?> get initialDeepLink;

  Stream<Uri?> get deepLinkStream;

  void triggerDeepLink(Uri uri);
}

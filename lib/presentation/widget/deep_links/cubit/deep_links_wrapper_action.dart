sealed class DeepLinksWrapperAction {}

class DeepLinksWrapperActionRedirectToPage extends DeepLinksWrapperAction {
  DeepLinksWrapperActionRedirectToPage(this.path);

  final String path;
}

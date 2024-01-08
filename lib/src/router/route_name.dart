enum AppRouteNames {
  home(path: '/'),
  onBoarding(path: '/onBoarding'),
  signIn(path: '/signIn');

  const AppRouteNames({
    required this.path,
  });

  final String path;

  String get name => path;

  String get subPath {
    if (path == '/') {
      return path;
    }
    return path.replaceFirst('/', '');
  }
}

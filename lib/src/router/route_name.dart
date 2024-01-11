enum AppRouteNames {
  home(path: '/'),
  onBoarding(path: '/onBoarding'),
  signIn(path: '/signIn'),
  signUp(path: '/signUp'),
  dashboard(path: '/dashboard'),
  calendar(path: '/calendar'),
  profile(path: '/profile'),
  medicineProfile(path: '/medicineProfile');

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

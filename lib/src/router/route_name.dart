enum AppRouteNames {
  home(path: '/'),
  onBoarding(path: '/onBoarding'),
  signIn(path: '/signIn'),
  signUp(path: '/signUp'),
  enterMail(path: '/enterMail'),
  verifyCode(path: 'verifyCode', param: "mail"),
  resetPassword(path: '/resetPassword');

  const AppRouteNames({
    required this.path,
    this.param,
  });

  final String path;
  final String? param;

  String get name => path;

  String get subPath {
    if (path == '/') {
      return path;
    }
    return path.replaceFirst('/', '');
  }

  String get buildPathParam => '$path:$param';
  String get buildSubPathParam => '$subPath:$param';
}

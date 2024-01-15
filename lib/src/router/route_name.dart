enum AppRouteNames {
  home(path: '/'),
  onBoarding(path: '/onBoarding'),
  signIn(path: '/signIn'),
  signUp(path: '/signUp'),
  dashboard(path: '/dashboard'),
  calendar(path: '/calendar'),
  profile(path: '/profile'),
  medicineProfile(path: '/medicineProfile'),
  enterMail(path: '/enterMail'),
  verifyCode(path: 'verifyCode', param: "mail"),
  resetPassword(path: '/resetPassword'),
  optionAddBaby(path: '/optionAddBaby'),
  addBaby(path: '/addBaby'),
  addPregnancyBaby(path: '/addPregnancyBaby');

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

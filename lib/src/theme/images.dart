class AppImage {
  static String welcomeSafeBump = ImagesPath.getPath("welcome_safebump.png");
  static String proviceEducational = ImagesPath.getPath("provice_educational.png");
  static String provideCommunity = ImagesPath.getPath("provide_community.png");
  static String provideTracking = ImagesPath.getPath("provide_tracking.png");
  static String scheduleManager = ImagesPath.getPath("schedule_manager.png");
}

extension ImagesPath on AppImage {
  static String getPath(String name) {
    if (name.contains('.svg')) {
      return 'assets/svg/$name';
    }
    if (name.contains('.png')) {
      return 'assets/images/images/$name';
    }
    if (name.contains('.json')) {
      return 'assets/jsons/$name';
    }
    return 'assets/images/$name';
  }
}

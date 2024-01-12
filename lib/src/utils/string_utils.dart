class StringUtils {
  static bool isNullOrEmpty(String? value) => value == null || value.isEmpty;

  static String createDataWithUnit(
      {required String data, required String unit}) {
    return "$data $unit";
  }
}

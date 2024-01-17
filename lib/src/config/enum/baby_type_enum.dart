enum BabyType {
  baby,
  fetus;

  BabyType getBabyTypeEnum(String type) {
    switch (type) {
      case 'baby':
        return BabyType.baby;
      case 'fetus':
      default:
        return BabyType.fetus;
    }
  }

  String getBabyTypeText() {
    switch (this) {
      case BabyType.baby:
        return 'baby';
      case BabyType.fetus:
        return 'fetus';
    }
  }
}

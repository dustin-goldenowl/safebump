import 'package:safebump/src/localization/localization_utils.dart';

enum DoseType {
  application,
  cap,
  drop,
  gram,
  injection,
  miligram,
  mililiter,
  packet,
  patch,
  piece,
  pill,
  puff,
  spoon,
  spray,
  suppository,
  unit;

  String getText() {
    switch (this) {
      case DoseType.application:
        return S.text.application;
      case DoseType.cap:
        return S.text.cap;
      case DoseType.drop:
        return S.text.drop;
      case DoseType.gram:
        return S.text.gram;
      case DoseType.injection:
        return S.text.injection;
      case DoseType.miligram:
        return S.text.miligram;
      case DoseType.mililiter:
        return S.text.mililiter;
      case DoseType.packet:
        return S.text.packet;
      case DoseType.patch:
        return S.text.patch;
      case DoseType.piece:
        return S.text.piece;
      case DoseType.pill:
        return S.text.pill;
      case DoseType.puff:
        return S.text.puff;
      case DoseType.spoon:
        return S.text.spoon;
      case DoseType.spray:
        return S.text.spray;
      case DoseType.suppository:
        return S.text.suppository;
      case DoseType.unit:
        return S.text.unit;
    }
  }
}

enum ReminderFrequencyEnum {
  everyDay;

  String get getValue {
    switch (this) {
      case ReminderFrequencyEnum.everyDay:
        return S.text.everyDay;
    }
  }

  int get getIntValue {
    switch (this) {
      case ReminderFrequencyEnum.everyDay:
        return 1;
    }
  }
}

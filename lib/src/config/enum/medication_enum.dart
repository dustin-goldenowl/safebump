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
  unit
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

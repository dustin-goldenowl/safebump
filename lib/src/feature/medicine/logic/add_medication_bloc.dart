import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/src/feature/medicine/logic/add_medication_state.dart';

class AddMedicationBloc extends Cubit<AddMedicationState> {
  AddMedicationBloc() : super(AddMedicationState());

  void onChangedMedicationName(String text) {
    emit(state.copyWith(name: text));
  }

  void onPressSaveButton() {}

  setAmount(double value) {}

  void setDoseType(String value) {}

  setNotes(value) {}
}

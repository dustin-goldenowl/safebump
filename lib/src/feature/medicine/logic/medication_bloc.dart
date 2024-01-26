import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/src/dialogs/toast_wrapper.dart';
import 'package:safebump/src/feature/medicine/logic/medication_state.dart';
import 'package:safebump/src/network/data/medication/medication_repository.dart';
import 'package:safebump/src/utils/utils.dart';

class MedicationBloc extends Cubit<MedicationState> {
  MedicationBloc()
      : super(MedicationState(listMedication: List.empty(growable: true)));

  Future<void> inital() async {
    _createLoadingScreen();
    await _getAllMedicationFromFirebase();
  }

  void _createLoadingScreen() {
    emit(state.copyWith(status: MedicationScreenStatus.fetching));
    XToast.showLoading();
  }

  void _hideLoadingScreen() {
    if (XToast.isShowLoading) {
      XToast.hideLoading();
    }
  }

  Future<void> _getAllMedicationFromFirebase() async {
    try {
      final result =
          await GetIt.I.get<MedicationRepository>().getAllMedications();
      if (result.data == null) {
        emit(state.copyWith(status: MedicationScreenStatus.fail));
        _hideLoadingScreen();
        return;
      }
      xLog.e(result.data);
      emit(state.copyWith(
        listMedication: result.data,
        status: MedicationScreenStatus.success,
      ));
      _hideLoadingScreen();
    } catch (e) {
      xLog.e(e);
      _hideLoadingScreen();
      emit(state.copyWith(status: MedicationScreenStatus.fail));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/src/feature/sync_data/logic/sync_data_state.dart';

class SyncDataBloc extends Cubit<SyncDataState> {
  SyncDataBloc() : super(SyncDataState());
}

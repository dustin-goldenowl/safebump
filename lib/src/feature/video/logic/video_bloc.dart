import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/src/feature/video/logic/video_state.dart';

class VideoBloc extends Cubit<VideoState> {
  VideoBloc() : super(VideoState());
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_album/presentation/bloc/photo_event.dart';
import 'package:photo_album/presentation/bloc/photo_state.dart';

import '../../application/dot/result.dart';
import '../service.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoState(photoData: [])) {
    on<FetchPhotoDataEvent>(_fetchPhotoData);
  }

  void _fetchPhotoData(
      FetchPhotoDataEvent event, Emitter<PhotoState> emit) async {
    List<Result> fetchedResults = await ServiceJson.fetchDataToDto();
    emit(PhotoState(photoData: fetchedResults));
  }
}

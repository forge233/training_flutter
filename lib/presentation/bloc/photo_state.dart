import '../../application/dot/result.dart';

class PhotoState {
  final List<Result> photoData;

  PhotoState({required this.photoData});

  PhotoState copyWith({List<Result>? photoData}) {
    return PhotoState(photoData: photoData ?? this.photoData);
  }
}
import '../../application/dot/result.dart';

class PhotoState {
  final List<Result> photoData;
  final bool isLoading;

  PhotoState({required this.photoData, required this.isLoading});

  PhotoState copyWith({List<Result>? photoData, bool? isLoading}) {
    return PhotoState(
      photoData: photoData ?? this.photoData,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

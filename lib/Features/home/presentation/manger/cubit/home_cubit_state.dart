sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitSuccess extends HomeCubitState {}

final class HomeCubitFailure extends HomeCubitState {
  Map<String,dynamic> err;

  HomeCubitFailure({required this.err});
}

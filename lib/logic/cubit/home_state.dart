part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeSearch extends HomeState {
  HomeSearch({this.isNullError = false});

  final bool isNullError;
}

class HomeLoading extends HomeState {}

class HomeResult extends HomeState {
  HomeResult({
    this.query,
    this.result,
  });

  final String query;
  final List<Github> result;
}

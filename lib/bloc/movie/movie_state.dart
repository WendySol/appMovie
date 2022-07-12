part of 'movie_bloc.dart';

// @immutable
// abstract class BlocMovieState {

// }

class BlocMovieState {
  final List<PopularModel> popularModel;
  final bool check;
  BlocMovieState({required this.popularModel, required this.check});

  BlocMovieState copyWith({List<PopularModel>? popularModel, bool? check}) {
    return BlocMovieState(
        popularModel: popularModel ?? this.popularModel,
        check: check ?? this.check);
  }
}

class MovieLoading extends BlocMovieState {
  MovieLoading() : super(check: false,popularModel: []);
  
}



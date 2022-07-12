part of 'movie_bloc.dart';

@immutable
abstract class BlocMovieEvent {}



class GetPopularMovie extends BlocMovieEvent {
   final bool check;
  
  GetPopularMovie(this.check);
}

import 'package:app_movie/apis/api_peliculas.dart';
import 'package:app_movie/models/populars_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class BlocMovieBloc extends Bloc<BlocMovieEvent, BlocMovieState> {
  BlocMovieBloc() : super(BlocMovieState(check: false, popularModel: [])) {
    final apiMovie = ApiMovie();
    List<PopularModel> mList = [];

    on<GetPopularMovie>((event, emit) async {
      try {
        //emite estado de carga
        emit(MovieLoading());
        //llama cuando el valor check es true
        if (event.check) {
          //llamada a la api
          mList = await apiMovie.getPopular();
          //emite estado con datos de la api
          emit(state.copyWith(check: event.check, popularModel: mList));
        } else {
          emit(state.copyWith(check: event.check, popularModel: []));
        }
      } catch (e) {
        print(e);
      }
    });

  
  }
}

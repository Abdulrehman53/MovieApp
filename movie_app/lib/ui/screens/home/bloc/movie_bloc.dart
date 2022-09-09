import 'package:bloc/bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/repoistory/movie_repository.dart';

import 'movie_bloc_state.dart';

class MovieBloc extends Cubit<MovieBlocState> {
  MovieBloc() : super(MovieBlocState.init()) {
    getMovieByCategory();
  }
  getMovieByCategory({String? tag = 'funny'}) async {
    emit(MovieBlocState.init());
    MovieModel? movieModel =
        await MovieRepository().getVideosbyCategory(tag: tag);
    emit(MovieBlocState(
        movieModel: MovieModel(
            data: Data(
                posts: movieModel.data!.posts!
                    .where((post) => post.images!.image460Sv != null)
                    .toList()))));
  }
}




import '../../../../models/movie_model.dart';



class MovieBlocState  {
  final MovieModel movieModel;
 factory MovieBlocState.init(){
    return MovieBlocState(movieModel:MovieModel(data:Data(posts: []) ));
  }

  MovieBlocState({required this.movieModel});
}

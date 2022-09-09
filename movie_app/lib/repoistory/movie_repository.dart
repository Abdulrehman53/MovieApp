import 'package:dio/dio.dart' as dio;
import 'package:movie_app/models/movie_model.dart';

import '../networking/networking_managar.dart';
import '../networking/sever_calls.dart';

abstract class MovieService {
  Future<MovieModel> getVideosbyCategory({String tag});
}

class MovieRepository extends MovieService {
  @override
  Future<MovieModel> getVideosbyCategory({String? tag}) async {
    dio.Response? response = await NetworkManager().callApi(
      method: HttpMethod.Get,
      urlEndPoint: ServerCalls.movieByCategory(tag),
    );

    return MovieModel.fromMap(response!.data);
  }
}

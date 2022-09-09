import 'movie_repository.dart';

final homeRepo = MovieRepository();

class RepositoryBarrel {
  static final RepositoryBarrel _instance = RepositoryBarrel._internal();

  RepositoryBarrel._internal();
  factory RepositoryBarrel() => _instance;

  /// You can only register adapters once, so keep track
  bool reposInitialized = false;

  Future<void> initializeAll() async {}
}

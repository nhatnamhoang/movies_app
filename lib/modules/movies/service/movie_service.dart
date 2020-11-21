
import 'package:chopper/chopper.dart';
import 'package:movies_app/config_env.dart';
import 'package:movies_app/modules/movies/models/popular.dart';
import 'package:movies_app/modules/movies/service/model_converter.dart';

import 'header_interceptor.dart';
part 'movie_service.chopper.dart';

@ChopperApi()
abstract class MovieService extends ChopperService {

  @Get(path: 'movie/popular')
  Future<Response> getPopularMovies();

  @Get(path: 'movie/top_rated')
  Future<Response> getRateMovies();

  @Get(path: 'movie/upcoming')
  Future<Response> getUpcomingMovies();

  @Get(path: 'movie/{movie_id}')
  Future<Response> getDetailMovie(@Path('movie_id') int id);

  static MovieService create() {
    final client = ChopperClient(
      baseUrl: ConfigEnv.getDomainAPI(),
      interceptors: [HeaderInterceptor(), HttpLoggingInterceptor()],
      errorConverter: JsonConverter(),
      services: [
        _$MovieService(),
      ],
    );
    return _$MovieService(client);
  }
}
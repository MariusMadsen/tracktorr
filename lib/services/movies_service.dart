import 'package:flutter/foundation.dart';
import 'package:laruina/contracts/movies_contracts.dart';
import 'package:laruina/contracts/user_contracts.dart';
import 'package:laruina/services/http_service.dart';

class MoviesService {
  MoviesService._();

  static final String _baseUrl = HttpService.getBaseUrl("movies");

  static Future<MovieResponse> searchMovies(
      GetMovieRequestFilters? filters) async {
    if (filters == null || filters.search.isEmpty) {
      return Future<MovieResponse>.value(MovieResponse(genres: [], movies: []));
    }

    return await HttpService.post(
      url: "$_baseUrl/search",
      body: filters,
      error: "Could not get searched movies",
      resp: (Map<String, dynamic> body) {
        return MovieResponse.fromJson(body);
      },
    );
  }

  static Future<MovieResponse> getOwnMovies() async {
    return await HttpService.post(
      url: _baseUrl,
      body: GetMovieRequestFilters(
        movieLiked: MovieLiked.BOTH,
        movieSortBy: MovieSortBy.ALPHABETICALASC,
        genres: [],
        friends: [],
        search: "",
      ),
      error: "Could not get own movies",
      resp: (Map<String, dynamic> body) {
        return MovieResponse.fromJson(body);
      },
    );
  }

  static Future<MovieResponse> getRecommendedMovies(List<Friend> friends) async {
    return await HttpService.post(
      url: "$_baseUrl/recommended",
      body: GetMovieRequestFilters(
        movieLiked: MovieLiked.BOTH,
        movieSortBy: MovieSortBy.ALPHABETICALASC,
        genres: [],
        friends: friends,
        search: "",
      ),
      error: "Could not get recommended movies",
      resp: (Map<String, dynamic> body) {
        return MovieResponse.fromJson(body);
      },
    );
  }

  static Future<MovieResponse> getPopularMovies() async {
    return await HttpService.post(
      url: "$_baseUrl/popular",
      body: GetMovieRequestFilters(
        movieLiked: MovieLiked.BOTH,
        movieSortBy: MovieSortBy.ALPHABETICALASC,
        genres: [],
        friends: [],
        search: "",
      ),
      error: "Could not get own movies",
      resp: (Map<String, dynamic> body) {
        return MovieResponse.fromJson(body);
      },
    );
  }

  static Future<DetailedMovie> getById(String id) async {
    return await HttpService.get(
      url: "$_baseUrl/$id",
      error: "Could not get movie",
      resp: (Map<String, dynamic> body) {
        debugPrint(body["recommendedMovies"].toString());
        return DetailedMovie.fromJson(body);
      },
    );
  }

  static Future<void> watchMovie(Movie movie, bool liked) async {
    return await HttpService.post(
      url: "$_baseUrl/add",
      body: AddMovieRequest(movie: movie, liked: liked),
      error: "Could not watch movie",
    );
  }

  static Future<void> watchDetailedMovie(
      DetailedMovie movie, bool liked) async {
    return await watchMovie(movie.toMovie(), liked);
  }

  static Future<void> like(String id) async {
    return await HttpService.get(
      url: "$_baseUrl/$id/like",
      error: "Could not like movie",
    );
  }

  static Future<void> dislike(String id) async {
    return await HttpService.get(
      url: "$_baseUrl/$id/dislike",
      error: "Could not dislike movie",
    );
  }

  static Future<void> ownMovie(String movieId) async {
    return await HttpService.put(
      url: "$_baseUrl/$movieId/own",
      error: "Could not own movie",
    );
  }

  static Future<void> disownMovie(String movieId) async {
    return await HttpService.put(
      url: "$_baseUrl/$movieId/disown",
      error: "Could not disown movie",
    );
  }

  static Future<MoviePerson> getByPersonId(String personId) async {
    return await HttpService.get(
      url: "$_baseUrl/person/$personId",
      error: "Could not get movie person",
      resp: (Map<String, dynamic> body) {
        return MoviePerson.fromJson(body);
      },
    );
  }

  static String buildImgUrl(String? img) {
    if (img == null) {
      return "";
    }
    return "https://image.tmdb.org/t/p/original/$img";
  }
}

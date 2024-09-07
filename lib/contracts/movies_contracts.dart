// ignore_for_file: constant_identifier_names, duplicate_ignore

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:laruina/contracts/user_contracts.dart';

part "movies_contracts.g.dart";

@JsonSerializable()
class Movie {
  final String id;
  final String title;
  final String? img;
  final String releaseDate;
  final List<String?> genres;
  final bool liked;
  final bool watched;
  final bool owned;

  Movie({
    required this.id,
    required this.title,
    this.img,
    required this.releaseDate,
    required this.genres,
    this.liked = false,
    this.watched = false,
    this.owned = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.id == id &&
        other.title == title &&
        other.img == img &&
        other.releaseDate == releaseDate &&
        listEquals(other.genres, genres) &&
        other.liked == liked &&
        other.watched == watched &&
        other.owned == owned;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        img.hashCode ^
        releaseDate.hashCode ^
        genres.hashCode ^
        liked.hashCode ^
        watched.hashCode ^
        owned.hashCode;
  }

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, img: $img, releaseDate: $releaseDate, genres: $genres, liked: $liked, watched: $watched, owned: $owned)';
  }
}

@JsonSerializable()
class UserMovie {
  final String id;
  final bool watched;
  final bool liked;
  final bool owned;
  UserMovie(
      {required this.watched,
      required this.liked,
      required this.id,
      required this.owned});

  factory UserMovie.fromJson(Map<String, dynamic> json) =>
      _$UserMovieFromJson(json);
  Map<String, dynamic> toJson() => _$UserMovieToJson(this);
}

@JsonSerializable()
class MovieResponse {
  final List<Movie> movies;
  final List<String> genres;
  MovieResponse({
    required this.movies,
    required this.genres,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);

  @override
  String toString() => 'MovieResponse(movies: $movies, genres: $genres)';

  MovieResponse copyWith({
    List<Movie>? movies,
    List<String>? genres,
  }) {
    return MovieResponse(
      movies: movies ?? this.movies,
      genres: genres ?? this.genres,
    );
  }
}

@JsonSerializable()
class MovieCast {
  final String name;
  final String as;
  final String? img;
  final String id;

  MovieCast({required this.name, required this.as, this.img, required this.id});

  factory MovieCast.fromJson(Map<String, dynamic> json) =>
      _$MovieCastFromJson(json);
  Map<String, dynamic> toJson() => _$MovieCastToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieCast &&
        other.name == name &&
        other.as == as &&
        other.img == img &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^ as.hashCode ^ img.hashCode ^ id.hashCode;
  }
}

@JsonSerializable()
class MovieDirector {
  final String name;
  final String? img;
  final String id;

  MovieDirector({required this.name, this.img, required this.id});

  factory MovieDirector.fromJson(Map<String, dynamic> json) =>
      _$MovieDirectorFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDirectorToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDirector &&
        other.name == name &&
        other.img == img &&
        other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ img.hashCode ^ id.hashCode;
}

@JsonSerializable()
class MoviePerson {
  final String name;
  final String id;
  final String? birthday;
  final String? death;
  final String? biography;
  final String? img;
  final List<Movie>? actedIn;
  final List<Movie>? created;
  MoviePerson(
      {required this.name,
      required this.id,
      required this.birthday,
      required this.death,
      required this.biography,
      required this.img,
      required this.actedIn,
      required this.created});
  factory MoviePerson.fromJson(Map<String, dynamic> json) =>
      _$MoviePersonFromJson(json);
  Map<String, dynamic> toJson() => _$MoviePersonToJson(this);
}

@JsonSerializable()
class FriendWhoWatched {
  final String id;
  final String username;
  final bool liked;

  FriendWhoWatched(
      {required this.id, required this.username, required this.liked});

  factory FriendWhoWatched.fromJson(Map<String, dynamic> json) =>
      _$FriendWhoWatchedFromJson(json);
  Map<String, dynamic> toJson() => _$FriendWhoWatchedToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FriendWhoWatched &&
        other.id == id &&
        other.username == username &&
        other.liked == liked;
  }

  @override
  int get hashCode => id.hashCode ^ username.hashCode ^ liked.hashCode;
}

@JsonSerializable()
class DetailedMovie {
  final String id;
  final String title;
  final String img;
  final String? backdropImg;
  final String releaseDate;
  final String description;
  final int runtime;
  final List<String> genres;
  final List<MovieProvider> providers;
  final bool liked;
  final bool watched;
  final bool owned;
  final List<MovieCast> cast;
  final MovieDirector? director;
  final List<Movie> recommendedMovies;
  final List<FriendWhoWatched> friendsWhoHaveWatched;
  DetailedMovie(
      {required this.id,
      required this.title,
      required this.img,
      required this.backdropImg,
      required this.releaseDate,
      required this.description,
      required this.runtime,
      required this.genres,
      required this.providers,
      required this.liked,
      required this.watched,
      required this.owned,
      required this.cast,
      required this.director,
      required this.recommendedMovies,
      required this.friendsWhoHaveWatched});

  Movie toMovie() {
    return Movie(
        id: id, title: title, releaseDate: releaseDate, genres: genres);
  }

  factory DetailedMovie.fromJson(Map<String, dynamic> json) =>
      _$DetailedMovieFromJson(json);
  Map<String, dynamic> toJson() => _$DetailedMovieToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetailedMovie &&
        other.id == id &&
        other.title == title &&
        other.img == img &&
        other.backdropImg == backdropImg &&
        other.releaseDate == releaseDate &&
        other.description == description &&
        other.runtime == runtime &&
        listEquals(other.genres, genres) &&
        listEquals(other.providers, providers) &&
        other.liked == liked &&
        other.watched == watched &&
        other.owned == owned &&
        listEquals(other.cast, cast) &&
        other.director == director &&
        listEquals(other.recommendedMovies, recommendedMovies) &&
        listEquals(other.friendsWhoHaveWatched, friendsWhoHaveWatched);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        img.hashCode ^
        backdropImg.hashCode ^
        releaseDate.hashCode ^
        description.hashCode ^
        runtime.hashCode ^
        genres.hashCode ^
        providers.hashCode ^
        liked.hashCode ^
        watched.hashCode ^
        owned.hashCode ^
        cast.hashCode ^
        director.hashCode ^
        recommendedMovies.hashCode ^
        friendsWhoHaveWatched.hashCode;
  }

  @override
  String toString() {
    return 'DetailedMovie(id: $id, title: $title, img: $img, backdropImg: $backdropImg, releaseDate: $releaseDate, description: $description, runtime: $runtime, genres: $genres, providers: $providers, liked: $liked, watched: $watched, owned: $owned, cast: $cast, director: $director, recommendedMovies: $recommendedMovies, friendsWhoHaveWatched: $friendsWhoHaveWatched)';
  }
}

@JsonSerializable()
class SearchMovieRequest {
  final String title;
  final bool adult;

  SearchMovieRequest({
    required this.title,
    this.adult = false,
  });

  factory SearchMovieRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchMovieRequestToJson(this);
}

@JsonSerializable()
class MovieProvider {
  final String providerName;
  final String img;
  MovieProvider({
    required this.providerName,
    required this.img,
  });

  factory MovieProvider.fromJson(Map<String, dynamic> json) =>
      _$MovieProviderFromJson(json);
  Map<String, dynamic> toJson() => _$MovieProviderToJson(this);
}

@JsonSerializable()
class AddMovieRequest {
  final Movie movie;
  final bool liked;
  AddMovieRequest({
    required this.movie,
    required this.liked,
  });

  factory AddMovieRequest.fromJson(Map<String, dynamic> json) =>
      _$AddMovieRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddMovieRequestToJson(this);
}

@JsonSerializable()
class GetMovieRequestFilters {
  final MovieLiked movieLiked;
  final MovieSortBy movieSortBy;
  final List<String> genres;
  final List<Friend> friends;
  final String search;

  GetMovieRequestFilters(
      {required this.movieLiked,
      required this.movieSortBy,
      required this.genres,
      required this.friends,
      required this.search});

  static GetMovieRequestFilters clear() {
    return GetMovieRequestFilters(
        movieLiked: MovieLiked.BOTH,
        movieSortBy: MovieSortBy.ALPHABETICALASC,
        genres: [],
        friends: [],
        search: "");
  }

  GetMovieRequestFilters copyWith(
      {MovieLiked? movieLiked,
      MovieSortBy? movieSortBy,
      List<String>? genres,
      List<Friend>? friends,
      String? search}) {
    return GetMovieRequestFilters(
        movieLiked: movieLiked ?? this.movieLiked,
        movieSortBy: movieSortBy ?? this.movieSortBy,
        genres: genres ?? this.genres,
        friends: friends ?? this.friends,
        search: search ?? this.search);
  }

  factory GetMovieRequestFilters.fromJson(Map<String, dynamic> json) =>
      _$GetMovieRequestFiltersFromJson(json);
  Map<String, dynamic> toJson() => _$GetMovieRequestFiltersToJson(this);

  @override
  String toString() =>
      'GetMovieRequestFilters(movieLiked: $movieLiked, movieSortBy: $movieSortBy, genres: $genres search: $search)';
}

// ignore: constant_identifier_names
enum MovieLiked { LIKED, NOTLIKED, BOTH }

enum MovieSortBy {
  ALPHABETICALASC,
  ALPHABETICALDESC,
  RELEASEDATEASC,
  RELEASEDATEDESC
}

enum MovieContext { watched, recommended, search, popular, owned }

final Map<int, MovieContext> contexts = {
  0: MovieContext.watched,
  1: MovieContext.owned,
  2: MovieContext.recommended,
  3: MovieContext.popular,
  4: MovieContext.search,
};

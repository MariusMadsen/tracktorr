// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      img: json['img'] as String?,
      releaseDate: json['releaseDate'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String?).toList(),
      liked: json['liked'] as bool? ?? false,
      watched: json['watched'] as bool? ?? false,
      owned: json['owned'] as bool? ?? false,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'releaseDate': instance.releaseDate,
      'genres': instance.genres,
      'liked': instance.liked,
      'watched': instance.watched,
      'owned': instance.owned,
    };

UserMovie _$UserMovieFromJson(Map<String, dynamic> json) => UserMovie(
      watched: json['watched'] as bool,
      liked: json['liked'] as bool,
      id: json['id'] as String,
      owned: json['owned'] as bool,
    );

Map<String, dynamic> _$UserMovieToJson(UserMovie instance) => <String, dynamic>{
      'id': instance.id,
      'watched': instance.watched,
      'liked': instance.liked,
      'owned': instance.owned,
    };

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      movies: (json['movies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'movies': instance.movies,
      'genres': instance.genres,
    };

MovieCast _$MovieCastFromJson(Map<String, dynamic> json) => MovieCast(
      name: json['name'] as String,
      as: json['as'] as String,
      img: json['img'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$MovieCastToJson(MovieCast instance) => <String, dynamic>{
      'name': instance.name,
      'as': instance.as,
      'img': instance.img,
      'id': instance.id,
    };

MovieDirector _$MovieDirectorFromJson(Map<String, dynamic> json) =>
    MovieDirector(
      name: json['name'] as String,
      img: json['img'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$MovieDirectorToJson(MovieDirector instance) =>
    <String, dynamic>{
      'name': instance.name,
      'img': instance.img,
      'id': instance.id,
    };

MoviePerson _$MoviePersonFromJson(Map<String, dynamic> json) => MoviePerson(
      name: json['name'] as String,
      id: json['id'] as String,
      birthday: json['birthday'] as String?,
      death: json['death'] as String?,
      biography: json['biography'] as String?,
      img: json['img'] as String?,
      actedIn: (json['actedIn'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: (json['created'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviePersonToJson(MoviePerson instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'birthday': instance.birthday,
      'death': instance.death,
      'biography': instance.biography,
      'img': instance.img,
      'actedIn': instance.actedIn,
      'created': instance.created,
    };

FriendWhoWatched _$FriendWhoWatchedFromJson(Map<String, dynamic> json) =>
    FriendWhoWatched(
      id: json['id'] as String,
      username: json['username'] as String,
      liked: json['liked'] as bool,
    );

Map<String, dynamic> _$FriendWhoWatchedToJson(FriendWhoWatched instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'liked': instance.liked,
    };

DetailedMovie _$DetailedMovieFromJson(Map<String, dynamic> json) =>
    DetailedMovie(
      id: json['id'] as String,
      title: json['title'] as String,
      img: json['img'] as String,
      backdropImg: json['backdropImg'] as String?,
      releaseDate: json['releaseDate'] as String,
      description: json['description'] as String,
      runtime: json['runtime'] as int,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      providers: (json['providers'] as List<dynamic>)
          .map((e) => MovieProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      liked: json['liked'] as bool,
      watched: json['watched'] as bool,
      owned: json['owned'] as bool,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => MovieCast.fromJson(e as Map<String, dynamic>))
          .toList(),
      director: json['director'] == null
          ? null
          : MovieDirector.fromJson(json['director'] as Map<String, dynamic>),
      recommendedMovies: (json['recommendedMovies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      friendsWhoHaveWatched: (json['friendsWhoHaveWatched'] as List<dynamic>)
          .map((e) => FriendWhoWatched.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailedMovieToJson(DetailedMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
      'backdropImg': instance.backdropImg,
      'releaseDate': instance.releaseDate,
      'description': instance.description,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'providers': instance.providers,
      'liked': instance.liked,
      'watched': instance.watched,
      'owned': instance.owned,
      'cast': instance.cast,
      'director': instance.director,
      'recommendedMovies': instance.recommendedMovies,
      'friendsWhoHaveWatched': instance.friendsWhoHaveWatched,
    };

SearchMovieRequest _$SearchMovieRequestFromJson(Map<String, dynamic> json) =>
    SearchMovieRequest(
      title: json['title'] as String,
      adult: json['adult'] as bool? ?? false,
    );

Map<String, dynamic> _$SearchMovieRequestToJson(SearchMovieRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'adult': instance.adult,
    };

MovieProvider _$MovieProviderFromJson(Map<String, dynamic> json) =>
    MovieProvider(
      providerName: json['providerName'] as String,
      img: json['img'] as String,
    );

Map<String, dynamic> _$MovieProviderToJson(MovieProvider instance) =>
    <String, dynamic>{
      'providerName': instance.providerName,
      'img': instance.img,
    };

AddMovieRequest _$AddMovieRequestFromJson(Map<String, dynamic> json) =>
    AddMovieRequest(
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
      liked: json['liked'] as bool,
    );

Map<String, dynamic> _$AddMovieRequestToJson(AddMovieRequest instance) =>
    <String, dynamic>{
      'movie': instance.movie,
      'liked': instance.liked,
    };

GetMovieRequestFilters _$GetMovieRequestFiltersFromJson(
        Map<String, dynamic> json) =>
    GetMovieRequestFilters(
      movieLiked: $enumDecode(_$MovieLikedEnumMap, json['movieLiked']),
      movieSortBy: $enumDecode(_$MovieSortByEnumMap, json['movieSortBy']),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      friends: (json['friends'] as List<dynamic>)
          .map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toList(),
      search: json['search'] as String,
    );

Map<String, dynamic> _$GetMovieRequestFiltersToJson(
        GetMovieRequestFilters instance) =>
    <String, dynamic>{
      'movieLiked': _$MovieLikedEnumMap[instance.movieLiked]!,
      'movieSortBy': _$MovieSortByEnumMap[instance.movieSortBy]!,
      'genres': instance.genres,
      'friends': instance.friends,
      'search': instance.search,
    };

const _$MovieLikedEnumMap = {
  MovieLiked.LIKED: 'LIKED',
  MovieLiked.NOTLIKED: 'NOTLIKED',
  MovieLiked.BOTH: 'BOTH',
};

const _$MovieSortByEnumMap = {
  MovieSortBy.ALPHABETICALASC: 'ALPHABETICALASC',
  MovieSortBy.ALPHABETICALDESC: 'ALPHABETICALDESC',
  MovieSortBy.RELEASEDATEASC: 'RELEASEDATEASC',
  MovieSortBy.RELEASEDATEDESC: 'RELEASEDATEDESC',
};

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'movie.dart';

class HttpHelper {
  //https://api.themoviedb.org/3/movie/upcoming?api_key=YOUR API KEY HERE&language=en-US
  final String urlKey =
      'api_key=591483ac7131877e4fbe8aa2b7501dff'; //591483ac7131877e4fbe8aa2b7501dff
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String url =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=591483ac7131877e4fbe8aa2b7501dff&language=en-US";



  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=e3fd37e8dd3eca6eecb8808906be73bc&query=';





  Future<List> getUpcoming() async {
      final String upcoming = url;
      http.Response result = await http.get(upcoming);
      if (result.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(result.body); // is dynamic. This means that it can contain any type at runtime.
        final moviesMap = jsonResponse['results'];
        List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
        return movies;
      } else {
        return null;
      }
  }


  Future<List> findMovies(String title) async{
    final String query = urlSearchBase + title;
    http.Response result = await http.get(query);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    }
    else {
      return null;
    }
  }




}

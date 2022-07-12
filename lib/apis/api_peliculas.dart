import 'dart:convert';

import 'package:app_movie/models/populars_model.dart';
import 'package:http/http.dart' as http;

class ApiMovie {
  String apiBaseURL = "https://api.themoviedb.org/3/movie";
  String apikey = "34738023d27013e6d1b995443764da44";
  List<PopularModel> listVacia = [];

  Future<List<PopularModel>> getPopular() async {
    try {
      //https: //api.themoviedb.org/3/movie/popular?api_key=34738023d27013e6d1b995443764da44
      final url = '$apiBaseURL/popular?api_key=$apikey';
      final resp = await http.get(Uri.parse(url));

      final decodedData = json.decode(resp.body);
      print(decodedData);
      if (resp.statusCode == 200) {
        List<dynamic> listResult = decodedData["results"];

        if (listResult.isNotEmpty) {
          for (var i = 0; i < listResult.length; i++) {
            listVacia.add(PopularModel.fromJson(decodedData["results"][i]));
          }
        }

        return listVacia;
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return [];
    }
  }

 

  Future<List<PopularModel>> getRatedMovie() async {
    try {
      //https: //api.themoviedb.org/3/movie/popular?api_key=34738023d27013e6d1b995443764da44
      final url = '$apiBaseURL/top_rated?api_key=$apikey';
      final resp = await http.get(Uri.parse(url));

      final decodedData = json.decode(resp.body);
      print(decodedData);
      if (resp.statusCode == 200) {
        List<dynamic> listResult = decodedData["results"];

        if (listResult.isNotEmpty) {
          for (var i = 0; i < listResult.length; i++) {
            listVacia.add(PopularModel.fromJson(decodedData["results"][i]));
          }
        }

        return listVacia;
      } else {
        return [];
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return [];
    }
  }
}

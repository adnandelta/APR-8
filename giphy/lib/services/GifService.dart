import 'dart:convert';
import 'package:giphy/models/TrendingModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

enum LoadingStatusE { idle, busy, error }

class BaseModel extends ChangeNotifier {
  LoadingStatusE loadingStatus = LoadingStatusE.idle;

  BaseModel();
}

const baseUrl = 'http://api.giphy.com/v1';
const apiKey = 'MPUkymzKjNtZDpZ6UV1nOtcYgqe4UnSB';
const giphsPerPage = 6;
const maxNofOfssets = 20;

class GiphsModel extends BaseModel {
  GiphyQuery? giphyTrendingAlbum;
  GiphyQuery? giphySearchAlbum;

  int offset = 0;
  int limit = giphsPerPage;

  fetchTrendingImages() async {
    loadingStatus = LoadingStatusE.busy;
    final response = await http.get(Uri.parse(
        '$baseUrl/gifs/trending?api_key=$apiKey&limit=$limit&offset=$offset/'));
    if (response.statusCode == 200) {
      giphyTrendingAlbum = GiphyQuery.fromJson(jsonDecode(response.body));
      loadingStatus = LoadingStatusE.idle;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      loadingStatus = LoadingStatusE.error;
      throw Exception('Failed to load album');
    }
    offset += 1;
    limit += giphsPerPage;
    notifyListeners();
  }

  searchImages(String searchString) async {
    loadingStatus = LoadingStatusE.busy;
    final response = await http.get(Uri.parse(
        '$baseUrl/gifs/search?api_key=$apiKey&q=$searchString&limit=$limit&offset=$offset/'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      giphySearchAlbum = GiphyQuery.fromJson(jsonDecode(response.body));
      loadingStatus = LoadingStatusE.idle;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      loadingStatus = LoadingStatusE.error;
      throw Exception('Failed to load album');
    }
    notifyListeners();
  }

  GiphsModel();
}

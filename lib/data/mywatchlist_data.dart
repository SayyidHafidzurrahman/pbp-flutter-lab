import 'package:counter_7/models/watchlist_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<bool> statusMovie = [];
Future<List<WatchList>> fetchToDo() async {
  var url = Uri.parse('http://tugassayyid.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<WatchList> listWatch = [];

  for (var d in data) {
    if (d != null) {
      listWatch.add(WatchList.fromJson(d));
      statusMovie.add(WatchList.fromJson(d).watched_movie);
    }
  }
  return listWatch;
}

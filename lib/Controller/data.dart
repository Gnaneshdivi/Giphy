import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> trending() async {
  List data = [];
  var response = await http.get(Uri.parse(
      "https://api.giphy.com/v1/gifs/trending?api_key=m49iHb6VfEFRgmKZVIWnVVHt2rMDINAS&limit=25&offset=0&rating=g&bundle=messaging_non_clips"));
  List resp = json.decode(response.body)['data'];
  resp.forEach((element) {
    data.add(element["images"]['original']['url']);
  });
  return data;
}

Future<List> search(String keyWord) async {
  List data = [];
  var response = await http.get(Uri.parse(
      "https://api.giphy.com/v1/gifs/search?api_key=m49iHb6VfEFRgmKZVIWnVVHt2rMDINAS&q=${keyWord}&limit=25&offset=0&rating=g&lang=en&bundle=messaging_non_clips"));
  List resp = json.decode(response.body)['data'];
  resp.forEach((element) {
    data.add(element["images"]['original']['url']);
  });
  return data;
}

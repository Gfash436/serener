import 'dart:convert';

import 'package:serener/models/baseurl.dart';
import 'package:serener/models/itemModel.dart';
import 'package:serener/post/dbProvider.dart';
import 'package:http/http.dart' as http;

class FetchItems {
  final url = ApiUrl.baseUrl;

  Future fetchItems() async {
    final userId = await DatabaseProvider().userId;
    final token = await DatabaseProvider().token;

    String _url = '$url/api/all/$token';

    try {
      http.Response request = await http
          .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
      print(request.statusCode);

      if (request.statusCode == 200) {
        print(request.body);
        // if (json.decode(request.body)['items'] == null) {
        //   return ItemModel();
        // } else {
        //   final itemModel =
        //       ItemModel.fromJson(request.body as Map<String, dynamic>);
        //   return itemModel;
        // }
      } else {
        print(request.body);
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }
}

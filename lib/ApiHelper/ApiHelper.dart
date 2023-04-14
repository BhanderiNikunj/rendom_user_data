import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rendom_user_data/Screen/Home/Model/RandomUserModel.dart';

class ApiHelper {
  Future<RandomUserModel> RandomApiCall() async {
    String Link = "https://randomuser.me/api/";
    Uri uri = Uri.parse(Link);
    var result = await http.get(uri);
    var json = jsonDecode(result.body);
    RandomUserModel r1 = RandomUserModel.fromJson(json);
    return r1;
  }
}

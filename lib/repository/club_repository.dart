import 'dart:convert';

import 'package:allaboutapps/models/model.dart';
import 'package:http/http.dart' as http;

import '../common/common.dart';
import '../models/repository_helper.dart';

class ClubsRepository {
  static Future<ResponseHelper<List<Clubs>>> getClubsList({
    String url = '${Common.getClubListForAnonymous}',
  }) async {
    ResponseHelper<List<Clubs>> _responseHelper = ResponseHelper(data: []);
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);
        for (var i in responseData) {
          Clubs c = Clubs.fromJson(i);
          _responseHelper.data.add(c);
        }

        return _responseHelper;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('${e.toString()}}');
      _responseHelper.errorMessage = 'try again';
    }
    _responseHelper.isLoading = false;
    _responseHelper.hasError = true;

    return _responseHelper;
  }
}

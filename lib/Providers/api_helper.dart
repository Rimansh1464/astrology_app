import 'dart:convert';
import 'dart:developer';

import 'package:astrology_app/model/astrology_modal.dart';
import 'package:http/http.dart' as http;

class AstrologyApiHelper {
  AstrologyApiHelper._();

  static final AstrologyApiHelper astrologyApiHelper = AstrologyApiHelper._();

  //Todo: Fetch love Data
  Future<AstrologyData?> todayData(
      {required String AstrilogyName, required String day}) async {
    http.Response response = await http.get(
      Uri.parse(
          "https://sameer-kumar-aztro-v1.p.rapidapi.com/?sign=$AstrilogyName&day=$day"),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = await jsonDecode(response.body);

      AstrologyData dataList = AstrologyData.fromMap(data);
      log(dataList.description, name: "$AstrilogyName");
      return dataList;
    }
    return null;
  }


}

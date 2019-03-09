import 'dart:convert';

import 'package:flutter_weather/data/constants.dart';
import 'package:flutter_weather/data/local_bean.dart';
import 'package:flutter_weather/data/now_weather_bean.dart';
import 'package:http/http.dart' as http;

class HttpManager {
  var now_url = AppUrls.WEATHER_BASE_URL + "weather?parameters";

  var local_url = AppUrls.WEATHER_LOCATION_URL + "find?parameters";

  getNowWeather(NowWeatherListener net, String cityName) {
    var client = new http.Client();
    client.post(now_url, body: {
      'location': cityName,
      'key': AppUrls.WEATHER_KEY
    }).then((response) {
      final responseJson = json.decode(response.body);
      net.onNowWeatherResponse(
          Now_weather_bean.fromMap(responseJson).HeWeather6[0]);
    }, onError: (error) {
      net.onError(error);
    }).whenComplete(client.close);
  }

  getLocalList(LocalListListener net, String cityName) {
    var client = new http.Client();
    client.post(local_url, body: {
      'location': cityName,
      'key': AppUrls.WEATHER_KEY
    }).then((response) {
      final responseJson = json.decode(response.body);
      net.onLocalList(Local_bean.fromMap(responseJson).HeWeather6[0].basic);
    }, onError: (error) {
      net.onError(error);
    }).whenComplete(client.close);
  }
}

abstract class NowWeatherListener {
  //实况天气
  void onNowWeatherResponse(HeWeather6ListBean body);

  void onError(error);
}

abstract class LocalListListener {
  //城市列表
  void onLocalList(List<BasicListBean> body);

  void onError(error);
}

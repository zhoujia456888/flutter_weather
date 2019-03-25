import 'package:flutter/material.dart';

class AppUrls {
  //天气BaseUrl
  static const WEATHER_BASE_URL = 'https://free-api.heweather.com/s6/';

  // 天气LocationURL
  static const WEATHER_LOCATION_URL = 'https://search.heweather.net/';

  //天气图标地址
  static const WEATHER_IMG_URL = 'https://cdn.heweather.com/cond_icon/';

  //天气Key
  static const WEATHER_KEY = 'e165f76955db41dfad5053572f0f355d';
}

class AppColors {
  static const AppBarColor = Color(0xffffffff);
  static const TitleColor = Color(0xff1bb5d8);
  static const BackgroundColor = Color(0xffF9F9F9);
  static const WeatherTempTxtColor = Color(0xff000000);
  static const WeatherTxtColor = Color(0xff575757);
  static const DividerColor = Color(0xffd9d9d9);
}

class AppStyles {
  static const AppBarTextStyle = TextStyle(color: AppColors.TitleColor);

  static const WeatherTempStyle = TextStyle(
    color: AppColors.WeatherTempTxtColor,
    fontSize: 40.0,
  );

  static const WeatherNowStyle = TextStyle(
    color: AppColors.WeatherTxtColor,
    fontSize: 14.0,
  );

  static const WeatherNowOtherTitleStyle=TextStyle(
    color: AppColors.WeatherTxtColor,
    fontSize: 14.0,
  );

  static const WeatherNowOtherContentStyle=TextStyle(
    color: AppColors.WeatherTxtColor,
    fontSize: 20.0,
  );

  static const LocationListContentStyle=TextStyle(
    color: AppColors.WeatherTempTxtColor,
    fontSize: 14.0,
  );

}

class Constants {
  static const Dividerwidth = 1.0;
}

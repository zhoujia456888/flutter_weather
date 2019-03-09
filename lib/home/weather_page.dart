import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather/data/constants.dart';
import 'package:flutter_weather/data/local_bean.dart';
import 'package:flutter_weather/data/now_weather_bean.dart';
import 'package:flutter_weather/http/http_manager.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key key, this.cityName})
      : assert(cityName != null),
        super(key: key);

  final String cityName;

  @override
  _WeatherPageState createState() => _WeatherPageState(cityName);
}

class _WeatherPageState extends State<WeatherPage> with NowWeatherListener {
  HttpManager httpManager = new HttpManager();
  HeWeather6ListBean heWeather6ListBean;

  _WeatherPageState(this.cityName);

  String cityName;

  @override
  Widget build(BuildContext context) {
    if (heWeather6ListBean == null) {
      _getNowWeather();
      return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(
              width: 10.0,
            ),
            Text('数据请求中，请稍候......')
          ],
        ),
      );
    } else {
      return RefreshIndicator(
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                _WeatherNowCard(
                    now: heWeather6ListBean.now,
                    loc: heWeather6ListBean.update.loc),
                _WeatherDailyForecastCard(
                    daily_forecast: heWeather6ListBean.daily_forecast),
                _WeatherHourlyCard(hourlylist: heWeather6ListBean.hourly),
                _WeatherNowOtherCard(now: heWeather6ListBean.now),
                _WeatherLifestyleCard(lifestyle: heWeather6ListBean.lifestyle),
              ],
            )),
      );
    }
  }

  _getNowWeather() async {
    await Future.delayed(Duration(seconds: 1), () {
      httpManager.getNowWeather(this, cityName);
    });
  }

  @override
  void onError(error) {
    // TODO: implement onError
    print('出错了 $error');
  }

  @override
  void onNowWeatherResponse(HeWeather6ListBean body) async {
    setState(() {
      heWeather6ListBean = body;
    });
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      _getNowWeather();
      /* items.clear();
        items = List.generate(40, (i) => i);*/
      return null;
    });
  }
}

//当前时间天气预报
class _WeatherNowCard extends StatelessWidget {
  _WeatherNowCard({@required this.now, @required this.loc})
      : assert(now != null),
        assert(loc != null);

  NowBean now;
  String loc = "1970-1-1 00:00:00";

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        elevation: 4.0,
        color: Colors.white,
        child: Container(
          height: 200.0,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Image.network(
                'https://cdn.heweather.com/cond_icon/${now.cond_code}.png',
                width: 90.0,
                height: 90.0,
              )),
              Container(
                width: 1.0,
                height: 150.0,
                color: Colors.black,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${now.tmp} ℃',
                        style: AppStyles.WeatherTempStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${now.cond_txt}',
                        style: AppStyles.WeatherNowStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${now.wind_dir}  ${now.wind_sc}级',
                        style: AppStyles.WeatherNowStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '更新于 ${loc}',
                        style: AppStyles.WeatherNowStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

//未来7天天气预测
class _WeatherDailyForecastCard extends StatelessWidget {
  _WeatherDailyForecastCard({@required this.daily_forecast})
      : assert(daily_forecast != null);

  List<Daily_forecastListBean> daily_forecast;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        elevation: 4.0,
        color: Colors.white,
        child: Container(
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _DailyForecastList(
                      daily_forecast: daily_forecast, index: index);
                },
                itemCount: daily_forecast.length,
              )),
              /*Text('天气预测折线图'),
              Text('天气预测折线图'),
              Text('天气预测折线图'),*/
            ],
          ),
        ));
  }
}

//未来7天天气预测ListView
class _DailyForecastList extends StatelessWidget {
  _DailyForecastList({@required this.daily_forecast, @required this.index})
      : assert(daily_forecast != null),
        assert(index != null);

  List<Daily_forecastListBean> daily_forecast;
  int index;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(daily_forecast[index].date);
    DateTime now = DateTime.now();
    String weekDay = '周一';
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      weekDay = '今天';
    } else {
      switch (date.weekday) {
        case 1:
          weekDay = '周一';
          break;
        case 2:
          weekDay = '周二';
          break;
        case 3:
          weekDay = '周三';
          break;
        case 4:
          weekDay = '周四';
          break;
        case 5:
          weekDay = '周五';
          break;
        case 6:
          weekDay = '周六';
          break;
        case 7:
          weekDay = '周天';
          break;
      }
    }

    return Container(
        width: (MediaQuery.of(context).size.width - 16) / daily_forecast.length,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(weekDay),
              SizedBox(
                height: 5.0,
              ),
              Text(
                  '${daily_forecast[index].tmp_min}/${daily_forecast[index].tmp_max}'),
              SizedBox(
                height: 5.0,
              ),
              Text('${daily_forecast[index].cond_txt_d}'),
              SizedBox(
                height: 5.0,
              ),
              new Image.network(
                'https://cdn.heweather.com/cond_icon/${daily_forecast[index].cond_code_d}.png',
                height: 30.0,
                width: 30.0,
              )
            ]));
  }
}

//未来一天天气小时预测
class _WeatherHourlyCard extends StatelessWidget {
  _WeatherHourlyCard({@required this.hourlylist}) : assert(hourlylist != null);
  List<HourlyListBean> hourlylist;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        elevation: 4.0,
        color: Colors.white,
        child: Container(
          height: 130.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _HourlyList(
                    hourlylist: hourlylist,
                    index: index,
                  );
                },
                itemCount: 8,
              )),
            ],
          ),
        ));
    ;
  }
}

//未来一天天气小时预测ListView
class _HourlyList extends StatelessWidget {
  _HourlyList({@required this.hourlylist, this.index})
      : assert(hourlylist != null),
        assert(index != null);

  List<HourlyListBean> hourlylist;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    String hour = '${DateTime.parse(hourlylist[index].time).hour}:00';
    return Container(
        width: (MediaQuery.of(context).size.width - 16) / hourlylist.length,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(hour),
              SizedBox(
                height: 5.0,
              ),
              Text(hourlylist[index].cond_txt),
              SizedBox(
                height: 5.0,
              ),
              new Image.network(
                'https://cdn.heweather.com/cond_icon/${hourlylist[index].cond_code}'
                    '.png',
                height: 30.0,
                width: 30.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('${hourlylist[index].tmp}°'),
            ]));
  }
}

//实时天气其他信息
class _WeatherNowOtherCard extends StatelessWidget {
  _WeatherNowOtherCard({
    @required this.now,
  }) : assert(now != null);

  NowBean now;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        elevation: 4.0,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 40.0, top: 10, right: 40, bottom: 20),
          child: Column(
            children: <Widget>[
              _WeatherNowOtherCardContent(
                  leftTitle: '体感温度',
                  leftContent: now.fl,
                  rightTitle: '相对湿度',
                  rightContent: '${now.hum}%'),
              _WeatherNowOtherCardContent(
                  leftTitle: '风力',
                  leftContent: '${now.wind_sc}级',
                  rightTitle: now.wind_dir,
                  rightContent: '${now.wind_spd} km/h'),
              _WeatherNowOtherCardContent(
                  leftTitle: '降水量',
                  leftContent: now.pcpn,
                  rightTitle: '气压',
                  rightContent: '${now.pres}百帕'),
              _WeatherNowOtherCardContent(
                  leftTitle: '能见度',
                  leftContent: '${now.vis}公里',
                  rightTitle: '云量',
                  rightContent: now.cloud)
            ],
          ),
        ));
  }
}

//实时天气其他信息View
class _WeatherNowOtherCardContent extends StatelessWidget {
  const _WeatherNowOtherCardContent(
      {@required this.leftTitle,
      @required this.leftContent,
      @required this.rightTitle,
      @required this.rightContent})
      : assert(leftContent != null),
        assert(leftTitle != null),
        assert(rightTitle != null),
        assert(rightContent != null);

  final String leftTitle, leftContent, rightTitle, rightContent;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    leftTitle,
                    style: AppStyles.WeatherNowOtherTitleStyle,
                  ),
                  Text(leftContent,
                      style: AppStyles.WeatherNowOtherContentStyle)
                ],
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          rightTitle,
                          style: AppStyles.WeatherNowOtherTitleStyle,
                        ),
                        Text(rightContent,
                            style: AppStyles.WeatherNowOtherContentStyle)
                      ],
                    )))
          ],
        ));
  }
}

//生活指数
class _WeatherLifestyleCard extends StatelessWidget {
  _WeatherLifestyleCard({@required this.lifestyle}) : assert(lifestyle != null);

  List<LifestyleListBean> lifestyle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: lifestyle.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _LifestyleList(
          lifestyle: lifestyle,
          index: index,
        );
      },
    );
  }
}

//生活指数ListView
class _LifestyleList extends StatelessWidget {
  _LifestyleList({@required this.lifestyle, @required this.index})
      : assert(lifestyle != null),
        assert(index != null);

  List<LifestyleListBean> lifestyle;
  int index;

  @override
  Widget build(BuildContext context) {
    String type = lifestyle[index].type;

    switch (type) {
      case 'comf':
        type = '舒适度指数';
        break;
      case 'cw':
        type = '洗车指数';
        break;
      case 'drsg':
        type = '穿衣指数';
        break;
      case 'flu':
        type = '感冒指数';
        break;
      case 'sport':
        type = '运动指数';
        break;
      case 'trav':
        type = '旅游指数';
        break;
      case 'uv':
        type = '紫外线指数';
        break;
      case 'air':
        type = '空气污染扩散条件指数';
        break;
      case 'ac':
        type = '空调开启指数';
        break;
      case 'ag':
        type = '过敏指数';
        break;
      case 'gl':
        type = '太阳镜指数';
        break;
      case 'mu':
        type = '化妆指数';
        break;
      case 'airc':
        type = '晾晒指数';
        break;
      case 'ptfc':
        type = '交通指数';
        break;
      case 'fsh':
        type = '钓鱼指数';
        break;
      case 'spi':
        type = '防晒指数';
        break;
    }

    return Card(
        margin: EdgeInsets.only(top: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        elevation: 4.0,
        color: Colors.white,
        child: Container(
            margin: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      type,
                      textAlign: TextAlign.start,
                      style: AppStyles.WeatherNowOtherTitleStyle,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      lifestyle[index].brf,
                      style: AppStyles.WeatherNowOtherContentStyle,
                    ),
                  ],
                ),
                Text(lifestyle[index].txt,
                    style: AppStyles.WeatherNowOtherTitleStyle)
              ],
            )));
  }
}

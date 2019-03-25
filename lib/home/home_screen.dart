import 'package:flutter/material.dart';
import 'package:flutter_weather/data/constants.dart';
import 'package:flutter_weather/data/database_util.dart';
import 'package:flutter_weather/data/local_bean.dart';
import 'package:flutter_weather/home/addcity_page.dart';
import 'package:flutter_weather/home/citylist_page.dart';
import 'package:flutter_weather/home/weather_page.dart';
import 'package:flutter_weather/utils/CityChangeEvent.dart';
import 'package:rxbus/rxbus.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  DataBase dataBase;
}

class _HomeScreenState extends State<HomeScreen> {
  int citySize = 4;
  int _currentIndex = 0;

  List<BasicListBean> cityList;
  DataBase dataBase;

  /*get cityList {
    return ['龙华', '长沙', '北京', '茶陵'];
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBase = new DataBase();
    if (dataBase.db == null) {
      dataBase.initDb();
    }

    RxBus.register<CityChangeEvent>().listen((event) {
      print("RxBus传过来的数据 ${event.title}");
      getcityList();
    });

    getcityList();
  }

  getcityList() {
    new DataBase().queryAll().then((List<BasicListBean> list) {
      print(list);
      setState(() {
        cityList=new List<BasicListBean>();
        _currentIndex=0;
        cityList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cityList == null || cityList.length == 0) {
      return Scaffold(
        appBar: AppBar(
            title: Text("天气", style: AppStyles.AppBarTextStyle),
            elevation: 0.0,
            brightness: Brightness.light,
            //状态栏字体颜色
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.location_city, size: 22.0),
                onPressed: () {
                  print("点击了城市按钮");

                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => AddCityPage()),
                  );
                },
                color: Colors.black,
              ),
              Container(
                width: 10.0,
              ),
            ]),
        body: Container(
          alignment: Alignment.center,
          child: Text('当前还没有添加城市，请点击右上角城市按钮进行城市添加。'),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            title: Text(cityList[_currentIndex].location,
                style: AppStyles.AppBarTextStyle),
            elevation: 0.0,
            brightness: Brightness.light,
            //状态栏字体颜色
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.location_city, size: 22.0),
                onPressed: () {
                  print("点击了城市按钮");

                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => CityListPage()),
                  );
                },
                color: Colors.black,
              ),
              Container(
                width: 10.0,
              ),
            ]),
        body: PageView.builder(
          itemCount: cityList.length,
          itemBuilder: (BuildContext context, int index) {
            return WeatherPage(cityName: cityList[index].location);
          },
          onPageChanged: (int index) {
            print('当前显示的是第$index页');
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      );
    }
  }
}

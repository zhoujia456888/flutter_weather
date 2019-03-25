import 'package:flutter/material.dart';
import 'package:flutter_weather/data/constants.dart';
import 'package:flutter_weather/data/database_util.dart';
import 'package:flutter_weather/data/local_bean.dart';
import 'package:flutter_weather/home/addcity_page.dart';
import 'package:flutter_weather/utils/CityChangeEvent.dart';
import 'package:rxbus/rxbus.dart';

class CityListPage extends StatefulWidget {
  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  List<BasicListBean> cityList;
  DataBase dataBase;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DataBase dataBase = new DataBase();
    dataBase.queryAll().then((List<BasicListBean> list) {
      print(list);
      setState(() {
        cityList = list;
      });
    });

    RxBus.register<CityChangeEvent>().listen((event) {
      print("RxBus传过来的数据 ${event.title}");
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cityList == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('城市列表', style: AppStyles.AppBarTextStyle),
          elevation: 0.0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print("添加城市");

                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => AddCityPage()),
                  );
                })
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text('暂无城市信息，你可以点击右上角按钮添加城市！'),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('城市列表', style: AppStyles.AppBarTextStyle),
          elevation: 0.0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print("添加城市");

                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => AddCityPage()),
                  );
                })
          ],
        ),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (cityList != null) {
                return _CityList(
                  localList: cityList,
                  index: index,
                );
              }
            },
            itemCount: cityList.length),
      );
    }
  }
}

class _CityList extends StatelessWidget {
  _CityList({@required this.localList, @required this.index})
      : assert(localList != null),
        assert(index != null);

  List<BasicListBean> localList;
  int index;

  @override
  Widget build(BuildContext context) {
    String location = localList[index].location;
    String parent_city = localList[index].parent_city;
    String admin_area = localList[index].admin_area;
    String cnty = localList[index].cnty;

    final String item = localList[index].cid;

    return Dismissible(
        key: Key(item),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          //localList.removeAt(index);
          DataBase dataBase = new DataBase();
          print(dataBase.deleteLocation(localList[index].cid));

          RxBus.post(CityChangeEvent("删除了城市！！！！"));
        },
        background: Container(
          color: Colors.red,
          child: Center(
            child: Text('删除'),
          ),
        ),
        child: FlatButton(
          child: Container(
            padding:
                const EdgeInsets.only(bottom: 13, top: 13, left: 20, right: 20),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: AppColors.DividerColor,
                        width: Constants.Dividerwidth))),
            child: Row(
              children: <Widget>[
                Text(
                  '$location,$parent_city,$admin_area,$cnty',
                  style: AppStyles.LocationListContentStyle,
                )
              ],
            ),
          ),
        ));
  }
}

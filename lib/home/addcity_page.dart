import 'package:flutter/material.dart';
import 'package:flutter_weather/data/constants.dart';
import 'package:flutter_weather/data/database_util.dart';
import 'package:flutter_weather/data/local_bean.dart';
import 'package:flutter_weather/home/home_screen.dart';
import 'package:flutter_weather/http/http_manager.dart';
import 'package:flutter_weather/utils/CityChangeEvent.dart';
import 'package:rxbus/rxbus.dart';


class AddCityPage extends StatefulWidget {
  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> with LocalListListener {
  TextEditingController _textEditingController = new TextEditingController();

  HttpManager httpManager = new HttpManager();

  String cityText;

  List<BasicListBean> localList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                if (cityText == null || cityText.isEmpty) {
                  Navigator.pop(context);
                } else {
                  cityText = null;
                  _textEditingController.clear();
                  setState(() {
                    localList=null;
                  });
                }
              });
            },
          )
        ],
        title: new TextField(
          autofocus: true,
          style: new TextStyle(
            color: Colors.black,
          ),
          decoration: new InputDecoration(
            hintText: "请输入城市名称...",
            hintStyle: new TextStyle(color: Colors.black),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          onChanged: _textFieldChanged,
          onSubmitted: _textFieldSubmitted,
          controller: _textEditingController,
        ),
      ),
      body: localListView,
    );
  }

  get localListView {
    if (localList != null) {
      return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (localList != null) {
              return _LocalList(
                localList: localList,
                index: index,
              );
            }
          },
          itemCount: localList.length);
    } else {
      return Container(
        alignment: Alignment.center,
        child: Text('请输入需要添加的城市名称'),
      );
    }
  }

  void _textFieldChanged(String value) {
   // print('Changed $value');
    cityText = value;
    _getLocalList(value);
  }

  void _textFieldSubmitted(String value) {
    //print('Submitted $value');
    cityText = value;
    _getLocalList(value);
  }

  _getLocalList(String value) async {
    await httpManager.getLocalList(this, value);
  }

  @override
  void onLocalList(List<BasicListBean> body) async {
    //print("地址：" + body[0].location);
    //print(body[0].cid);

    setState(() {
      localList = body;
    });
  }

  @override
  void onError(error) {
    // TODO: implement onError
  }
}

class _LocalList extends StatelessWidget {
  _LocalList({@required this.localList, @required this.index})
      : assert(localList != null),
        assert(index != null);

  List<BasicListBean> localList;
  int index;

  @override
  Widget build(BuildContext context) {
    //print(index);
    String ss = localList[index].cid;

    String cid = localList[index].cid;
    String location = localList[index].location;
    String parent_city = localList[index].parent_city;
    String admin_area = localList[index].admin_area;
    String cnty = localList[index].cnty;
    String lat = localList[index].lat;
    String lon = localList[index].lon;
    String tz = localList[index].tz;
    String type = localList[index].type;

    return FlatButton(
      padding: EdgeInsets.only(left: 20, right: 20, top: 13, ),
      onPressed: () {
        print(localList[index].location);

        DataBase dataBase=new DataBase();
        dataBase.insert(localList[index]);
        Navigator.pop(context);


        RxBus.post(CityChangeEvent("添加了城市！！！！"));

      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 13),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: AppColors.DividerColor,
                    width: Constants.Dividerwidth))),
        child: Row(
          children: <Widget>[Text('$location,$parent_city,$admin_area,$cnty')],
        ),
      ),
    );
  }

}



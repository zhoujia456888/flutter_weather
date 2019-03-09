import 'package:flutter_weather/data/local_bean.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  static final DataBase _instance = new DataBase.internal();

  factory DataBase() => _instance;

  static Database _db;
  String _dbName = 'weather.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DataBase.internal();

  //初始化数据库，根据路径版本号新建数据库
  initDb() async {
    // Directory directory = await getApplicationDocumentsDirectory();
    String p = await getDatabasesPath();
    String path = join(p, _dbName);
    var dataBase = await openDatabase(path, version: 1, onCreate: _onCreate);
    print('数据库创建成功，version： 1');
    return dataBase;
  }

  _onCreate(Database db, int version) async {
    // When creating the db, create the table
    /*
*  cid : "CN101010100"
   * location : "北京"
   * parent_city : "北京"
   * admin_area : "北京"
   * cnty : "中国"
   * lat : "39.90498734"
   * lon : "116.4052887"
   * tz : "+8.00"
   * type : "city"*/
    await db
        .execute("CREATE TABLE city (id INTEGER PRIMARY KEY, cid TEXT,location "
            "TEXT,parent_city TEXT,admin_area TEXT,cnty TEXT,lat TEXT,lon"
            " TEXT,tz TEXT,type TEXT)");
    print("创建表成功！");
  }

  closeDB() {
    if (_db != null || _db.isOpen) {
      _db.close();
      _db = null;
      print("关闭成功！");
    }
  }

  insert(BasicListBean localBean) async {
    var dbClient = await db;
    return dbClient.transaction((trx) {
      trx.rawInsert('INSERT INTO city(cid,location,parent_city,admin_area,'
          'cnty,lat,lon,tz,type) '
          'VALUES'
          '("${localBean.cid}","${localBean.location}","${localBean.parent_city}","${localBean.admin_area}","${localBean.cnty}","${localBean.lat}","${localBean.lon}","${localBean.tz}","${localBean.type}")');
    });
  }

  Future<List<BasicListBean>> queryAll() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM city');
    if (list.length > 0) {
      return BasicListBean.fromMapList(list);
    }
    return null;
  }

  deleteLocation(String cid) async {
    var dbClient = await db;
    int count = await dbClient.rawDelete("delete from city where cid=?", [cid]);

    return count;
  }
}

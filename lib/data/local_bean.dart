class Local_bean {

  /**
   * HeWeather6 : [{"basic":[{"cid":"CN101010100","location":"北京","parent_city":"北京","admin_area":"北京","cnty":"中国","lat":"39.90498734","lon":"116.4052887","tz":"+8.00","type":"city"},{"cid":"CN101210410","location":"北仑","parent_city":"宁波","admin_area":"浙江","cnty":"中国","lat":"29.90943909","lon":"121.83130646","tz":"+8.00","type":"city"},{"cid":"CN101301301","location":"北海","parent_city":"北海","admin_area":"广西","cnty":"中国","lat":"21.4733429","lon":"109.11925507","tz":"+8.00","type":"city"},{"cid":"CN101040800","location":"北碚","parent_city":"重庆","admin_area":"重庆","cnty":"中国","lat":"29.82542992","lon":"106.43786621","tz":"+8.00","type":"city"},{"cid":"CN101070706","location":"北镇","parent_city":"锦州","admin_area":"辽宁","cnty":"中国","lat":"41.59876251","lon":"121.79595947","tz":"+8.00","type":"city"}],"status":"ok"}]
   */

  List<Local6ListBean> HeWeather6;

  static Local_bean fromMap(Map<String, dynamic> map) {
    Local_bean local_bean = new Local_bean();
    local_bean.HeWeather6 = Local6ListBean.fromMapList(map['HeWeather6']);
    return local_bean;
  }

  static List<Local_bean> fromMapList(dynamic mapList) {
    List<Local_bean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class Local6ListBean {

  /**
   * status : "ok"
   * basic : [{"cid":"CN101010100","location":"北京","parent_city":"北京","admin_area":"北京","cnty":"中国","lat":"39.90498734","lon":"116.4052887","tz":"+8.00","type":"city"},{"cid":"CN101210410","location":"北仑","parent_city":"宁波","admin_area":"浙江","cnty":"中国","lat":"29.90943909","lon":"121.83130646","tz":"+8.00","type":"city"},{"cid":"CN101301301","location":"北海","parent_city":"北海","admin_area":"广西","cnty":"中国","lat":"21.4733429","lon":"109.11925507","tz":"+8.00","type":"city"},{"cid":"CN101040800","location":"北碚","parent_city":"重庆","admin_area":"重庆","cnty":"中国","lat":"29.82542992","lon":"106.43786621","tz":"+8.00","type":"city"},{"cid":"CN101070706","location":"北镇","parent_city":"锦州","admin_area":"辽宁","cnty":"中国","lat":"41.59876251","lon":"121.79595947","tz":"+8.00","type":"city"}]
   */

  String status;
  List<BasicListBean> basic;

  static Local6ListBean fromMap(Map<String, dynamic> map) {
    Local6ListBean heWeather6ListBean = new Local6ListBean();
    heWeather6ListBean.status = map['status'];
    heWeather6ListBean.basic = BasicListBean.fromMapList(map['basic']);
    return heWeather6ListBean;
  }

  static List<Local6ListBean> fromMapList(dynamic mapList) {
    List<Local6ListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class BasicListBean {

  /**
   * cid : "CN101010100"
   * location : "北京"
   * parent_city : "北京"
   * admin_area : "北京"
   * cnty : "中国"
   * lat : "39.90498734"
   * lon : "116.4052887"
   * tz : "+8.00"
   * type : "city"
   */

  String cid;
  String location;
  String parent_city;
  String admin_area;
  String cnty;
  String lat;
  String lon;
  String tz;
  String type;

  static BasicListBean fromMap(Map<String, dynamic> map) {
    BasicListBean basicListBean = new BasicListBean();
    basicListBean.cid = map['cid'];
    basicListBean.location = map['location'];
    basicListBean.parent_city = map['parent_city'];
    basicListBean.admin_area = map['admin_area'];
    basicListBean.cnty = map['cnty'];
    basicListBean.lat = map['lat'];
    basicListBean.lon = map['lon'];
    basicListBean.tz = map['tz'];
    basicListBean.type = map['type'];
    return basicListBean;
  }

  static List<BasicListBean> fromMapList(dynamic mapList) {
    List<BasicListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class Now_weather_bean {

  /**
   * HeWeather6 : [{"basic":{"cid":"CN101010100","location":"北京","parent_city":"北京","admin_area":"北京","cnty":"中国","lat":"39.90498734","lon":"116.40528870","tz":"8.0"},"daily_forecast":[{"cond_code_d":"103","cond_code_n":"101","cond_txt_d":"晴间多云","cond_txt_n":"多云","date":"2017-10-26","hum":"57","pcpn":"0.0","pop":"0","pres":"1020","tmp_max":"16","tmp_min":"8","uv_index":"3","vis":"16","wind_deg":"0","wind_dir":"无持续风向","wind_sc":"微风","wind_spd":"5"},{"cond_code_d":"101","cond_code_n":"501","cond_txt_d":"多云","cond_txt_n":"雾","date":"2017-10-27","hum":"56","pcpn":"0.0","pop":"0","pres":"1018","tmp_max":"18","tmp_min":"9","uv_index":"3","vis":"20","wind_deg":"187","wind_dir":"南风","wind_sc":"微风","wind_spd":"6"},{"cond_code_d":"101","cond_code_n":"101","cond_txt_d":"多云","cond_txt_n":"多云","date":"2017-10-28","hum":"26","pcpn":"0.0","pop":"0","pres":"1029","tmp_max":"17","tmp_min":"5","uv_index":"2","vis":"20","wind_deg":"2","wind_dir":"北风","wind_sc":"3-4","wind_spd":"19"}],"hourly":[{"cloud":"8","cond_code":"100","cond_txt":"晴","hum":"84","pop":"0","pres":"1018","time":"2017-10-27 01:00","tmp":"8","wind_deg":"49","wind_dir":"东北风","wind_sc":"微风","wind_spd":"2"},{"cloud":"8","cond_code":"100","cond_txt":"晴","hum":"81","pop":"0","pres":"1018","time":"2017-10-27 04:00","tmp":"8","wind_deg":"29","wind_dir":"东北风","wind_sc":"微风","wind_spd":"2"},{"cloud":"6","cond_code":"100","cond_txt":"晴","hum":"95","pop":"0","pres":"1019","time":"2017-10-27 07:00","tmp":"8","wind_deg":"37","wind_dir":"东北风","wind_sc":"微风","wind_spd":"2"},{"cloud":"2","cond_code":"100","cond_txt":"晴","hum":"75","pop":"0","pres":"1018","time":"2017-10-27 10:00","tmp":"14","wind_deg":"108","wind_dir":"东南风","wind_sc":"微风","wind_spd":"3"},{"cloud":"0","cond_code":"100","cond_txt":"晴","hum":"62","pop":"0","pres":"1016","time":"2017-10-27 13:00","tmp":"16","wind_deg":"158","wind_dir":"东南风","wind_sc":"微风","wind_spd":"6"},{"cloud":"0","cond_code":"100","cond_txt":"晴","hum":"73","pop":"0","pres":"1016","time":"2017-10-27 16:00","tmp":"15","wind_deg":"162","wind_dir":"东南风","wind_sc":"微风","wind_spd":"6"},{"cloud":"3","cond_code":"100","cond_txt":"晴","hum":"92","pop":"0","pres":"1018","time":"2017-10-27 19:00","tmp":"13","wind_deg":"206","wind_dir":"西南风","wind_sc":"微风","wind_spd":"4"},{"cloud":"19","cond_code":"100","cond_txt":"晴","hum":"96","pop":"0","pres":"1019","time":"2017-10-27 22:00","tmp":"13","wind_deg":"212","wind_dir":"西南风","wind_sc":"微风","wind_spd":"1"}],"lifestyle":[{"brf":"舒适","txt":"今天夜间不太热也不太冷，风力不大，相信您在这样的天气条件下，应会感到比较清爽和舒适。","type":"comf"},{"brf":"较舒适","txt":"建议着薄外套、开衫牛仔衫裤等服装。年老体弱者应适当添加衣物，宜着夹克衫、薄毛衣等。","type":"drsg"},{"brf":"少发","txt":"各项气象条件适宜，无明显降温过程，发生感冒机率较低。","type":"flu"},{"brf":"适宜","txt":"天气较好，赶快投身大自然参与户外运动，尽情感受运动的快乐吧。","type":"sport"},{"brf":"适宜","txt":"天气较好，但丝毫不会影响您出行的心情。温度适宜又有微风相伴，适宜旅游。","type":"trav"},{"brf":"弱","txt":"紫外线强度较弱，建议出门前涂擦SPF在12-15之间、PA+的防晒护肤品。","type":"uv"},{"brf":"较不宜","txt":"较不宜洗车，未来一天无雨，风力较大，如果执意擦洗汽车，要做好蒙上污垢的心理准备。","type":"cw"},{"brf":"较差","txt":"气象条件较不利于空气污染物稀释、扩散和清除，请适当减少室外活动时间。","type":"air"}],"now":{"cond_code":"501","cond_txt":"雾","fl":"8","hum":"94","pcpn":"0","pres":"1018","tmp":"9","vis":"2","wind_deg":"48","wind_dir":"东北风","wind_sc":"微风","wind_spd":"7"},"status":"ok","update":{"loc":"2017-10-26 23:09","utc":"2017-10-26 15:09"}}]
   */

  List<HeWeather6ListBean> HeWeather6;

  static Now_weather_bean fromMap(Map<String, dynamic> map) {
    Now_weather_bean now_weather_bean = new Now_weather_bean();
    now_weather_bean.HeWeather6 = HeWeather6ListBean.fromMapList(map['HeWeather6']);
    return now_weather_bean;
  }

  static List<Now_weather_bean> fromMapList(dynamic mapList) {
    List<Now_weather_bean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class HeWeather6ListBean {

  /**
   * status : "ok"
   * basic : {"cid":"CN101010100","location":"北京","parent_city":"北京","admin_area":"北京","cnty":"中国","lat":"39.90498734","lon":"116.40528870","tz":"8.0"}
   * now : {"cond_code":"501","cond_txt":"雾","fl":"8","hum":"94","pcpn":"0","pres":"1018","tmp":"9","vis":"2","wind_deg":"48","wind_dir":"东北风","wind_sc":"微风","wind_spd":"7"}
   * update : {"loc":"2017-10-26 23:09","utc":"2017-10-26 15:09"}
   * daily_forecast : [{"cond_code_d":"103","cond_code_n":"101","cond_txt_d":"晴间多云","cond_txt_n":"多云","date":"2017-10-26","hum":"57","pcpn":"0.0","pop":"0","pres":"1020","tmp_max":"16","tmp_min":"8","uv_index":"3","vis":"16","wind_deg":"0","wind_dir":"无持续风向","wind_sc":"微风","wind_spd":"5"},{"cond_code_d":"101","cond_code_n":"501","cond_txt_d":"多云","cond_txt_n":"雾","date":"2017-10-27","hum":"56","pcpn":"0.0","pop":"0","pres":"1018","tmp_max":"18","tmp_min":"9","uv_index":"3","vis":"20","wind_deg":"187","wind_dir":"南风","wind_sc":"微风","wind_spd":"6"},{"cond_code_d":"101","cond_code_n":"101","cond_txt_d":"多云","cond_txt_n":"多云","date":"2017-10-28","hum":"26","pcpn":"0.0","pop":"0","pres":"1029","tmp_max":"17","tmp_min":"5","uv_index":"2","vis":"20","wind_deg":"2","wind_dir":"北风","wind_sc":"3-4","wind_spd":"19"}]
   * hourly : [{"cloud":"8","cond_code":"100","cond_txt":"晴","hum":"84","pop":"0","pres":"1018","time":"2017-10-27 01:00","tmp":"8","wind_deg":"49","wind_dir":"东北风","wind_sc":"微风","wind_spd":"2"},{"cloud":"8","cond_code":"100","cond_txt":"晴","hum":"81","pop":"0","pres":"1018","time":"2017-10-27 04:00","tmp":"8","wind_deg":"29","wind_dir":"东北风","wind_sc":"微风","wind_spd":"2"},{"cloud":"6","cond_code":"100","cond_txt":"晴","hum":"95","pop":"0","pres":"1019","time":"2017-10-27 07:00","tmp":"8","wind_deg":"37","wind_dir":"东北风","wind_sc":"微风","wind_spd":"2"},{"cloud":"2","cond_code":"100","cond_txt":"晴","hum":"75","pop":"0","pres":"1018","time":"2017-10-27 10:00","tmp":"14","wind_deg":"108","wind_dir":"东南风","wind_sc":"微风","wind_spd":"3"},{"cloud":"0","cond_code":"100","cond_txt":"晴","hum":"62","pop":"0","pres":"1016","time":"2017-10-27 13:00","tmp":"16","wind_deg":"158","wind_dir":"东南风","wind_sc":"微风","wind_spd":"6"},{"cloud":"0","cond_code":"100","cond_txt":"晴","hum":"73","pop":"0","pres":"1016","time":"2017-10-27 16:00","tmp":"15","wind_deg":"162","wind_dir":"东南风","wind_sc":"微风","wind_spd":"6"},{"cloud":"3","cond_code":"100","cond_txt":"晴","hum":"92","pop":"0","pres":"1018","time":"2017-10-27 19:00","tmp":"13","wind_deg":"206","wind_dir":"西南风","wind_sc":"微风","wind_spd":"4"},{"cloud":"19","cond_code":"100","cond_txt":"晴","hum":"96","pop":"0","pres":"1019","time":"2017-10-27 22:00","tmp":"13","wind_deg":"212","wind_dir":"西南风","wind_sc":"微风","wind_spd":"1"}]
   * lifestyle : [{"brf":"舒适","txt":"今天夜间不太热也不太冷，风力不大，相信您在这样的天气条件下，应会感到比较清爽和舒适。","type":"comf"},{"brf":"较舒适","txt":"建议着薄外套、开衫牛仔衫裤等服装。年老体弱者应适当添加衣物，宜着夹克衫、薄毛衣等。","type":"drsg"},{"brf":"少发","txt":"各项气象条件适宜，无明显降温过程，发生感冒机率较低。","type":"flu"},{"brf":"适宜","txt":"天气较好，赶快投身大自然参与户外运动，尽情感受运动的快乐吧。","type":"sport"},{"brf":"适宜","txt":"天气较好，但丝毫不会影响您出行的心情。温度适宜又有微风相伴，适宜旅游。","type":"trav"},{"brf":"弱","txt":"紫外线强度较弱，建议出门前涂擦SPF在12-15之间、PA+的防晒护肤品。","type":"uv"},{"brf":"较不宜","txt":"较不宜洗车，未来一天无雨，风力较大，如果执意擦洗汽车，要做好蒙上污垢的心理准备。","type":"cw"},{"brf":"较差","txt":"气象条件较不利于空气污染物稀释、扩散和清除，请适当减少室外活动时间。","type":"air"}]
   */

  String status;
  BasicBean basic;
  NowBean now;
  UpdateBean update;
  List<Daily_forecastListBean> daily_forecast;
  List<HourlyListBean> hourly;
  List<LifestyleListBean> lifestyle;

  static HeWeather6ListBean fromMap(Map<String, dynamic> map) {
    HeWeather6ListBean heWeather6ListBean = new HeWeather6ListBean();
    heWeather6ListBean.status = map['status'];
    heWeather6ListBean.basic = BasicBean.fromMap(map['basic']);
    heWeather6ListBean.now = NowBean.fromMap(map['now']);
    heWeather6ListBean.update = UpdateBean.fromMap(map['update']);
    heWeather6ListBean.daily_forecast = Daily_forecastListBean.fromMapList(map['daily_forecast']);
    heWeather6ListBean.hourly = HourlyListBean.fromMapList(map['hourly']);
    heWeather6ListBean.lifestyle = LifestyleListBean.fromMapList(map['lifestyle']);
    return heWeather6ListBean;
  }

  static List<HeWeather6ListBean> fromMapList(dynamic mapList) {
    List<HeWeather6ListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class BasicBean {

  /**
   * cid : "CN101010100"
   * location : "北京"
   * parent_city : "北京"
   * admin_area : "北京"
   * cnty : "中国"
   * lat : "39.90498734"
   * lon : "116.40528870"
   * tz : "8.0"
   */

  String cid;
  String location;
  String parent_city;
  String admin_area;
  String cnty;
  String lat;
  String lon;
  String tz;

  static BasicBean fromMap(Map<String, dynamic> map) {
    BasicBean basicBean = new BasicBean();
    basicBean.cid = map['cid'];
    basicBean.location = map['location'];
    basicBean.parent_city = map['parent_city'];
    basicBean.admin_area = map['admin_area'];
    basicBean.cnty = map['cnty'];
    basicBean.lat = map['lat'];
    basicBean.lon = map['lon'];
    basicBean.tz = map['tz'];
    return basicBean;
  }

  static List<BasicBean> fromMapList(dynamic mapList) {
    List<BasicBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class NowBean {

  /**
   * cond_code : "501"
   * cond_txt : "雾"
   * fl : "8"
   * hum : "94"
   * pcpn : "0"
   * pres : "1018"
   * tmp : "9"
   * vis : "2"
   * wind_deg : "48"
   * wind_dir : "东北风"
   * wind_sc : "微风"
   * wind_spd : "7"
   */

  String cond_code;
  String cond_txt;
  String fl;
  String hum;
  String pcpn;
  String pres;
  String tmp;
  String vis;
  String wind_deg;
  String wind_dir;
  String wind_sc;
  String wind_spd;
  String cloud;

  static NowBean fromMap(Map<String, dynamic> map) {
    NowBean nowBean = new NowBean();
    nowBean.cond_code = map['cond_code'];
    nowBean.cond_txt = map['cond_txt'];
    nowBean.fl = map['fl'];
    nowBean.hum = map['hum'];
    nowBean.pcpn = map['pcpn'];
    nowBean.pres = map['pres'];
    nowBean.tmp = map['tmp'];
    nowBean.vis = map['vis'];
    nowBean.wind_deg = map['wind_deg'];
    nowBean.wind_dir = map['wind_dir'];
    nowBean.wind_sc = map['wind_sc'];
    nowBean.wind_spd = map['wind_spd'];
    nowBean.cloud=map['cloud'];
    return nowBean;
  }

  static List<NowBean> fromMapList(dynamic mapList) {
    List<NowBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class UpdateBean {

  /**
   * loc : "2017-10-26 23:09"
   * utc : "2017-10-26 15:09"
   */

  String loc;
  String utc;

  static UpdateBean fromMap(Map<String, dynamic> map) {
    UpdateBean updateBean = new UpdateBean();
    updateBean.loc = map['loc'];
    updateBean.utc = map['utc'];
    return updateBean;
  }

  static List<UpdateBean> fromMapList(dynamic mapList) {
    List<UpdateBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class Daily_forecastListBean {

  /**
   * cond_code_d : "103"
   * cond_code_n : "101"
   * cond_txt_d : "晴间多云"
   * cond_txt_n : "多云"
   * date : "2017-10-26"
   * hum : "57"
   * pcpn : "0.0"
   * pop : "0"
   * pres : "1020"
   * tmp_max : "16"
   * tmp_min : "8"
   * uv_index : "3"
   * vis : "16"
   * wind_deg : "0"
   * wind_dir : "无持续风向"
   * wind_sc : "微风"
   * wind_spd : "5"
   */

  String cond_code_d;
  String cond_code_n;
  String cond_txt_d;
  String cond_txt_n;
  String date;
  String hum;
  String pcpn;
  String pop;
  String pres;
  String tmp_max;
  String tmp_min;
  String uv_index;
  String vis;
  String wind_deg;
  String wind_dir;
  String wind_sc;
  String wind_spd;

  static Daily_forecastListBean fromMap(Map<String, dynamic> map) {
    Daily_forecastListBean daily_forecastListBean = new Daily_forecastListBean();
    daily_forecastListBean.cond_code_d = map['cond_code_d'];
    daily_forecastListBean.cond_code_n = map['cond_code_n'];
    daily_forecastListBean.cond_txt_d = map['cond_txt_d'];
    daily_forecastListBean.cond_txt_n = map['cond_txt_n'];
    daily_forecastListBean.date = map['date'];
    daily_forecastListBean.hum = map['hum'];
    daily_forecastListBean.pcpn = map['pcpn'];
    daily_forecastListBean.pop = map['pop'];
    daily_forecastListBean.pres = map['pres'];
    daily_forecastListBean.tmp_max = map['tmp_max'];
    daily_forecastListBean.tmp_min = map['tmp_min'];
    daily_forecastListBean.uv_index = map['uv_index'];
    daily_forecastListBean.vis = map['vis'];
    daily_forecastListBean.wind_deg = map['wind_deg'];
    daily_forecastListBean.wind_dir = map['wind_dir'];
    daily_forecastListBean.wind_sc = map['wind_sc'];
    daily_forecastListBean.wind_spd = map['wind_spd'];
    return daily_forecastListBean;
  }

  static List<Daily_forecastListBean> fromMapList(dynamic mapList) {
    List<Daily_forecastListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class HourlyListBean {

  /**
   * cloud : "8"
   * cond_code : "100"
   * cond_txt : "晴"
   * hum : "84"
   * pop : "0"
   * pres : "1018"
   * time : "2017-10-27 01:00"
   * tmp : "8"
   * wind_deg : "49"
   * wind_dir : "东北风"
   * wind_sc : "微风"
   * wind_spd : "2"
   */

  String cloud;
  String cond_code;
  String cond_txt;
  String hum;
  String pop;
  String pres;
  String time;
  String tmp;
  String wind_deg;
  String wind_dir;
  String wind_sc;
  String wind_spd;

  static HourlyListBean fromMap(Map<String, dynamic> map) {
    HourlyListBean hourlyListBean = new HourlyListBean();
    hourlyListBean.cloud = map['cloud'];
    hourlyListBean.cond_code = map['cond_code'];
    hourlyListBean.cond_txt = map['cond_txt'];
    hourlyListBean.hum = map['hum'];
    hourlyListBean.pop = map['pop'];
    hourlyListBean.pres = map['pres'];
    hourlyListBean.time = map['time'];
    hourlyListBean.tmp = map['tmp'];
    hourlyListBean.wind_deg = map['wind_deg'];
    hourlyListBean.wind_dir = map['wind_dir'];
    hourlyListBean.wind_sc = map['wind_sc'];
    hourlyListBean.wind_spd = map['wind_spd'];
    return hourlyListBean;
  }

  static List<HourlyListBean> fromMapList(dynamic mapList) {
    List<HourlyListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class LifestyleListBean {

  /**
   * brf : "舒适"
   * txt : "今天夜间不太热也不太冷，风力不大，相信您在这样的天气条件下，应会感到比较清爽和舒适。"
   * type : "comf"
   */

  String brf;
  String txt;
  String type;

  static LifestyleListBean fromMap(Map<String, dynamic> map) {
    LifestyleListBean lifestyleListBean = new LifestyleListBean();
    lifestyleListBean.brf = map['brf'];
    lifestyleListBean.txt = map['txt'];
    lifestyleListBean.type = map['type'];
    return lifestyleListBean;
  }

  static List<LifestyleListBean> fromMapList(dynamic mapList) {
    List<LifestyleListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

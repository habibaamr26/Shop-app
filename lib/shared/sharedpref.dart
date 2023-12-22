
import 'package:shared_preferences/shared_preferences.dart';
class cachHelper{
  static late  SharedPreferences shoppref;
  static initial ()
  async {
    shoppref=await SharedPreferences.getInstance() ;
  }


  static Future<bool> setdata({required String key,required dynamic value})
  async{
    if(value is String) return await shoppref.setString(key, value);
    if(value is int)return await shoppref.setInt(key, value);
    if(value is bool)return await shoppref.setBool(key, value);
    else {
      return await shoppref.setDouble(key, value);
    }

  }

  static  getdata({required String key})
   {
    return  shoppref.get(key);
  }
  static Future<bool> removedata({required String key})
  async {
    return await shoppref.remove(key);
  }
}
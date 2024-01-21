import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_ui/models/comment.dart';
import 'package:http/http.dart' as http;

Future<List<Comment>> getCommentsFromApi (int start, int limit) async {
  final url = 'https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit';
  try{
    final res = await http.get(Uri.parse(url));
    if(res.statusCode == 200){
      final responseData = json.decode(res.body) as List;
      // convert responseData to List of comment ?
      final List<Comment> comments = responseData.map((e){
        return Comment(id: e['id'], name: e['name'], email: e['email'], body: e['body']);
      }).toList();
      // print('start $start, limit $limit');
      return comments;
    }
    return [];
    // return Comment.fromJson(jsonDecode(res.body)) as List;
  }catch(err){
    print('Failed to load album');
    return [];
  }
}

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if(Platform.isIOS){
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor;
  }else if(Platform.isAndroid){
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id;
  }
}
// Usage
// String? deviceId = await _getId();










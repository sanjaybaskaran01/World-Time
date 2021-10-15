import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String? time;
  String flag;
  String url;
  bool? isDayTime;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];

      // create DateTime object
      DateTime now = DateTime.parse(datetime.substring(0, 26));
      // set the time property
      isDayTime = now.hour > 6 && now.hour < 20;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Could not get time data';
    }
  }
}

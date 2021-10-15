import 'package:http/http.dart';

class TimeZones {
  void getTimeZones() async {
    Response response =
        await get(Uri.parse('https://worldtimeapi.org/api/timezones'));
    print(response.body);
  }
}

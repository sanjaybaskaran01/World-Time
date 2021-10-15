import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Color? bgColor=Colors.orange;
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(flag: 'india.png', location: 'India', url: 'Asia/Kolkata');
    await instance.getTime();
    bgColor = instance.isDayTime! ? Colors.orange : Colors.indigo[700];

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: const Center(
          child: SpinKitPumpingHeart(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDayTime'] ? "assets/day.jpg" : "assets/night.png";

    Color? bgColor = data['isDayTime'] ? Colors.orange : Colors.indigo[700];
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.fill,
          )),
          child: Column(
            children: <Widget>[
              
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(data['location'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 2.0,
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Text(data['time'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    letterSpacing: 2.0,
                  )),
              Expanded(
                child: Align(
                  alignment:Alignment.bottomCenter,
                  child: TextButton.icon(
                      style:ButtonStyle(
                        overlayColor:MaterialStateProperty.all<Color>(bgColor!), 
                      ),
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location',arguments:{
                              'isDayTime': data['isDayTime']
                            });
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: const Icon(Icons.edit_location, color: Colors.white),
                      label: const Text(
                        "Edit Location",
                        style: TextStyle(color: Colors.white),
                      ),
                    
                      ),
                ),
              ),

            ],
          ),
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_flashlight/flutter_flashlight.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _hasFlashlight = false;
  var isON = false;

  checkLight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff0577C6),
        title: Text("FlashLight App"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("img.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: _hasFlashlight
            ? Center(
                child: Transform.rotate(
                  angle: -3.14 / 2,
                  child: Transform.scale(
                    scale: 3.0,
                    child: Switch(
                      value: isON,
                      onChanged: (value) {
                        setState(
                          () {
                            isON = !isON;
                            isON ? Flashlight.lightOn() : Flashlight.lightOff();
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            : Text(
                "You Don't have Flash in your Camera..",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}

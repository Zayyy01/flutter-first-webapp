import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello world"),
        leading: Icon(Icons.photo_camera),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.badge),
            tooltip: 'About this page',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: UnderDevelopmentSnackBar(),
              ));
            },
          ),
        ],
      ),
      body: Material(
        color: Colors.deepPurple,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Center(
                    child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Container(
                      decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      image: new ExactAssetImage('images/me.jpg'),
                      fit: BoxFit.fill,
                    ),
                  )),
                )),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        sayHello(),
                        textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.white, fontSize: 39.0),
                      ),
                      Text(
                        currentTime(),
                        textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.white, fontSize: 21.0),
                      ),
                      Text(
                        "There is nothing to see here..yet.",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "While this page is in under construction, there is a picture from Budapest at night:",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6),
                        child: ElevatedButton(
                          onPressed: () => showDummyPhotoDialog(context),
                          child: Text('Click to open the photo'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showDummyPhotoDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurpleAccent,
            content: Image.asset(
              'images/cover.jpg',
              fit: BoxFit.cover,
            ),
          );
        });
  }

  String sayHello() {
    String hello;
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour < 12) {
      hello = "Good Morning!";
    } else if (hour < 18) {
      hello = "Good Afternoon!";
    } else
      hello = "Good Evening!";

    return hello;
  }

  String currentTime() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;

    String minutes = minute < 10 ? "0" + minute.toString() : minute.toString();
    return "It's now " + hour.toString() + ":" + minutes + ".";
  }
}

class UnderDevelopmentSnackBar extends StatelessWidget {
  const UnderDevelopmentSnackBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('This is under development...'),
        SizedBox(width: 5),
        Icon(Icons.construction),
        SizedBox(width: 3),
        Text("Check it later :)")
      ],
    );
  }
}

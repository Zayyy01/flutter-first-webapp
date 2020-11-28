import 'package:flutter/material.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'home.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
              home: Scaffold(
            body: Center(
              child: Text('Something went wrong. Try reload the page!',
                  style: Theme.of(context).textTheme.headline2),
            ),
          ));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return PhotoBlogApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
            home: Scaffold(
          body: Center(
            child: Text('Loading...',
                style: Theme.of(context).textTheme.headline2),
          ),
        ));
      },
    );
  }
}

class PhotoBlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Photoblog",
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Home(),
    );
  }
}

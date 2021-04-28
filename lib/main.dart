import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("AppName"),
            backgroundColor: Colors.red,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start, // uses main axis up/down(y)
            crossAxisAlignment: CrossAxisAlignment.stretch, //stretch left to right(x)
            children: [
              Container(
                  child:
                      Image.network("https://wallup.net/wp-content/uploads/2019/09/708281-kittens-kitten-cat-cats-baby-cute.jpg"),
                    
                  ),
              Container(
                  child:
                    Text("Two"),
                  ),
              Container(
                  child:
                    Text("Three"),
                  )
            ],
          )));
}

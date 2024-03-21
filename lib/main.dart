import 'package:flutter/material.dart';
import 'package:giphy/Controller/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeMode _isdark = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    search("dog");
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white24,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: _isdark,
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: trending(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text("GIPHY", textAlign: TextAlign.center),
                actions: <Widget>[
                  Text("Dark Mode"),
                  // ElevatedButton(
                  //     onPressed: _changeTheme(_isdark == ThemeMode.dark
                  //         ? ThemeMode.light
                  //         : ThemeMode.dark),
                  //     child: Icon(Icons.dark_mode)),
                ],
              ),
              body: snapshot.data.length != 0
                  ? GridView.builder(
                      cacheExtent: 50,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (c, i) {
                        return Container(
                          child: Image.network(
                            snapshot.data[i],
                            fit: BoxFit.fill,
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    ),

              // This trailing comma makes auto-formatting nicer for build methods.
            );

            // return a page with the model
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
            // return the loading placeholders
          }
        });
  }
}

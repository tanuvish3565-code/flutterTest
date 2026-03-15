import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Welcome to the Home Page";
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            _horizontalList(),
            SizedBox(height: 80),
            _verticalList(),
          ],
        ),
      ),
    );
  }

  Container _horizontalList() {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(26, 0, 255, 4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                  // changes position of shadow
                ),
              ],

              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  "Horizontal ListView",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 80,
                  child: ScrollConfiguration(
                    behavior:
                        DesktopScrollBehavior(), // use desktop scroll behavior
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: 20, // increase to see scrolling
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100, // make items wider
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          color: Colors.blueAccent,
                          child: Center(
                            child: Text(
                              'Item $index',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 30,
                          height: 20,
                        ); // space between items
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Container _verticalList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(26, 0, 255, 4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
            // changes position of shadow
          ),
        ],

        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            "Vertical ListView",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 500,
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 20, // increase to see scrolling
              itemBuilder: (context, index) {
                return Container(
                  height: 50, // make items taller
                  margin: EdgeInsets.symmetric(vertical: 5),
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 30); // space between items
              },
            ),
          ),
        ],
      ),
    );
  }



  AppBar _AppBar() {
    return AppBar(
      toolbarHeight: 50,
      leading: const Icon(Icons.home, color: Colors.white),
      title: const Text(
        'Home Page',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,

      toolbarOpacity: 1.0,
      shadowColor: Color.fromARGB(255, 0, 0, 0),
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 73, 57, 76)],
            begin: Alignment(0.5, 1.0),
            end: Alignment(0.5, 0.0),
          ),
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          color: const Color.fromARGB(126, 0, 0, 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onSelected: (value) {
            // if (value == 'Option 1') {
            //   setState(() {
            //     title = "You selected Option 1";
            //   });
            // } else if (value == 'Option 2') {
            //   setState(() {
            //     title = "You selected Option 2";
            //   });
            // }
          },
          itemBuilder: (BuildContext context) {
            return {'Option 1', 'Option 2'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 0, 34, 255),
                    ), // add an icon
                    SizedBox(width: 8),
                    Text(
                      choice,
                      style: TextStyle(
                        color: Color.fromARGB(255, 70, 181, 250),
                      ),
                    ),
                  ],
                ),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}

// Your HomePage widget code above...

class DesktopScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse, // 👈 enables mouse drag
    PointerDeviceKind.trackpad,
  };
}

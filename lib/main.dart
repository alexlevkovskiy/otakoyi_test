import 'package:flutter/material.dart';
import 'package:otakoyi_test/main_tab.dart';
import 'package:otakoyi_test/utils/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: FontColors.darkBlue,
        accentColor: Colors.cyan[600],
        backgroundColor: SurfaceColors.lightGray,

        fontFamily: 'Work Sans',

        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w600, height: 1.15),
          headline2: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, height: 1.15),
          headline3: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w600, height: 1.15),
          subtitle1: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w500, height: 1.5),
          bodyText1: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w400, height: 1.65),
          subtitle2: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w600, height: 1.5),
          bodyText2: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w400, height: 1.65),
          caption: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
          overline: TextStyle(
              fontSize: 10.0, fontWeight: FontWeight.w500, height: 1.65),
        ).apply(
            bodyColor: FontColors.darkBlue, displayColor: FontColors.darkBlue),
      ),
      home: TabsPage(),
    );
  }
}

class TabsPage extends StatefulWidget {
  TabsPage({Key key}) : super(key: key);

  @override
  TabsPageState createState() => TabsPageState();
}

class TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [MainPage(), MainPage(), MainPage(), MainPage()],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.add_circle_outline),
                text: "Refer",
              ),
              Tab(
                icon: Icon(Icons.mail),
                text: "Messages",
              ),
              Tab(
                icon: Icon(Icons.account_circle),
                text: "Profile",
              )
            ],
            labelColor: FontColors.darkBlue,
            unselectedLabelColor: FontColors.gray,
            indicator: null,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

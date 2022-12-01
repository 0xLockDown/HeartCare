import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:heart_care/pages/settings.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'learn.dart';
import 'vitals.dart';
import 'scan.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_service.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 1;
  int counter = 0;

  /*static const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);*/

  List<String> notif=["Valorant","Overwatch2","League of Legends","Rainbow six seige","GTA V","Detroit becomes human"];

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[const learn(),const vitals(),const scan()];
    final controller = ScrollController();
    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const settings()));},
            child: const Icon(
              Icons.settings,
            ),
          ),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: IconButton(icon: const Icon(Icons.notifications), onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                          elevation: 16,
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                const SizedBox(height: 20),
                                const Center(child: Text('Notifications')),
                                const SizedBox(height: 20),
                                _buildRow('assets/choc.png', 'Name 1', 1000),
                              ],
                            ),
                        );
                      },
                    );

                    setState(() {
                      counter = 0;
                      <Widget>[PopupMenuButton(itemBuilder: (context){return notif.map((item){return PopupMenuItem( value : item, child:Text(item),);}).toList();})]; //should be a container or sizedbox
                    });
                  }),
                ),
                counter != 0 ? Positioned(
                  right: 22,
                  top: 15,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 15,
                      minHeight: 15,
                    ),
                    child: Text(
                      '$counter',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ) : Container()
              ],
            ),
          ]
      ),
      body:IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.cyanAccent, size: 40),
        selectedItemColor: Colors.cyanAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            label: 'vitals',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye),
            label: 'Retinal Scan',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          /*await flutterLocalNotificationsPlugin.show(
              12345,
              "A Notification From My Application",
              "This notification was sent using Flutter Local Notifcations Package",
              platformChannelSpecifics,
              payload: 'data');*/
          /*LocalNoticeService().addNotification(
            'Notification Title',
            'Notification Body',
            DateTime.now().millisecondsSinceEpoch + 1000,
            channel: 'testing',
          );*/
          counter++;
        });
      }, child: const Icon(Icons.add),),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}



Widget _buildRow(String imageAsset, String name, double score) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        SizedBox(height: 8),
        Container(height: 2, color: Colors.cyanAccent),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage(imageAsset)),
            SizedBox(width: 12),
            Text(name),
            Spacer(),
            Container(
              decoration: BoxDecoration(color: Colors.yellow[900], borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text('$score'),
            ),
          ],
        ),
      ],
    ),
  );
}
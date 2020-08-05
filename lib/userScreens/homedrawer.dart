import 'dart:io';
import 'dart:async';

import 'package:flutter_blog/services/auth.dart';
import 'package:flutter_blog/services/app_tools.dart';
import '../main.dart';
import 'routes.dart';
import 'contact.dart';
import 'share.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {

  BuildContext context;
    String fName = "";
    String lName = "";
    String email = "";

    final AuthService _auth = AuthService();

  @override
    void initState(){
      getCurrentUser();
      super.initState();
    }

    Future getCurrentUser() async{
      fName = await getDataLocally(key: 'fName');
      lName = await getDataLocally(key: 'lName');
      email = await getDataLocally(key: 'email');
      setState(() {});
    }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.collections_bookmark,
            text: 'blogs',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, Routes.blogs);
            }
          ),
          _createDrawerItem(
            icon: Icons.person,
            text: 'Profile',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, Routes.profile);
            }
          ),
          _createDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, Routes.settings);
            }
          ),
          Divider(color: Colors.grey,thickness: 0.5,),
          ListTile(
            trailing: Icon(
                Icons.contact_mail,
              ),
            title: Text("Contact Us"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Contact()));
            },
          ),
          ListTile(
            trailing: Icon(
                Icons.share,
              ),
            title: Text("Share the App"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Share()));
            },
          ),
          Divider(color: Colors.grey,thickness: 0.5,),
          ListTile(
            trailing: Icon(
              Icons.exit_to_app,
            ),
            title: Text('Sign Out'),
            onTap: () async{
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => MyApp()));
              await _auth.signOut();
              //setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(fName+" "+lName),
      accountEmail: Text(email),
      currentAccountPicture: new CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.person),
      ),
      decoration: BoxDecoration(
        color:Colors.blue,
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}



//  /*class DrawerItem {
//    String title;
//    IconData icon;
//    DrawerItem(this.title, this.icon);
//  }*/
//
//  class HomeDrawer extends StatefulWidget {
//
//    /*final drawerItems = [
//      new DrawerItem("blogs", Icons.blogs),
//      new DrawerItem("Ride", Icons.directions_bike),
//      new DrawerItem("Profile", Icons.person),
//      new DrawerItem("Settings", Icons.settings),
//    ];*/
//
//    @override
//    _HomeDrawerState createState() => _HomeDrawerState();
//  }
//
//  class _HomeDrawerState extends State<HomeDrawer> {
//
//    BuildContext context;
//    String fName = "";
//    String lName = "";
//    String email = "";
//
//    final AuthService _auth = AuthService();
//
//      /*switch (pos) {
//        case 0:
//          return new blogs();
//        case 1:
//          return new Ride();
//        case 2:
//          return new Profile();
//        case 3:
//          return new Settings();
//
//        default:
//          return new Text("Error");
//      }
//    }*/
//
//    /*_onSelectItem(int index) {
//      setState(() {
//        _selectedDrawerIndex = index;
//        _getDrawerItemWidget(_selectedDrawerIndex);
//      });
//      Navigator.of(context).pop();
//    }*/
//
//    @override
//    void initState(){
//      getCurrentUser();
//      super.initState();
//    }
//
//    Future getCurrentUser() async{
//      fName = await getDataLocally(key: 'fName');
//      lName = await getDataLocally(key: 'lName');
//      email = await getDataLocally(key: 'email');
//      setState(() {});
//    }
//
//    Widget build(BuildContext context) {
//
//      /*var drawerOptions = <Widget>[];
//      for (var i = 0; i < widget.drawerItems.length; i++) {
//        var d = widget.drawerItems[i];
//        drawerOptions.add(
//            new ListTile(
//              leading: new Icon(d.icon),
//              title: new Text(d.title),
//              selected: i == _selectedDrawerIndex,
//              onTap: () => _onSelectItem(i),
//            )
//        );
//      }*/
//
//      return Scaffold(
//        backgroundColor: Colors.white,
//        appBar: AppBar(
//          //title: Text(widget.drawerItems[_selectedDrawerIndex].title),
//          title: Text("Home"),
//          backgroundColor: Colors.blue,
//          actions: <Widget>[
//            FlatButton.icon(
//              icon: Icon(Icons.exit_to_app),
//              label: Text("Sign Out"),
//              onPressed:() async{
//                await _auth.signOut();
//              },
//            )
//          ],
//        ),
//        //body: _getDrawerItemWidget(_selectedDrawerIndex),
//        drawer: Drawer(
//          child: ListView(
//            padding: EdgeInsets.zero,
//            children: <Widget>[
//              UserAccountsDrawerHeader(
//                accountName: Text(fName+" "+lName),
//                accountEmail: Text(email),
//                currentAccountPicture: new CircleAvatar(
//                  backgroundColor: Colors.white,
//                  child: Icon(Icons.person),
//                ),
//                decoration: BoxDecoration(
//                  color:Colors.blue,
//                ),
//              ),
//              /*Column(
//                children: drawerOptions,
//              ),*/
//              ListTile(
//                leading: new CircleAvatar(
//                  child: new Icon(
//                    Icons.home,
//                    color: Colors.white,
//                    size: 20.0,
//                  ),
//                ),
//                title: new Text("Home"),
//                onTap: () {
//                  Navigator.pop(context);
//                },
//              ),
//              ListTile(
//                leading: new CircleAvatar(
//                  child: new Icon(
//                    Icons.blogs,
//                    color: Colors.white,
//                    size: 20.0,
//                  ),
//                ),
//                title: new Text("blogs"),
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => blogs()));
//                },
//              ),
//              ListTile(
//                leading: new CircleAvatar(
//                  child: new Icon(
//                    Icons.directions_bike,
//                    color: Colors.white,
//                    size: 20.0,
//                  ),
//                ),
//                title: new Text("Ride"),
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Ride()));
//                },
//              ),
//              Divider(color: Colors.grey,thickness: 0.1,),
//              ListTile(
//                leading: new CircleAvatar(
//                  child: new Icon(
//                    Icons.person,
//                    color: Colors.white,
//                    size: 20.0,
//                  ),
//                ),
//                title: new Text("Profile"),
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Profile()));
//                },
//              ),
//              ListTile(
//                leading: new CircleAvatar(
//                  child: new Icon(
//                    Icons.settings,
//                    color: Colors.white,
//                    size: 20.0,
//                  ),
//                ),
//                title: new Text("Settings"),
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Settings()));
//                },
//              ),
//              Divider(color: Colors.grey,thickness: 0.5,),
//              new ListTile(
//                trailing: new Icon(
//                    Icons.contact_mail,
//                  ),
//                title: new Text("Contact Us"),
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Contact()));
//                },
//              ),
//              new ListTile(
//                trailing: new Icon(
//                    Icons.share,
//                  ),
//                title: new Text("Share the App"),
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Share()));
//                },
//              ),
//            ],
//          ),
//        ),
//      );
//    }
//  }

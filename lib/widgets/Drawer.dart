import 'package:flutter/material.dart';
import '../screens/Filters.dart';

class MainDrawer extends StatelessWidget {
  Widget BulildListTile(String title, IconData icon, Function Tap) {
    return ListTile(
      leading: Icon(
       icon,
        size: 25,
      ),
      title: Text(
       title,
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w800,
        ),
      ),
      onTap: Tap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color:Theme.of(context).primaryColor ,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              "المراجع",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BulildListTile("Meal", Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          BulildListTile("Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed( FilterScreen.routeName);}),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                "Cooking",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 20),
         buildListTile(
           "Meal",
           Icons.restaurant,
             (){Navigator.of(context).pushReplacementNamed("/");}
         ),
            buildListTile(
              "Filters",
              Icons.settings,
                (){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
            leading: Icon(icon, size: 26),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'RobotoCondensed'
              ),
            ),
            onTap:tabHandler
          );
  }
}

import 'package:flutter/material.dart';
import 'package:best_before/navBarTest/menu_item.dart';

class MenuItems {
  static const allRecipes = MenuItem('ALL RECIPES', Icons.push_pin );
  static const touseup = MenuItem('To be used soon', Icons.delete_sweep_outlined);
  static const lowCal = MenuItem('Low calorie meals', Icons.priority_high);
  static const veg = MenuItem('Vegetarian', Icons.park_outlined );
  static const vegan = MenuItem('Vegan', Icons.local_florist_sharp );
  static const pescetarian = MenuItem('Pescetarian', Icons.phishing );
  static const glutenFree = MenuItem('Gluten Free', Icons.no_food);
  static const breakfast = MenuItem('Breakfast', Icons.local_cafe_outlined);
  static const lunch = MenuItem('Lunch & Dinner', Icons.lunch_dining);
  static const dessert = MenuItem('Dessert', Icons.cake_outlined);


  static const all = <MenuItem>[
    allRecipes,
    touseup,
    lowCal,
    veg,
    vegan,
    pescetarian,
    glutenFree,
    breakfast,
    lunch,
    dessert,
    
  ];
}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(51, 171, 160, 100),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(),
                // buildAvatar(),
                SizedBox(height: 32),
                ...MenuItems.all.map(buildMenuItem).toList(),
                Spacer(flex: 2),
                // buildLogout(),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      );

  Widget buildLogout() => Container(
        margin: EdgeInsets.only(left: 16),
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            primary: Colors.white,
            shape: StadiumBorder(),
            side: BorderSide(width: 2, color: Colors.white),
            textStyle: TextStyle(fontSize: 18),
          ),
          icon: Icon(Icons.lock),
          label: Text('Logout'),
          onPressed: () {},
        ),
      );

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => onSelectedItem(item),
        ),
      );

  Widget buildAvatar() => Container(
        margin: EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 42,
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}
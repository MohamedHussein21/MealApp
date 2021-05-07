import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/Drawer.dart';
import 'categoris_Screens.dart';
import 'favotiteScreen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> FavoritMeal;

  TabsScreen( this.FavoritMeal) ;
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String ,Object>> _pages ;

  int _selectPageIndex = 0;
  @override
  void initState() {
   _pages = [
    {
    'page': CategoriesScreen(),
    'title': 'Categories',
    },
    {
    'page': FavoritScreen(widget.FavoritMeal),
    'title': 'Your Favorites',
    }
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      body:_pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).accentColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("الرئسية")),
          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text("المفضلة")),
        ],
      ),
      drawer:MainDrawer(),
    );
  }
}

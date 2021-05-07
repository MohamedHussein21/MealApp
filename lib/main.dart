import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/Filters.dart';
import 'package:meal_app/screens/Meal_Detail_Screen.dart';
import './screens/CatMeealScreen.dart';
import './screens/categoris_Screens.dart';
import 'models/meal.dart';
import 'screens/tabs_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _Filters = {
    'gluten' : false,
    'lactose'  : false,
    'vegetarin':false,
    'vegan' :false,

};

  List<Meal>_avalableMeal = DUMMY_MEALS;
  List<Meal>_FavoritMeal = [];

  void _setFilter (Map<String,bool> _filterData){
  setState(() {
    _Filters =_filterData;
    _avalableMeal =DUMMY_MEALS.where((meal) {
      if (_Filters['gluten'] && !meal.isGlutenFree){
        return false;
      };
      if (_Filters['lactose'] && !meal.isGlutenFree){
        return false;
      }
      if (_Filters['vegetarin'] && !meal.isGlutenFree){
        return false;
      }
      if (_Filters['vegan'] && !meal.isGlutenFree){
        return false;
      }
      return true;
    }).toList();
  });
  }
  void _toggleFavorite(String mealId){
   final existingIndex = _FavoritMeal.indexWhere((meal) =>meal.id ==mealId );
   if(existingIndex>=0){
     setState(() {
       _FavoritMeal.removeAt(existingIndex);
     });
   }
   else {
     setState(() {
       _FavoritMeal.add(DUMMY_MEALS.firstWhere((meal) =>meal.id ==mealId ));
     });
   }
  }
  bool _isMeealFavorite (String id){
    return _FavoritMeal.any((meal) =>meal.id == id );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.teal,
          accentColor: Colors.teal,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_FavoritMeal),
        CatMealScreen.routeName: (context) => CatMealScreen(_avalableMeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite,_isMeealFavorite),
        FilterScreen.routeName:(context)=>FilterScreen(_Filters,_setFilter),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}

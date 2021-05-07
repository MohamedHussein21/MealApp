import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:meal_app/widgets/MealItem.dart';

class CatMealScreen extends StatefulWidget {
  static const routeName ='categoy_Meals';
  final List<Meal> avalableMeal ;

  CatMealScreen( this.avalableMeal) ;

  @override
  _CatMealScreenState createState() => _CatMealScreenState();

}

class _CatMealScreenState extends State<CatMealScreen> {
  String categoryTitle;
  List<Meal>displayMeals;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId =routeArg['id'];
    categoryTitle = routeArg['title'];
    displayMeals =widget.avalableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }


  void _removemeal(String mealId){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle,textAlign: TextAlign.center,),
      ),
      body: ListView.builder(
        itemBuilder:(ctx , index){
          return MealItem(
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            id: displayMeals[index].id,

          );
        } ,
        itemCount: displayMeals.length ,
      ),
    );
  }
}

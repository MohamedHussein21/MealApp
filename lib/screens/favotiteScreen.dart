import 'package:flutter/material.dart';
import '../widgets/MealItem.dart';
import '../models/meal.dart';
class FavoritScreen extends StatelessWidget {
  final List<Meal> FavoritMeal;

  FavoritScreen( this.FavoritMeal) ;
  @override
  Widget build(BuildContext context) {
    if(FavoritMeal.isEmpty){
      return Center(
        child: Text('ليس لديك اي وجبات مفضله',style: TextStyle(fontSize: 20),),
      );
    }
    else {
      return ListView.builder(
        itemBuilder:(ctx , index){
          return MealItem(
            imageUrl: FavoritMeal[index].imageUrl,
            title: FavoritMeal[index].title,
            duration: FavoritMeal[index].duration,
            complexity: FavoritMeal[index].complexity,
            affordability: FavoritMeal[index].affordability,
            id: FavoritMeal[index].id,
          );
        } ,
        itemCount: FavoritMeal.length ,
      );
    }

  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'Meal_detail';
  final Function toggleFavorite;
  final Function isfavorit;

   MealDetailScreen( this.toggleFavorite,this.isfavorit) ;

  Widget buildTitle (BuildContext context,String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme
          .of(context)
          .textTheme
          .title,),
    );
  }
  Widget BulidStep (BuildContext context,Widget child){
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 320,
      child: child ,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title,textAlign: TextAlign.center,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(selectedmeal.imageUrl, fit: BoxFit.cover,),
            ),
            buildTitle(context, "المكونات"),
            BulidStep(context,ListView.builder
              (itemBuilder: (ctx ,index)=> Card(

              color: Colors.orangeAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child:
                Text(selectedmeal.ingredients[index],textAlign: TextAlign.end ,),
              ),
            ) ,
              itemCount: selectedmeal.ingredients.length,
            ), ),
            buildTitle(context, "الخطوات"),
            BulidStep(context, ListView.builder
              (itemBuilder: (ctx ,index)=> Card(

              color: Colors.orangeAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: Text(selectedmeal.steps[index],textAlign: TextAlign.end,),
              ),
            ) ,
              itemCount: selectedmeal.steps.length,
            ), ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>toggleFavorite(mealid) ,
        child: Icon(
          isfavorit(mealid) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}

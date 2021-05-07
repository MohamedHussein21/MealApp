import 'package:flutter/material.dart';
import '../screens/CatMeealScreen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;

  CategoryItem(this.id, this.title, this.image);

  void selectCat(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CatMealScreen.routeName, arguments: {
      'id': id,
      'title': title,

    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCat(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.only(top: 1),

        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,

          child: Column(
            children: [

              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.network(image,height: 400,
                          width: double.infinity,
                          fit: BoxFit.fill)),

                  ],
                ),

              ),
             Padding(
              padding: const EdgeInsets.only(bottom: 1),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
      ],
             ),

             // Text(
              //  title,
               // style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700
               //   , ),
             // ),
             ),  // Image.network(image),
            ],
          ),
        ),

      //  decoration: BoxDecoration(
         // gradient: LinearGradient(
         //   colors: [color.withOpacity(0.5), color],
        //    begin: Alignment.topLeft,
        //    end: Alignment.bottomRight,
       //   ),
       //   color: color,
       //   borderRadius: BorderRadius.circular(15),
        //),
      ),
    );
  }
}

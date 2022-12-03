import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/models/ingredient_by_id_mode.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/nutrition_by_id_model.dart';

class RecipeView extends StatefulWidget {
  final String imageUrl;
  final NutritionByIdModel nutritionByIdModel;
  final IngredientsByIdModel ingredientsByIdModel;

  const RecipeView(
      {super.key,
      required this.nutritionByIdModel,
      required this.ingredientsByIdModel,
      required this.imageUrl});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  TextStyle _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35.h,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(widget.imageUrl))),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.w,left: 5.w,right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cal: ${widget.nutritionByIdModel.calories}",
                  style: _textStyle,
                ),
                Text(
                  "Carbs: ${widget.nutritionByIdModel.carbs}",
                  style: _textStyle,
                ),
                Text(
                  "Fat: ${widget.nutritionByIdModel.fat}",
                  style: _textStyle,
                ),
                Text(
                  "Protein: ${widget.nutritionByIdModel.protein}",
                  style: _textStyle,
                ),
                
                Container(
                  height: 50.h,
                  child: ListView.builder(
                    itemCount: widget.ingredientsByIdModel.ingredients!.length,
                    itemBuilder: (context, index) {
                      return Text(
                        "${widget.ingredientsByIdModel.ingredients![index].name!} ${widget.ingredientsByIdModel.ingredients![index].amount!.metric!.value}${widget.ingredientsByIdModel.ingredients![index].amount!.metric!.unit!}",
                        style: _textStyle,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

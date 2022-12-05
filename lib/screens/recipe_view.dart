import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/models/ingredient_by_id_mode.dart';
import 'package:food_app/provider/instructions_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/nutrition_by_id_model.dart';
import 'animations/ingredient_column.dart';

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
  InstructionsProvider instructionsProvider = InstructionsProvider();
  TextStyle _textStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  @override
  void initState() {
    instructionsProvider =Provider.of<InstructionsProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double fatAmount = double.parse(widget.nutritionByIdModel.fat!
        .substring(0, widget.nutritionByIdModel.fat!.length - 1));

    double carbAmount = double.parse(widget.nutritionByIdModel.carbs!
        .substring(0, widget.nutritionByIdModel.carbs!.length - 1));
    double proteinAmount = double.parse(widget.nutritionByIdModel.protein!
        .substring(0, widget.nutritionByIdModel.protein!.length - 1));
    double totalAmount = fatAmount + carbAmount + proteinAmount;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              margin: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    "Cal: ${widget.nutritionByIdModel.calories}",
                    style: _textStyle,
                  ),
                  SizedBox(height: 1.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          IngredientColumn(
                              color: Colors.green,
                              widgetWidth: (carbAmount / totalAmount) * 50.w),
                          Text(
                            " Carb ${widget.nutritionByIdModel.carbs}",
                            style: _textStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IngredientColumn(
                              color: Colors.red,
                              widgetWidth: (fatAmount / totalAmount) * 50.w),
                          Text(
                            " Fat ${widget.nutritionByIdModel.fat}",
                            style: _textStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IngredientColumn(
                              color: Colors.blue,
                              widgetWidth: (proteinAmount / totalAmount) * 50.w),
                          Text(
                            " Protein ${widget.nutritionByIdModel.protein}",
                            style: _textStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Ingredients",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Text(
                              "${widget.ingredientsByIdModel.ingredients!.length} items")
                        ],
                      ),
                      SizedBox(
                        height:
                            widget.ingredientsByIdModel.ingredients!.length * 3.2.h,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              widget.ingredientsByIdModel.ingredients!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "${widget.ingredientsByIdModel.ingredients![index].name!.replaceFirst(widget.ingredientsByIdModel.ingredients![index].name![0], widget.ingredientsByIdModel.ingredients![index].name![0].toUpperCase())} ",
                                    style: _textStyle,
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${widget.ingredientsByIdModel.ingredients![index].amount!.metric!.value} ${widget.ingredientsByIdModel.ingredients![index].amount!.metric!.unit!}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  instructionsProvider.GetInstructions("324694");

                },
                icon: Icon(Icons.add)),
            Consumer(
              builder: (context, InstructionsProvider value, child) {
                
                if (instructionsProvider.isLoaded==true) {
                  
                  return SizedBox(
                    
                    height: instructionsProvider.data.steps!.length * 10.h,
                    width: 100.w,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: instructionsProvider.data.steps!.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Icon(Icons.arrow_circle_right),
                            SizedBox(
                              width: 70.w,
                              child: Text(instructionsProvider.data.steps![index].step!)),
                          ],
                        );
                      },
                    ),
                  );
                }
                else{
                  return Container(
                    height: 10.h,width: 10.h,color: Colors.amber,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

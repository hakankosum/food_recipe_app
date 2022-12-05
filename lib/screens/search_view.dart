import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:food_app/provider/search_recipes_provider.dart';
import 'package:food_app/screens/recipe_view.dart';
import 'package:food_app/services/search_recipes_service.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  SearchRecipesProvider? searchRecipesProvider;

  TextEditingController textFieldController = TextEditingController();

  bool isSearchButtonClicked = false;
  @override
  void initState() {
    searchRecipesProvider =
        Provider.of<SearchRecipesProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: 100.w,
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            SizedBox(
              width: 50.w,
              child: const Text(
                "Find best recipes for cooking",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 2.h),
            TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: InkWell(
                      onTap: () {
                        isSearchButtonClicked = true;
                        searchRecipesProvider?.GetSearchRecipes(
                            textFieldController.text);
                      },
                      child: Icon(Icons.search))),
            ),
            SizedBox(height: 2.h),
            Consumer(builder: (BuildContext context,
                SearchRecipesProvider value, Widget? child) {
              if (value.loaded != false) {
                if (value.data.errorMessage != null) {
                  return Text(value.data.errorMessage!);
                } else {
                  if (value.data.totalResults == 0) {
                    return const Text("Not found!");
                  } else {
                    return Container(
                      height: 70.h,
                      margin: EdgeInsets.only(bottom: 2.h),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: value.data.results!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecipeView(
                                      imageUrl:
                                          value.data.results![index].image!,
                                      nutritionByIdModel: searchRecipesProvider!
                                          .nutritionData[index],
                                      ingredientsByIdModel:
                                          searchRecipesProvider!
                                              .ingredientData[index],
                                    ),
                                  ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 2.h),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 10.h,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                    child:value.data.results![index].image ==null? Image.network("https://upload.wikimedia.org/wikipedia/commons/5/59/Empty.png?20091205084734"):CachedNetworkImage(
                                      imageUrl:
                                          value.data.results![index].image!,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            
                                              image: imageProvider,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  SizedBox(
                                    width: 30.w,
                                    child: Text(
                                      value.data.results![index].title!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${value.nutritionData[index].calories}cal",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                          " Fat: ${value.nutritionData[index].fat}"),
                                      Text(
                                          " Carb: ${value.nutritionData[index].fat}"),
                                      Text(
                                          " Protein: ${value.nutritionData[index].fat}")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              } else {
                return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}

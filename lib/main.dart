import 'package:flutter/material.dart';
import 'package:food_app/provider/instructions_provider.dart';

import 'package:food_app/provider/search_recipes_provider.dart';
import 'package:food_app/screens/search_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => SearchRecipesProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => InstructionsProvider(),
        ),

      ], child: const MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MaterialApp(
          
          home: Scaffold(resizeToAvoidBottomInset: false, body: SearchView()),
        );
      },
    );
    
  }
}

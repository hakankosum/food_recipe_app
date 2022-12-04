import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IngredientColumn extends StatefulWidget {
  final double widgetWidth;
  final Color color;
  const IngredientColumn({super.key, required this.widgetWidth, required this.color});

  @override
  State<IngredientColumn> createState() => _IngredientColumnState();
}

class _IngredientColumnState extends State<IngredientColumn> {
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => setState(() {
          isPageLoaded=true;          
        }));
    super.initState();
  }
  bool isPageLoaded =false;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: widget.color,
      
      duration: const Duration(milliseconds: 1200),
      height:3.w,
      width: isPageLoaded ? widget.widgetWidth:0 ,
    );
  }
}

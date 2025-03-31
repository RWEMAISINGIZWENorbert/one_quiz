 
 import 'package:flutter/material.dart';

class CategoryModel {
   final String name;
   final String detail;
   final Color color1;
   final Color color2;
   final String ill;

   CategoryModel({
      required this.name,
      required this.detail,
      required this.color1,
      required this.color2,
      required this.ill,
   });
   
   static List<CategoryModel> initCategoryModel(){
    List<CategoryModel> categories = [];
      categories.add(
        CategoryModel(
          name: 'Easy', 
          detail: '210+',
          color1: Colors.green,
          color2: const Color.fromARGB(255, 177, 238, 179),
          ill: '🌟'
          )
        );
      categories.add(
        CategoryModel(
          name: 'Medium', 
          detail: '210+',
          color1: Colors.amber,
          color2: const Color.fromARGB(255, 247, 224, 156),
          ill: '🔥'
          )
        );
      categories.add(
        CategoryModel(
          name: 'Difficult', 
          detail: '210+',
          color1: Colors.red,
          color2: const Color.fromARGB(255, 241, 182, 177),
          ill: '⚡'
          )
        );

    return categories;    
   }
 }
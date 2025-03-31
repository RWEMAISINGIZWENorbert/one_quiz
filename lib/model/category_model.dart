 
 import 'package:flutter/material.dart';

class CategoryModel {
   final String name;
   final String detail;
   final Color color;
   final String ill;

   CategoryModel({
      required this.name,
      required this.detail,
      required this.color,
      required this.ill,
   });
   
   static List<CategoryModel> initCategoryModel(){
    List<CategoryModel> categories = [];
      categories.add(
        CategoryModel(
          name: 'Easy', 
          detail: '210+',
          color: Colors.green,
          ill: '🌟'
          )
        );
      categories.add(
        CategoryModel(
          name: 'Medium', 
          detail: '210+',
          color: Colors.amber,
          ill: '🔥'
          )
        );
      categories.add(
        CategoryModel(
          name: 'Difficult', 
          detail: '210+',
          color: Colors.green,
          ill: '⚡'
          )
        );

    return categories;    
   }
 }


import 'package:flutter/material.dart';
import 'package:one_quiz/model/category_model.dart';

class QuizCategory extends StatelessWidget {
  const QuizCategory({super.key});

  @override
  Widget build(BuildContext context) {
    
     List<CategoryModel> categories = CategoryModel.initCategoryModel();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, index){
                return Container();
            }
            ),
        ),
      ),
    );
  }
}
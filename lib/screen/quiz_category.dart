

import 'package:flutter/material.dart';
import 'package:one_quiz/model/category_model.dart';

class QuizCategory extends StatelessWidget {
  const QuizCategory({super.key});

  @override
  Widget build(BuildContext context) {
    
     List<CategoryModel> categories = CategoryModel.initCategoryModel();
     double screenHeight = MediaQuery.of(context).size.height;
     double screenWidth =  MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose category'),
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: screenWidth,
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, index){
                return Container(
                  width: screenWidth <= 450 ? screenWidth : screenWidth / 1.5,
                  child:Card(
                      color: Theme.of(context).cardColor,
                      child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Text(categories[index].ill, 
                                    style: Theme.of(context).textTheme.labelMedium
                                           !.copyWith(fontSize: 18)
                                      ),
                                    ),
                                    
                              Column(
                                children: [
                                 const SizedBox(height: 18,),
                                 Text(
                                  categories[index].name,
                                  style: Theme.of(context).textTheme.displaySmall,
                                ),
                                const SizedBox(height: 8,),
                                Text(
                                 "X 2.2",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ), 
                                const SizedBox(height: 22, width: 10,),
                               ],
                               )
                                  ],
                                 ),
                               ),
                );
            }
            ),
        ),
      ),
    );
  }
}
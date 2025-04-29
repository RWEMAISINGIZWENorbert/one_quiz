
import 'package:uuid/uuid.dart';

class QuizOptionsModel {
  String id;
  String name;
  int questions;

  QuizOptionsModel({
    required this.id,
    required this.name,
    required this.questions
  });
 
  static List<QuizOptionsModel> initQuizOptions() {
    var uuid = Uuid(); // Create an instance of Uuid
    List<QuizOptionsModel> data = [];

    data.add(
       QuizOptionsModel(
        id: uuid.v4(),
        name: 'Math Quiz',
        questions: 10,
      ));
    data.add(
            QuizOptionsModel(
        id: uuid.v4(),
        name: 'Science Quiz',
        questions: 15,
      )
    );
    data.add(
         QuizOptionsModel(
        id: uuid.v4(),
        name: 'History Quiz',
        questions: 12,
      )
    );
     data.add(
      QuizOptionsModel(
        id: uuid.v4(),
        name: 'Geography Quiz',
        questions: 8,
      )
     );
     data.add(
      QuizOptionsModel(
        id: uuid.v4(),
        name: 'Programming Quiz',
      
        questions: 20,
      ));
      data.add(
              QuizOptionsModel(
        id: uuid.v4(),
        name: 'General Knowledge Quiz',
        questions: 25,
      )
      );

    return data;
  }

}
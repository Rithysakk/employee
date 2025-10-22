class Quiz {

//This list stores all the answers the user gives during the quiz.
//The underscore (_) means it’s private to the class (only accessible inside Quiz)
  final List<Answer> _answers = []; 

//Adds an Answer object to the _answers list.
  void addAnswer(Answer answer) {
    _answers.add(answer);
  }

//Calculates the total number of correct answers.
//It loops through all Answer objects and counts how many have isGoodAnswer == true.
  int getScore() {
    int score = 0;
    for (var answer in _answers) {
      if (answer.isGoodAnswer) {
        score++;
      }
    }
    return score;
  }
}
//The Quiz class keeps track of answers and can calculate how many are correct.

//class question
//title → The question text (e.g., “What is 2 + 2?”)
//channels → The list of possible answers (e.g., [“2”, “3”, “4”, “5”])
//goodChoice → The correct answer (e.g., "4")

//isGoodAnswer(String answerChoice) 
//Compares the given answer with the correct one.
//Returns true if it matches, otherwise false.

//✅ In short:
//The Question class stores a question, its choices, and knows which one is correct.

class Question {
  String title;
  List<String> channels;
  String goodChoice;

  Question({
    required this.title,
    required this.channels,
    required this.goodChoice,
  });

  bool isGoodAnswer(String answerChoice) {
    return answerChoice == goodChoice;
  }
}


//answerChoice → The choice the user selected.

//isGoodAnswer → Whether that choice was correct (true or false).

//In short:
//The Answer class represents what the user answered and whether it was right.

class Answer {
  String answerChoice;
  bool isGoodAnswer;

  Answer({
    required this.answerChoice,
    required this.isGoodAnswer,
  });
}

import 'package:flutter/material.dart';
import 'package:quiz_app/constant.dart';
import '../widgets/next_button.dart';
import '../model/question.dart';
import '../widgets/question_widget.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Question> _question = [
    Question(id: '10', title: 'What is 2 + 2', option: {
      "5": false,
      "6": false,
      "4": true,
      "3": false,
    }),
    Question(id: '11', title: 'What is 10 + 10', option: {
      "5": false,
      "6": false,
      "20": true,
      "3": false,
    }),
  ];

  int index = 0;

  void nextQuestion(){
    if (index==_question.length -1){
      return;
    } else {
      setState(() {
        index++;

      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text("Quiz App"),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),

        child: Column(
          children: [
            Questionwidget(indexAction: index,
            question: _question[index].title,
            totalQuestions: _question.length,),
            const Divider(color: neutral,)
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(nextQuestion:
        nextQuestion,),
      ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/models/quiz/answer_option.dart';
import 'package:flutter_quiz/user_interface/widgets/answer_widget.dart';
import 'package:flutter_quiz/user_interface/widgets/see_more_widget.dart';
import 'package:flutter_quiz/blocs/quiz/quiz_bloc.dart';
import 'package:flutter_quiz/blocs/quiz/quiz_event.dart';

class AnswersWidget extends StatefulWidget {
  const AnswersWidget({Key key, this.answers, this.selectedAnswerId});

  final List<AnswerOption> answers;
  final String selectedAnswerId;

  @override
  _AnswersWidgetState createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends State<AnswersWidget> {
  int seeMoreId = -1;
  void setSeeMoreId(int index) {
    setState(() {
      if (seeMoreId == index) {
        resetSeeMoreId();
      } else {
        seeMoreId = index;
      }
    });
  }

  void resetSeeMoreId() {
    seeMoreId = -1;
  }

  @override
  void didUpdateWidget(AnswersWidget oldWidget) {
    resetSeeMoreId();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.answers.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: AnswerWidget(
                      title: widget.answers[index].answer,
                      isSelected:
                          widget.selectedAnswerId == widget.answers[index].id,
                      function: () => {
                        BlocProvider.of<QuizBloc>(context)
                            .add(QuizAnswerEvent(widget.answers[index].id))
                      },
                    ),
                  ),
                  SeeMoreButton(
                      title: index == seeMoreId ? "Hide" : "Show",
                      size: 10,
                      onPress: () => this.setSeeMoreId(index)),
                ],
              ),
              index == seeMoreId
                  ? AnswerDetailWidget(
                      key: Key(widget.answers[index].id),
                      description: widget.answers[index].description)
                  : Container(),
            ],
          );
        });
  }
}

class AnswerDetailWidget extends StatelessWidget {
  final String description;

  const AnswerDetailWidget({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description),
        ),
        decoration: BoxDecoration(
            // color: Colors.black26,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.black26)));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/blocs/quiz/quiz_event.dart';
import 'package:flutter_quiz/user_interface/quiz_review/quiz_review_screen.dart';
import 'package:flutter_quiz/user_interface/widgets/custom_snakbar.dart';
import 'package:flutter_quiz/user_interface/widgets/rounded_bordered_button.dart';
import 'package:flutter_quiz/utilities/base_screen.dart';
import 'package:flutter_quiz/blocs/quiz/quiz_bloc.dart';
import 'package:flutter_quiz/blocs/quiz/quiz_state.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'answers_widget.dart';

class QuizScreen extends BaseStatelessWidget {
  static const String routeName = "/quiz_screen";

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<QuizBloc>(context).add(QuizInitEvent());
    return Scaffold(
      body: BlocConsumer<QuizBloc, QuizState>(builder: (context, state) {
        if (state is QuizLoadedState) {
          return _getBody(context, state);
        }
        if (state is QuizLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Text(state.toString()),
        );
      }, listener: (context, state) {
        if (state is QuizErrorState) {
          CustomSnackbar.showFailed(context, state.message);
        }
        if (state is QuizCompletedState) {
          Navigator.of(context).pushNamed(QuizReviewScreen.routeName,
              arguments:
                  QuizReviewScreenArguments(state.totalScore, state.questions));
        }
      }),
    );
  }

  Widget _getBody(BuildContext context, QuizLoadedState state) {
    var isLastQuestion = state.currentIndex == state.questions.length - 1;
    var progress = state.currentIndex / (state.questions.length - 1);

    var headerWidget = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        isLastQuestion
            ? 'Last One'
            : (progress == 0 ? 'Lets Start' : 'One More'),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );

    var questionWidget = Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Text(
        state.questions[state.currentIndex].question,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
      ),
    );

    var linearPercentIndicator = LinearPercentIndicator(
      lineHeight: 8.0,
      percent: progress,
      backgroundColor: Colors.grey.shade300,
      progressColor: Colors.amber,
    );

    var nextButton = RoundedBorderedButton(
      title: isLastQuestion ? "Done" : "Next",
      onPress: () => {
        isLastQuestion
            ? BlocProvider.of<QuizBloc>(context).add(QuizDoneEvent())
            : BlocProvider.of<QuizBloc>(context).add(QuizNextEvent()),
      },
      isSelected: true,
    );

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          headerWidget,
          linearPercentIndicator,
          questionWidget,
          AnswersWidget(
            answers: state.questions[state.currentIndex].answerOptions,
            selectedAnswerId:
                state.questions[state.currentIndex].selectedAnswerId,
          ),
          Spacer(),
          nextButton,
        ],
      ),
    );
  }
}

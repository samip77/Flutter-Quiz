import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/blocs/quiz/quiz_bloc.dart';
import 'package:flutter_quiz/repository/quiz/mock_quiz_repository.dart';
import 'package:flutter_quiz/user_interface/home_screen/home_screen.dart';
import 'package:flutter_quiz/utilities/router.dart' as route;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Flutter Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      onGenerateRoute: route.generateRoute,
    );

    // TODO: replace MockQuizRepository() with RemoteQuizRepository() if you need the quiz from API
    return BlocProvider<QuizBloc>(
      create: (context) => QuizBloc(repository: MockQuizRepository()),
      child: materialApp,
    );
  }
}

import '../models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource{

  Future<NumberTriviaModel> getCLastNumberTrivia();
  Future<void> getRandomNumberTrivia(NumberTriviaModel triviaToCache);
}
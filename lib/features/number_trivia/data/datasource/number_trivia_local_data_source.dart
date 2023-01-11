import '../models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource{

  Future<NumberTriviaModel> getCLastNumberTrivia();
  Future<void> getRandomNumberTrivia(NumberTriviaModel triviaToCache);
}
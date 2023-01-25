import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/core/platform/network_info.dart';
import 'package:number_trivia/features/number_trivia/data/datasource/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import '../datasource/number_trivia_remote_data_source.dart';

class NumberTriviaRepositoryIml implements NumberTriviaRepository{

 final NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;
 final NumberTriviaLocalDataSource numberTriviaLocalDataSource;
 final NetworkInfo networkInfo;


 NumberTriviaRepositoryIml(
      {
       required this.numberTriviaRemoteDataSource,
        required this.numberTriviaLocalDataSource,
        required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(int number)async {
    networkInfo.isConnected;
    return Right(await numberTriviaRemoteDataSource.getConcreteNumberTrivia(number)!);
  }

  @override
  Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}
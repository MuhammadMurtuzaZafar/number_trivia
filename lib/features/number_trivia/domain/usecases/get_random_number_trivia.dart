import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/error/failures.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia extends UseCase<NumberTrivia,NoParam>{

  final NumberTriviaRepository repository;


  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>?> call(NoParam params)async {
    return await repository.getRandomNumberTrivia();
  }

}

class NoParam extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
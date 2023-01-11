import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concerete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository
{

}
@GenerateMocks([MockNumberTriviaRepository])
void main(){
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  late  GetConcreteNumberTrivia? usecase;

  setUp((){
    mockNumberTriviaRepository=MockNumberTriviaRepository();
    usecase=GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  final tNumber=1;
  final tNumberTrivia=NumberTrivia(text: "test", number:  1);

  test('should get trivia from the number from the repository', () async{

    when(mockNumberTriviaRepository.getConcreteNumberTrivia(1)).thenAnswer((_) async{
      return Right(tNumberTrivia);
    });
    //
    // when(mockNumberTriviaRepository!.getConcreteNumberTrivia(1)).thenReturn(Future(() => tNumberTrivia));

    final result=await usecase!(Params(number: tNumber));

    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(1));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
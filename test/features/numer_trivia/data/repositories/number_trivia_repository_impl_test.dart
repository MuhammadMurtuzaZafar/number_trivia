import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/platform/network_info.dart';
import 'package:number_trivia/features/number_trivia/data/datasource/number_trivia_local_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/datasource/number_trivia_remote_data_source.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource{}
class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource{}
class MockNetworkInfo extends Mock implements NetworkInfo{}

@GenerateMocks([MockRemoteDataSource,MockLocalDataSource,MockNetworkInfo])
void main(){
  late NumberTriviaRepositoryIml numberTriviaRepository;
  late NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;
  late NumberTriviaLocalDataSource numberTriviaLocalDataSource;
  late MockNetworkInfo networkInfo;

  setUp(() {

    numberTriviaRemoteDataSource=MockRemoteDataSource();
    numberTriviaLocalDataSource=MockLocalDataSource();
    networkInfo=MockNetworkInfo();
    numberTriviaRepository=NumberTriviaRepositoryIml(
        numberTriviaRemoteDataSource: numberTriviaRemoteDataSource,
        numberTriviaLocalDataSource: numberTriviaLocalDataSource,
        networkInfo: networkInfo);
  });
  
  group("get concrete number trivia", () {

    final tNumber=1;
    final tNumberModel=NumberTriviaModel(text: "test trivia", number: tNumber);
    final tNumberTrivia=tNumberModel;
    group("device is Online", () {
      setUp(() {
        when(networkInfo.isConnected).thenAnswer((_) async=> true);
      });
      test("test remoedatta", () async{

        when(numberTriviaRemoteDataSource.getRandomNumberTrivia(tNumber)).thenAnswer((_)async => tNumberModel);

        final result=await numberTriviaRepository.getConcreteNumberTrivia(tNumber);

        verify(numberTriviaRemoteDataSource.getConcreteNumberTrivia(tNumber));

        expect(result, equals(Right(tNumberTrivia)));
      });

    });

    test("should check if the device is online", () {
      when(networkInfo.isConnected).thenAnswer((_) async=> Future.value(true));
      verify(networkInfo.isConnected);

    });
  });
}
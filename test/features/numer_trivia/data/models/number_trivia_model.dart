import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixture/fixture_reader.dart';
import '../repositories/number_trivia_model.dart';


void main(){

  final tnumberTriviaModel=NumberTriviaModel(text: "test", number:1);

  test('should be a subclass of number trivia', () async{
    expect(tnumberTriviaModel, isA<NumberTrivia>());
  });
  
  group('fromJson', () {
    
    test("should return a valid number when json number is int", () {
      final Map<String,dynamic> jsonMap=json.decode(fixture('trivia.json'));
      final result=NumberTriviaModel.fromJson(jsonMap);
      expect(result, equals(tnumberTriviaModel));
    });

    test("should return a valid number when json number is double", () {
      final Map<String,dynamic> jsonMap=json.decode(fixture('trivia_double.json'));
      final result=NumberTriviaModel.fromJson(jsonMap);
      expect(result, equals(tnumberTriviaModel));
    });
  });
  group('tojson', () {
    
    test("should return a json", () {

      final result=tnumberTriviaModel.toJson();
      Map<String,dynamic> expected={
        'number':1,
        'text':'test'
      };
      expect(result,expected);
    });
  });
}
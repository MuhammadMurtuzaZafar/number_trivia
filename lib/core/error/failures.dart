import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

  List properties=const<dynamic>[];
  Failure({required this.properties});

  @override
  List<Object?> get props => [properties];
}
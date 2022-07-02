import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

//  Some General Failures

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFaliure extends Failure {
  @override
  List<Object?> get props => [];
}

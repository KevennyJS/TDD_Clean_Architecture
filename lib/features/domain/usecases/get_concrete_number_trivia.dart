import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia{
  final NumberTriviaRepository _numberTriviaRepository;
  GetConcreteNumberTrivia(this._numberTriviaRepository);
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await _numberTriviaRepository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable{
  final int number;
  const Params({required this.number});
  @override
  List<Object> get props => [number];
}
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_architecture/features/domain/entities/number_trivia.dart';
import 'package:tdd_clean_architecture/features/domain/repositories/number_trivia_repository.dart';
import 'package:tdd_clean_architecture/features/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  // setUp((){
  //   mockNumberTriviaRepository = MockNumberTriviaRepository();
  //   usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  // });
  setUp(() => () {
        mockNumberTriviaRepository = MockNumberTriviaRepository();
        usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
        usecase.call(const Params(number: 1));
      });

  const tParams = Params(number: 1);
  const tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test('should get trivia for the number from the repository', () async {
    // arrange
    when(() => mockNumberTriviaRepository.getConcreteNumberTrivia(any())).thenAnswer((_) async => const Right(tNumberTrivia));
    // act
    final result = await usecase(tParams);
    // assert
    expect(result, const Right(tNumberTrivia));
    verify(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tParams.number));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}

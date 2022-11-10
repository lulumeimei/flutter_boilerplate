part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({required this.count});

  factory CounterState.initial() {
    return const CounterState(
      count: 0,
    );
  }

  CounterState copyWith({
    required int count,
  }) {
    return CounterState(
      count: count,
    );
  }

  final int count;

  @override
  List<Object> get props => [count];
}

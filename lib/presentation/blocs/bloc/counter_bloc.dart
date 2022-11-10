import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      : super(
          CounterState.initial(),
        ) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
  }

  void _onIncrement(
    Increment event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        count: state.count + 1,
      ),
    );
  }

  void _onDecrement(
    Decrement event,
    Emitter emit,
  ) {
    emit(
      state.copyWith(
        count: state.count - 1,
      ),
    );
  }
}

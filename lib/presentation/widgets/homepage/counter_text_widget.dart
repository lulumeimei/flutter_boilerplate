import 'package:boilerplate/presentation/blocs/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterTextWidget extends StatelessWidget {
  const CounterTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Text(
          state.count.toString(),
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}

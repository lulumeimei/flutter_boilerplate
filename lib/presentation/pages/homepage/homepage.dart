import 'package:assessment/config/app_environments/app_env.dart';
import 'package:assessment/presentation/blocs/bloc/counter_bloc.dart';
import 'package:assessment/presentation/widgets/homepage/counter_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppEnv().getApiBaseURL(),
            ),
            const SizedBox(height: 10),
            const CounterTextWidget(),
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          final counterBloc = context.read<CounterBloc>();
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: 'increment_fab',
                onPressed: () {
                  counterBloc.add(Increment());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: 'decrement_fab',
                onPressed: () {
                  counterBloc.add(Decrement());
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              )
            ],
          );
        },
      ),
    );
  }
}

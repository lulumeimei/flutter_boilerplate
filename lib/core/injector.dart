import 'package:boilerplate/presentation/blocs/bloc/counter_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // TODO: inject dependencies here
  injector.registerLazySingleton<CounterBloc>(
    CounterBloc.new,
  );
  return;
}

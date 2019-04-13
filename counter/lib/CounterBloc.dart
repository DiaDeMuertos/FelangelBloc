import 'package:bloc/bloc.dart';
import 'package:counter/CounterEvent.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  void onIncrement() {
    dispatch(CounterEvent.increment);
  }

  void onDecrement() {
    dispatch(CounterEvent.decrement);
  }

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield currentState - 1 < 0 ? 0 : currentState - 1;
        break;
      case CounterEvent.increment:
        yield currentState + 1;
        break;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CounterCubit extends Cubit<String> {
  CounterCubit({this.initial = ""}) : super(initial);
  final String initial;

  void addCharacter(String char) {
    final newState = state + char;
    emit(newState);
  }

  void deleteCharacter() {
    final newState = state.substring(0, state.length - 1);
    emit(newState);
  }

  void clear() {
    const newState = "";
    emit(newState);
  }

  void calculate() {
    String newState;
    try {
      Parser p = Parser();
      Expression exp = p.parse(state);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // cek bilangan bulat atau tidak
      if (eval == eval.truncate()) {
        newState = eval.truncate().toString();
      } else {
        newState = eval.toString();
      }
      print("ini calcu $eval");
    } catch (e) {
      newState = "Error";
    }
    emit(newState);
  }

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }
}

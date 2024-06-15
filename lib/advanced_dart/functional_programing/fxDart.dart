import 'function/reduce.dart';

fxDart(List args) async {
  return await reduce((a, f) async {
    if (a is Future) {
      return f(await a);
    }
    return f(a);
  }, args);
}
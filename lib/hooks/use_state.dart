part of "hooks.dart";

_genSetState<T>(HookElement currentContext, int i) {
  return (T val) {
    currentContext.states[i] = val;
    currentContext.markNeedsBuild();
  };
}

StateType<T> useState<T>(T initState) {
  int i = context.index++;

  print("index${context.states.toString()}");
  print("state");
  if (context.states.length < context.index) {
    context.states.add(initState);
  }

  Function(T data) setState = _genSetState<T>(context, i);

  return StateType(context.states[i], setState);
}

class StateType<T> {
  T state;
  Function(T data) setState;
  StateType(this.state, this.setState);
}

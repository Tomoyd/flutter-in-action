part of "hooks.dart";

_genSetState<T>(_Hook _currentHook, HookElement currentContext) {
  return (T val) {
    _currentHook.memorizedData.state = val;
    currentContext.markNeedsBuild();
  };
}

StateType<T> useState<T>(T initState) {
  final currentHook = _createWorkInProgressHooks();

  if (currentHook.memorizedData == null) {
    currentHook.memorizedData =
        StateType<T>(initState, _genSetState<T>(currentHook, context));
  }

  if (currentHook.memorizedData is StateType) {
    return currentHook.memorizedData;
  }

  return null;
}

class StateType<T> {
  T state;
  Function(T data) setState;
  StateType(this.state, this.setState);
}

import 'package:flutter/material.dart';
import 'package:myapp/hooks/is_input_equal.dart';
part 'my_hook_element.dart';
part "my_hook_widget.dart";
part "use_state.dart";

part "use_effect.dart";

HookElement context;

class _Hook {
  dynamic memorizedData;
  _Hook next;
  _Hook();
}

class _EffectMemory {
  bool needUpdate;
  Function() callback;
  List deeps;
  VoidCallback destroy;
  _EffectMemory next;

  _EffectMemory(
      {this.needUpdate, this.next, this.callback, this.destroy, this.deeps});
}

_Hook _workInProgressHook;

_Hook _createWorkInProgressHooks() {
  final currentContext = context;

  if (_workInProgressHook == null) {
    _workInProgressHook = currentContext.hook;
  } else {
    if (_workInProgressHook.next == null) {
      _workInProgressHook = _workInProgressHook.next = _Hook();
    } else {
      _workInProgressHook = _workInProgressHook.next;
    }
  }

  return _workInProgressHook;
}

dispose() {
  context = null;
}

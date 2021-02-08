part of "hooks.dart";

_EffectMemory _pushEffectMemory(needUpdate, create, deeps, destroy) {
  _EffectMemory effect = _EffectMemory(
      needUpdate: needUpdate, callback: create, deeps: deeps, destroy: destroy);
  if (context.effectHeader == null) {
    context.effectHeader = effect.next = effect;
  } else {
    var currentEffect = context.effectHeader.next;
    context.effectHeader.next = effect;
    effect.next = currentEffect.next;
    context.effectHeader = effect;
  }
  return effect;
}

useEffect(VoidCallback create, [List deeps]) {
  final currentHook = _createWorkInProgressHooks();

  _EffectMemory preData = currentHook.memorizedData;

  if (isInputEqual(preData?.deeps, deeps)) {
    _pushEffectMemory(false, create, deeps, preData?.destroy);
  } else {
    currentHook.memorizedData =
        _pushEffectMemory(true, create, deeps, preData?.destroy);
  }
}

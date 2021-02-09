part of 'hooks.dart';

class HookElement extends StatelessElement {
  HookElement(StatelessWidget widget) : super(widget);

  _Hook hook = _Hook();
  _EffectMemory effectHeader;

  void resetIndexContext() {
    _workInProgressHook = null;
    context = this;
  }

  @override
  Widget build() {
    // TODO: implement build

    resetIndexContext();
    WidgetsBinding.instance.addPostFrameCallback(effect);
    return super.build();
  }

  void effect(Duration duration) {
    if (effectHeader == null) {
      return;
    }
    var firstEffect = effectHeader.next;
    do {
      effectHeader = effectHeader.next;
      if (effectHeader.needUpdate) {
        var destroy = effectHeader.callback();

        if (destroy != null && destroy is Function) {
          print("destroy$destroy${destroy is Function}");
          effectHeader.destroy = destroy;
        }
      }
    } while (effectHeader?.next != firstEffect);
  }

  @override
  void rebuild() {
    super.rebuild();
  }

  doCleanUp() {
    if (effectHeader == null) {
      return;
    }
    var firstEffect = effectHeader.next;
    do {
      effectHeader = effectHeader.next;
      var destroy = effectHeader.destroy;
      if (destroy != null && destroy is Function) {
        destroy();
      }
    } while (effectHeader?.next != firstEffect);
  }

  @override
  void unmount() {
    print("unmount");
    doCleanUp();
    dispose();
    // TODO: implement unmount
    super.unmount();
  }
}

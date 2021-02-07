part of 'hooks.dart';

class HookElement extends StatelessElement {
  HookElement(StatelessWidget widget) : super(widget);

  _Hook hook = _Hook();
  int index = 0;
  _EffectMemory effectHeader;
  List states = [];
  void resetIndexContext() {
    index = 0;
    context = this;
    print("context.hook${context.hook}");
  }

  @override
  Widget build() {
    // TODO: implement build
    print("111111111111111111hook${hook}");
    resetIndexContext();
    WidgetsBinding.instance.addPostFrameCallback(effect);
    return super.build();
  }

  void effect(Duration duration) {
    if (effectHeader == null) {
      return;
    } else {
      var firstEffect = effectHeader.next;
      do {
        if (effectHeader.needUpdate) {
          var destroy = effectHeader.callback();
          if (destroy == null) {
            effectHeader.destroy = destroy;
          }
          effectHeader = effectHeader.next;
        }
      } while (effectHeader?.next != firstEffect);
    }
  }

  @override
  void rebuild() {
    super.rebuild();
  }

  @override
  void unmount() {
    dispose();
    // TODO: implement unmount
    super.unmount();
  }
}
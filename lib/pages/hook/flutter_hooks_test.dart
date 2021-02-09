// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:myapp/pages/hook/test_hooks2.dart';
// import 'package:myapp/widgets/common_scaffold.dart';

// class HookTextView extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final counter = useState<int>(1);

//     return CommonScaffold(
//         title: "text hooks",
//         body: Column(
//           children: [
//             FlatButton(
//                 onPressed: () {
//                   counter.value = counter.value + 1;
//                 },
//                 child: Text("${counter.value}")),
//             TestHook2()
//           ],
//         ));
//   }
// }

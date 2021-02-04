part of "test.dart";

Test _$TestFromJson(Map<String, dynamic> json) {
  return Test()
    ..email = json["email"] as String
    ..name = json["name"] as String;
}

Map<String, dynamic> _$TestToJson(Test test) =>
    {"name": test.name, "email": test.email};

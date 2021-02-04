part 'test.g.dart';

class Test {
  String name = "";
  String email = "name";

  Test();

  // Test.fromJson(Map<String, dynamic> json)
  //     : name = json["name"],
  //       email = json["email"];

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  Map<String, dynamic> toJson() => _$TestToJson(this);
}

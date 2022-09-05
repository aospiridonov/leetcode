import 'package:serializers/serializers.dart';
import 'dart:io';
import 'dart:convert';

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    for (int i = 0; i < nums.length; i++) {
      for (int j = i + 1; j < nums.length; j++) {
        if (nums[i] + nums[j] == target) {
          return [i, j];
        }
      }
    }
    return [];
  }
}

class LRUCache {
  LRUCache(int capacity) {}

  int get(int key) {
    return 0;
  }

  void put(int key, int value) {}
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = LRUCache(capacity);
 * int param1 = obj.get(key);
 * obj.put(key,value);
 */

// void main() async {
//     const SEPARATOR = "\u001b\u0009\u001d";
//
//     var userOut = File("user.out");
//
//     while (true) {
//         var line = stdin.readLineSync();
//         if (line == null) {
//             break;
//         }
//
//
//         var param1 = deserializeToList<int>(line, "integer[]");
//
//         line = stdin.readLineSync()!;
//         var param2 = deserialize__(line, "integer");
//
//
//         Object? ret = Solution().twoSum(param1, param2);
//
//         userOut.writeAsStringSync('${serialize__(ret, "integer[]")}\n', mode: FileMode.writeOnlyAppend, flush: true);
//         stdout.write(SEPARATOR);
//
//         List<TreeNode?> r3 = deserializeToList<TreeNode?>("[[]]", "TreeNode[]");
//         print(r3.runtimeType);
//     }
// }
String __helperSelectMethod__(String method, List paramsCur, LRUCache obj) {
  switch (method) {
    case "get":
      return serialize__(
          obj.get(deserialize__(jsonEncode(paramsCur[0]), "integer")),
          "integer");
    case "put":
      obj.put(deserialize__(jsonEncode(paramsCur[0]), "integer"),
          deserialize__(jsonEncode(paramsCur[1]), "integer"));
      return "null";
    default:
      throw ArgumentError("input method does not exist.");
  }
}

LRUCache __helperConstructor__(String method, List paramsCur) {
  if (method != "LRUCache") {
    throw ArgumentError("The first input method name is not Constructor name.");
  }
  return LRUCache(deserialize__(jsonEncode(paramsCur[0]), "integer"));
}

List<String> __callHelper__(List<String> methods, List params) {
  LRUCache obj = __helperConstructor__(methods[0], params[0]);
  List<String> ret = ["null"];
  for (int i = 1; i < methods.length; i++) {
    String method = methods[i];
    List paramsCur = params[0];
    ret.add(__helperSelectMethod__(method, paramsCur, obj));
  }

  return ret;
}

void main() async {
  const SEPARATOR = "\u001b\u0009\u001d";

  var userOut = File("user.out");

  var lineMethods = '["LRUCache", "get"]';
  var lineParams = '[[1], [0]]';
  List<String> methods = deserializeToList<String>(lineMethods, "String[]");
  List params = jsonDecode(lineParams);
  if (params.length != methods.length || params.isEmpty) {
    throw ArgumentError(
        "Input methods size does not equal to params size or equals to 0.");
  }
  List<String> ret = __callHelper__(methods, params);
  userOut.writeAsStringSync("[${ret.join(",")}]\n",
      mode: FileMode.writeOnlyAppend, flush: true);
  stdout.write(SEPARATOR);
}

import 'dart:convert';
import 'listnode.dart';
import 'treenode.dart';
import 'nested_integer.dart';

const _specialTypes = ["double", "ListNode", "TreeNode", "NestedInteger"];

String serializeSpecial(Object? obj, String type) {
  if (type.startsWith('list<')) {
    var subType = type.substring(5, type.length - 1);
    var list = obj as List<Object?>;
    return "[${list.map((e) => serializeSpecial(e, subType)).join(',')}]";
  } else if (type.endsWith('[]')) {
    var subType = type.substring(0, type.length - 2);
    var list = obj as List<Object?>;
    return "[${list.map((e) => serializeSpecial(e, subType)).join(',')}]";
  } else {
    switch (type) {
      case "double":
        return (obj as num).toStringAsFixed(5);
      case "ListNode":
        return jsonEncode(listNodeToList(obj as ListNode?));
      case "TreeNode":
        return jsonEncode(treeNodeToList(obj as TreeNode?));
      case "NestedInteger":
        return serializeNestedInteger(obj as NestedInteger);
      default:
        throw Exception("Invalid type $type");
    }
  }
}

String serialize__(Object? obj, String type) {
  if (_specialTypes.any((t) => type.contains(t))) {
    return serializeSpecial(obj, type);
  }
  return jsonEncode(obj);
}
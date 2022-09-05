import 'dart:convert';
import 'listnode.dart';
import 'treenode.dart';
import 'nested_integer.dart';

const _specialTypes = ["ListNode", "TreeNode", "NestedInteger"];

Object? deserializeSpecial(Object? obj, String type) {
  switch (type) {
    case "ListNode":
      return listToListNode(obj as List);
    case "TreeNode":
      return listToTreeNode(obj as List);
    case "NestedInteger":
      return objToNestedInteger(obj!);
    default:
      throw Exception("Invalid type $type");
  }
}

dynamic deserialize__(String str, String type) {
  var obj = jsonDecode(str);
  if (_specialTypes.any((t) => type.contains(t))) {
    return deserializeSpecial(obj, type);
  }
  return obj;
}

List<T> deserializeToList<T>(String str, String type) {
  var obj = jsonDecode(str);
  if (_specialTypes.any((t) => type.contains(t))) {
    String subType;
    if (type.startsWith('list<')) {
      subType = type.substring(5, type.length - 1);
    } else {
      assert(type.endsWith('[]'));
      subType = type.substring(0, type.length - 2);
    }
    switch (subType) {
      case "ListNode":
        return [for (final sl in obj) listToListNode(sl as List) as T];
      case "TreeNode":
        return [for (final sl in obj) listToTreeNode(sl as List) as T];
      case "NestedInteger":
        return [for (final sl in obj) objToNestedInteger(sl!) as T];
      default:
        throw Exception("Invalid type $type");
    }
  }
  return List<T>.from(obj);
}

List<List<T>> deserializeTo2dList<T>(String str, String _) {
  var obj = jsonDecode(str);
  return [for (final sl in obj) List<T>.from(sl)];
}

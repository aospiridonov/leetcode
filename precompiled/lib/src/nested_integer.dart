class NestedInteger {
  int? _integer;
  final List<NestedInteger> _list = [];

  NestedInteger([int? this._integer]);

  bool isInteger() {
    return _integer != null;
  }

  int getInteger() {
    return _integer ?? 0;
  }

  void setInteger(int i) {
    _integer = i;
  }

  List<NestedInteger> getList() {
    return _list;
  }

  void add(NestedInteger ni) {
    _list.add(ni);
    _integer = null;
  }
}

NestedInteger objToNestedInteger(Object obj) {
  NestedInteger root = NestedInteger();
  if (obj is int) {
    root.setInteger(obj);
  } else {
    assert(obj is List);
    for (final ele in obj as List) {
      root.add(objToNestedInteger(ele));
    }
  }
  return root;
}

String serializeNestedInteger(NestedInteger ni) {
  if (ni.isInteger()) {
    return ni.getInteger().toString();
  }
  return serializeNestedIntegerList(ni.getList());
}

String serializeNestedIntegerList(List<NestedInteger> ni) {
  return "[${ni.map((e) => serializeNestedInteger(e)).join(',')}]";
}
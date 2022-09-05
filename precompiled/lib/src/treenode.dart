class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode([this.val = 0, this.left, this.right]);
}

List<int?> treeNodeToList(TreeNode? node) {
  var root = node;
  var q = [root];
  for (var head = 0; head < q.length; head++) {
    var cur = q[head];
    if (cur != null) {
      q.add(cur.left);
      q.add(cur.right);
    }
  }
  while (q.isNotEmpty && q.last == null) {
    q.removeLast();
  }
  return [for (final v in q) v?.val];
}

TreeNode? listToTreeNode(List list) {
  if (list.isEmpty) {
    return null;
  }
  var root = TreeNode(list[0]!);
  List<TreeNode> q = [root];
  for (var i = 1; i < list.length; i++) {
    if (list[i] == null) {
      continue;
    }
    var node = TreeNode(list[i]);
    var parent = q[(i - 1) ~/ 2];
    q.add(node);
    if (i % 2 == 0) {
      parent.right = node;
    } else {
      parent.left = node;
    }
  }
  return root;
}
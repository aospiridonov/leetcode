class ListNode {
  int val;
  ListNode? next;

  ListNode([this.val = 0, this.next]);
}

List<int> listNodeToList(ListNode? node) {
  if (node == null) {
    return [];
  }
  List<int> ret = [];
  ListNode? head = node;
  do {
    ret.add(head!.val);
    head = head.next;
  } while (head != null);
  return ret;
}

ListNode? listToListNode(List list) {
  var dummy = ListNode();
  ListNode? cur = dummy;
  for (final i in list) {
    cur!.next = ListNode(i);
    cur = cur.next;
  }
  return dummy.next;
}
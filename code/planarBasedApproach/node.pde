class Node {
  int row ;
  int column ;
  Node(int r, int c) {
    row = r ;
    column = c ;
  }
  String toString() {
    return "(" + column + ", " + row + ")" ;
  }
}

class NodeSet extends ArrayList<Node> {
  NodeSet() {
  }
  String toString() {
    String[] stg = new String[size()] ;
    for (int i = 0 ; i < size() ; i++) {
      stg[i] = get(i).toString() ;
    }
    return "{" + join(stg, ", ") + "}" ;
  }
}

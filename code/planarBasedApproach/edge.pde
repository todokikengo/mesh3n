class Edge extends NodeSet {
  Edge(Node u, Node v) {
    add(u) ;
    add(v) ;
  }
  String toString() {
    return super.toString() + "\n" ;
  }
}

class EdgeSet extends ArrayList<Edge> {
  EdgeSet() {
  }
  String toString() {
    String[] stg = new String[size()] ;
    for (int i = 0 ; i < size() ; i++) {
      stg[i] = get(i).toString() ;
    }
    return "{" + join(stg, ", ") + "}" ;
  }
}

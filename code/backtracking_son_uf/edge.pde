class Edge extends ArrayList<Node>{
  boolean valid
  float p = 0.1 ;
  Edge(Node u, Node v){
    add(u);
    add(v);
    valid = false ;
  }
  void setEdge() {
    for (Node u : this) {
      u.edges.add(this) ;
    }
  }
  boolean deletable() {
    return (get(0).deletable() && get(1).deletable()) ;
  }
  void setFalse() {
    valid = false ;
    get(0).deletedNum++ ;
    get(1).deletedNum++ ;
  }
  void setTrue() {
    valid = true ;
    get(0).deletedNum-- ;
    get(1).deletedNum-- ;
  }
}


class EdgeSet  extends ArrayList<Edge>{
  EdgeSet(){
  }
  EdgeSet(int l, int s, NodeSet ns) {
    for(int i = 1 ; i < l * s ; i++) {
      if(i % s > 0)
      add(new Edge(ns.get(i - 1), ns.get(i)));
    }
    for(int i = 0 ; i < s * (l - 1) ; i++) {
      add(new Edge(ns.get(i), ns.get(i + s)));
    }
  }
  void setEdge() {
    for (Edge e : this) {
      e.setEdge() ;
    }
  }
  EdgeSet getValidEdgeSet() {
    EdgeSet subsetEs = new EdgeSet();
    for(Edge e : this) {
      if (e.valid) subsetEs.add(e);
    }
    return subsetEs ;
  }
}

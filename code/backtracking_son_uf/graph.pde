class Graph{
  NodeSet ns ;
  EdgeSet es ;
  Graph(int r, int c) {
    ns = new NodeSet(r,c) ;
    es = new EdgeSet(r,c,ns) ;
  }
  Graph(NodeSet a, EdgeSet b){
    ns = a;
    es = b;
  }
  void setEdge() {
    ns.setEdge() ;
    es.setEdge() ;
  }
  EdgeSet getValidEdgeSet() {
    return es.getValidEdgeSet() ;
  }
  boolean isConnected(){
    ns.reset() ;
    Node s = ns.get(0);
    s.reached = true ;
    NodeSet stack = new NodeSet() ;
    stack.add(s) ;
    while (! stack.isEmpty()) {
      Node u = stack.remove(stack.size() - 1) ;
      for (Edge e : u.edges) {
        if (! e.valid) continue ;
        Node v = (e.get(0) == u) ? e.get(1) : e.get(0) ;
        if (! v.reached) {
          v.reached = true ;
          stack.add(v) ;
        }
      }
    }
    return ns.reached() ;
  }

  void show(){
    println("NodeSet");
    for(Node u : ns)
    print(u.index+",");
    println();
    println("EdgeSet");
    for(Edge e : es){
      println("{" + e.get(0).index + "," + e.get(1).index + "} ");
    }
  }
}

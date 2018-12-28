class Graph{
  NodeSet ns ;
  EdgeSet es ;
  float reliability;
  Graph(NodeSet a, EdgeSet b){
    ns = a;
    es = b;
    reliability = 0.0;
  }

  boolean isConnected(){
    boolean check[] = new boolean[ns.size()];
    for(Edge e : es){
    if(!check[e.get(0).index]) check[e.get(0).index] = true;
    if(!check[e.get(1).index]) check[e.get(1).index] = true;
  }
   for(int i = 0 ; i < check.length ; i++)
   if(!check[i])
   return false;

    NodeSet undiscoveredNs = new NodeSet();
    NodeSet discoveredNs = new NodeSet();
    NodeSet processedNs = new NodeSet();
    Node s = ns.get(0);
    for (Node u :ns)
    undiscoveredNs.add(u);

    Node u = undiscoveredNs.remove(0);
    discoveredNs.add(u);
    while (discoveredNs.size() != 0) {
      Node v = discoveredNs.remove(0) ;
      for(Edge e : es){
        if(e.get(0) == v){
          Node u1 = e.get(1) ;
          if(undiscoveredNs.contains(u1)){
            discoveredNs.add(u1) ;
            undiscoveredNs.remove(u1) ;
          }
        }
        else if(e.get(1) == v){
          Node u2 = e.get(0) ;
          if(undiscoveredNs.contains(u2)){
           discoveredNs.add(u2) ;
           undiscoveredNs.remove(u2) ;
         }
        }
      }
      processedNs.add(v);
    }
    if(undiscoveredNs.size() == 0)
      return true;
    return false;

  }

  void getReliability(Graph g){
    reliability = pow(p,es.size()) * pow(1-p,g.es.size() - es.size());
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

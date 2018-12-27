class Edge extends ArrayList<Node>{
  Edge(Node u, Node v){
    add(u);
    add(v);
  }
  Edge(){
  }

}


class EdgeSet  extends ArrayList<Edge>{
  EdgeSet(int l, int s,NodeSet ns){
    for(int i = 0 ; i < l*s-1 ; i++)
    if(i%s!=s-1)
    add(new Edge(ns.get(i),ns.get(i+1)));
    for(int i = 0 ; i < s*(l-1) ; i++)
    add(new Edge(ns.get(i),ns.get(i+s)));
  }
  EdgeSet(){
  }
}

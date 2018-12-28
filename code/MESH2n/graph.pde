class Graph{
  NodeSet ns ;
  EdgeSet es ;
  float reliability;
  Graph(NodeSet a, EdgeSet b){
    ns = a;
    es = b;
    reliability = 0.0;
  }

  float getReliability(long counts[][],Graph g){
    for(int i = 0 ; i<counts.length ; i++)
    reliability += counts[counts.length-1][i]*pow(p,g.es.size() - i) * pow(1-p,i);
    return reliability;
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

float p=0.9;
void setup(){
  int l = 2; //縦
  int s = 2; //横
  NodeSet ns = new NodeSet(l,s);
  EdgeSet es = new EdgeSet(l,s,ns);
  Graph g = new Graph(ns,es);
  long[][]counts = new long[s][s];
  int start = millis() ;
  println("信頼度　" + eSet(s,counts,g));
  print("time  ");
  println(millis() - start) ;
  //g.show();
  exit();
}
float eSet(int s,long [][]counts,Graph g){



  for(int i = 0 ; i < counts.length ; i++)
  println("辺の数　" + (g.es.size()- i) + " :　" + counts[counts.length-1][i]) ;
  return g.getReliability(counts,g);
}

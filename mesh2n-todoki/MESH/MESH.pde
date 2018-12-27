float p=0.9;
void setup(){
  int l = 4;     //縦
  int s = 5;     //横
  NodeSet ns = new NodeSet(l,s);
  EdgeSet es = new EdgeSet(l,s,ns);
  Graph g = new Graph(ns,es);
  int size = es.size() - (g.ns.size()-1) + 1 ;
  int[]counts = new int[size];
  int start = millis() ;
  subset_BT(new boolean[es.size()], 0 ,g ,counts) ;
//  println("信頼度　" + g.reliability);
  print("time  ");
  println(millis() - start) ;
//  g.show();
  for(int i = 0 ; i<size ; i++)
  println("辺の数 " + (i+(g.ns.size()-1)) + " : " + counts[i]);
  exit();
}
void subset_BT(boolean[] b, int k,Graph g,int[] counts) {

  if (subset_isSolution(b, k)){
    EdgeSet subsetEs = new EdgeSet();
    int count = 0;
    for(int i = 0; i < b.length; i++)
    if(b[i]){
      subsetEs.add(g.es.get(i));
      count++;
    }
    Graph gg = new Graph(g.ns,subsetEs);
    if(count >= g.ns.size()-1)
    if(gg.isConnected()){
      counts[gg.es.size() - (g.ns.size()-1)]++;

//      gg.getReliability(g) ;
//      g.reliability += gg.reliability ;
    }
  }
  else {
    boolean[] Sk = subset_Sk(b, k) ;
    for (int i = 0; i < Sk.length; i++) {
      b[k] = Sk[i] ;
      subset_BT(b, k+1, g, counts) ;
    }
  }
}

boolean subset_isSolution(boolean[] b, int k) {
  return (k == b.length) ;
}

boolean[] subset_Sk(boolean[] b, int k) {
  boolean[] Sk = new boolean[2] ;
  Sk[0] = true ;
  Sk[1] = false ;
  return Sk ;
}

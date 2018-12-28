int r = 3 ;     //縦
int c = 5;     //横

void setup(){
  Graph g = new Graph(r,c);
  g.setEdge() ;
  int[] counts = new int[g.es.size()+1];
  int start = millis() ;
  subset_BT(0 , g, counts, 0, g.es.size() - (g.ns.size() - 1)) ;
  print("time  ");
  println(millis() - start) ;
  for(int i = g.ns.size() - 1 ; i < counts.length ; i++) {
    println("辺の数 " + i + " : " + counts[i]);
  }
  exit();
}

void subset_BT(int k, Graph g, int[] counts, int edgeNum, int deleteCap) {
  if (k == counts.length - 1) {
    if (g.isConnected()) counts[edgeNum]++ ;
  }
  else {
    Edge e = g.es.get(k) ;
    if (e.deletable() && deleteCap > 0) {
      e.setFalse() ;
      subset_BT(k + 1, g, counts, edgeNum, deleteCap - 1) ;
      e.setTrue() ;
    }
    subset_BT(k + 1, g, counts, edgeNum + 1, deleteCap) ;
  }
}

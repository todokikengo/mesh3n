int r = 4 ;     //縦
int c = 5 ;     //横

void setup(){
  Graph g = new Graph(r,c);
  g.setEdge() ;
  int[] counts = new int[g.es.size()+1];
  int start = millis() ;
  //  subset_BT_UF(g, 0, g.es.size(), 0, g.ns.size(), counts) ;
  subset_BT_UF(g, 0, g.es.size(), g.ns.size(), 1) ;
  print("time  ");
  println(millis() - start) ;
  for(int i = g.ns.size() - 1 ; i < counts.length ; i++) {
    println("辺の数 " + i + " : " + counts[i]);
  }
  exit();
}

void subset_BT_UF(Graph g, int k, int remainingNum, int edgeNum, int componentNum, int[] counts) {
  if (k == counts.length - 1) {
   if (componentNum == 1) counts[edgeNum]++ ;
//    counts[edgeNum]++ ;
  }
  else {
    Edge e = g.es.get(k) ;
    Node u = e.get(0) ;
    Node v = e.get(1) ;
    Node ru = u.getRoot() ;
    Node rv = v.getRoot() ;

    if (ru != rv) {
      Node parent, child ;
      if (ru.size >= rv.size) {
        parent = ru ;
        child = rv ;
      } else {
        parent = rv ;
        child = ru ;
      }
      child.parent = parent ;
      parent.size += child.size ;
      e.setTrue() ;
      subset_BT_UF(g, k + 1, remainingNum - 1, edgeNum + 1, componentNum - 1, counts) ;

      child.parent = null ;
      parent.size -= child.size ;
    }
    else {
      e.setTrue() ;
      subset_BT_UF(g, k + 1, remainingNum - 1, edgeNum + 1, componentNum, counts) ;
    }

    if (remainingNum > componentNum - 1) {
      e.setFalse() ;
      subset_BT_UF(g, k + 1, remainingNum - 1, edgeNum, componentNum, counts) ;
    }
  }
}

float subset_BT_UF_R(Graph g, int k, int remainingNum, int componentNum, float r) {
  if (k == counts.length - 1) {
    if (componentNum == 1) return r ;
  }
  else {
    Edge e = g.es.get(k) ;
    Node u = e.get(0) ;
    Node v = e.get(1) ;
    Node ru = u.getRoot() ;

    if (ru != rv) {
      Node parent, child ;
      if (ru.size >= rv.size) {
        parent = ru ;
        child = rv ;
      } else {
        parent = rv ;
        child = ru ;
      }
      child.parent = parent ;
      parent.size += child.size ;
      e.setTrue() ;
      subset_BT_UF_R(g, k + 1, remainingNum - 1, componentNum - 1, r * e.p) ;

      child.parent = null ;
      parent.size -= child.size ;

      if (remainingNum > componentNum - 1) {
        e.setFalse() ;
        subset_BT_UF_R(g, k + 1, remainingNum - 1,componentNum, r * (1 - e.p)) ;
      }
    }
  } else {
    subset_BT_UF_R(g, k + 1, remainingNum - 1, componentNum, r) ;
  }
}

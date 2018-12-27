class Node{
  int index ;
  EdgeSet edges ;
  boolean reached ;
  int deletedNum ;
  Node(int i) {
    index = i;
    deletedNum = 0 ;
  }
  Node() {
  }
  boolean deletable() {
    return (edges.size() - deletedNum > 1) ;
  }
}

class NodeSet extends ArrayList<Node>{
  NodeSet(){
  }
  NodeSet(int l,int s){
    for(int i = 0 ; i < l * s ; i++){
      add(new Node(i));
    }
  }
  void reset() {
    for (Node v : this) {
      v.reached = false ;
    }
  }
  boolean reached() {
    for (Node u : this) {
      if (! u.reached) return false ;
    }
    return true ;
  }
  void setEdge() {
    for (Node v : this) {
      v.edges = new EdgeSet() ;
    }
  }
}

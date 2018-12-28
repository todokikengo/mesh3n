class Mesh {
  int rowNum ;
  int columnNum ;
  NodeSet nodes ;
  EdgeSet edges ;

  Mesh(int rn, int cn) {
    rowNum = rn ;
    columnNum = cn ;
    nodeSetup() ;
    edgeSetup() ;
  }
  void nodeSetup() {
    nodes = new NodeSet() ;
    for (int r = 0 ; r < rowNum ; r++) {
      for (int c = 0 ; c < columnNum ; c++) {
        nodes.add(new Node(r, c)) ;
      }
    }
  }
  void edgeSetup() {
    edges = new EdgeSet() ;
    for (int i = 0 ; i < nodes.size() - 1 ; i++) {
      Node u = nodes.get(i) ;
      for (int j = i + 1 ; j < nodes.size() ; j++) {
        Node v = nodes.get(j) ;
        if (abs(u.row - v.row) + abs(u.column - v.column) != 1) continue ;
        edges.add(new Edge(u, v)) ;
      }
    }
  }
}

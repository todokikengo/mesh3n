class Arc extends FaceSet {
  Edge edge ;
  boolean valid ;
  Arc(Face u, Face v, Edge e) {
    add(u) ;
    add(v) ;
    edge = e ;
  }
  String toString() {
    return "(" + super.toString() + " : " + edge.toString() + ")" ;
  }
}

class ArcSet extends ArrayList<Arc> {
  ArcSet() {
  }
  void reset() {
    for (Arc a : this) {
      a.valid = false ;
    }
  }
  String toString() {
    String[] stg = new String[size()] ;
    for (int i = 0 ; i < size() ; i++) {
      stg[i] = get(i).toString() ;
    }
    return "{" + join(stg, ", ") + "}" ;
  }
}

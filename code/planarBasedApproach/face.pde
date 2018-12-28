class Face {
  int index ;
  int row ;
  int column ;
  Face(int i, int r, int c) {
    index = i ;
    row = r ;
    column = c ;
  }
  String toString() {
    return "(" + column + ", " + row + ")" ;
  }
}

class FaceSet extends ArrayList<Face> {
  FaceSet() {
  }
  String toString() {
    String[] stg = new String[size()] ;
    for (int i = 0 ; i < size() ; i++) {
      stg[i] = get(i).toString() ;
    }
    return "{" + join(stg, ", ") + "}" ;
  }
}

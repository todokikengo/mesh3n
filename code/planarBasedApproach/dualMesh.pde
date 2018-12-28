class DualMesh {
  FaceSet faces ;
  ArcSet arcs ;
  DualMesh(Mesh mesh) {
    faces = new FaceSet() ;
    Face[][] faceArray = new Face[mesh.columnNum + 1][mesh.rowNum + 1] ;
    Face outerFace = new Face(0, 0, 0) ;
    faces.add(outerFace) ;
    faceArray[0][0] = outerFace ;
    for (int c = 1 ; c <= mesh.columnNum ; c++) {
      faceArray[c][0] = outerFace ;
      faceArray[c][mesh.rowNum] = outerFace ;
    }
    for (int r = 1 ; r < mesh.rowNum ; r++) {
      faceArray[0][r] = outerFace ;
      faceArray[mesh.columnNum][r] = outerFace ;
    }
    for (int c = 1 ; c < mesh.columnNum ; c++) {
      for (int r = 1 ; r < mesh.rowNum ; r++) {
        faceArray[c][r] = new Face(faces.size(), r, c) ;
        faces.add(faceArray[c][r]) ;
      }
    }
    arcs = new ArcSet() ;
    for (Edge e : mesh.edges) {
      Node u = e.get(0) ;
      Node v = e.get(1) ;
      if (v.column - u.column == 1) {
        Arc a = new Arc(faceArray[v.column][v.row], faceArray[v.column][v.row + 1], e) ;
        arcs.add(a) ;
      }
      else {
        Arc a = new Arc(faceArray[v.column][v.row], faceArray[v.column + 1][v.row], e) ;
        arcs.add(a) ;
      }
    }
  }
  int[] backtracking() {
    int[] counts = new int[faces.size() + 1] ;
    int[] ci = new int[faces.size()] ;
    for (int i = 0 ; i < ci.length ; i++) {
      ci[i] = i ;
    }
    backtracking(0, 0, ci, counts) ;
    return counts ;
  }
  void backtracking(int index, int arcNum, int[] ci, int[] counts) {
    if (index == arcs.size()) {
      counts[arcNum]++ ;
    }
    else {
      Arc a = arcs.get(index) ;
      Face fs = a.get(0) ;
      Face ft = a.get(1) ;
      if (arcNum < faces.size() - 1 && ci[fs.index] != ci[ft.index]) {
        int[] cii = new int[faces.size()];
        arrayCopy(ci, cii) ;
        for (int i = 0 ; i < cii.length ; i++) {
          if (cii[i] == ci[ft.index]) cii[i] = ci[fs.index] ;
        }
        a.valid = true ;
        backtracking(index + 1, arcNum + 1, cii, counts) ;
        a.valid = false ;
      }
      backtracking(index + 1, arcNum, ci, counts) ;
    }
  }
}

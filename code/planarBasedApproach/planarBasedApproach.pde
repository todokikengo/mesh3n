int rowNum = 4 ;
int columnNum = 5 ;

// nodeNum = rowNum * columnNum ;
// edgeNum = rowNum * (columnNum - 1) + columnNum * (rowNum - 1)
//         = 2 * rowNum * columnNum - rowNum - columnNum ;
// deleteNumUpperBount = rowNum * columnNum - rowNum - columnNum + 1 ;


// faceNum = (rowNum - 1) * (columnNum - 1) + 1
//         = rowNum * columnNum - rowNum - column + 2
// edgeNumUpperBound = faceNum - 1
//                   = rowNum * columnNum - rowNum - column + 1 ;

void setup() {
  Mesh mesh = new Mesh(rowNum, columnNum) ;
  DualMesh dual = new DualMesh(mesh) ;
  int time = millis() ;
  int[] counts = dual.backtracking() ;
  time = millis() - time ;
  println("time : " + time) ;
  println(counts) ;
  exit() ;
}

void setup(){
  int l = 2; //縦
  int s = 10; //横
  // NodeSet ns = new NodeSet(l,s);
  // EdgeSet es = new EdgeSet(l,s,ns);
  // Graph g = new Graph(ns,es,l,s);
  int start = millis() ;
  int x = s + 1 ; //何列目か
  int y = 2 ;  //連結成分の繋がり方
  int z = 3 * s - 2 + 1 ; //辺の本数
  long[][][] data = new long[x][y][z] ;
  data[1][0][1] = 1 ; //初期値
  data[1][1][0] = 1 ;
  int count = 2 ;
  while(count < x ){
    for(int i = 0 ; i < y ; i++){
      for(int j = 0 ; j < z ; j++){
        if(data[count - 1][i][j] != 0) {
          long sum = data[count - 1][i][j] ;
          if(i == 0){
            //連結から連結 0 -> 0
            //  print("0");
            data[count][0][j + 2] += sum * 3 ;
            data[count][0][j + 3] += sum ;
            //連結から非連結 0 -> 1
            data[count][1][j + 1] += sum * 2 ;
          }else if(i == 1){
            //非連結から連結 1 -> 0
            //   print("1");
            data[count][0][j + 3] += sum ;
            //非連結から非連結 1 -> 1
            data[count][1][j + 2] += sum ;
          }
        }
      }
    }
    count++;
  }
  for(int k = l * s - 1 ; k < z ; k++){
      println("辺の本数 " + k + " 本　：" + data[count-1][0][k] + " 通り");
  }
  print("time   ");
  println(millis() - start);
  exit();
}
  // long[] connectedSpanningSubgraphNum = new long[es.size() + 1] ;
  // for(int i = 0 ; i < connectedSpanningSubgraphNum.length ; i++){
  //   connectedSpanningSubgraphNum[i] = calcConnectedSpanningSubgraph(g, i) ;
  //}
  //int position = s;
  //g.show();


// long calcConnectedSpanningSubgraph(Graph g, int k){
//   long cssNum = b_1() * calcConnectedSpanningSubgraph(getSubgraph(s-1,g), k - a_1()) ;
//   for(int i = 1 ; i < n - 1 ; i++){
//     cssNum += (b_2() * b_3() * pow(b_4(), n - 2 - i))*calcConnectedSpanningSubgraph(getSubgraph(s-i,g), k - a_2() - a_3() - a_4() * (n - 2 - i)) ;
//   }
//   if(a_d() + (n-2) * a_4() + a_3() == k)
//   cssNum += b_d() * pow(b_4(), n - 2) * b_3() ;
//   return cssNum ;
// }
//
// Graph getSubgraph(int a,Graph g){
//   //G_{n*3}の部分グラフ G_{a*3}を取り出す．
//   Graph subgraph = new Graph(g.ns,g.es,g.l,a);
//   return subgraph;
//}

float p=0.9;
void setup(){
  int l = 2; //縦
  int s = 200; //横
  NodeSet ns = new NodeSet(l,s);
  EdgeSet es = new EdgeSet(l,s,ns);
  Graph g = new Graph(ns,es);
  long[][]counts = new long[s][s];
  int start = millis() ;
  println("信頼度　" + eSet(s,counts,g));
  print("time  ");
  println(millis() - start) ;
  //g.show();
  exit();
}
float eSet(int s,long [][]counts,Graph g){
  for(int n = 0 ; n < counts.length ; n++)
  counts[n][0] = 1;
  for(int i = 1 ; i < s; i++){
    for(int j = 1 ; j < counts.length ; j++){
      if(counts[i-1][j-1] != 0 && counts[i-1][j] == 0){
        int position1 = j-2;
        counts[i][j] += 1;
        counts[i][j] += counts[i-1][j-1]*3 ;
        if(i>1 && position1 >=0)
        for(int k = i-2 ; k >= 0 ; k--){
          counts[i][j] += counts[k][position1]*2;
          position1--;
        }
      }
      if(counts[i-1][j-1] != 0 && counts[i-1][j] != 0){
        int position2 = j-2;
        counts[i][j] += counts[i-1][j-1]*3 + counts[i-1][j];
        if(i>1 && position2 >=0)
        for(int k = i-2 ; k >= 0 ; k--){
          if(position2<0)
          break;
          counts[i][j] += counts[k][position2]*2;
          position2--;
        }
      }
    }
  }
  for(int i = 0 ; i < counts.length ; i++)
  println("辺の数　" + (g.es.size()- i) + " :　" + counts[counts.length-1][i]) ;
  return g.getReliability(counts,g);
}

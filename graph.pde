class Graph{
  NodeSet ns ;
  EdgeSet es ;
  int l ;
  int s ;
  Graph(NodeSet a, EdgeSet b, int c, int d){
    ns = a;
    es = b;
    l = c;
    s = d;
  }
  int Ce(){ //３×１が連結な時の辺の本数
    return 2;//３×１が連結な時の辺の本数は２本
  }

  int Cn(){ //3×１が連結な場合の数
    return 1;
  }

  int De(){ //３×１が非連結な時の辺の本数
    for(int i=0; i<2 ; i++)
      return  counts[1][3-i]=i; //３×１が非連結の時は０本追加の場合と１本追加の場合
  }

  int Dn(){ //3×１が非連結な場合の数
    for(int i=0; i<2 ; i++)
      if(i==0)
        return 1;
      else if(i==1)
        return 2;
  }

  int a_1(){ //連結から連結の辺の追加本数

  }

  int b_1(){ //連結から連結の場合の数

  }

  int a_2(){ //連結から非連結の辺の追加本数

  }

  int b_2(){ //連結から非連結の場合の数

  }

  int a_3(){ //非連結から連結の辺の追加本数
　
  }

  int b_3(){ //非連結から連結の場合の数
　
  }

  int a_4(){ //非連結から非連結の辺の追加本数

  }

  int b_4(){ //非連結から非連結の場合の数

  }




  void show(){
    println("NodeSet");
    for(Node u : ns)
    print(u.index+",");
    println();
    println("EdgeSet");
    for(Edge e : es){
      println("{" + e.get(0).index + "," + e.get(1).index + "} ");
    }
  }
}

part of 'extension.dart';



extension ListIntegerExtension on List<int>{

  List<int> alternative(final int main,final int replace){
    final List<int> list=this;
    list.remove(main);
    list.add(replace);
    return list;
    // for(int i=0;i<list.length;i++){
    //   if(list[i]==main){
    //   }
    // }

  }
}


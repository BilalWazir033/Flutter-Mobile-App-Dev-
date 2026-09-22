void main(){
  var list1=[2,3,5,6];
  print(list1[2]);
  var mapping={
    'id': 1,
    'name': "Dart"
  };
  print(mapping);

  var map1=[];
  map1.add(30);
  map1.add(23);

  print(map1[1]);


 var list4 = <int>[90, 70, 60, 40, 20]; 
 print(list4);
 print(list4[2]);

 var list5=List.filled(5, 0);
  list5[0]=90; 
  list5[1]=70;
  list5[2]=60; 
  list5[3]=40; 
  list5[4]=20;
  print(list5);
  print(list5.first);
  print(list5.isEmpty);
  print(list5.hashCode);
  print(list5.length);
  print(list5.reversed);

  Set<int> numbers={23,53,603};
  print(numbers);
}

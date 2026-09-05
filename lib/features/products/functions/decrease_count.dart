String DeceaseCount(String value, int minValue){
  int count = int.tryParse(value) ?? 0;

  if(count <= minValue){
    return count.toString();
  }else{
    return (count - 1).toString();
  }
}
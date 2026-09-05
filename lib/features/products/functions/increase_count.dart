String IncreaseCount(String value, int maxValue) {
  int count = int.tryParse(value) ?? 0;

  if(count >= maxValue){
    return value;
  }else{
  return (count + 1).toString();
  }
}

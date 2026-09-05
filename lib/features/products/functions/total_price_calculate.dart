import 'package:login/features/products/entity/product_ordered.dart';
import 'package:login/features/products/entity/total_price.dart';

TotalPrice TotalPriceCalculate(List<ProductOrdered> products, int customerId){
  int grossAmount = 0;
  int discount = 0;
  int netPayabel = 0 ;
  for(int index = 0; index < products.length; index++){
    grossAmount = grossAmount +( products[index].count * products[index].product.price);
    discount =  discount +(products[index].count * products[index].product.discount);
    
  }

  netPayabel = grossAmount - discount;



  return TotalPrice(grossAmount, discount, netPayabel, customerId);
}
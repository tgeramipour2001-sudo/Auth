import 'package:login/features/products/entity/product_ordered.dart';
import 'package:login/features/products/entity/total_price.dart';

void TotalPriceCalculate(List<ProductOrdered> products, TotalPrice totalPrice){
  int grossAmount = 0;
  int discount = 0;
  int netPayabel = 0 ;
  for(int index = 0; index < products.length; index++){
    grossAmount = grossAmount +( products[index].count * products[index].product.price);
    discount =  discount +(products[index].count * products[index].product.discount);
    
  }

  netPayabel = grossAmount - discount;

  totalPrice.grossAmount = grossAmount;
  totalPrice.discountAmount = discount;
  totalPrice.netPayableAmount = netPayabel;
}
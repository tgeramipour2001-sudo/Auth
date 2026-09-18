import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/total_price_entity.dart';
import 'package:login/Features/Order/Domain/Entity/Product_Entity/cart_item_entity.dart';

TotalPriceEntity totalPriceCalculate(List<CartItemEntity> products, int customerId){
  int grossAmount = 0;
  int discount = 0;
  int netPayabel = 0 ;
  for(int index = 0; index < products.length; index++){
    grossAmount = grossAmount +( products[index].count * products[index].product.price);
    discount =  discount +(products[index].count * products[index].product.discount);
    
  }

  netPayabel = grossAmount - discount;



  return TotalPriceEntity(grossAmount, discount, netPayabel);
}
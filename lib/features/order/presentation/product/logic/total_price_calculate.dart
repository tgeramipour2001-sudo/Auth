
import 'package:login/features/order/domain/entity/order_cart_entity/total_price_entity.dart';
import 'package:login/features/order/domain/entity/product_entity/cart_item_entity.dart';

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
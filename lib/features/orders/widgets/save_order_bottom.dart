import 'package:flutter/material.dart';
import 'package:login/core/Main/injection.dart';
import 'package:login/features/orders/bloc/save_order_bloc.dart';
import 'package:login/features/products/bloc/products_list_bloc.dart';

class SaveOrderBottom extends StatelessWidget {
  final int customerId;
  Color containerColor = Color(0xff204680);
  SaveOrderBottom({super.key, required this.customerId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      color: Color(0xff88A9DC),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          Center(
            child: SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: containerColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  getIt<SaveOrderBloc>().add(SendOrder(customerId: customerId));
                },
                child: Text(
                  'Send',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),

          SizedBox(width: 20,),
           Center(
             child: SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: containerColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16),
                ),
              ),
                       ),
           ),
        ],
      ),
    );
  }
}

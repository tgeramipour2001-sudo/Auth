import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/Main/injection.dart';
import 'package:login/features/orders/bloc/save_order_bloc.dart';
import 'package:login/features/products/entity/customer_order.dart';

class SaveOrderBottom extends StatefulWidget {
  final int customerId;
  final CustomerOrder customerOrder;

  SaveOrderBottom({
    super.key,
    required this.customerId,
    required this.customerOrder,
  });

  @override
  State<SaveOrderBottom> createState() => _SaveOrderBottomState();
}

class _SaveOrderBottomState extends State<SaveOrderBottom> {
  Color containerColor = Color(0xff204680);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaveOrderBloc, SaveOrderState>(
      bloc: getIt<SaveOrderBloc>(),
      listener: (context, state) {
        if (state is SeveOrderSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('The order id is ${state.orderId}'),
              duration: Duration(seconds: 3),

              backgroundColor:  Color(0xff204680),
             // margin: EdgeInsets.only(left: 10, right: 10),
            ),
          );
          Future.delayed(const Duration(milliseconds: 800), () {
            if (context.mounted) {
              Navigator.pop(context);
              Navigator.pop(context);
            }
          });
        }
      },
      child: Container(
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
                    getIt<SaveOrderBloc>().add(
                      SendOrder(
                        customerId: widget.customerId,
                        customerOrder: widget.customerOrder,
                      ),
                    );
                  },
                  child: Text(
                    'Send',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ),

            SizedBox(width: 20),
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
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

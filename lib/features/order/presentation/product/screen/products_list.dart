import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:login/core/startup/injection.dart';
import 'package:login/features/customers/domain/entity/customer_entity.dart';
import 'package:login/features/order/presentation/bloc/product/products_list_bloc.dart';
import 'package:login/features/order/presentation/product/widget/product_list_view.dart';
import 'package:login/features/order/presentation/product/widget/product_list_view_bottom.dart';
import 'package:login/features/order/presentation/product/widget/refresh_button.dart';
import 'package:login/features/order/presentation/product/widget/serach_box.dart';


class ProductsListScreen extends StatelessWidget {
  // TotalPrice totalPrice = TotalPrice(0, 0, 0);
  final CustomerEntity customer;
  TextEditingController searchProductController = TextEditingController();
  ProductsListScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final Color containerColor = Color(0xff204680);
    final theme = Theme.of(context);
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 65,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              boxShadow: [BoxShadow(blurRadius: 5)],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SearchBoxProductsList(
                  searchChanged: (String value) {
                    getIt<ProductsListBloc>().add(
                      ProductListFilter(
                        customer: customer,
                        searchedTextField: searchProductController.text,
                      ),
                    );
                  },
                  searchProductController: searchProductController,
                ),
                RefreshButtonProductsList(
                  onTap: () {
                    getIt<ProductsListBloc>().add(
                      ProductListFilter(
                        customer: customer,
                        searchedTextField: searchProductController.text,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: BlocBuilder<ProductsListBloc, ProductsListState>(
              builder: (context, state) {
                if (state is ProductListSuccess) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: ProductListView(
                          products: state.products,
                          customer: customer,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ProductListViewBottom(
                          customerOrder: state.customerOrder,
                          customerEntity: customer,
                        ),
                      ),
                    ],
                  );
                } else if (state is ProductListLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductListError) {
                  return Text(state.exeception.toString());
                } else {
                  throw Exception();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/features/products/bloc/products_list_bloc.dart';
import 'package:login/features/products/widgets/product_list_view.dart';
import 'package:login/features/products/widgets/product_list_view_bottom.dart';
import 'package:login/features/products/widgets/refresh_button.dart';
import 'package:login/features/products/widgets/serach_box.dart';

class ProductsListScreen extends StatelessWidget {
  TextEditingController searchProductController = TextEditingController();
  ProductsListScreen({super.key});

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
                    context.read<ProductsListBloc>().add(
                      ProductListFilter(
                        searchedTextField: searchProductController.text,
                      ),
                    );
                  },
                  searchProductController: searchProductController,
                ),
                RefreshButtonProductsList(
                  onTap: () {
                    context.read<ProductsListBloc>().add(
                      ProductListFilter(
                        searchedTextField: searchProductController.text,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
      
          BlocBuilder<ProductsListBloc, ProductsListState>(
            builder: (context, state) {
              if (state is ProductListSuccess) {
                return Stack(
                  children: [
                    Positioned.fill(child: ProductListView(products: state.products)),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ProductListViewBottom()),
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
        ],
      ),
    );
  }
}

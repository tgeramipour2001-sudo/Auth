import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/customer.dart';
import 'package:login/data/repository/customer_repository.dart';
import 'package:login/ui/customer/bloc/customer_bloc.dart';
import 'package:login/widget/search_bar.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color containerColor = Color(0xff204680);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<CustomerBloc>(
        create: (context) {
          final bloc = CustomerBloc(customerRepository: customerRepository);
          bloc.add(CustomerStarted());
          return bloc;
        },

        child: BlocListener<CustomerBloc, CustomerState>(
          listener: (context, index) {},
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      boxShadow: [BoxShadow(blurRadius: 5)],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width - 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [BoxShadow(blurRadius: 2)],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: SearchTextField()),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  CupertinoIcons.search,
                                  size: 20,
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.refresh_bold,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<CustomerBloc, CustomerState>(
                    builder: (context, state) {
                      if (state is CustomerSuccess) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.customers.length,
                          itemBuilder: (context, index) {
                            CustomerEntity customer = state.customers[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 3,
                                left: 6,
                                right: 6,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xff88A9DC),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: containerColor,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    //name
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            customer.name,
                                            style: theme
                                                .textTheme
                                                .headlineMedium!
                                                .apply(color: containerColor),
                                          ),
                                        ],
                                      ),
                                    ),

                                    //address
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        bottom: 6,
                                      ),
                                      child: Expanded(
                                        child: Row(
                                          children: [
                                            Text(
                                              customer.address,
                                              style:
                                                  theme.textTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Divider(
                                      color: containerColor,
                                      indent: 2,
                                      endIndent: 2,
                                    ),

                                    //balances and last order
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                      child: Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text('Credit Balance', style: theme.textTheme.titleSmall,),
                                                Text(
                                                  customer.creditBalance.toString(),style: theme.textTheme.titleSmall
                                                ),
                                              ],
                                            ),
                                        
                                                                             
                                            Column(
                                              children: [
                                                Text('Account Balance',style: theme.textTheme.titleSmall),
                                                Text(
                                                  customer.accountBalance.toString(),style: theme.textTheme.titleSmall
                                                ),
                                              ],
                                            ),
                                        
                                            Column(
                                              children: [
                                                Text('Last Order Date',style: theme.textTheme.titleSmall),
                                                Text(
                                                  customer.lastOrderDate.toString(),style: theme.textTheme.titleSmall
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is CustomerLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CustomerError) {
                        return Text(state.exception.toString());
                      } else {
                        throw Exception('state is not valid');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

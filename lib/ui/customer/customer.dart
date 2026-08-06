import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/customer.dart';
import 'package:login/data/repository/customer_repository.dart';
import 'package:login/ui/customer/bloc/customer_bloc.dart';
import 'package:login/ui/customer/widgets/BalanceBox.dart';
import 'package:login/ui/customer/widgets/CustomerAddressBox.dart';
import 'package:login/ui/customer/widgets/CustomerNameBox.dart';
import 'package:login/ui/customer/widgets/RefreshButton.dart';
import 'package:login/ui/customer/widgets/SearchBox.dart';

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
                        //search box
                        SearchBox(),
                        //refresh button
                        BlocBuilder<CustomerBloc, CustomerState>(
                          builder: (context, state) {
                            return RefreshButton(
                              onPressed: () {
                                context.read<CustomerBloc>().add(
                                  CustomeRefresh(),
                                );
                              },
                            );
                          },
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
                                    CustomerNameBox(
                                      customer: customer,
                                      theme: theme,
                                      containerColor: containerColor,
                                    ),

                                    //address
                                    CustomerAddressBox(
                                      customer: customer,
                                      theme: theme,
                                    ),
                                    Divider(
                                      color: containerColor,
                                      indent: 2,
                                      endIndent: 2,
                                    ),

                                    //balances and last order
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        8,
                                        5,
                                        8,
                                        5,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BalanceBox(
                                            theme: theme,
                                            customer: customer,
                                            title: 'Credite Balance',
                                            detail: customer.creditBalance
                                                .toString(),
                                          ),

                                          BalanceBox(
                                            theme: theme,
                                            customer: customer,
                                            title: 'Account Balance',
                                            detail: customer.accountBalance
                                                .toString(),
                                          ),

                                          BalanceBox(
                                            theme: theme,
                                            customer: customer,
                                            title: 'Last Order Date',
                                            detail: customer.lastOrderDate,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is CustomerLoading) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                          child: Center(child: CircularProgressIndicator(),),
                        );
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

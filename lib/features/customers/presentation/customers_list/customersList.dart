import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/features/customers/bloc/customer_bloc.dart';
import 'package:login/features/customers/entity/customer.dart';
import 'package:login/features/customers/presentation/customer_entrance/customerEntrance.dart';
import 'package:login/features/customers/widgets/BalanceBox.dart';

import 'package:login/features/customers/widgets/CustomerAddressBox.dart';
import 'package:login/features/customers/widgets/CustomerNameBox.dart';
import 'package:login/features/customers/widgets/RefreshButton.dart';
import 'package:login/features/customers/widgets/SearchBox.dart';

// ignore: must_be_immutable
class CustomersListScreen extends StatelessWidget {
  TextEditingController searchCustomerController = TextEditingController();
  CustomersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color containerColor = Color(0xff204680);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
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
                    //search box
                    SearchBox(
                      searchChanged: (String value) {
                        BlocProvider.of<CustomerBloc>(
                          context,
                        ).add(CustomerFilter(SearchedField: value));
                      },
                      searchCustomerController: searchCustomerController,
                    ),

                    //refresh button
                    //BlocBuilder<CustomerBloc, CustomerState>(
                    // builder: (context, state) {
                    RefreshButton(
                      onPressed: () {
                        if (searchCustomerController != '') {
                          context.read<CustomerBloc>().add(
                            CustomerFilter(
                              SearchedField: searchCustomerController.text,
                            ),
                          );
                        } else {
                          context.read<CustomerBloc>().add(CustomerStarted());
                        }
                      },
                    ),

                    // },
                    //  ),
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

                            left: 8,
                            right: 8,
                          ),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                              
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) {
                                  return CustomerEntranceScreen(customerEntity: customer,);
                                },
                              );
                            },
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
                                    containerColor: containerColor,
                                  ),

                                  //address
                                  CustomerAddressBox(customer: customer),
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
                                          customer: customer,
                                          title: 'Credite Balance',
                                          detail: customer.creditBalance
                                              .toString(),
                                        ),

                                        BalanceBox(
                                          customer: customer,
                                          title: 'Account Balance',
                                          detail: customer.accountBalance
                                              .toString(),
                                        ),

                                        BalanceBox(
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
                          ),
                        );
                      },
                    );
                  } else if (state is CustomerLoading) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is CustomerError) {
                    return Text(state.exception.toString());
                  } else {
                    throw Exception('state is not valid');
                  }
                },
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

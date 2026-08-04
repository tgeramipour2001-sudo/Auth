import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/widget/search_bar.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
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
                          Expanded(
                            child: SearchTextField(),
                          ),
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
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 3),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        boxShadow: [
                          BoxShadow(blurRadius: 2, color: Colors.grey),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

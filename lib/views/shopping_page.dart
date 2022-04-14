import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Card();
              },
            ),
          ),
          const Text('Total Amount: '),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

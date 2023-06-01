import 'package:flutter/material.dart';

class ShoppingHome extends StatefulWidget {
  const ShoppingHome({Key? key}) : super(key: key);
  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Shopping Home"),
    );
  }
}

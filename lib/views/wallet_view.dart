import 'package:flutter/material.dart';


class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text('Wallet',style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}
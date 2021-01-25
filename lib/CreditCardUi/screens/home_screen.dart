import 'package:flutter/material.dart';
import 'package:flutter_ui_complexity/CreditCardUi/components/card_section.dart';
import 'package:flutter_ui_complexity/CreditCardUi/components/expenseSection.dart';
import 'package:flutter_ui_complexity/CreditCardUi/components/header.dart';
import 'package:flutter_ui_complexity/CreditCardUi/data.dart';


class HomeScreenWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
          body: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                height: 120,
                child: WalletHeader(),
              ),
              Expanded(child: CardSection()),
              Expanded(child: ExpenseSection()),
            ],
          ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tip_calculator_project/widget/simple_input_field.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {

  final formKey = GlobalKey<FormState>();
  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  static const Color containerBox = Color(0xffF5F8FB);
  static const Color textBlock = Color(0xff232323);
  static const Color textLightBlock = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Tip Calculator',
            style: TextStyle(fontWeight: FontWeight.w600),),
          centerTitle: true,
          elevation: 3,
          shadowColor: Colors.black.withOpacity(0.3),
          backgroundColor: Colors.white
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: containerBox,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text("Total Bill", style: TextStyle(fontSize: 16, color: textLightBlock)),
                      Text("\$ ${totalBillController.text}", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: textBlock)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Persons", style: TextStyle(color: textLightBlock)),
                          Text("Tip Amount", style: TextStyle(color: textLightBlock)),
                        ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(totalPeopleController.text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textBlock)),
                            Text("\$ 0.00", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textBlock)),
                          ]
                      )
                    ],
                  ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: containerBox,
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount Per Person", style: TextStyle(color: textLightBlock)),
                    Text("\$ 0.00", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: textBlock)),
                  ]
                )
              ),
              const Spacer(),

              SimpleInputField(
                controller: totalBillController,
                title: "Total bill",
                hintText: "Please enter total bill",
                iconData: Icons.attach_money,
              ),
              SimpleInputField(
                controller: totalTipController,
                title: "Tip percentage",
                hintText: "Please enter tip percentage",
                iconData: Icons.percent,
              ),
              SimpleInputField(
                controller: totalPeopleController,
                title: "Number of people",
                hintText: "Please enter number of people",
              ),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          formKey.currentState!.validate();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        alignment: Alignment.center,
                        child: const Text("Calculate", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        formKey.currentState!.validate();
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                      decoration: BoxDecoration(
                          color: clearButtonColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      alignment: Alignment.center,
                      child: const Text("Clear", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}

import 'package:calculator_bloc/bloc/counter_cubit.dart';
import 'package:calculator_bloc/widgets/custom_button.dart';
import 'package:calculator_bloc/widgets/custom_button_equals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit counter = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BlocBuilder<CounterCubit, String>(
                bloc: counter,
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: Container(
                    child: Text(
                      state,
                      style: const TextStyle(fontSize: 30),
                    ),
                    // ),
                  );
                },
              ),
              const Column(children: [
                Row(
                  children: [
                    CustomButton(text: "C"),
                    CustomButton(text: "/"),
                    CustomButton(text: "*"),
                    CustomButton(text: "del")
                  ],
                ),
                Row(
                  children: [
                    CustomButton(text: "7"),
                    CustomButton(text: "8"),
                    CustomButton(text: "9"),
                    CustomButton(text: "-")
                  ],
                ),
                Row(
                  children: [
                    CustomButton(text: "4"),
                    CustomButton(text: "5"),
                    CustomButton(text: "6"),
                    CustomButton(text: "+")
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomButton(text: "3"),
                              CustomButton(text: "2"),
                              CustomButton(text: "1"),
                            ],
                          ),
                          Row(
                            children: [
                              CustomButton(text: "0"),
                              CustomButton(text: "000"),
                              CustomButton(text: "."),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomButtonEquals(),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ]),
    );
  }
}

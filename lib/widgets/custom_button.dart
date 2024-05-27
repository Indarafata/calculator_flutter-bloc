import 'package:calculator_bloc/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    CounterCubit counter = BlocProvider.of<CounterCubit>(context);

    return Expanded(
      child: InkWell(
        onTap: () {
          if (counter.state == "Error") {
            counter.clear();
          }

          if (text == "del") {
            counter.deleteCharacter();
          } else if (text == "C") {
            counter.clear();
          } else {
            counter.addCharacter(text);
          }
        },
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.black54,
          ),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

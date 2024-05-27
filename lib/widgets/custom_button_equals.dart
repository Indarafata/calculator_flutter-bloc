import 'package:calculator_bloc/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonEquals extends StatelessWidget {
  const CustomButtonEquals({super.key});

  @override
  Widget build(BuildContext context) {
    CounterCubit counter = BlocProvider.of<CounterCubit>(context);
    return Expanded(
      child: InkWell(
        onTap: () {
          if (counter.state.isNotEmpty) {
            counter.calculate();
          }
        },
        child: Container(
          height: 160,
          decoration: const BoxDecoration(
            color: Colors.black54,
          ),
          child: const Center(
              child: Text(
            "=",
            style: TextStyle(fontSize: 25, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

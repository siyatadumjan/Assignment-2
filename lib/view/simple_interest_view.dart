import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/simple_interest/simple_interest_bloc.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  double principal = 0; // Principal amount
  double rate = 0; // Rate of interest
  double time = 0; // Time in years

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Principal Input
              TextField(
                onChanged: (value) {
                  setState(() {
                    principal = double.tryParse(value) ?? 0;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Principal Amount',
                ),
              ),
              const SizedBox(height: 16),

              // Rate of Interest Input
              TextField(
                onChanged: (value) {
                  setState(() {
                    rate = double.tryParse(value) ?? 0;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Rate of Interest (%)',
                ),
              ),
              const SizedBox(height: 16),

              // Time Input
              TextField(
                onChanged: (value) {
                  setState(() {
                    time = double.tryParse(value) ?? 0;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Time (in years)',
                ),
              ),
              const SizedBox(height: 16),

              // Interest Display Using BlocBuilder
              BlocBuilder<SimpleInterestBloc, double>(
                builder: (context, interest) {
                  return Text(
                    'Simple Interest: NRs. ${interest.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Calculate Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Dispatch the calculation directly using the emit method
                    context.read<SimpleInterestBloc>().calculateInterest(
                          principal,
                          rate,
                          time,
                        );
                  },
                  child: const Text('Calculate Interest'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

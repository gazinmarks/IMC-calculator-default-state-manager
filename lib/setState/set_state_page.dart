import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/graphic_range.dart';

class SetStatePage extends StatefulWidget {
  const SetStatePage({super.key});

  @override
  State<SetStatePage> createState() => _SetStatePageState();
}

class _SetStatePageState extends State<SetStatePage> {
  final formKey = GlobalKey<FormState>();
  final weightEC = TextEditingController();
  final heightEC = TextEditingController();
  double imc = 0.0;

  Future<void> _calculateIMC(double weight, double height) async {
    setState(() {
      imc = 0;
    });
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      imc = weight / pow(height, 2);
    });
  }

  @override
  void dispose() {
    weightEC.dispose();
    heightEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set State'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                GraphicRange(imc: imc),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                    controller: weightEC,
                    maxLength: 6,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale: 'pt_BR',
                        decimalDigits: 2,
                        symbol: '',
                      ),
                    ],
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Informe seu peso'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                    controller: heightEC,
                    maxLength: 4,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale: 'pt_BR',
                        decimalDigits: 2,
                        symbol: '',
                      ),
                    ],
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Informe sua altura'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final formValid = formKey.currentState?.validate() ?? false;

                    if (formValid) {
                      final formatter = NumberFormat.simpleCurrency(
                        locale: 'pt_BR',
                        decimalDigits: 2,
                      );
                      final double weight =
                          formatter.parse(weightEC.text) as double;
                      final double height =
                          formatter.parse(heightEC.text) as double;

                      _calculateIMC(weight, height);
                    }
                  },
                  child: const Text('Calcular IMC'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

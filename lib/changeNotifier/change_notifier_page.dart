import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:imc_default_state_manager/changeNotifier/change_notifier_controller.dart';
import 'package:intl/intl.dart';

import '../widgets/graphic_range.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  final weightEC = TextEditingController();
  final heightEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = ChangeNotifierController();

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
        title: const Text('Change Notifier'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return GraphicRange(imc: controller.imc);
                  },
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
                    controller: weightEC,
                    maxLength: 6,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        decimalDigits: 2,
                        symbol: '',
                        locale: 'pt_BR',
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
                        decimalDigits: 2,
                        symbol: '',
                        locale: 'pt_BR',
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

                      controller.calculateIMC(weight: weight, height: height);
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

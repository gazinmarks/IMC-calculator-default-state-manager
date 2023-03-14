import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:imc_default_state_manager/blocScrum/bloc_pattern_controller.dart';
import 'package:intl/intl.dart';

import '../widgets/graphic_range.dart';
import 'imc_state.dart';

class BlocPatternPage extends StatefulWidget {
  const BlocPatternPage({super.key});

  @override
  State<BlocPatternPage> createState() => _BlocScrumsPageState();
}

class _BlocScrumsPageState extends State<BlocPatternPage> {
  final weightEC = TextEditingController();
  final heightEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = BlocPatternController();

  @override
  void dispose() {
    weightEC.dispose();
    heightEC.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Pattern'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                StreamBuilder<ImcState>(
                  stream: controller.imcOut,
                  builder: (context, snapshot) {
                    var imc = snapshot.data?.imc ?? 0;
                    return GraphicRange(imc: imc);
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

                      controller.calculateImc(weight: weight, height: height);
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

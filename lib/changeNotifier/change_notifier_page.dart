import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

import '../widgets/graphic_range.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  final weightEC = TextEditingController();
  final heightEC = TextEditingController();

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
          child: Column(
            children: [
              const GraphicRange(imc: 0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: weightEC,
                  maxLength: 6,
                  inputFormatters: [
                    CurrencyTextInputFormatter(
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
                  controller: heightEC,
                  maxLength: 4,
                  inputFormatters: [
                    CurrencyTextInputFormatter(decimalDigits: 2, symbol: ''),
                  ],
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Informe sua altura'),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Calcular IMC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

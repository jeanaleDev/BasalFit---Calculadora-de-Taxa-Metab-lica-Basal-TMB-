import 'package:flutter/material.dart';
import 'package:projeto_app_tmb/models/nivel_atividade.dart';
import 'package:projeto_app_tmb/models/sexo.dart';
import 'package:projeto_app_tmb/widgets/app_text_form_field.dart';
import 'package:projeto_app_tmb/widgets/calculo_tmb.dart';
import 'package:projeto_app_tmb/widgets/custom_drawer.dart';
import 'package:projeto_app_tmb/widgets/result_card.dart';
import 'package:projeto_app_tmb/widgets/theme_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  final _idadeCtrl = TextEditingController();
  final _pesoCtrl = TextEditingController();
  final _alturaCtrl = TextEditingController();

  Sexo? _sexoSelecionado;
  double? _resultadoTmb;
  NivelAtividade? _nivelAtividadeSelecionado;

  @override
  void dispose() {
    _idadeCtrl.dispose();
    _pesoCtrl.dispose();
    _alturaCtrl.dispose();
    super.dispose();
  }

  void _calcularTmb() {
    if (!_formKey.currentState!.validate()) return;

    if (_sexoSelecionado == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Selecione o sexo")));
      return;
    }
    if (_nivelAtividadeSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selecione o nível de atividade!")),
      );
      return;
    }

    final calculo = CalculoTmb(
      sexo: _sexoSelecionado!,
      nivelAtividade: _nivelAtividadeSelecionado!,

      idade: int.parse(_idadeCtrl.text),
      peso: double.parse(_pesoCtrl.text),
      altura: double.parse(_alturaCtrl.text),
    );

    setState(() {
      _resultadoTmb = calculo.calcularTmb();
    });
  }

  void _limparResultado() {
    if (_resultadoTmb != null) {
      setState(() => _resultadoTmb = null);
    }
  }

  void _resetar() {
    _formKey.currentState?.reset();
    _idadeCtrl.clear();
    _alturaCtrl.clear();
    _pesoCtrl.clear();
    setState(() {
      _sexoSelecionado = null;
      _nivelAtividadeSelecionado = null;
      _resultadoTmb = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _resetar,
            icon: Icon(Icons.refresh, color: AppTheme.textColor),
          ),
        ],
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          "BasalFit",
          style: TextStyle(color: AppTheme.textColor, fontSize: 26),
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),

                AppTextFormField(
                  controller: _idadeCtrl,
                  label: "Idade",
                  icon: Icons.person_outline,
                  keyBoardType: TextInputType.number,
                  onChanged: (_) => _limparResultado(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe a idade";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 14),

                AppTextFormField(
                  controller: _pesoCtrl,
                  label: "Peso (kg)",
                  icon: Icons.balance_outlined,
                  keyBoardType: TextInputType.number,
                  onChanged: (_) => _limparResultado(),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe o peso";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 14),

                AppTextFormField(
                  controller: _alturaCtrl,
                  label: "Altura (cm)",
                  icon: Icons.height,
                  keyBoardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (_) => _limparResultado(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe a altura";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                Text(
                  "Sexo",
                  style: TextStyle(fontSize: 18, color: AppTheme.primaryColor),
                ),

                DropdownButtonFormField<Sexo>(
                  dropdownColor: AppTheme.primaryColor,
                  style: TextStyle(color: AppTheme.textColor),
                  initialValue: _sexoSelecionado,
                  decoration: _dropDownDecoration(),
                  hint: Text(
                    "Selecione o sexo",
                    style: TextStyle(color: AppTheme.textColor),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: Sexo.masculino,
                      child: Text("Masculino"),
                    ),
                    DropdownMenuItem(
                      value: Sexo.feminino,
                      child: Text("Feminino"),
                    ),
                  ],
                  onChanged: (value) =>
                      setState(() => _sexoSelecionado = value),
                ),

                const SizedBox(height: 20),
                Text(
                  "Nível de atividade física",
                  style: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
                ),
                SizedBox(height: 6),
                DropdownButtonFormField<NivelAtividade>(
                  dropdownColor: AppTheme.primaryColor,
                  style: TextStyle(color: AppTheme.textColor),
                  initialValue: _nivelAtividadeSelecionado,
                  decoration: _dropDownDecoration(),
                  hint: Text(
                    "Selecione o nível",
                    style: TextStyle(color: AppTheme.textColor),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: NivelAtividade.sedentario,
                      child: Text("Sedentário"),
                    ),
                    DropdownMenuItem(
                      value: NivelAtividade.leve,
                      child: Text('Leve (1-3x/semana)'),
                    ),
                    DropdownMenuItem(
                      value: NivelAtividade.moderado,
                      child: Text('Moderado (3-5/semana)'),
                    ),
                    DropdownMenuItem(
                      value: NivelAtividade.intenso,
                      child: Text('Intenso (6-7/semana)'),
                    ),
                  ],

                  onChanged: (value) {
                    setState(() {
                      _nivelAtividadeSelecionado = value;
                      _resultadoTmb = null;
                    });
                  },
                ),
                SizedBox(height: 26),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                    ),
                    onPressed: _calcularTmb,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: AppTheme.textColor, fontSize: 18),
                    ),
                  ),
                ),

                if (_resultadoTmb != null) ...[
                  const SizedBox(height: 24),
                  ResultCard(tmb: _resultadoTmb!),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _dropDownDecoration() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppTheme.primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
      ),
    );
  }
}

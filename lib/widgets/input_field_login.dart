import 'package:flutter/material.dart';
import 'package:projeto_app_tmb/pages/home_page.dart';
import 'package:projeto_app_tmb/widgets/app_text_form_field.dart';
import 'package:projeto_app_tmb/widgets/theme_data.dart';

class InpTextField extends StatefulWidget {
  const InpTextField({super.key});

  @override
  State<InpTextField> createState() => _InpTextFieldState();
}

class _InpTextFieldState extends State<InpTextField> {
  final _formctrl = GlobalKey<FormState>();
  final _emailcrtl = TextEditingController();
  final _senhacrtl = TextEditingController();

  @override
  void dispose() {
    _emailcrtl.dispose();
    _senhacrtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formctrl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bem-vindo,",
            style: TextStyle(fontSize: 28, color: AppTheme.textColor),
          ),
          SizedBox(height: 40),
          AppTextFormField(
            controller: _emailcrtl,
            label: 'E-mail',
            icon: Icons.email_outlined,
            keyBoardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Informe seu Email";
              }
              if (!value.contains("@")) {
                return "Email inválido";
              }
              return null;
            },
          ),
          SizedBox(height: 22),
          AppTextFormField(
            controller: _senhacrtl,
            label: "Senha",
            icon: Icons.lock_outline,
            keyBoardType: TextInputType.number,
            obscureText: true,
            validator: (value) {
              if (value == null || value.length < 6) {
                return "Mínimo de 6 caracteres";
              }
              return null;
            },
          ),
          SizedBox(height: 18),
          InkWell(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Esqueceu sua senha?",
                style: TextStyle(color: AppTheme.textColor),
              ),
            ),
          ),
          SizedBox(height: 44),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
              ),
              onPressed: () {
                final ok = _formctrl.currentState?.validate() ?? false;
                if (!ok) return;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
              child: Text(
                "Entrar",
                style: TextStyle(fontSize: 18, color: AppTheme.textColor),
              ),
            ),
          ),
          SizedBox(height: 18),
          InkWell(
            onTap: () {},
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Não tem conta? Cadastre-se",
                style: TextStyle(fontSize: 14, color: AppTheme.textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

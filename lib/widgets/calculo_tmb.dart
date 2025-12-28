import 'package:projeto_app_tmb/models/nivel_atividade.dart';
import 'package:projeto_app_tmb/models/sexo.dart';

class CalculoTmb {
  final Sexo sexo;
  final int idade;
  final double peso;
  final double altura;
  final NivelAtividade nivelAtividade;

  CalculoTmb({
    required this.sexo,
    required this.peso,
    required this.altura,
    required this.idade,
    required this.nivelAtividade,
  });

  double calcularTmb() {
    double tmbBase;
    if (sexo == Sexo.masculino) {
      tmbBase = 88.36 + (13.4 * peso) + (4.8 * altura) - (5.7 * idade);
    } else {
      tmbBase = 447.6 + (9.2 * peso) + (3.1 * altura) - (4.3 * idade);
    }
    return tmbBase * nivelAtividade.fator;
  }
}

enum NivelAtividade { sedentario, leve, moderado, intenso }

extension NivelAtividadeExt on NivelAtividade {
  double get fator {
    switch (this) {
      case NivelAtividade.sedentario:
        return 1.2;
      case NivelAtividade.leve:
        return 1.375;
      case NivelAtividade.moderado:
        return 1.55;
      case NivelAtividade.intenso:
        return 1.725;
    }
  }

  String get descricao {
    switch (this) {
      case NivelAtividade.sedentario:
        return 'Sedentário';
      case NivelAtividade.leve:
        return 'Leve (1-3x/semana)';
      case NivelAtividade.moderado:
        return 'Moderado (3-5x/semana)';
      case NivelAtividade.intenso:
        return 'Intenso (6-7x/semana)';
    }
  }
}

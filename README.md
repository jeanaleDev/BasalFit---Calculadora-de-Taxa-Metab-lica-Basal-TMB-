# projeto_app_tmb

A new Flutter project.
O BasalFit é um aplicativo mobile desenvolvido em Flutter, focado no cálculo da Taxa Metabólica Basal (TMB) e do gasto calórico diário, utilizando a fórmula de Harris-Benedict, considerada uma das mais precisas na área de nutrição.
O app permite ao usuário informar dados pessoais e selecionar o nível de atividade física, retornando um cálculo confiável e de fácil entendimento.

Funcionalidades:
. Cálculo da TMB com base na fórmula de Harris-Benedict
.Seleção de nível de atividade física
.Seleção de sexo
.Validação de formulários
.Interface padronizada com ThemeData
.Botão de reset para novo cálculo
.Layout responsivo

Formula Utilizada:
TMB(masculino) = 88.36 + (13.4 * peso) + (4.8 * altura) - (5.7 * idade)
TMB(femenino) = 447.6 + (9.2 * peso) + (3.1 * altura) - (4.3 * idade)
  
Tecnologias utilizadas:
.Flutter
.Dart
.Material Design
.Gerenciamento de estado com setState
.Componentização de widgets
.Enums para regras de negócio    


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

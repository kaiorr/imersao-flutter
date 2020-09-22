import 'package:builder/builder/funcionario_builder.dart';
import 'package:builder/model/filho_model.dart';

void execute() {
  var FuncionarioImpressao = FuncionarioBuilder.instance
      .nome("Kaio Ribeiro")
      .idade(33)
      .profissao("Software Developer")
      .addFilho(FilhoModel(nome: 'Anna Vitória', idade: 3))
      .build();
  print(FuncionarioImpressao);
}

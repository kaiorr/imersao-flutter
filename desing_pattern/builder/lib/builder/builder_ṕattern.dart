import 'package:builder/builder/funcionario_builder.dart';
import 'package:builder/dio/custom_dio_builder.dart';
import 'package:builder/model/filho_model.dart';

Future<void> execute() async {
  var FuncionarioImpressao = FuncionarioBuilder.instance
      .nome("Kaio Ribeiro")
      .idade(33)
      .profissao("Software Developer")
      .addFilho(FilhoModel(nome: 'Anna Vitória', idade: 3))
      .build();
  print(FuncionarioImpressao);

  print('########### ABAIXO IMPLEMENTACAO DO CUSTOM DIO ############');

  print('Method: POST');
  var response = await CustomDioBuilder.instance
      .post()
      .path('http://jsonplaceholder.typicode.com/posts')
      .addHeader('Content-Type', 'application/json')
      .params()
      .data({'titile': 'titulo', 'body': 'Corpo', 'userId': 1}).run();
  var resultPost = response;

  print(resultPost.data);

  print('#################################################');

  print('Method: GET');
  var resultGet = await CustomDioBuilder.instance
      .get()
      .path('http://jsonplaceholder.typicode.com/posts')
      .params()
      .queryParameters()
      .addQueryParam('userId', 1)
      .run();

  print(resultGet.data);
}

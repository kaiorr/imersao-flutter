void main() {
  contaCorrente conta1 = contaCorrente();
  contaCorrente conta2 = contaCorrente();

  conta1.titular = "Kaio Rocha Ribeiro";
  conta2.titular = "Kaio Ribeiro Roc";
  conta1.agencia = 1234;
  conta1.conta = 123456;
  conta1.saldo = 150.00;
  print("Titular: ${conta1.titular}");
  print("Titular: ${conta2.titular}");
}

class contaCorrente {
  String titular;
  int agencia;
  int conta;
  double saldo;
}

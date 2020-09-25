void main() {
  contaCorrente conta = contaCorrente();
  conta.titular = "Kaio Rocha Ribeiro";
  conta.agencia = 1234;
  conta.conta = 123456;
  conta.saldo = 150.00;
  print("Titular: ${conta.titular}");
  print("Agencia: ${conta.agencia}");
  print("Agencia: ${conta.conta}");
  print("Saldo: ${conta.saldo}");
}

class contaCorrente {
  String titular;
  int agencia;
  int conta;
  double saldo;
}

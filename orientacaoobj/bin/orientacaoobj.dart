void main() {
  contaCorrente contaKaio = contaCorrente();
  contaKaio.titular = "Kaio Ribeiro";

  contaKaio.deposito(50.00);
  print("Valor depositado ${contaKaio.deposito}");
  print("Titular, ${contaKaio.titular}: ${contaKaio.saldo} ");
  contaKaio.saque(80.00);
}

class contaCorrente {
  String titular;
  int agencia;
  int conta;
  double saldo = 20.00;

  void saque(double valorSaque) {
    if (this.saldo - valorSaque <= -100) {
      print(
          "O limite do cheque especial é R${100.00}, o valor do seu saque ultrapassa esse valor ");
    } else {
      print("Sacando $valorSaque ");
      this.saldo -= valorSaque;
      print("Saldo Final $saldo");
    }
  }

  void deposito(double valorDeposito) {
    this.saldo += valorDeposito;
  }
}

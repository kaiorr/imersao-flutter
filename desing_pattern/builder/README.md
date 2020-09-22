# Builder

>Builder é um padrão de projeto de software criacional que permite a separação da construção de um objeto complexo da sua representação, de forma que o mesmo processo de construção possa criar diferentes representações.

## Utilização

O padrão Builder pode ser utilizado em uma aplicação que converte o formato de texto RTF para uma série de outros formatos e que permite a inclusão de suporte para conversão para outros formatos, sem a alteração do código fonte do leitor de RTF.

A implementação da solução para esse problema pode ser realizada através de uma classe de leitura (director) associada a uma classe capaz de converter o formato RTF para outra representação (builder). O objeto da classe de leitura lê cada token do texto e executa o método apropriado no objeto de conversão, de acordo com tipo do token. A classe de conversão possui um método para cada tipo de token, incluindo os caracteres comuns, parágrafos, fontes e etc. Para cada formato de texto suportado é criada uma classe de conversão especializada (concrete builder). Um conversor para formato ASCII, por exemplo, poderia ignorar qualquer requisição para converter tokens que não fossem caracteres comuns. Um conversor para o formato PDF, por outro lado, iria processar qualquer requisição para poder converter o estilo, além do texto.

### Exemplo em Java

```
  abstract class ConversorTexto {
 	public void converterCaractere(char c) {
 		// vazio
 	}

 	public void converterParagrafo() {
 		// vazio
 	}

 	public void converterFonte(Fonte f) {
 		// vazio
 	}
 }

 class ConversorPDF extends ConversorTexto {
 	public void converterCaractere(char c) {
 		System.out.print("Caractere PDF");
 	}

 	public void converterParagrafo() {
 		System.out.print("Parágrafo PDF");
 	}

 	public void converterFonte(Fonte f) {
 		System.out.print("Fonte PDF");
 	}
 }

 class ConversorTeX extends ConversorTexto {
 	public void converterCaractere(char c) {
 		System.out.print("Caractere Tex");
 	}

 	public void converterParagrafo() {
 		System.out.print("Paragrafo Tex");
 	}

 	public void converterFonte(Fonte f) {
 		System.out.print("Fonte Tex");
 	}
 }

 class ConversorASCII extends ConversorTexto {
 	public void converterCaractere(char c) {
 		System.out.print("Caractere ASCII");
 	}
 }

 class LeitorRTF {

 	private ConversorTexto conversor;

 	LeitorRTF(ConversorTexto c) {
 		this.conversor = c;
 	}

 	public void lerRTF() {

 		List<Token> tokens = obterTokensDoTexto();

 		for (Token t : tokens) {
 			if (t.getTipo() == Token.Tipo.CARACTERE) {
 				conversor.converterCaractere(t.getCaractere());
 			}
 			if (t.getTipo() == Token.Tipo.PARAGRAFO) {
 				conversor.converterParagrafo();
 			}
 			if (t.getTipo() == Token.Tipo.FONTE) {
 				conversor.converterFonte(t.getFonte());
 			}
 		}
 	}
 }

 public class Cliente {

 	public static void main(String[] args) {

 		ConversorTexto conversor;
 		if (args[0].equals("pdf")) {
 			conversor = new ConversorPDF();
 		} else if (args[0].equals("tex")) {
 			conversor = new ConversorTeX();
 		} else {
 			conversor = new ConversorASCII();
 		}
 		LeitorRTF leitor = new LeitorRTF(conversor);

 		leitor.lerRTF();
 	}
 }

```

### Vantagens

* Permite variar a representação interna de um produto;
* Encapsula o código entre construção e representação;
* Provê controle durante o processo de construção.

### Contras
* Requer criar um concrete builder específico para cada instância diferente do produto.

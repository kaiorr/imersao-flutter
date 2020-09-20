# Singleton


> Alguns projetos necessitam que algumas classes tenham apenas uma instância. Por exemplo, em uma aplicação que precisa de uma infraestrutura de log de dados, pode-se implementar uma classe no padrão singleton. Desta forma existe apenas um objeto responsável pelo log em toda a aplicação que é acessível unicamente através da classe singleton.

***Exemplo***

```public class SingletonDuplaVerificacao {

	private static SingletonDuplaVerificacao instance;

	private SingletonDuplaVerificacao() {}

	public static SingletonDuplaVerificacao getInstance() {
		if(instance == null) {
			synchronized(SingletonDuplaVerificacao.class) {
				if(instance == null) {
					instance = new SingletonDuplaVerificacao();
				}
			}
		}
		return instance;
	}

}
    Como usar:
        1: Deixar o construtor privado, assim evitando qualquer criar um NEW.
        2: Atributos privados e Estatico do mesmo tipo da classe instance
        3: Metodo getInstance();
```

Em um dos parágrafos do Item 3 do livro de Joshua Bloch, ele diz:

>"Essa abordagem é funcionalmente equivalente à abordagem de campo público, exceto por ser mais concisa, fornecer o mecanismo de serialização facilmente e fornecer uma garantia sólida contra a instanciação múltipla, mesmo no caso de serialização sofisticada ou ataques de reflexão. Embora ela ainda tenha que ser amplamente adotada, um tipo enum com apenas um elemento é a melhor maneira de implementar um singleton."

## Benefícios

* Permite o controle sobre como e quando os clientes acessam a instância.
* Várias classes singleton podem obedecer uma mesma interface, permitindo assim que um singleton em particular seja escolhido para trabalhar com uma determinada aplicação em tempo de execução.
* Com apenas uma implementação interna do singleton pode-se fazer com que o singleton crie um número controlado de instâncias.
* É mais flexível que métodos estáticos por permitir o polimorfismo.

## Contras

* Acoplamento: Usando Singleton você estará acoplando o seu código em uma implementação estática e específica. Isso faz o seu código dependente dessa classe e impede, por exemplo, criar mocks em testes unitários.
* Escopo: Se você por alguma razão decidir que para determinado componente da aplicação você precisa de outra implementação terá que alterar manualmente todas as classes.
* Falsa segurança: No java, por exemplo, não existe uma classe apenas por JVM. O conceito de carregamento de classes em java é feito por ***ClassLoader***.

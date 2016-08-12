# Desenvolvimento de Aplicações Web

**Data de Entrega: 24/08/2016 às 23h59**

**Trabaho Individual**

**Valor: 6 pontos**

## Banco de dados: Pokedex

A caçada por pokemons está mais acirrada do que nunca!! 

Neste trabalho, você deverá modelar um banco de dados relacional para armazenamento de informações de pokemons. Essa modelagem deverá permitir o armazenamento dos dados de cada pokemon e sua evolução. Além disso, todo pokemon deve possuir um tipo pre-definido atrelado a ele e os locais onde ele aparece.

Ao consultar os projetistas do banco de dados, eles decidiram estruturá-lo na seguinte estrutura:

* Entidade: Pokemon
	* Atributos: Nome, peso, pontos de ataque, pontos de defesa
* Entidade: Tipo
	* Atributos: Nome 
* Entidade: Localização
	* Atributos: Local, Latitude, Longitude

Você deverá implementar os seguintes diagramas:

* **Modelo conceitual:** Diagrama entidade-relacionamento
* **Modelo lógico:** Diagrama relacional
* **Implementação:** Script SQL com a estrutura do banco 


### Forma de Entrega

O trabalho deverá ser entregue por meio de um *fork* desse repositório, que deverá conter pelo menos três commits (um para cada diagrama).
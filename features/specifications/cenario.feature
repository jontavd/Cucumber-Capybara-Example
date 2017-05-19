# language: pt

Funcionalidade: Validando o FrontEnd

Cenario: Exemplo de carrinho de compra de TV e cadastro

    Dado que eu esteja no Walmart deslogado
    Quando eu procurar por "tv" e validar os resultados
    E escolher um produto de posicao "2" da lista para adicionar ao carrinho
    E efetuar o login cancelando o pedido na etapa final
    Entao o produto continuará no carrinho com o usuario logado
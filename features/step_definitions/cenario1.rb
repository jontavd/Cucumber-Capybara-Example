# encoding: utf-8

$user = ENV['user']
$pass = ENV['pass']

Dado(/^que eu esteja no Walmart deslogado$/) do
    @site = EntryPage.new
    @site.paginainicial
    assert @site.nao_logado?
end

Quando(/^eu procurar por "([^"]*)" e validar os resultados$/) do |produto|
  @site.buscarproduto(produto)
  assert @site.trouxeresultados?
end

Quando(/^escolher um produto de posicao "([^"]*)" da lista para adicionar ao carrinho$/) do |item|
  produtoescolhido = @site.escolherprodutodalista(item)  
  assert @site.adicionar?
  produtonocarrinho = @site.verificarcarrinho
  @site.confirmarcompra
end

Quando(/^efetuar o login cancelando o pedido na etapa final$/) do
  @site.efetuarlogin
  @site.confirmarentrega
  @site.cancelapedida
end

Entao(/^o produto continuará no carrinho com o usuario logado$/) do
  @site.validaproduto
end


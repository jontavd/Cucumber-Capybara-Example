class EntryPage
  include Capybara::DSL

  def paginainicial
    visit "http://www.walmart.com"
  end

  def nao_logado?
    (page.has_content?('Entre') and page.has_content?('Cadastre-se'))
  end

  def logado?
    page.has_content?(:xpath, '//*[@id="site-topbar"]/div[2]/div[3]/a')
  end

  def buscarproduto(produto)
    fill_in 'suggestion-search', with: produto
    find('button.search-icon').click
  end

  def trouxeresultados? 
    resultado = find(:xpath, '//*[@id="sort-by"]/span[1]').text
    puts 'Encontrado ' + resultado + ' para a busca do termo '
    resultado.to_i > 0
  end

  def escolherprodutodalista(posicao)
    produtoescolhido = find(:xpath, '//*[@id="product-list"]/section/ul/li['+posicao.to_s+']/section/a/span')
    puts 'Escolhendo o produto: ' + produtoescolhido.text.to_s + ' para o carrinho'
    produtoescolhido.click
  end

  def adicionar?
    produto = find(:xpath, '//*[@id="buybox"]/div/div[2]/div/div/div[2]/button')
    produto.click
    #TODO exceção garantia
    # if find(:xpath, '//*[@id="navegaCarrinho"]').exists?
    #  find(:xpath, '//*[@id="navegaCarrinho"]').click
    # end
  end

  def verificarcarrinho
    find(:xpath, '//*[@id="site-topbar"]/div[2]/div[1]/a').click
    produtodeslogado = find(:xpath, '//*[@id="main"]/div/section/div/article/ul/li/div/div[2]/div/div[1]/a')
    puts 'Produto no carrinho deslogado: ' + produtodeslogado.text.to_s
  end

  def confirmarcompra
    find(:xpath, '//*[@id="main"]/div/section/div/div[1]/div/button').click
  end

  def efetuarlogin
    within_frame(:css, '#iframeLogin') do
      find(:css, '#signinField').set $user
      find(:css, '#password').set $pass
      find(:css, '#signinButtonSend').click
    end
  end

  def confirmarentrega
    find(:xpath, '//*[@id="btn-set-delivery"]').click
    produtoentrega = find(:xpath, '/html/body/div[1]/section/div/div/div[2]/section[1]/article[1]/ul/li/div')
    puts 'Produto na tela de entrega: ' + produtoentrega.text.to_s 
    find(:xpath, '/html/body/div[1]/section/div/div/section/a').click
    produtofatura = find(:xpath, '/html/body/div[1]/section/div/div/div[3]/section/article[1]/ul/li[2]/div[1]/span[1]')
    puts 'Produto na tela de pagamento: ' + produtofatura.text.to_s
  end

  def cancelapedida
    find(:xpath, '//*[@id="deliveryItemButton"]/span').click
  end

  def validaproduto
    produtologado = find(:xpath, '//*[@id="main"]/div/section/div/article/ul/li/div/div[2]/div/div[1]/a')
    puts 'Produto no carrinho logado: ' + produtologado.text.to_s
  end

end
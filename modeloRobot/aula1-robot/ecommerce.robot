Código de teste:
** Settings **
Library  SeleniumLibrary

** Variables **
${login}                 id:user-name
${senha}                 id:password
${button_login}          id:login-button
${mochila}               id:add-to-cart-sauce-labs-backpack
${camiseta}              id:add-to-cart-sauce-labs-onesie
${lanterna}              id:add-to-cart-sauce-labs-bike-light
${carrinho}              class:shopping_cart_link
${checkout}              id:checkout
${nome}                  id:first-name
${sobrenome}             id:last-name
${cep}                   id:postal-code
${continue}              id:continue
${finalizar}             id:finish
${mensagem}              class:complete-header

** Keywords **
Dado que eu acesso o site 
      Open Browser     url=https://www.saucedemo.com/  browser=Chrome

E preencher os campos de login
    Input Text         ${login}     standard_user
    Input Text         ${senha}     secret_sauce

E clicar no botão de login
    Click Button       ${button_login}    

E adicionar itens no carrinho de compras
    Click Button       ${mochila}
    Click Button       ${lanterna}   
    Click Button       ${camiseta}
    Click Element      ${carrinho} 

E clicar em Checkout 
    Click Button       ${checkout} 

Quando preencher o endereço de entrega 
    Input Text        ${nome}         Ana  
    Input Text        ${sobrenome}    Silva
    Input Text        ${cep}          82810-000
    Click Button      ${continue}
    Click Button      ${finalizar}
   
Então verificar se existe a mensagem Obrigado pelo pedido
    Element Should Be Visible   ${mensagem}

** Test Cases **
Cenário 1: Preencher login e clicar no botão se Login e adicionar itens no carrinho
   Dado que eu acesso o site 
   E preencher os campos de login
   Sleep     2s
   E clicar no botão de login
   Sleep     2s
   E adicionar itens no carrinho de compras
   Sleep     2s
   E clicar em Checkout
   Sleep     2s
   Quando preencher o endereço de entrega
   Sleep     3s
   Então verificar se existe a mensagem Obrigado pelo pedido
   Sleep     2s

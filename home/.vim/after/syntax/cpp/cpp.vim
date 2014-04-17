" Added some support for C++11 lambdas.
syn match cpp11_lambda "[[a-zA-Z0-9&= ,]*] *(.*)( *{)\@=" conceal cchar=λ
syn match cpp11_lambda "[[a-zA-Z0-9&= ,]*]( *{)\@=" conceal cchar=λ"})})"

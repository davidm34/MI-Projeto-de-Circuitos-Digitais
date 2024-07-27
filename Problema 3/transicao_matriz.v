module transicao_matriz(q, frequencia, linha_cheia);

input [2:0]q;
input frequencia;
output linha_cheia; 


and (linha_cheia, q[2], q[1], q[0]);



endmodule 
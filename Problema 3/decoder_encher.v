module decoder_encher(q, frequenciapiscar, l );

input [3:0]q;
input frequenciapiscar;
output [6:0]l;


and (cont0, !q[2], !q[1], !q[0]);
and (linha1_enche, cont0, frequenciapiscar);
not (cont0_n, cont0);
nor (l[6], linha1_enche, cont0_n);


// ESTADO DE APAGADA 
and (linha2_apagada, cont0, 1);

and (cont1, !q[2], !q[1], q[0]);
and (linha2_enche, cont1, frequenciapiscar);
not (cont1_n, cont1);
nor (saida_ligada1, linha2_enche, cont1_n);
or (l[5], saida_ligada1, linha2_apagada);


// ESTADO DE APAGADA 
and(linha3_apagada, !q[2], !q[1]);


// ESTADO PARA PISCAR E LIGAR 
and (cont2, !q[2], q[1], !q[0]);
and (linha3_enche, cont2, frequenciapiscar);
not (cont2_n, cont2);
nor (saida_ligada2, linha3_enche, cont2_n);
or (l[4], saida_ligada2, linha3_apagada); 


// ESTADO DE APAGADA
and (s1, !q[2], !q[0]);
and (s2, !q[2], !q[1]);
or (linha4_apagada, s1, s2);

// ESTADO PISCAR E LIGAR 
and (cont3, !q[2], q[1], q[0]);
and (linha4_enche, cont3, frequenciapiscar);
not (cont3_n, cont3);
nor (saida_ligada3, linha4_enche, cont3_n);
or (l[3], saida_ligada3, linha4_apagada);

// ESTADO DE APAGADA
and (linha5_apagada, 1, !q[2]);


// ESTADO PISCAR E LIGAR 
and (cont4, q[2], !q[1], !q[0]);

and (linha5_enche, cont4, frequenciapiscar);
not (cont4_n, cont4);
nor (saida_ligada4, linha5_enche, cont4_n);
or (l[2], saida_ligada4, linha5_apagada); 


// ESTADO DE APAGADA
and (s7, !q[1]	, !q[0]);
or (linha6_apagada, s7, !q[2]);

// ESTADO PISCAR LIGAR 
and (cont5, q[2], !q[1], q[0]);
and (linha6_enche, cont5, frequenciapiscar);
not (cont5_n, cont5);
nor (saida_ligada5, linha6_enche, cont5_n);
or (l[1],saida_ligada5, linha6_apagada);

// ESTADO DE APAGADA
or (saida7_apagada, !q[2], !q[1]); 


and (cont6, q[2], q[1], !q[0]);
and (linha7_enche, cont6, frequenciapiscar);
and (cont6_n, q[2], q[1], q[0]);
nor (saida_ligada6, linha7_enche, cont6_n);
or (l[0], saida_ligada6, saida7_apagada); 



endmodule 
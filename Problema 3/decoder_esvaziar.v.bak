module decoder_esvaziar(q, frequenciapiscar, l);

input [3:0]q;
input frequenciapiscar;
output [6:0]l;

// linha 0 
and (cont6, q[2], q[1], q[0]);
and (linha0_esvazia, cont6, frequenciapiscar);
not (cont6_n, cont6);
or (l[0], linha0_esvazia, cont6_n);


// linha 1
or (linha1_desligada, !q[2], !q[1]);
and (cont5, q[2], q[1], !q[0]);
and (linha1_esvazia, cont5, frequenciapiscar);
or (l[1], linha1_esvazia,linha1_desligada);



// linha 2 
and (s1, !q[1], !q[0]);
or (linha2_desligada, s1, !q[2]);

and (cont4, q[2], !q[1], q[0]);
and (linha2_esvazia, cont4, frequenciapiscar);

or (l[2], linha2_esvazia, linha2_desligada);


// linha 3 
and (cont3, q[2], !q[1], !q[0]);
and (linha3_esvazia, cont3, frequenciapiscar);
or (l[3], linha3_esvazia, cont3_n, !q[2]);


// linha 4 
and (s3, !q[2], !q[0]);
and (s4, !q[2], !q[1]);
or (linha4_deligada, s3,s4);

and (cont2, !q[2], q[1], q[0]);
and (linha4_esvazia, cont2, frequenciapiscar);
or (l[4], linha4_esvazia, linha4_deligada);


// linha 5 
and (linha5_desligada, !q[2], !q[1]);
and (cont1, !q[2], q[1], !q[0]);
and (linha5_esvazia, cont1, frequenciapiscar);

or (l[5], linha5_esvazia, linha5_desligada);


// linha 6 
and (linha6_apagada, !q[2], !q[1], !q[0]);
and (cont0, !q[2], !q[1], q[0]);
and (linha6_esvazia, cont0, frequenciapiscar);

or (l[6], linha6_esvazia,linha6_apagada );


endmodule 

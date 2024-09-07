/*
    -identificação: 

Guia_0608 - 07 / 09 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- Expressão completa-------------- // 
module f08a ( output s, input x, input y, input w, input z );
    // definir dado local

     assign s = (~x & ~y & w & z) | (x & y & w & z) | (x & ~y & w & z) | (x & ~y & ~w & ~z) ;

endmodule 

// ----------- Expressão simplificada pelo mapa de Veitch-Karnaugh-------------- // 
module sf08a ( output s, input x, input y, input w, input z );
    // definir dado local

  assign s = (w & z) & (~y | x) | (x & ~y & ~w & ~z) ;
endmodule 


module test_f08;
// ------------------------- definir dados
    reg x;
    reg y;
    reg w;
    reg z;

 wire a, aS;
 f08a moduloA ( a, x, y, w, z );
 sf08a moduloSA ( aS, x, y, w, z );

// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0608 - Davi Cândido - 857859");
    $display("Test module");
    $display("   x    y    w    z    a    Sa");
    // projetar testes do modulo
    $monitor("%4b %4b %4b %4b %4b %4b ", x, y, w, z, a, aS);
    x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b0;
    #1 x = 1'b0; y = 1'b0; w = 1'b0; z = 1'b1;
    #1 x = 1'b0; y = 1'b0; w = 1'b1; z = 1'b1;
    #1 x = 1'b0; y = 1'b0; w = 1'b1; z = 1'b0;
    #1 x = 1'b0; y = 1'b1; w = 1'b1; z = 1'b0;
    #1 x = 1'b0; y = 1'b1; w = 1'b1; z = 1'b1;
    #1 x = 1'b0; y = 1'b1; w = 1'b0; z = 1'b1;
    #1 x = 1'b0; y = 1'b1; w = 1'b0; z = 1'b0;
    #1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b0;
    #1 x = 1'b1; y = 1'b1; w = 1'b0; z = 1'b1;
    #1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b1;
    #1 x = 1'b1; y = 1'b1; w = 1'b1; z = 1'b0;
    #1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b0;
    #1 x = 1'b1; y = 1'b0; w = 1'b1; z = 1'b1;
    #1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b1;
    #1 x = 1'b1; y = 1'b0; w = 1'b0; z = 1'b0;

 end
endmodule

/*
Guia_0608 - Davi Cândido - 857859
Test module
   x    y    w    z    a    Sa
   0    0    0    0    0    0 
   0    0    0    1    0    0 
   0    0    1    1    1    1 
   0    0    1    0    0    0 
   0    1    1    0    0    0 
   0    1    1    1    0    0 
   0    1    0    1    0    0 
   0    1    0    0    0    0 
   1    1    0    0    0    0 
   1    1    0    1    0    0 
   1    1    1    1    1    1 
   1    1    1    0    0    0 
   1    0    1    0    0    0 
   1    0    1    1    1    1 
   1    0    0    1    0    0 
   1    0    0    0    1    1 
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0608.vvp Guia_0608.v
Para executar: vvp Guia_0608.vvp
*/


/*
    -identificação: 

Guia_0503 - 29 / 08 / 2024

Nome: Davi Cândido de Almeida
Matricula: 857859
Código de Pessoa: 1527368

*/

// ----------- descrever por portas-------------- // 
module f03a ( output s, input a, input b );
    // definir dado local
    wire not_a;

    nor op1 ( not_a, a, a );
    nor op2 ( s, not_a, b );
endmodule 


// -----------descrever por expressao-------------- // 
module f03b ( output s, input a, input b );


    assign s = ~(~(a|a) | b);
endmodule


// -----------expressao original-------------- // 
module f03c ( output s, input a, input b );


    assign s = ~(~a | b);
endmodule



module test_f5;
// ------------------------- definir dados
 reg x;
 reg y;
 wire a, b;
 f03a moduloA ( a, x, y );
 f03b moduloB ( b, x, y );
 f03c moduloC ( c, x, y );
// ------------------------- parte principal
 initial
 begin : main
    $display("Guia_0503 - Davi Cândido - 857859");
    $display("Test module");
    $display("   x    y   nor  nor  ORI"); //nor - por portas, nor - por expressão, ORI - Expressão original
    // projetar testes do modulo
    $monitor("%4b %4b %4b %4b %4b", x, y, a, b, c);
    x = 1'b0; y = 1'b0;
    #1 x = 1'b0; y = 1'b1;
    #1 x = 1'b1; y = 1'b0;
    #1 x = 1'b1; y = 1'b1;
 end
endmodule

/*
    -Saídas de resultados:

Guia_0503 - Davi Cândido - 857859
Test module
   x    y   nor  nor  ORI
   0    0    0    0    0
   0    1    0    0    0
   1    0    1    1    1
   1    1    0    0    0
*/

/*
    -Notas:

Para compilar: iverilog -o Guia_0503.vvp Guia_0503.v
Para executar: vvp Guia_0503.vvp
*/


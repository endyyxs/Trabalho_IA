

% Estatisticas de Tempo

medir_tempo :-
    statistics(cputime, T1),

    (resolver_enigma(solucao) -> write('\n=== Solucao encontrada ===\n'),
    imprime_lista(solucao)
    ;
    write('\n Erro: Nenhuma solucao possivel (contradicao das pistas) ===\n')
    ),

% Predicado modelo/1

resolver_enigma(solucao) :-
solucao = [
    (Mochila_1, Nome_1, Mes_1, Jogo_1, Materia_1, Suco_1),
    (Mochila_2, Nome_2, Mes_2, Jogo_2, Materia_2, Suco_2),
    (Mochila_3, Nome_3, Mes_3, Jogo_3, Materia_3, Suco_3),
    (Mochila_4, Nome_4, Mes_4, Jogo_4, Materia_4, Suco_4),
    (Mochila_5, Nome_5, Mes_5, Jogo_5, Materia_5, Suco_5)
],

% Mochila

mochila(Mochila_1),
mochila(Mochila_2),
mochila(Mochila_3),
mochila(Mochila_4),
mochila(Mochila_5),
alldifferent([Mochila_1, Mochila_2, Mochila_3, Mochila_4, Mochila_5]),

% O garoto da mochila azul esta em algum lugar a esquerda de quem nasceu em maio
(
    (Mes_2 = maio, Mochila_1 = azul);
    (Mes_3 = maio, Mochila_2 = azul);
    (Mes_3 = maio, Mochila_1 = azul);
    (Mes_5 = maio, Mochila_4 = azul);
    (Mes_5 = maio, Mochila_3 = azul);
    (Mes_5 = maio, Mochila_2 = azul);
    (Mes_5 = maio, Mochila_1 = azul)

),

% Nome

nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),
alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

% Restrições especificas
% Lenin está na quinta posição
Nome_5==lenin ,

% Otávio está em uma das pontas
Nome_1==otavio ,

% O garoto da mochila branca está exatamente à esquerda de Will
(
    (Nome_4==will, Mochila_3==branca);
    (Nome_3==will, Mochila_2==branca);
    (Nome_2==will, Mochila_1==branca)
),

% Joao gosta de historia

(
    (Nome_1==joao, Materia_1==historia);
    (Nome_2==joao, Materia_2==historia);
    (Nome_4==joao, Materia_4==historia);
    (Nome_5==joao, Materia_5==historia)
),

% Will esta ao lado do menino que gosta de ploblema de logica

(
    (Nome_2 = will, Jogo_1 = problemas_de_logica);
    (Nome_2 = will, Jogo_3 = problemas_de_logica);
    (Nome_3 = will, Jogo_2 = problemas_de_logica);
    (Nome_3 = will, Jogo_4 = problemas_de_logica);
    (Nome_4 = will, Jogo_3 = problemas_de_logica);
    (Nome_4 = will, Jogo_5 = problemas_de_logica)
),

% Mes

mes(Mes_1),
mes(Mes_2),
mes(Mes_3),
mes(Mes_4),
mes(Mes_5),
alldifferent([Mes_1, Mes_2, Mes_3, Mes_4, Mes_5]),

% O menino que nasceu no mes de setembro está ao lado de quem gosta de suco de laranja

(Mes_4 = setembro, Suco_5 = laranja) ,

% Jogo

jogo(Jogo_1),
jogo(Jogo_2),
jogo(Jogo_3),
jogo(Jogo_4),
jogo(Jogo_5),
alldifferent([Jogo_1, Jogo_2, Jogo_3, Jogo_4, Jogo_5]),

% Em uma das pontas esta o menino que adora jogar cubo vermelho
(
    (Jogo_1 = cubo_vermelho);
    (Jogo_5 = cubo_vermelho)
),

% O garoto que gosta do jogo da forca esta ao lado do que gosta de 3 ou mais ou 3

(
    (Jogo_1 = jogo_da_forca, Jogo_2 = mais_ou_3);
    (Jogo_2 = jogo_da_forca, Jogo_1 = mais_ou_3);
    (Jogo_2 = jogo_da_forca, Jogo_3 = mais_ou_3);
    (Jogo_3 = jogo_da_forca, Jogo_2 = mais_ou_3);
    (Jogo_3 = jogo_da_forca, Jogo_4 = mais_ou_3);
    (Jogo_4 = jogo_da_forca, Jogo_3 = mais_ou_3);
    (Jogo_4 = jogo_da_forca, Jogo_5 = mais_ou_3);
    (Jogo_5 = jogo_da_forca, Jogo_4 = mais_ou_3)
),

% Materia

materia(Materia_1),
materia(Materia_2),
materia(Materia_3),
materia(Materia_4),
materia(Materia_5),
alldifferent([Materia_1, Materia_2, Materia_3, Materia_4, Materia_5]),

% Suco

suco(Suco_1),
suco(Suco_2),
suco(Suco_3),
suco(Suco_4),
suco(Suco_5),
alldifferent([Suco_1, Suco_2, Suco_3, Suco_4, Suco_5]),

% Na terceira posição está quem gosta de suco de morango
Suco_3 = morango ,

% O garoto que gosta de Biologia gosta de suco de morango
(Materia_3 = biologia, Suco_3 = morango) ,

% Quem gosta de suco de uva está exatamente à esquerda de quem gosta de português
(
    (Suco_2 = uva, Materia_3 = portugues);
    (Suco_4 = uva, Materia_5 = portugues)
),

% quem gosta de suco de uva gosta de problemas_de_logica
(
    (Suco_1 = uva, Jogo_1 = problemas_de_logica);
    (Suco_2 = uva, Jogo_2 = problemas_de_logica);
    (Suco_4 = uva, Jogo_4 = problemas_de_logica)
),

% O menino que gosta de suco de uva esta em algum lugar a direita do garoto da mochila azul
(
    (Mochila_1 = azul, Suco_2 = uva);
    (Mochila_1 = azul, Suco_4 = uva);
    (Mochila_2 = azul, Suco_4 = uva);
    (Mochila_3 = azul, Suco_4 = uva)
),

statistics(cputime, T2),

Tempo is T2 - T1,
write('Tempo de CPU: '), write(Tempo), write(' segundos'), nl,

    write('=== Solucao ==='),
    imprime_lista(solucao).
        
    
% Valores possiveis para cada atributo:

%% Mochilas:
mochila(amarela).
mochila(azul).
mochila(branca).
mochila(verde).
mochila(vermelha).

%% Nomes:
nome(denis).
nome(joao).
nome(lenin).
nome(otavio).
nome(will).

%% Meses:
mes(agosto).
mes(dezembro).
mes(janeiro).
mes(maio).
mes(setembro).

%% Jogos:
jogo(mais_ou_3).
jogo(caca_palavras).
jogo(cubo_vermelho).
jogo(jogo_da_forca).
jogo(problemas_de_logica).

%% Matérias:
materia(biologia).
materia(geografia).
materia(historia).
materia(matematica).
materia(portugues).

%% Sucos:
suco(laranja).
suco(limao).
suco(maracuja).
suco(morango).
suco(uva).

alldifferent([]).
alldifferent([H|T]):- not(member(H,T)),
                      alldifferent(T).

imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
write('\n..........................\n'),
write(H), write(':'),
imprime_lista(T).




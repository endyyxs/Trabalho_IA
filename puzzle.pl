% Predicados Auxiliares

main :- 
    write('Arquivo carregado com sucesso'), nl,
    resolver.

mochila(amarela). mochila(azul). mochila(branca). mochila(verde). mochila(vermelha).
nome(denis). nome(joao). nome(lenin). nome(otavio). nome(will).
mes(dezembro). mes(agosto). mes(janeiro). mes(maio). mes(setembro).
jogo(tres_ou_mais). jogo(cubo_vermelho). jogo(jogo_da_forca). jogo(problemas_de_logica). jogo(caca_palavras).
materia(biologia). materia(geografia). materia(historia). materia(matematica). materia(portugues).
suco(laranja). suco(limao). suco(maracuja). suco(morango). suco(uva).

alldifferent([]).
alldifferent([H|T]) :- 
    not(member(H, T)), 
    alldifferent(T).

imprime_lista([]) :- 
    write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]) :-
    write('\n......................................\n'),
    write(H), write(' : '),
    imprime_lista(T).

% Modelo
modelo([
    (Mochila_1, Nome_1, Mes_1, Jogo_1, Materia_1, Suco_1),
    (Mochila_2, Nome_2, Mes_2, Jogo_2, Materia_2, Suco_2),
    (Mochila_3, Nome_3, Mes_3, Jogo_3, Materia_3, Suco_3),
    (Mochila_4, Nome_4, Mes_4, Jogo_4, Materia_4, Suco_4),
    (Mochila_5, Nome_5, Mes_5, Jogo_5, Materia_5, Suco_5)
]) :-

    % Na primeira posicao esta quem gosta de suco de limao
    Suco_1 = limao,

    % Na terceira posicao esta quem gosta de suco de morango
    Suco_3 = morango,
    suco(Suco_2), suco(Suco_4), suco(Suco_5),
    (Suco_2 \= uva ; true), % Corrigido com parenteses
    alldifferent([Suco_1, Suco_2, Suco_3, Suco_4, Suco_5]),

    % Lenin esta na quinta posicao
    Nome_5 = lenin,
    nome(Nome_1), nome(Nome_2), nome(Nome_3), nome(Nome_4),

    % Otavio esta em uma das pontas
    Nome_1 = otavio, 
    alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

    % Na terceira posicao esta o menino que gosta do jogo da forca
    Jogo_3 = jogo_da_forca,
    jogo(Jogo_1), jogo(Jogo_2), jogo(Jogo_4), jogo(Jogo_5),

    % Em uma das pontas esta o menino que adora jogar cubo vermelho
    ( Jogo_1 = cubo_vermelho ; Jogo_5 = cubo_vermelho ),

    % O garoto que gosta do jogo da forca esta ao lado do que gosta do 3 ou mais
    (
      ( Jogo_2 = tres_ou_mais,Jogo_1=jogo_da_forca ) ; 
      ( Jogo_2 = tres_ou_mais,Jogo_3=jogo_da_forca ) ; 
      ( Jogo_4 = tres_ou_mais,Jogo_3=jogo_da_forca ) ;
      ( Jogo_4 = tres_ou_mais,Jogo_5=jogo_da_forca ) 
    ),
    alldifferent([Jogo_1, Jogo_2, Jogo_3, Jogo_4, Jogo_5]),

    % Meses
    mes(Mes_1), mes(Mes_2), mes(Mes_3), mes(Mes_4), mes(Mes_5),
    alldifferent([Mes_1, Mes_2, Mes_3, Mes_4, Mes_5]),

    % O garoto que gosta de biologia gosta de morango = Na terceira posicao esta quem gosta de suco de morango
    Materia_3 = biologia,
    materia(Materia_1), materia(Materia_2), materia(Materia_4), materia(Materia_5),
    alldifferent([Materia_1, Materia_2, Materia_3, Materia_4, Materia_5]),

    % Mochilas
    mochila(Mochila_1), mochila(Mochila_2), mochila(Mochila_3), mochila(Mochila_4), mochila(Mochila_5),
    alldifferent([Mochila_1, Mochila_2, Mochila_3, Mochila_4, Mochila_5]),

    % Joao gosta de historia
    ( (Nome_1=joao,Materia_1=historia) ; (Nome_2=joao,Materia_2=historia) ;
      (Nome_3=joao,Materia_3=historia) ; (Nome_4=joao,Materia_4=historia) ;
      (Nome_5=joao,Materia_5=historia) ),

    % Quem gosta de suco de uva gosta de problemas de logica
    ( (Suco_1=uva,Jogo_1=problemas_de_logica) ; (Suco_2=uva,Jogo_2=problemas_de_logica) ;
      (Suco_3=uva,Jogo_3=problemas_de_logica) ; (Suco_4=uva,Jogo_4=problemas_de_logica) ;
      (Suco_5=uva,Jogo_5=problemas_de_logica) ),

    % O menino que gosta de matematica nasceu em dezembro
    ( (Materia_1=matematica,Mes_1=dezembro) ; (Materia_2=matematica,Mes_2=dezembro) ;
      (Materia_3=matematica,Mes_3=dezembro) ; (Materia_4=matematica,Mes_4=dezembro) ;
      (Materia_5=matematica,Mes_5=dezembro) ),

    % O dono da Mochila Azul nasceu em janeiro
    ( (Mochila_1=azul,Mes_1=janeiro) ; (Mochila_2=azul,Mes_2=janeiro) ;
      (Mochila_3=azul,Mes_3=janeiro) ; (Mochila_4=azul,Mes_4=janeiro) ;
      (Mochila_5=azul,Mes_5=janeiro) ),

    % Quem gosta de matematica gosta tambem de suco de maracuja
    ( (Materia_1=matematica,Suco_1=maracuja) ; (Materia_2=matematica,Suco_2=maracuja) ;
      (Materia_3=matematica,Suco_3=maracuja) ; (Materia_4=matematica,Suco_4=maracuja) ;
      (Materia_5=matematica,Suco_5=maracuja) ),

    % O garoto da mochila branca esta exatamente a esquerda de Will
    ( (Mochila_1=branca,Nome_2=will) ; (Mochila_2=branca,Nome_3=will) ;
      (Mochila_3=branca,Nome_4=will) ; (Mochila_4=branca,Nome_5=will) ),

    % Quem gosta de suco de uva esta exatamente a esquerda de quem gosta de portugues
    ( (Suco_1=uva,Materia_2=portugues) ; (Suco_2=uva,Materia_3=portugues) ;
      (Suco_3=uva,Materia_4=portugues) ; (Suco_4=uva,Materia_5=portugues) ),

    % O garoto da mochila azul esta em algum lugar a esquerda de quem nasceu em maio
    ( (Mochila_1=azul,(Mes_2=maio;Mes_3=maio;Mes_4=maio;Mes_5=maio)) ;
      (Mochila_2=azul,(Mes_3=maio;Mes_4=maio;Mes_5=maio)) ;
      (Mochila_3=azul,(Mes_4=maio;Mes_5=maio)) ;
      (Mochila_4=azul,Mes_5=maio) ),

    % O menino que gosta de suco de uva esta em algum lugar a direita do garoto da mochila azul
    ( (Mochila_1=azul,(Suco_2=uva;Suco_3=uva;Suco_4=uva;Suco_5=uva)) ;
      (Mochila_2=azul,(Suco_3=uva;Suco_4=uva;Suco_5=uva)) ;
      (Mochila_3=azul,(Suco_4=uva;Suco_5=uva)) ;
      (Mochila_4=azul,Suco_5=uva) ),

    % O menino que nasceu no mes de setembro esta ao lado de quem gosta de suco de laranja
    ( (Mes_1=setembro,Suco_2=laranja) ; (Mes_2=setembro,Suco_1=laranja) ;
      (Mes_2=setembro,Suco_3=laranja) ; (Mes_3=setembro,Suco_2=laranja) ;
      (Mes_3=setembro,Suco_4=laranja) ; (Mes_4=setembro,Suco_3=laranja) ;
      (Mes_4=setembro,Suco_5=laranja) ; (Mes_5=setembro,Suco_4=laranja) ),

    % Will esta ao lado do menino que gosta de problemas de logica
    ( (Nome_1=will,Jogo_2=problemas_de_logica) ; (Nome_2=will,Jogo_1=problemas_de_logica) ;
      (Nome_2=will,Jogo_3=problemas_de_logica) ; (Nome_3=will,Jogo_2=problemas_de_logica) ;
      (Nome_3=will,Jogo_4=problemas_de_logica) ; (Nome_4=will,Jogo_3=problemas_de_logica) ;
      (Nome_4=will,Jogo_5=problemas_de_logica) ; (Nome_5=will,Jogo_4=problemas_de_logica) ),

    % O garoto que gosta do jogo da forca esta ao lado do que gosta do 3 ou mais
    ( (Jogo_1=jogo_da_forca,Jogo_2=tres_ou_mais) ; (Jogo_2=jogo_da_forca,Jogo_1=tres_ou_mais) ;
      (Jogo_2=jogo_da_forca,Jogo_3=tres_ou_mais) ; (Jogo_3=jogo_da_forca,Jogo_2=tres_ou_mais) ;
      (Jogo_3=jogo_da_forca,Jogo_4=tres_ou_mais) ; (Jogo_4=jogo_da_forca,Jogo_3=tres_ou_mais) ;
      (Jogo_4=jogo_da_forca,Jogo_5=tres_ou_mais) ; (Jogo_5=jogo_da_forca,Jogo_4=tres_ou_mais) ),

    % O menino que nasceu em janeiro esta ao lado de quem nasceu em setembro
    ( (Mes_1=janeiro,Mes_2=setembro) ; (Mes_2=janeiro,Mes_1=setembro) ;
      (Mes_2=janeiro,Mes_3=setembro) ; (Mes_3=janeiro,Mes_2=setembro) ;
      (Mes_3=janeiro,Mes_4=setembro) ; (Mes_4=janeiro,Mes_3=setembro) ;
      (Mes_4=janeiro,Mes_5=setembro) ; (Mes_5=janeiro,Mes_4=setembro) ),

    % Quem curte problemas de logica esta ao lado do menino da mochila amarela
    ( (Jogo_1=problemas_de_logica,Mochila_2=amarela) ; (Jogo_2=problemas_de_logica,Mochila_1=amarela) ;
      (Jogo_2=problemas_de_logica,Mochila_3=amarela) ; (Jogo_3=problemas_de_logica,Mochila_2=amarela) ;
      (Jogo_3=problemas_de_logica,Mochila_4=amarela) ; (Jogo_4=problemas_de_logica,Mochila_3=amarela) ;
      (Jogo_4=problemas_de_logica,Mochila_5=amarela) ; (Jogo_5=problemas_de_logica,Mochila_4=amarela) ),

    % O garoto que nasceu em setembro esta ao lado de quem gosta de jogar cubo vermelho
    ( (Mes_1=setembro,Jogo_2=cubo_vermelho) ; (Mes_2=setembro,Jogo_1=cubo_vermelho) ;
      (Mes_2=setembro,Jogo_3=cubo_vermelho) ; (Mes_3=setembro,Jogo_2=cubo_vermelho) ;
      (Mes_3=setembro,Jogo_4=cubo_vermelho) ; (Mes_4=setembro,Jogo_3=cubo_vermelho) ;
      (Mes_4=setembro,Jogo_5=cubo_vermelho) ; (Mes_5=setembro,Jogo_4=cubo_vermelho) ),

    % Quem gosta do jogo da forca esta ao lado do dono da mochila vermelha
    ( (Jogo_1=jogo_da_forca,Mochila_2=vermelha) ; (Jogo_2=jogo_da_forca,Mochila_1=vermelha) ;
      (Jogo_2=jogo_da_forca,Mochila_3=vermelha) ; (Jogo_3=jogo_da_forca,Mochila_2=vermelha) ;
      (Jogo_3=jogo_da_forca,Mochila_4=vermelha) ; (Jogo_4=jogo_da_forca,Mochila_3=vermelha) ;
      (Jogo_4=jogo_da_forca,Mochila_5=vermelha) ; (Jogo_5=jogo_da_forca,Mochila_4=vermelha) ).

% Imprimir lista
resolver :- 
    statistics(cputime, T1),
    modelo(Solucao),
    imprime_lista(Solucao),
    statistics(cputime, T2),
    Tempo is T2 - T1,
    format('\nTempo de execucao: ~w segundos\n', [Tempo]),
    fail.

resolver :- 
    write('\nBusca terminada.\n').

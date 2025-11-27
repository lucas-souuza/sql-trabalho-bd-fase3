--UPDATES
--1 Manuntenção para manutenção
UPDATE public.estacao e 
SET  status = 'Em manutenção'
WHERE status = 'Em manuntenção';

--2 e 3 Estagiario de ID 10 foi de Estagiario para CLT ,e alocando-o na estacao_ID 4
UPDATE public.estacao e
SET id_atendente = f.id_funcionario
FROM public.funcionario f
LEFT JOIN public.estacao e2 ON f.id_funcionario = e2.id_atendente
WHERE f.funcao = 'Atendente'
  AND e2.id_atendente IS NULL
  AND e.id_estacao = 4;
UPDATE public.funcionario f 
SET tipo = 'CLT'
WHERE f.id_funcionario = 10;

--REMOÇÕES
--1 Excluir os gerentes que não sejam PJ e alterar todas as estações.
UPDATE public.estacao e
SET id_gerente = 203;
UPDATE public.linha l
SET id_funcionario = 203;
DELETE FROM funcionario f 
WHERE f.funcao = 'Gerente de Operacoes' AND f.tipo = 'CLT';

--2 Excluir um trem com pouca capacidade, e adicionar um novo
DELETE FROM public.trem t
WHERE id_trem = 6;
INSERT INTO public.trem VALUES (20, 3, 88, 250, 'Em funcionamento');


--CONSULTAS
--Consulta para listagem de dados para relatório
--1) Media de salario por funcao
SELECT
f.funcao,
round(avg(salario),2) AS mediaFuncao
FROM
public.funcionario f
GROUP BY f.funcao;

--2) Velocidade media nas linhas
SELECT 
    CASE
        WHEN l.extensao ILIKE '%k%' AND ROUND( (l.tempo_medio::numeric / 60), 2) <> 0 
            THEN ROUND((REPLACE(REPLACE(l.extensao, 'km', ''), 'm', '')::numeric)/ROUND( (l.tempo_medio::numeric / 60), 2 ),2)
        WHEN l.extensao NOT LIKE '%k%' AND ROUND( (l.tempo_medio::numeric / 60), 2) <> 0 
            THEN ROUND(((REPLACE(REPLACE(l.extensao, 'km', ''), 'm', '')::numeric) / 1000)/ROUND( (l.tempo_medio::numeric / 60), 2 ),2)
    END AS velocidadeMedia,
    l.nome_linha
FROM linha l;

--Consultas para consulta de dados específicos/individuais;
--1)Seleção de um range de salários de funcionarios
SELECT f.nome, f.salario FROM funcionario f
WHERE f.salario>= 6000 AND f.salario <=7000;

--2)Seleção de estações com projetos em andamento
SELECT e.nome, e.status FROM estacao e
WHERE e.status = 'Projeto em andamento - Obras';

--Consultas de dados que envolvam 2 ou mais tabelas.
--Qtd de linhas por estação
SELECT e.nome AS nome_estacao, COUNT(c.id_linha) AS quantidade_linhas FROM contem c
LEFT JOIN estacao e ON c.id_estacao = e.id_estacao
GROUP BY e.nome ORDER BY quantidade_linhas DESC;

--Nome dos Funcionarios e seus locais de trabalho
SELECT f.nome AS nome_funcionario, e.nome AS nome_estacao FROM public.estacao e
LEFT JOIN funcionario f ON f.id_funcionario = e.id_atendente
WHERE f.nome IS NOT NULL
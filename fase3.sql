--
-- PostgreSQL database dump
--

\restrict TaVYgJlk7bdCuXfdBaArsksadaLkX1GIj4bXB9gsjqX9BZkX5SeByqn7R6J8lpH

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-14 13:10:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 24664)
-- Name: contem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contem (
    id_estacao smallint NOT NULL,
    id_linha integer NOT NULL
);


ALTER TABLE public.contem OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24586)
-- Name: estacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estacao (
    id_estacao smallint NOT NULL,
    id_gerente smallint,
    id_atendente smallint DEFAULT 0,
    nome character varying(254),
    status character varying(254) DEFAULT 'Ativa'::character varying,
    localizacao character varying(254) NOT NULL
);


ALTER TABLE public.estacao OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24577)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    id_funcionario smallint NOT NULL,
    nome character varying(254) NOT NULL,
    salario numeric(16,4),
    funcao character varying(254),
    tipo character varying(51),
    email character varying(254)
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24633)
-- Name: linha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.linha (
    id_linha integer NOT NULL,
    id_funcionario smallint,
    extensao character varying(254),
    nome_linha character varying(254),
    tempo_medio smallint DEFAULT 0
);


ALTER TABLE public.linha OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24647)
-- Name: trem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trem (
    id_trem integer NOT NULL,
    id_linha integer,
    id_gerente smallint,
    capacidade smallint DEFAULT 0,
    status_trem character varying(254)
);


ALTER TABLE public.trem OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24616)
-- Name: viagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viagem (
    id_viagem integer NOT NULL,
    id_trem integer,
    data_partida timestamp with time zone,
    id_funcionario smallint,
    destino character varying(254) NOT NULL,
    data_chegada_prevista timestamp with time zone,
    data_chegada timestamp with time zone,
    status character varying(254),
    qtd_passageiros integer DEFAULT 0
);


ALTER TABLE public.viagem OWNER TO postgres;

--
-- TOC entry 5054 (class 0 OID 24664)
-- Dependencies: 224
-- Data for Name: contem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contem (id_estacao, id_linha) FROM stdin;
\.


--
-- TOC entry 5050 (class 0 OID 24586)
-- Dependencies: 220
-- Data for Name: estacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estacao (id_estacao, id_gerente, id_atendente, nome, status, localizacao) FROM stdin;
\.


--
-- TOC entry 5049 (class 0 OID 24577)
-- Dependencies: 219
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcionario (id_funcionario, nome, salario, funcao, tipo, email) FROM stdin;
\.


--
-- TOC entry 5052 (class 0 OID 24633)
-- Dependencies: 222
-- Data for Name: linha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.linha (id_linha, id_funcionario, extensao, nome_linha, tempo_medio) FROM stdin;
\.


--
-- TOC entry 5053 (class 0 OID 24647)
-- Dependencies: 223
-- Data for Name: trem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trem (id_trem, id_linha, id_gerente, capacidade, status_trem) FROM stdin;
\.


--
-- TOC entry 5051 (class 0 OID 24616)
-- Dependencies: 221
-- Data for Name: viagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.viagem (id_viagem, id_trem, data_partida, id_funcionario, destino, data_chegada_prevista, data_chegada, status, qtd_passageiros) FROM stdin;
\.


--
-- TOC entry 4893 (class 2606 OID 24670)
-- Name: contem contem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contem
    ADD CONSTRAINT contem_pkey PRIMARY KEY (id_estacao, id_linha);


--
-- TOC entry 4883 (class 2606 OID 24596)
-- Name: estacao estacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estacao
    ADD CONSTRAINT estacao_pkey PRIMARY KEY (id_estacao);


--
-- TOC entry 4881 (class 2606 OID 24585)
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id_funcionario);


--
-- TOC entry 4889 (class 2606 OID 24641)
-- Name: linha linha_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linha
    ADD CONSTRAINT linha_pkey PRIMARY KEY (id_linha);


--
-- TOC entry 4891 (class 2606 OID 24653)
-- Name: trem trem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trem
    ADD CONSTRAINT trem_pkey PRIMARY KEY (id_trem);


--
-- TOC entry 4885 (class 2606 OID 24682)
-- Name: viagem uk_viagem_id_trem_data_partida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem
    ADD CONSTRAINT uk_viagem_id_trem_data_partida UNIQUE (id_trem, data_partida);


--
-- TOC entry 4887 (class 2606 OID 24625)
-- Name: viagem viagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem
    ADD CONSTRAINT viagem_pkey PRIMARY KEY (id_viagem);


--
-- TOC entry 4894 (class 2606 OID 24602)
-- Name: estacao estacao_id_atendente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estacao
    ADD CONSTRAINT estacao_id_atendente_fkey FOREIGN KEY (id_atendente) REFERENCES public.funcionario(id_funcionario);


--
-- TOC entry 4895 (class 2606 OID 24597)
-- Name: estacao estacao_id_gerente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estacao
    ADD CONSTRAINT estacao_id_gerente_fkey FOREIGN KEY (id_gerente) REFERENCES public.funcionario(id_funcionario);


--
-- TOC entry 4900 (class 2606 OID 24671)
-- Name: contem fk_contem_estacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contem
    ADD CONSTRAINT fk_contem_estacao FOREIGN KEY (id_estacao) REFERENCES public.estacao(id_estacao);


--
-- TOC entry 4901 (class 2606 OID 24676)
-- Name: contem fk_contem_linha; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contem
    ADD CONSTRAINT fk_contem_linha FOREIGN KEY (id_linha) REFERENCES public.linha(id_linha);


--
-- TOC entry 4897 (class 2606 OID 24642)
-- Name: linha fk_funcionario_linha; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.linha
    ADD CONSTRAINT fk_funcionario_linha FOREIGN KEY (id_funcionario) REFERENCES public.funcionario(id_funcionario);


--
-- TOC entry 4898 (class 2606 OID 24659)
-- Name: trem fk_trem_funcionario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trem
    ADD CONSTRAINT fk_trem_funcionario FOREIGN KEY (id_gerente) REFERENCES public.funcionario(id_funcionario);


--
-- TOC entry 4899 (class 2606 OID 24654)
-- Name: trem fk_trem_linha; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trem
    ADD CONSTRAINT fk_trem_linha FOREIGN KEY (id_linha) REFERENCES public.linha(id_linha);


--
-- TOC entry 4896 (class 2606 OID 24628)
-- Name: viagem viagem_id_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viagem
    ADD CONSTRAINT viagem_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionario(id_funcionario);


-- Completed on 2025-11-14 13:10:07

--
-- PostgreSQL database dump complete
--

\unrestrict TaVYgJlk7bdCuXfdBaArsksadaLkX1GIj4bXB9gsjqX9BZkX5SeByqn7R6J8lpH


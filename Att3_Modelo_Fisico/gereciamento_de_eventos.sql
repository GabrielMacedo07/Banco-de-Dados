--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-24 21:15:07

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
-- TOC entry 222 (class 1259 OID 16540)
-- Name: tb_agendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_agendas (
    id_agendas integer NOT NULL,
    data date,
    horario time without time zone,
    descricao character varying(255),
    evento_associado integer,
    fk_eventos_id_eventos integer
);


ALTER TABLE public.tb_agendas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16535)
-- Name: tb_convites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_convites (
    id_convites integer NOT NULL,
    status character varying(50),
    data_de_envio date,
    fk_participantes_id_participantes integer
);


ALTER TABLE public.tb_convites OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16515)
-- Name: tb_eventos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_eventos (
    id_eventos integer NOT NULL,
    nome character varying(100),
    data date,
    local character varying(100),
    descricao character varying(255),
    fk_organizadores_id_organizador integer
);


ALTER TABLE public.tb_eventos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16545)
-- Name: tb_eventos_fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_eventos_fornecedores (
    fk_fornecedores_id_fornecedores integer NOT NULL,
    fk_eventos_id_eventos integer NOT NULL
);


ALTER TABLE public.tb_eventos_fornecedores OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16525)
-- Name: tb_fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_fornecedores (
    id_fornecedores integer NOT NULL,
    nome character varying(100),
    tipo_de_servico character varying(100),
    telefone character varying(15)
);


ALTER TABLE public.tb_fornecedores OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16550)
-- Name: tb_inscricoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_inscricoes (
    fk_participantes_id_participantes integer NOT NULL,
    fk_eventos_id_eventos integer NOT NULL,
    status character varying(50),
    data_de_inscricao date
);


ALTER TABLE public.tb_inscricoes OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16520)
-- Name: tb_organizadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_organizadores (
    id_organizador integer NOT NULL,
    nome character varying(100),
    e_mail character varying(100),
    telefone character varying(15)
);


ALTER TABLE public.tb_organizadores OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16530)
-- Name: tb_participantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_participantes (
    id_participantes integer NOT NULL,
    nome character varying(100),
    e_mail character varying(100),
    telefone character varying(15)
);


ALTER TABLE public.tb_participantes OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 16540)
-- Dependencies: 222
-- Data for Name: tb_agendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_agendas (id_agendas, data, horario, descricao, evento_associado, fk_eventos_id_eventos) FROM stdin;
\.


--
-- TOC entry 4887 (class 0 OID 16535)
-- Dependencies: 221
-- Data for Name: tb_convites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_convites (id_convites, status, data_de_envio, fk_participantes_id_participantes) FROM stdin;
\.


--
-- TOC entry 4883 (class 0 OID 16515)
-- Dependencies: 217
-- Data for Name: tb_eventos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_eventos (id_eventos, nome, data, local, descricao, fk_organizadores_id_organizador) FROM stdin;
\.


--
-- TOC entry 4889 (class 0 OID 16545)
-- Dependencies: 223
-- Data for Name: tb_eventos_fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_eventos_fornecedores (fk_fornecedores_id_fornecedores, fk_eventos_id_eventos) FROM stdin;
\.


--
-- TOC entry 4885 (class 0 OID 16525)
-- Dependencies: 219
-- Data for Name: tb_fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_fornecedores (id_fornecedores, nome, tipo_de_servico, telefone) FROM stdin;
\.


--
-- TOC entry 4890 (class 0 OID 16550)
-- Dependencies: 224
-- Data for Name: tb_inscricoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_inscricoes (fk_participantes_id_participantes, fk_eventos_id_eventos, status, data_de_inscricao) FROM stdin;
\.


--
-- TOC entry 4884 (class 0 OID 16520)
-- Dependencies: 218
-- Data for Name: tb_organizadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_organizadores (id_organizador, nome, e_mail, telefone) FROM stdin;
1	Gabriel	santosgabrielmacedo@gmail.com	+5599984974809
\.


--
-- TOC entry 4886 (class 0 OID 16530)
-- Dependencies: 220
-- Data for Name: tb_participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_participantes (id_participantes, nome, e_mail, telefone) FROM stdin;
\.


--
-- TOC entry 4733 (class 2606 OID 16544)
-- Name: tb_agendas tb_agendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_agendas
    ADD CONSTRAINT tb_agendas_pkey PRIMARY KEY (id_agendas);


--
-- TOC entry 4731 (class 2606 OID 16539)
-- Name: tb_convites tb_convites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_convites
    ADD CONSTRAINT tb_convites_pkey PRIMARY KEY (id_convites);


--
-- TOC entry 4735 (class 2606 OID 16549)
-- Name: tb_eventos_fornecedores tb_eventos_fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_eventos_fornecedores
    ADD CONSTRAINT tb_eventos_fornecedores_pkey PRIMARY KEY (fk_fornecedores_id_fornecedores, fk_eventos_id_eventos);


--
-- TOC entry 4723 (class 2606 OID 16519)
-- Name: tb_eventos tb_eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_eventos
    ADD CONSTRAINT tb_eventos_pkey PRIMARY KEY (id_eventos);


--
-- TOC entry 4727 (class 2606 OID 16529)
-- Name: tb_fornecedores tb_fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_fornecedores
    ADD CONSTRAINT tb_fornecedores_pkey PRIMARY KEY (id_fornecedores);


--
-- TOC entry 4737 (class 2606 OID 16554)
-- Name: tb_inscricoes tb_inscricoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_inscricoes
    ADD CONSTRAINT tb_inscricoes_pkey PRIMARY KEY (fk_participantes_id_participantes, fk_eventos_id_eventos);


--
-- TOC entry 4725 (class 2606 OID 16524)
-- Name: tb_organizadores tb_organizadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_organizadores
    ADD CONSTRAINT tb_organizadores_pkey PRIMARY KEY (id_organizador);


--
-- TOC entry 4729 (class 2606 OID 16534)
-- Name: tb_participantes tb_participantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_participantes
    ADD CONSTRAINT tb_participantes_pkey PRIMARY KEY (id_participantes);


-- Completed on 2025-03-24 21:15:07

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: dictionaries; Type: TABLE; Schema: public; Owner: shakalyan
--

CREATE TABLE public.dictionaries (
    id integer NOT NULL,
    name character varying NOT NULL,
    user_id integer NOT NULL,
    source character varying NOT NULL,
    target character varying NOT NULL
);


ALTER TABLE public.dictionaries OWNER TO shakalyan;

--
-- Name: dictionaries_id_seq; Type: SEQUENCE; Schema: public; Owner: shakalyan
--

CREATE SEQUENCE public.dictionaries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dictionaries_id_seq OWNER TO shakalyan;

--
-- Name: dictionaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakalyan
--

ALTER SEQUENCE public.dictionaries_id_seq OWNED BY public.dictionaries.id;


--
-- Name: dictionaries_user_id_seq; Type: SEQUENCE; Schema: public; Owner: shakalyan
--

CREATE SEQUENCE public.dictionaries_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dictionaries_user_id_seq OWNER TO shakalyan;

--
-- Name: dictionaries_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakalyan
--

ALTER SEQUENCE public.dictionaries_user_id_seq OWNED BY public.dictionaries.user_id;


--
-- Name: translations; Type: TABLE; Schema: public; Owner: shakalyan
--

CREATE TABLE public.translations (
    id integer NOT NULL,
    word character varying NOT NULL,
    translation character varying NOT NULL,
    dictionary_id integer NOT NULL
);


ALTER TABLE public.translations OWNER TO shakalyan;

--
-- Name: translations_dictionary_id_seq; Type: SEQUENCE; Schema: public; Owner: shakalyan
--

CREATE SEQUENCE public.translations_dictionary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_dictionary_id_seq OWNER TO shakalyan;

--
-- Name: translations_dictionary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakalyan
--

ALTER SEQUENCE public.translations_dictionary_id_seq OWNED BY public.translations.dictionary_id;


--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: shakalyan
--

CREATE SEQUENCE public.translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_id_seq OWNER TO shakalyan;

--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakalyan
--

ALTER SEQUENCE public.translations_id_seq OWNED BY public.translations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: shakalyan
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    salt character varying NOT NULL
);


ALTER TABLE public.users OWNER TO shakalyan;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: shakalyan
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO shakalyan;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shakalyan
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: dictionaries id; Type: DEFAULT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.dictionaries ALTER COLUMN id SET DEFAULT nextval('public.dictionaries_id_seq'::regclass);


--
-- Name: dictionaries user_id; Type: DEFAULT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.dictionaries ALTER COLUMN user_id SET DEFAULT nextval('public.dictionaries_user_id_seq'::regclass);


--
-- Name: translations id; Type: DEFAULT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.translations ALTER COLUMN id SET DEFAULT nextval('public.translations_id_seq'::regclass);


--
-- Name: translations dictionary_id; Type: DEFAULT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.translations ALTER COLUMN dictionary_id SET DEFAULT nextval('public.translations_dictionary_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: dictionaries; Type: TABLE DATA; Schema: public; Owner: shakalyan
--

COPY public.dictionaries (id, name, user_id, source, target) FROM stdin;
\.


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: shakalyan
--

COPY public.translations (id, word, translation, dictionary_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: shakalyan
--

COPY public.users (id, login, password, salt) FROM stdin;
\.


--
-- Name: dictionaries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shakalyan
--

SELECT pg_catalog.setval('public.dictionaries_id_seq', 2, true);


--
-- Name: dictionaries_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shakalyan
--

SELECT pg_catalog.setval('public.dictionaries_user_id_seq', 1, false);


--
-- Name: translations_dictionary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shakalyan
--

SELECT pg_catalog.setval('public.translations_dictionary_id_seq', 1, false);


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shakalyan
--

SELECT pg_catalog.setval('public.translations_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shakalyan
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: dictionaries dictionaries_pkey; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.dictionaries
    ADD CONSTRAINT dictionaries_pkey PRIMARY KEY (id);


--
-- Name: translations translations_pkey; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: users users_login_key; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: dictionaries dictionaries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.dictionaries
    ADD CONSTRAINT dictionaries_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: translations translations_dictionary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shakalyan
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_dictionary_id_fkey FOREIGN KEY (dictionary_id) REFERENCES public.dictionaries(id);


--
-- PostgreSQL database dump complete
--


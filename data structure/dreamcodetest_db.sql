--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2024-01-15 19:22:12

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
-- TOC entry 209 (class 1259 OID 34894)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    description character varying(200)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 34909)
-- Name: categories_hierarchy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories_hierarchy (
    child_id integer NOT NULL,
    parent_id integer NOT NULL,
    level integer
);


ALTER TABLE public.categories_hierarchy OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 34899)
-- Name: keywords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keywords (
    keyword_id integer NOT NULL,
    category_id integer NOT NULL,
    description character varying(200)
);


ALTER TABLE public.keywords OWNER TO postgres;

--
-- TOC entry 3319 (class 0 OID 34894)
-- Dependencies: 209
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, description) FROM stdin;
-1	Root
1	Furniture
2	Electronics
3	Home Appliances
4	Major Appliances
5	Minor Appliances
7	Kitchen Appliances
8	General Appliances
6	Lawn & Garden
\.


--
-- TOC entry 3321 (class 0 OID 34909)
-- Dependencies: 211
-- Data for Name: categories_hierarchy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories_hierarchy (child_id, parent_id, level) FROM stdin;
1	-1	1
2	-1	1
3	-1	1
4	3	2
5	3	2
6	3	2
7	4	3
8	4	3
\.


--
-- TOC entry 3320 (class 0 OID 34899)
-- Dependencies: 210
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keywords (keyword_id, category_id, description) FROM stdin;
1	-1	Furniture
2	-1	Electronics
3	6	Lawn
4	6	Garden
5	6	GardeningTools
\.


--
-- TOC entry 3176 (class 2606 OID 34913)
-- Name: categories_hierarchy categories_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_hierarchy
    ADD CONSTRAINT categories_hierarchy_pkey PRIMARY KEY (child_id, parent_id);


--
-- TOC entry 3172 (class 2606 OID 34898)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3174 (class 2606 OID 34903)
-- Name: keywords keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (keyword_id);


--
-- TOC entry 3178 (class 2606 OID 34914)
-- Name: categories_hierarchy cat_cat_hierarchy_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_hierarchy
    ADD CONSTRAINT cat_cat_hierarchy_1 FOREIGN KEY (child_id) REFERENCES public.categories(category_id) NOT VALID;


--
-- TOC entry 3179 (class 2606 OID 34919)
-- Name: categories_hierarchy cat_cat_hierarchy_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_hierarchy
    ADD CONSTRAINT cat_cat_hierarchy_2 FOREIGN KEY (parent_id) REFERENCES public.categories(category_id) NOT VALID;


--
-- TOC entry 3177 (class 2606 OID 34904)
-- Name: keywords fk_categories_keywords_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT fk_categories_keywords_1 FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


-- Completed on 2024-01-15 19:22:13

--
-- PostgreSQL database dump complete
--


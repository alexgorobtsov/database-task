--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2018-12-06 11:30:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 24585)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    comp_name text NOT NULL
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24611)
-- Name: emp_to_proj; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emp_to_proj (
    proj_name text,
    emp_id integer
);


ALTER TABLE public.emp_to_proj OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24629)
-- Name: empl_id_autoi; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empl_id_autoi
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empl_id_autoi OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24577)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_id integer DEFAULT nextval('public.empl_id_autoi'::regclass) NOT NULL,
    empl_name text,
    department text
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24593)
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    proj_name text NOT NULL,
    comp_name text,
    manager_id integer
);


ALTER TABLE public.project OWNER TO postgres;

--
-- TOC entry 2836 (class 0 OID 24585)
-- Dependencies: 197
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company VALUES ('Corporation');


--
-- TOC entry 2838 (class 0 OID 24611)
-- Dependencies: 199
-- Data for Name: emp_to_proj; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.emp_to_proj VALUES ('ProjectX', 1);
INSERT INTO public.emp_to_proj VALUES ('ArtWork', 1);
INSERT INTO public.emp_to_proj VALUES ('ArtWork', 2);


--
-- TOC entry 2835 (class 0 OID 24577)
-- Dependencies: 196
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee VALUES (1, 'John Doe', 'Manager');
INSERT INTO public.employee VALUES (2, 'Mary Lee', 'Designer');
INSERT INTO public.employee VALUES (3, 'Steven King', 'President');


--
-- TOC entry 2837 (class 0 OID 24593)
-- Dependencies: 198
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.project VALUES ('ProjectX', 'Corporation', 1);
INSERT INTO public.project VALUES ('ArtWork', 'Corporation', 1);


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 200
-- Name: empl_id_autoi; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empl_id_autoi', 3, true);


--
-- TOC entry 2707 (class 2606 OID 24592)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (comp_name);


--
-- TOC entry 2703 (class 2606 OID 24628)
-- Name: employee empl_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT empl_name UNIQUE (emp_id);


--
-- TOC entry 2705 (class 2606 OID 24584)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 2709 (class 2606 OID 24600)
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (proj_name);


--
-- TOC entry 2713 (class 2606 OID 24622)
-- Name: emp_to_proj emptoproj_empid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_to_proj
    ADD CONSTRAINT emptoproj_empid_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(emp_id);


--
-- TOC entry 2712 (class 2606 OID 24617)
-- Name: emp_to_proj emptoproj_proj_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emp_to_proj
    ADD CONSTRAINT emptoproj_proj_name_fkey FOREIGN KEY (proj_name) REFERENCES public.project(proj_name);


--
-- TOC entry 2710 (class 2606 OID 24601)
-- Name: project project_comp_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_comp_name_fkey FOREIGN KEY (comp_name) REFERENCES public.company(comp_name);


--
-- TOC entry 2711 (class 2606 OID 24606)
-- Name: project project_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employee(emp_id);


-- Completed on 2018-12-06 11:30:10

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE periodic_table;
--
-- Name: periodic_table; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE periodic_table WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE periodic_table OWNER TO postgres;

\connect periodic_table

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
-- Name: elements; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.elements (
    atomic_number integer NOT NULL,
    symbol character varying(2) NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.elements OWNER TO freecodecamp;

--
-- Name: properties; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.properties (
    atomic_number integer NOT NULL,
    type character varying(30),
    atomic_mass double precision NOT NULL,
    melting_point_celsius numeric NOT NULL,
    boiling_point_celsius numeric NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.properties OWNER TO freecodecamp;

--
-- Name: types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types (
    type_id integer NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.types OWNER TO freecodecamp;

--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.elements VALUES (1, 'H', 'Hydrogen');
INSERT INTO public.elements VALUES (4, 'Be', 'Beryllium');
INSERT INTO public.elements VALUES (5, 'B', 'Boron');
INSERT INTO public.elements VALUES (6, 'C', 'Carbon');
INSERT INTO public.elements VALUES (7, 'N', 'Nitrogen');
INSERT INTO public.elements VALUES (8, 'O', 'Oxygen');
INSERT INTO public.elements VALUES (2, 'He', 'Helium');
INSERT INTO public.elements VALUES (3, 'Li', 'Lithium');
INSERT INTO public.elements VALUES (1000, 'Mt', 'moTanium');
INSERT INTO public.elements VALUES (9, 'F', 'Fluorine');
INSERT INTO public.elements VALUES (10, 'Ne', 'Neon');


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.properties VALUES (3, 'metal', 6.94, 180.54, 1342, 1);
INSERT INTO public.properties VALUES (4, 'metal', 9.0122, 1287, 2470, 1);
INSERT INTO public.properties VALUES (1, 'nonmetal', 1.008, -259.1, -252.9, 2);
INSERT INTO public.properties VALUES (2, 'nonmetal', 4.0026, -272.2, -269, 2);
INSERT INTO public.properties VALUES (6, 'nonmetal', 12.011, 3550, 4027, 2);
INSERT INTO public.properties VALUES (7, 'nonmetal', 14.007, -210.1, -195.8, 2);
INSERT INTO public.properties VALUES (8, 'nonmetal', 15.999, -218, -183, 2);
INSERT INTO public.properties VALUES (5, 'metalloid', 10.81, 2075, 4000, 3);
INSERT INTO public.properties VALUES (1000, 'metalloid', 1, 10, 100, 3);
INSERT INTO public.properties VALUES (9, NULL, 18.998, -220, -188.1, 2);
INSERT INTO public.properties VALUES (10, NULL, 20.18, -248.6, -246.1, 2);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.types VALUES (1, 'metal');
INSERT INTO public.types VALUES (2, 'nonmetal');
INSERT INTO public.types VALUES (3, 'metalloid');


--
-- Name: elements elements_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_atomic_number_key UNIQUE (atomic_number);


--
-- Name: elements elements_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_name_key UNIQUE (name);


--
-- Name: elements elements_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (atomic_number);


--
-- Name: elements elements_symbol_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_symbol_key UNIQUE (symbol);


--
-- Name: properties properties_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_atomic_number_key UNIQUE (atomic_number);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (atomic_number);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- Name: properties properties_atomic_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_atomic_number_fkey FOREIGN KEY (atomic_number) REFERENCES public.elements(atomic_number);


--
-- Name: properties properties_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(type_id);


--
-- PostgreSQL database dump complete
--


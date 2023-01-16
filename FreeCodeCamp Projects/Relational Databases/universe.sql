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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    description text,
    number_of_stars integer,
    number_of_planets integer,
    mushrooms integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: grass; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.grass (
    grass_id integer NOT NULL,
    name character varying,
    green integer NOT NULL,
    greenish integer NOT NULL
);


ALTER TABLE public.grass OWNER TO freecodecamp;

--
-- Name: grass_grass_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.grass_grass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grass_grass_id_seq OWNER TO freecodecamp;

--
-- Name: grass_grass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.grass_grass_id_seq OWNED BY public.grass.grass_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    description text,
    gravity numeric,
    planet_id integer NOT NULL,
    pointy integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    description text,
    bigger_than_earth boolean,
    big_or_not boolean,
    star_id integer NOT NULL,
    curves integer NOT NULL,
    pointy integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    description text,
    galaxy_id integer NOT NULL,
    curves integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: grass grass_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.grass ALTER COLUMN grass_id SET DEFAULT nextval('public.grass_grass_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'First galaxy', NULL, NULL, 3);
INSERT INTO public.galaxy VALUES (3, 'Voie lactée', 'Main Galaxy', NULL, NULL, 4);
INSERT INTO public.galaxy VALUES (5, 'Androsdfeda', 'First sdfsalaxy', NULL, NULL, 1);
INSERT INTO public.galaxy VALUES (6, 'Voie lacfdfée', 'Main G5laxy', NULL, NULL, 6);
INSERT INTO public.galaxy VALUES (7, 'Anddsfsdfffeda', 'Fisfsfdfsalaxy', NULL, NULL, 7);
INSERT INTO public.galaxy VALUES (8, 'Vosdfacfdfée', 'Maisdfdfsaxy', NULL, NULL, 43);


--
-- Data for Name: grass; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.grass VALUES (1, 'blade', 1, 1);
INSERT INTO public.grass VALUES (2, 'basde', 2, 2);
INSERT INTO public.grass VALUES (3, 'dsasda', 3, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, NULL, NULL, 1, 1);
INSERT INTO public.moon VALUES (2, NULL, NULL, NULL, 2, 2);
INSERT INTO public.moon VALUES (3, NULL, NULL, NULL, 3, 3);
INSERT INTO public.moon VALUES (4, NULL, NULL, NULL, 4, 4);
INSERT INTO public.moon VALUES (5, NULL, NULL, NULL, 5, 5);
INSERT INTO public.moon VALUES (6, NULL, NULL, NULL, 6, 6);
INSERT INTO public.moon VALUES (7, NULL, NULL, NULL, 7, 7);
INSERT INTO public.moon VALUES (8, NULL, NULL, NULL, 8, 8);
INSERT INTO public.moon VALUES (9, NULL, NULL, NULL, 9, 9);
INSERT INTO public.moon VALUES (10, NULL, NULL, NULL, 10, 10);
INSERT INTO public.moon VALUES (11, NULL, NULL, NULL, 11, 11);
INSERT INTO public.moon VALUES (12, NULL, NULL, NULL, 12, 12);
INSERT INTO public.moon VALUES (14, NULL, NULL, NULL, 1, 121);
INSERT INTO public.moon VALUES (15, NULL, NULL, NULL, 2, 112);
INSERT INTO public.moon VALUES (16, NULL, NULL, NULL, 3, 13);
INSERT INTO public.moon VALUES (17, NULL, NULL, NULL, 4, 14);
INSERT INTO public.moon VALUES (18, NULL, NULL, NULL, 5, 15);
INSERT INTO public.moon VALUES (19, NULL, NULL, NULL, 6, 16);
INSERT INTO public.moon VALUES (20, NULL, NULL, NULL, 7, 17);
INSERT INTO public.moon VALUES (21, NULL, NULL, NULL, 8, 18);
INSERT INTO public.moon VALUES (22, NULL, NULL, NULL, 9, 19);
INSERT INTO public.moon VALUES (23, NULL, NULL, NULL, 10, 110);
INSERT INTO public.moon VALUES (24, NULL, NULL, NULL, 11, 151);
INSERT INTO public.moon VALUES (25, NULL, NULL, NULL, 12, 152);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, NULL, NULL, NULL, NULL, 3, 1, 1);
INSERT INTO public.planet VALUES (2, NULL, NULL, NULL, NULL, 5, 2, 2);
INSERT INTO public.planet VALUES (3, NULL, NULL, NULL, NULL, 6, 3, 3);
INSERT INTO public.planet VALUES (4, NULL, NULL, NULL, NULL, 8, 4, 4);
INSERT INTO public.planet VALUES (5, NULL, NULL, NULL, NULL, 9, 5, 5);
INSERT INTO public.planet VALUES (6, NULL, NULL, NULL, NULL, 10, 6, 6);
INSERT INTO public.planet VALUES (7, NULL, NULL, NULL, NULL, 3, 12, 12);
INSERT INTO public.planet VALUES (8, NULL, NULL, NULL, NULL, 5, 11, 11);
INSERT INTO public.planet VALUES (9, NULL, NULL, NULL, NULL, 6, 10, 10);
INSERT INTO public.planet VALUES (10, NULL, NULL, NULL, NULL, 8, 9, 9);
INSERT INTO public.planet VALUES (11, NULL, NULL, NULL, NULL, 9, 8, 8);
INSERT INTO public.planet VALUES (12, NULL, NULL, NULL, NULL, 10, 7, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'star', NULL, 2, 2);
INSERT INTO public.star VALUES (5, 'tinyStar', NULL, 3, 4);
INSERT INTO public.star VALUES (6, 'tinyStar', NULL, 5, 3);
INSERT INTO public.star VALUES (8, 'tinsdfsdfStar', NULL, 6, 5);
INSERT INTO public.star VALUES (9, 'tinsdar', NULL, 7, 6);
INSERT INTO public.star VALUES (10, 'tinsfdar', NULL, 8, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: grass_grass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.grass_grass_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_mushrooms_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_mushrooms_key UNIQUE (mushrooms);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: grass grass_green_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.grass
    ADD CONSTRAINT grass_green_key UNIQUE (green);


--
-- Name: grass grass_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.grass
    ADD CONSTRAINT grass_pkey PRIMARY KEY (grass_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_pointy_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pointy_key UNIQUE (pointy);


--
-- Name: planet planet_curves_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_curves_key UNIQUE (curves);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_pointy_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pointy_key UNIQUE (pointy);


--
-- Name: star star_curves_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_curves_key UNIQUE (curves);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


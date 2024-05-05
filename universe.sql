--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    diameter_unit text NOT NULL,
    eccentricity numeric(9,8),
    has_life boolean,
    is_spherical boolean
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
-- Name: galaxy_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star (
    galaxy_star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.galaxy_star OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_galaxy_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_galaxy_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_galaxy_star_id_seq OWNED BY public.galaxy_star.galaxy_star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    diameter_unit text NOT NULL,
    eccentricity numeric(9,8),
    has_life boolean,
    is_spherical boolean,
    planet_id integer,
    description character varying(50)
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    diameter_unit text NOT NULL,
    eccentricity numeric(9,8),
    has_life boolean,
    is_spherical boolean,
    star_id integer,
    description character varying(50)
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    diameter_unit text NOT NULL,
    eccentricity numeric(9,8),
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
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
-- Name: galaxy_star galaxy_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star ALTER COLUMN galaxy_star_id SET DEFAULT nextval('public.galaxy_star_galaxy_star_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Galaxy 1', 3000, 1500, 'light-years', 0.00000000, true, false);
INSERT INTO public.galaxy VALUES (2, 'Galaxy 2', 2580, 1200, 'light-years', 0.00000000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Galaxy 3', 2900, 1000, 'light-years', 0.00000000, false, false);
INSERT INTO public.galaxy VALUES (4, 'Galaxy 4', 3100, 1400, 'light-years', 0.00000000, false, true);
INSERT INTO public.galaxy VALUES (5, 'Galaxy 5', 2900, 1500, 'light-years', 0.00000000, true, true);
INSERT INTO public.galaxy VALUES (6, 'Galaxy 6', 2800, 1600, 'light-years', 0.00000000, false, false);


--
-- Data for Name: galaxy_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star VALUES (1, 'Relation 1', 1, 1);
INSERT INTO public.galaxy_star VALUES (2, 'Relation 2', 2, 2);
INSERT INTO public.galaxy_star VALUES (3, 'Relation 3', 3, 3);
INSERT INTO public.galaxy_star VALUES (4, 'Relation 4', 4, 4);
INSERT INTO public.galaxy_star VALUES (5, 'Relation 5', 5, 5);
INSERT INTO public.galaxy_star VALUES (6, 'Relation 6', 6, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon A1-1', 1900, 6000, 'km', NULL, false, true, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Moon A1-2', 1800, 5000, 'km', NULL, false, true, 1, NULL);
INSERT INTO public.moon VALUES (3, 'Moon A1-3', 1900, 5500, 'km', NULL, false, true, 1, NULL);
INSERT INTO public.moon VALUES (4, 'Moon A1-4', 1700, 4000, 'km', NULL, false, true, 1, NULL);
INSERT INTO public.moon VALUES (5, 'Moon B1-1', 2000, 2500, 'km', NULL, false, true, 3, NULL);
INSERT INTO public.moon VALUES (6, 'Moon B2-1', 2100, 5200, 'km', NULL, false, true, 4, NULL);
INSERT INTO public.moon VALUES (7, 'Moon B2-2', 1800, 4300, 'km', NULL, false, true, 4, NULL);
INSERT INTO public.moon VALUES (8, 'Moon C1-1', 2000, 5000, 'km', NULL, true, true, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Moon C1-2', 2500, 4000, 'km', NULL, false, false, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Moon C1-3', 2100, 3000, 'km', NULL, false, true, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Moon C1-4', 2200, 3500, 'km', NULL, false, true, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Moon C1-5', 2000, 4500, 'km', NULL, false, true, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Moon C1-6', 2000, 3400, 'km', NULL, false, true, 5, NULL);
INSERT INTO public.moon VALUES (14, 'Moon C1-7', 2100, 3600, 'km', NULL, false, true, 5, NULL);
INSERT INTO public.moon VALUES (15, 'Moon E2-1', 1800, 4000, 'km', NULL, false, true, 10, NULL);
INSERT INTO public.moon VALUES (16, 'Moon E2-2', 1800, 3500, 'km', NULL, false, true, 10, NULL);
INSERT INTO public.moon VALUES (17, 'Moon F2-1', 1900, 5000, 'km', NULL, true, true, 12, NULL);
INSERT INTO public.moon VALUES (18, 'Moon F2-2', 1800, 4500, 'km', NULL, false, true, 12, NULL);
INSERT INTO public.moon VALUES (19, 'Moon F2-3', 1800, 4000, 'km', NULL, false, false, 12, NULL);
INSERT INTO public.moon VALUES (20, 'Moon F2-4', 1600, 3000, 'km', NULL, false, true, 12, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet A1', 2900, 60000, 'km', 0.45213585, false, true, 1, 'Blue  planet');
INSERT INTO public.planet VALUES (2, 'Planet A2', 2800, 15000, 'km', 0.32157441, true, true, 1, 'Green planet');
INSERT INTO public.planet VALUES (3, 'Planet B1', 3000, 20000, 'km', 0.41236500, false, false, 2, 'Plated-shaped planet');
INSERT INTO public.planet VALUES (4, 'Planet B2', 3500, 30000, 'km', 0.30000000, true, true, 2, 'Rocky planet');
INSERT INTO public.planet VALUES (5, 'Planet C1', 3000, 100000, 'km', 0.46213215, false, true, 3, 'Big planet');
INSERT INTO public.planet VALUES (6, 'Planet C2', 2800, 8000, 'km', 0.12324000, false, true, 3, 'Small planet');
INSERT INTO public.planet VALUES (7, 'Planet D1', 2900, 15000, 'km', 0.30000000, false, false, 4, 'Fast planet');
INSERT INTO public.planet VALUES (8, 'Planet D2', 2100, 12000, 'km', 0.35431000, true, true, 4, 'Young planet');
INSERT INTO public.planet VALUES (9, 'Planet E1', 3000, 20000, 'km', 0.41230000, false, true, 5, 'Red planet');
INSERT INTO public.planet VALUES (10, 'Planet E2', 2900, 25000, 'km', 0.10000000, false, true, 5, 'Ice planet');
INSERT INTO public.planet VALUES (11, 'Planet F1', 3000, 16000, 'km', 0.25120000, true, true, 6, 'Yellow planet');
INSERT INTO public.planet VALUES (12, 'Planet F2', 2900, 45000, 'km', 0.30000000, false, false, 6, 'Gas planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star A', 3000, 1400000, 'km', 0.00000000, false, true, 1);
INSERT INTO public.star VALUES (2, 'Star B', 4500, 3000000, 'km', 0.00000000, false, true, 2);
INSERT INTO public.star VALUES (3, 'Star C', 3200, 1700000, 'km', 0.00000000, false, true, 3);
INSERT INTO public.star VALUES (4, 'Star D', 2000, 1000000, 'km', 0.00000000, false, true, 4);
INSERT INTO public.star VALUES (5, 'Star E', 2800, 1500000, 'km', 0.00000000, false, true, 5);
INSERT INTO public.star VALUES (6, 'Star F', 3100, 1600000, 'km', 0.00000000, false, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_galaxy_star_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star galaxy_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_name_key UNIQUE (name);


--
-- Name: galaxy_star galaxy_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_pkey PRIMARY KEY (galaxy_star_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_star galaxy_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star galaxy_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


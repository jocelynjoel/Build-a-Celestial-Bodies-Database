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
    name character varying(40),
    description text,
    galaxy_types character varying(40),
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    description text,
    moon_types character varying(40),
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer,
    planet_id integer NOT NULL
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
    name character varying(40),
    description text,
    planet_types character varying(40),
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer,
    star_id integer NOT NULL
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
-- Name: planetsys; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetsys (
    planetsys_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planetsys OWNER TO freecodecamp;

--
-- Name: planetsys_planetsys_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetsys_planetsys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetsys_planetsys_id_seq OWNER TO freecodecamp;

--
-- Name: planetsys_planetsys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetsys_planetsys_id_seq OWNED BY public.planetsys.planetsys_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--


CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    description text,
    star_types character varying(40),
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer,
    galaxy_id integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);

--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planetsys planetsys_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetsys ALTER COLUMN planetsys_id SET DEFAULT nextval('public.planetsys_planetsys_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Voie Lactée', 'Notre galaxie, contenant notre système solaire.', 'Spirale barrée', true, 13600, 27000);
INSERT INTO public.galaxy VALUES (2, 'Galaxie d''Andromède', 'La plus grande galaxie du Groupe Local, voisine de la Voie Lactée.', 'Spirale', true, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Galaxie du Sombrero', 'Connue pour sa forme distinctive qui rappelle un sombrero.', 'Spirale', true, 13000, 29000000);
INSERT INTO public.galaxy VALUES (4, 'Galaxie du Moulinet', 'Une belle galaxie spirale située dans la constellation de la Grande Ourse.', 'Spirale', true, 400, 21000000);
INSERT INTO public.galaxy VALUES (5, 'Grand Nuage de Magellan', 'Une galaxie naine irrégulière, satellite de la Voie Lactée.', 'Irrégulière', false, 13000, 163000);
INSERT INTO public.galaxy VALUES (6, 'Galaxie du Cigare', 'Une galaxie starburst située dans la constellation de la Grande Ourse.', 'Starburst', false, 13000, 12000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna1', 'Première lune', 'Type A', true, 4500, 384400, 7);
INSERT INTO public.moon VALUES (2, 'Luna2', 'Deuxième lune', 'Type B', false, 3200, 500000, 8);
INSERT INTO public.moon VALUES (3, 'Luna3', 'Troisième lune', 'Type C', true, 1500, 600000, 9);
INSERT INTO public.moon VALUES (4, 'Luna4', 'Quatrième lune', 'Type D', false, 2000, 700000, 10);
INSERT INTO public.moon VALUES (5, 'Luna5', 'Cinquième lune', 'Type E', true, 2500, 800000, 11);
INSERT INTO public.moon VALUES (6, 'Luna6', 'Sixième lune', 'Type F', false, 3000, 900000, 12);
INSERT INTO public.moon VALUES (7, 'Luna7', 'Septième lune', 'Type G', true, 3500, 1000000, 13);
INSERT INTO public.moon VALUES (8, 'Luna8', 'Huitième lune', 'Type H', false, 4000, 1100000, 14);
INSERT INTO public.moon VALUES (9, 'Luna9', 'Neuvième lune', 'Type I', true, 4500, 1200000, 15);
INSERT INTO public.moon VALUES (10, 'Luna10', 'Dixième lune', 'Type J', false, 5000, 1300000, 16);
INSERT INTO public.moon VALUES (11, 'Luna11', 'Onzième lune', 'Type K', true, 5500, 1400000, 17);
INSERT INTO public.moon VALUES (12, 'Luna12', 'Douzième lune', 'Type L', false, 6000, 1500000, 18);
INSERT INTO public.moon VALUES (13, 'Luna13', 'Treizième lune', 'Type M', true, 6500, 1600000, 7);
INSERT INTO public.moon VALUES (14, 'Luna14', 'Quatorzième lune', 'Type N', false, 7000, 1700000, 8);
INSERT INTO public.moon VALUES (15, 'Luna15', 'Quinzième lune', 'Type O', true, 7500, 1800000, 9);
INSERT INTO public.moon VALUES (16, 'Luna16', 'Seizième lune', 'Type P', false, 8000, 1900000, 10);
INSERT INTO public.moon VALUES (17, 'Luna17', 'Dix-septième lune', 'Type Q', true, 8500, 2000000, 11);
INSERT INTO public.moon VALUES (18, 'Luna18', 'Dix-huitième lune', 'Type R', false, 9000, 2100000, 12);
INSERT INTO public.moon VALUES (19, 'Luna19', 'Dix-neuvième lune', 'Type S', true, 9500, 2200000, 13);
INSERT INTO public.moon VALUES (20, 'Luna20', 'Vingtième lune', 'Type T', false, 10000, 2300000, 14);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 'Mercure', 'La plus petite planète du système solaire, proche du Soleil.', 'Tellurique', true, 4500, 0, 7);
INSERT INTO public.planet VALUES (8, 'Vénus', 'Deuxième planète du système solaire, avec une atmosphère dense.', 'Tellurique', true, 4500, 0, 2);
INSERT INTO public.planet VALUES (9, 'Terre', 'Notre planète, la seule connue pour abriter la vie.', 'Tellurique', true, 4500, 0, 2);
INSERT INTO public.planet VALUES (10, 'Mars', 'La planète rouge, connue pour ses montagnes et vallées.', 'Tellurique', true, 4500, 0, 2);
INSERT INTO public.planet VALUES (11, 'Jupiter', 'La plus grande planète du système solaire, une géante gazeuse.', 'Gazeuse', false, 4500, 0, 2);
INSERT INTO public.planet VALUES (12, 'Saturne', 'Connue pour ses anneaux spectaculaires.', 'Gazeuse', false, 4500, 0, 4);
INSERT INTO public.planet VALUES (13, 'Uranus', 'Une géante gazeuse avec une inclinaison axiale unique.', 'Gazeuse', false, 4500, 0, 3);
INSERT INTO public.planet VALUES (14, 'Neptune', 'La planète la plus éloignée du système solaire, une géante gazeuse.', 'Gazeuse', false, 4500, 0, 2);
INSERT INTO public.planet VALUES (15, 'Proxima b', 'Une exoplanète en orbite autour de Proxima Centauri.', 'Tellurique', true, 4850, 4, 3);
INSERT INTO public.planet VALUES (16, 'Kepler-22b', 'Une exoplanète située dans la zone habitable de son étoile.', 'Super-Terre', true, 4000, 600, 4);
INSERT INTO public.planet VALUES (17, 'Gliese 581g', 'Une exoplanète potentiellement habitable.', 'Super-Terre', true, 7000, 20, 5);
INSERT INTO public.planet VALUES (18, 'Kelpler-22b', 'Une exoplanète située dans la zonne habitable de son etoile.', 'Super-Terre', true, 4000, 600, 4);


--
-- Data for Name: planetsys; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetsys VALUES (1, 'Système Alpha', 'Premier système planétaire', 2);
INSERT INTO public.planetsys VALUES (2, 'Système Beta', 'Deuxième système planétaire', 3);
INSERT INTO public.planetsys VALUES (3, 'Système Gamma', 'Troisième système planétaire', 4);
INSERT INTO public.planetsys VALUES (4, 'Système Delta', 'Quatrième système planétaire', 5);
INSERT INTO public.planetsys VALUES (5, 'Système Epsilon', 'Cinquième système planétaire', 6);
INSERT INTO public.planetsys VALUES (6, 'Système Zeta', 'Sixième système planétaire', 7);
INSERT INTO public.planetsys VALUES (7, 'Système Eta', 'Septième système planétaire', 2);
INSERT INTO public.planetsys VALUES (8, 'Système Theta', 'Huitième système planétaire', 3);
INSERT INTO public.planetsys VALUES (9, 'Système Iota', 'Neuvième système planétaire', 4);
INSERT INTO public.planetsys VALUES (10, 'Système Kappa', 'Dixième système planétaire', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Soleil', 'Notre étoile, au centre du système solaire.', 'Naine jaune', true, 4600, 0, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'L étoile la plus brillante du ciel nocturne.', 'Naine blanche', true, 242, 9, 2);
INSERT INTO public.star VALUES (4, 'Bételgeuse', 'Une supergéante rouge dans la constellation d Orion.', 'Supergéante rouge', false, 10, 642, 3);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Une des étoiles du système stellaire le plus proche de la Terre.', 'Naine jaune', true, 4850, 4, 4);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'L étoile la plus proche de la Terre en dehors du Soleil.', 'Naine rouge', true, 4850, 4, 5);
INSERT INTO public.star VALUES (7, 'Véga', 'Une des étoiles les plus brillantes de la constellation de la Lyre.', 'Naine blanche', true, 455, 25, 6);


-
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: planetsys_planetsys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetsys_planetsys_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planetsys planetsys_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetsys
    ADD CONSTRAINT planetsys_name_key UNIQUE (name);
    
    
    
    
    --
-- Name: planetsys planetsys_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetsys
    ADD CONSTRAINT planetsys_pkey PRIMARY KEY (planetsys_id);


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
-- Name: planetsys planetsys_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetsys
    ADD CONSTRAINT planetsys_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--



























































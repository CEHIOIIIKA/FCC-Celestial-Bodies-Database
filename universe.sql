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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    mass_10e9_kg bigint,
    mean_diameter_km numeric(6,2),
    semimajor_axis_au numeric(6,2),
    is_in_asteroid_belt boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying NOT NULL,
    type character varying(20) NOT NULL,
    mass_10e9_suns smallint,
    size_in_parsecs numeric(5,2),
    absolute_magnitude numeric(4,1),
    galaxy_id integer NOT NULL
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
    planet_id integer,
    name character varying NOT NULL,
    mass_10e15_kg numeric(10,1),
    mean_radius_in_km numeric(6,2),
    semimajor_axis_in_km integer,
    orbital_period_in_days numeric(6,2),
    is_spherical boolean,
    is_tidal_locked boolean
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
    star_id integer,
    name character varying NOT NULL,
    type text NOT NULL,
    mass_in_earth_masses numeric(8,5),
    radius_in_earth_radiuses numeric(6,3),
    semimajor_axis_in_au numeric(6,2),
    orbital_period_in_days numeric(7,2),
    rotation_period_in_days numeric(6,2),
    effective_temperature_in_k smallint,
    is_visible_to_the_naked_eye boolean,
    is_in_habitable_zone boolean
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
    galaxy_id integer,
    name character varying NOT NULL,
    type character varying(20),
    mass_in_solar_masses numeric(5,2),
    radius_in_solar_radiuses numeric(5,2),
    temperature_in_k smallint,
    absolute_magnitude numeric(5,2),
    age_10e6_years integer,
    distance_from_earth_in_ly numeric(9,2)
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '4 Vesta', 259076000000, 525.40, 2.36, true);
INSERT INTO public.asteroid VALUES (2, '2 Pallas', 204000000000, 511.00, 2.77, true);
INSERT INTO public.asteroid VALUES (3, '10 Hygiea', 87400000000, 433.00, 3.14, true);
INSERT INTO public.asteroid VALUES (4, '704 Interamnia', 35000000000, 332.00, 3.06, true);
INSERT INTO public.asteroid VALUES (5, '99942 Apophis', 61, 0.37, 0.92, false);
INSERT INTO public.asteroid VALUES (6, '433 Eros', 6687000, 16.84, 1.46, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'barred spiral', 1150, 26.80, -20.9, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 'barred spiral', 1500, 46.56, -21.5, 2);
INSERT INTO public.galaxy VALUES ('Triangulum', 'spiral', 50, 18.74, -18.9, 3);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 'barred spiral', 138, 9.86, -18.5, 4);
INSERT INTO public.galaxy VALUES ('Messier 32', 'elliptical', 1, 5.00, -16.5, 5);
INSERT INTO public.galaxy VALUES ('Cartwheel', 'lenticular', 4, 44.23, NULL, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 73476730.9, 1737.40, 384399, 27.32, true, true);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 10.7, 11.27, 9376, 0.32, false, true);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 1.5, 6.20, 23463, 1.26, false, true);
INSERT INTO public.moon VALUES (5, 6, 'Europa', 47998440.0, 1560.80, 670900, 3.55, true, true);
INSERT INTO public.moon VALUES (6, 6, 'Ganymede', 148190000.0, 2634.10, 1070400, 7.15, true, true);
INSERT INTO public.moon VALUES (7, 6, 'Callisto', 107593800.0, 2410.30, 1882700, 16.69, true, true);
INSERT INTO public.moon VALUES (8, 7, 'Mimas', 37493.0, 198.20, 185539, 0.94, true, true);
INSERT INTO public.moon VALUES (9, 7, 'Enceladus', 108022.0, 252.10, 237948, 1.37, true, true);
INSERT INTO public.moon VALUES (10, 7, 'Tethys', 617449.0, 531.10, 294619, 1.89, true, true);
INSERT INTO public.moon VALUES (11, 7, 'Dione', 1095452.0, 561.40, 377396, 2.74, true, true);
INSERT INTO public.moon VALUES (12, 7, 'Rhea', 2306518.0, 763.80, 527108, 4.52, true, true);
INSERT INTO public.moon VALUES (13, 7, 'Titan', 134520000.0, 2574.73, 1221870, 15.95, true, true);
INSERT INTO public.moon VALUES (14, 7, 'Hyperion', 5619.9, 135.00, 1481009, 21.27, false, false);
INSERT INTO public.moon VALUES (15, 7, 'Iapetus', 1805635.0, 734.50, 3560820, 79.32, true, true);
INSERT INTO public.moon VALUES (16, 7, 'Phoebe', 8292.0, 106.50, 12960000, 550.56, false, false);
INSERT INTO public.moon VALUES (17, 8, 'Ariel', 1251000.0, 578.90, 191020, 2.52, true, true);
INSERT INTO public.moon VALUES (18, 8, 'Umbriel', 1275000.0, 584.70, 266000, 4.14, true, true);
INSERT INTO public.moon VALUES (19, 8, 'Titania', 3400000.0, 788.40, 435910, 8.71, true, true);
INSERT INTO public.moon VALUES (20, 8, 'Oberon', 3076000.0, 761.40, 583520, 13.46, true, true);
INSERT INTO public.moon VALUES (21, 8, 'Miranda', 64000.0, 235.80, 129390, 1.41, true, true);
INSERT INTO public.moon VALUES (22, 9, 'Triton', 21390000.0, 1353.40, 354759, 5.88, true, true);
INSERT INTO public.moon VALUES (23, 10, 'Charon', 1586000.0, 606.00, 19591, 6.39, true, true);
INSERT INTO public.moon VALUES (4, 6, 'Io', 89319380.0, 1821.60, 421700, 1.77, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'terrestrial', 0.05500, 0.383, 0.39, 87.97, 58.65, 437, true, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'terrestrial', 0.81500, 0.950, 0.72, 224.70, -243.02, 232, true, true);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'terrestrial', 1.00000, 1.000, 1.00, 365.26, 1.00, 288, true, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'terrestrial', 0.10700, 0.532, 1.52, 686.98, 1.30, 209, true, true);
INSERT INTO public.planet VALUES (5, 1, 'Ceres', 'dwarf planet', 0.00016, 0.074, 2.77, 1680.00, 0.38, 166, false, false);
INSERT INTO public.planet VALUES (6, 1, 'Jupiter', 'gas giant', 317.80000, 10.973, 5.20, 4332.59, 0.41, 88, true, false);
INSERT INTO public.planet VALUES (7, 1, 'Saturn', 'gas giant', 95.15900, 9.140, 9.58, 10759.22, 0.44, 81, true, false);
INSERT INTO public.planet VALUES (8, 1, 'Uranus', 'gas giant', 14.53600, 3.981, 19.19, 30688.50, -0.72, 58, false, false);
INSERT INTO public.planet VALUES (9, 1, 'Neptune', 'gas giant', 17.14700, 3.865, 30.07, 60195.00, 0.67, 47, false, false);
INSERT INTO public.planet VALUES (10, 1, 'Pluto', 'dwarf planet', 0.00218, 0.187, 39.48, 90560.00, -6.39, 32, false, false);
INSERT INTO public.planet VALUES (11, 5, 'Proxima Centauri b', 'terrestrial', 1.07000, 1.300, 0.05, 11.18, 0.00, 234, false, true);
INSERT INTO public.planet VALUES (12, 5, 'Proxima Centauri c', 'gas giant', 7.00000, NULL, 1.49, 1928.00, NULL, 39, false, false);
INSERT INTO public.planet VALUES (13, 5, 'Proxima Centauri d', 'terrestrial', 0.26000, 0.810, 0.03, 5.12, NULL, 360, false, false);
INSERT INTO public.planet VALUES (14, 8, 'Gliese 436 b', 'gas giant', 21.36000, 4.327, 0.03, 2.64, 0.00, 520, false, false);
INSERT INTO public.planet VALUES (15, 9, 'HD 219134 c', 'terrestrial', 4.36000, 1.511, 0.07, 6.76, 0.00, 782, false, false);
INSERT INTO public.planet VALUES (16, 10, 'HD 260655 b', 'terrestrial', 2.14000, 1.240, 0.03, 2.77, NULL, 709, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'yellow dwarf', 1.00, 1.00, 5772, 4.83, 4600, 0.00);
INSERT INTO public.star VALUES (2, 1, 'Aldebaran', 'red giant', 1.16, 45.10, 3900, -0.64, 6400, 65.30);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri A', 'yellow dwarf', 1.08, 1.22, 5790, 4.38, 5300, 4.34);
INSERT INTO public.star VALUES (4, 1, 'Alpha Centauri B', 'orange dwarf', 0.91, 0.86, 5260, 5.71, 5300, 4.34);
INSERT INTO public.star VALUES (5, 1, 'Proxima Centauri', 'red dwarf', 0.12, 0.15, 2992, 15.60, 4850, 4.25);
INSERT INTO public.star VALUES (6, 1, 'Sirius A', 'white dwarf', 2.06, 1.71, 9940, 1.43, 242, 8.60);
INSERT INTO public.star VALUES (7, 1, 'Sirius B', 'white dwarf', 1.02, 0.01, 25000, 11.18, 228, 8.60);
INSERT INTO public.star VALUES (8, 1, 'Gliese 436', 'red dwarf', 0.43, 0.43, 3477, 10.63, 9230, 31.88);
INSERT INTO public.star VALUES (9, 1, 'HD 219134', 'orange dwarf', 0.81, 0.78, 4699, 6.46, 11000, 21.34);
INSERT INTO public.star VALUES (10, 1, 'HD 260655', 'red dwarf', 0.44, 0.44, 3803, NULL, 2000, 32.61);
INSERT INTO public.star VALUES (11, 2, 'AE Andromedae', 'variable star', 50.00, 55.00, 20000, -7.00, NULL, 2500000.00);


--
-- Name: asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


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


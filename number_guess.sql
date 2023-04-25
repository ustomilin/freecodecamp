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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    played integer,
    best integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('malina', 1, 3);
INSERT INTO public.users VALUES ('user_1682395442841', 2, 11);
INSERT INTO public.users VALUES ('user_1682395442842', 5, 10);
INSERT INTO public.users VALUES ('user_1682395482653', 2, 4);
INSERT INTO public.users VALUES ('user_1682395482654', 5, 10);
INSERT INTO public.users VALUES ('user_1682395794879', 2, 7);
INSERT INTO public.users VALUES ('user_1682395794880', 5, 1);
INSERT INTO public.users VALUES ('petr', 3, 3);
INSERT INTO public.users VALUES ('arzzaba', 6, 1);
INSERT INTO public.users VALUES ('user_1682395875275', 2, 541);
INSERT INTO public.users VALUES ('user_1682395875276', 5, 131);
INSERT INTO public.users VALUES ('user_1682395951011', 2, 526);
INSERT INTO public.users VALUES ('user_1682395951012', 5, 183);
INSERT INTO public.users VALUES ('user_1682396002040', 2, 209);
INSERT INTO public.users VALUES ('user_1682396002041', 5, 393);
INSERT INTO public.users VALUES ('user_1682396007627', 2, 146);
INSERT INTO public.users VALUES ('user_1682396007628', 5, 100);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--


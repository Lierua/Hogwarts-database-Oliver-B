--
-- PostgreSQL database dump
--

\restrict HRfuT9r0ojEVFWc0mA5QzAg59XbwqtJNrjN0vgFBcXs5gEx3UlgaI6XjRMNwoRC

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-30 20:28:54

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

--
-- TOC entry 6 (class 2615 OID 16407)
-- Name: hogwarts; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA hogwarts;


ALTER SCHEMA hogwarts OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 231 (class 1259 OID 16478)
-- Name: course_student_ft; Type: TABLE; Schema: hogwarts; Owner: postgres
--

CREATE TABLE hogwarts.course_student_ft (
    id integer NOT NULL,
    course_fk integer,
    student_fk integer
);


ALTER TABLE hogwarts.course_student_ft OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16477)
-- Name: course_student_ft_id_seq; Type: SEQUENCE; Schema: hogwarts; Owner: postgres
--

ALTER TABLE hogwarts.course_student_ft ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hogwarts.course_student_ft_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16417)
-- Name: courses; Type: TABLE; Schema: hogwarts; Owner: postgres
--

CREATE TABLE hogwarts.courses (
    id integer NOT NULL,
    course character varying NOT NULL,
    teacher integer
);


ALTER TABLE hogwarts.courses OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16430)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: hogwarts; Owner: postgres
--

ALTER TABLE hogwarts.courses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hogwarts.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16414)
-- Name: houses; Type: TABLE; Schema: hogwarts; Owner: postgres
--

CREATE TABLE hogwarts.houses (
    id integer NOT NULL,
    houses character varying(200) NOT NULL,
    "Colors" character varying(200)[],
    "Founder" character varying(200)
);


ALTER TABLE hogwarts.houses OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16420)
-- Name: houses_id_seq; Type: SEQUENCE; Schema: hogwarts; Owner: postgres
--

ALTER TABLE hogwarts.houses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hogwarts.houses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16408)
-- Name: students; Type: TABLE; Schema: hogwarts; Owner: postgres
--

CREATE TABLE hogwarts.students (
    id integer NOT NULL,
    student_name character varying NOT NULL,
    house integer,
    starting_year integer CONSTRAINT students_start_year_not_null NOT NULL
);


ALTER TABLE hogwarts.students OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16460)
-- Name: students_id_seq; Type: SEQUENCE; Schema: hogwarts; Owner: postgres
--

ALTER TABLE hogwarts.students ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hogwarts.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16411)
-- Name: teachers; Type: TABLE; Schema: hogwarts; Owner: postgres
--

CREATE TABLE hogwarts.teachers (
    id integer NOT NULL,
    teacher_name character varying(200) CONSTRAINT teachers_teacher_not_null NOT NULL,
    house integer NOT NULL
);


ALTER TABLE hogwarts.teachers OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16441)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: hogwarts; Owner: postgres
--

ALTER TABLE hogwarts.teachers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME hogwarts.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 5052 (class 0 OID 16478)
-- Dependencies: 231
-- Data for Name: course_student_ft; Type: TABLE DATA; Schema: hogwarts; Owner: postgres
--

INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (1, 2, 2);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (2, 2, 1);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (3, 3, 4);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (4, 3, 3);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (5, 4, 4);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (6, 4, 3);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (7, 4, 1);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (8, 1, 2);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (9, 1, 4);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (10, 1, 3);
INSERT INTO hogwarts.course_student_ft OVERRIDING SYSTEM VALUE VALUES (11, 2, 4);


--
-- TOC entry 5046 (class 0 OID 16417)
-- Dependencies: 225
-- Data for Name: courses; Type: TABLE DATA; Schema: hogwarts; Owner: postgres
--

INSERT INTO hogwarts.courses OVERRIDING SYSTEM VALUE VALUES (1, 'Defence Against the Dark Arts', 5);
INSERT INTO hogwarts.courses OVERRIDING SYSTEM VALUE VALUES (2, 'Herbology', 3);
INSERT INTO hogwarts.courses OVERRIDING SYSTEM VALUE VALUES (3, 'Astronomy', 4);
INSERT INTO hogwarts.courses OVERRIDING SYSTEM VALUE VALUES (4, 'History of Magic', 2);


--
-- TOC entry 5045 (class 0 OID 16414)
-- Dependencies: 224
-- Data for Name: houses; Type: TABLE DATA; Schema: hogwarts; Owner: postgres
--

INSERT INTO hogwarts.houses OVERRIDING SYSTEM VALUE VALUES (1, 'Gryffindor', '{Scarlet,Gold}', 'Godric Gryffindor');
INSERT INTO hogwarts.houses OVERRIDING SYSTEM VALUE VALUES (2, 'Slytherin', '{Yellow,Black}', 'Helga Hufflepuff');
INSERT INTO hogwarts.houses OVERRIDING SYSTEM VALUE VALUES (3, 'Ravenclaw', '{Blue,Bronze}', 'Rowena Ravenclaw');
INSERT INTO hogwarts.houses OVERRIDING SYSTEM VALUE VALUES (4, 'Hufflepuff', '{Green,Sliver}', 'Salazar Slytherin');


--
-- TOC entry 5043 (class 0 OID 16408)
-- Dependencies: 222
-- Data for Name: students; Type: TABLE DATA; Schema: hogwarts; Owner: postgres
--

INSERT INTO hogwarts.students OVERRIDING SYSTEM VALUE VALUES (1, 'Cedric Diggory', 4, 1991);
INSERT INTO hogwarts.students OVERRIDING SYSTEM VALUE VALUES (2, 'Luna Lovegood', 3, 1991);
INSERT INTO hogwarts.students OVERRIDING SYSTEM VALUE VALUES (3, 'Draco Malfoy', 2, 1991);
INSERT INTO hogwarts.students OVERRIDING SYSTEM VALUE VALUES (4, 'Harry Potter', 1, 1991);
INSERT INTO hogwarts.students OVERRIDING SYSTEM VALUE VALUES (5, 'Megan Jones', 4, 1991);


--
-- TOC entry 5044 (class 0 OID 16411)
-- Dependencies: 223
-- Data for Name: teachers; Type: TABLE DATA; Schema: hogwarts; Owner: postgres
--

INSERT INTO hogwarts.teachers OVERRIDING SYSTEM VALUE VALUES (2, 'Jakub Gorski', 3);
INSERT INTO hogwarts.teachers OVERRIDING SYSTEM VALUE VALUES (3, 'Mirabel Garlick', 4);
INSERT INTO hogwarts.teachers OVERRIDING SYSTEM VALUE VALUES (4, 'Aurora Sinistra', 2);
INSERT INTO hogwarts.teachers OVERRIDING SYSTEM VALUE VALUES (5, 'Gilderoy Lockhart', 1);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 230
-- Name: course_student_ft_id_seq; Type: SEQUENCE SET; Schema: hogwarts; Owner: postgres
--

SELECT pg_catalog.setval('hogwarts.course_student_ft_id_seq', 11, true);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 227
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: hogwarts; Owner: postgres
--

SELECT pg_catalog.setval('hogwarts.courses_id_seq', 4, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 226
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: hogwarts; Owner: postgres
--

SELECT pg_catalog.setval('hogwarts.houses_id_seq', 4, true);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 229
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: hogwarts; Owner: postgres
--

SELECT pg_catalog.setval('hogwarts.students_id_seq', 5, true);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 228
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: hogwarts; Owner: postgres
--

SELECT pg_catalog.setval('hogwarts.teachers_id_seq', 6, true);


--
-- TOC entry 4890 (class 2606 OID 16483)
-- Name: course_student_ft course_student_ft_pkey; Type: CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.course_student_ft
    ADD CONSTRAINT course_student_ft_pkey PRIMARY KEY (id);


--
-- TOC entry 4888 (class 2606 OID 16440)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4886 (class 2606 OID 16429)
-- Name: houses houses_pkey; Type: CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);


--
-- TOC entry 4882 (class 2606 OID 16471)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4884 (class 2606 OID 16449)
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- TOC entry 4894 (class 2606 OID 16489)
-- Name: course_student_ft course; Type: FK CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.course_student_ft
    ADD CONSTRAINT course FOREIGN KEY (course_fk) REFERENCES hogwarts.courses(id);


--
-- TOC entry 4891 (class 2606 OID 16472)
-- Name: students house; Type: FK CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.students
    ADD CONSTRAINT house FOREIGN KEY (house) REFERENCES hogwarts.houses(id) NOT VALID;


--
-- TOC entry 4892 (class 2606 OID 16450)
-- Name: teachers house; Type: FK CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.teachers
    ADD CONSTRAINT house FOREIGN KEY (house) REFERENCES hogwarts.houses(id) NOT VALID;


--
-- TOC entry 4895 (class 2606 OID 16484)
-- Name: course_student_ft student; Type: FK CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.course_student_ft
    ADD CONSTRAINT student FOREIGN KEY (student_fk) REFERENCES hogwarts.students(id);


--
-- TOC entry 4893 (class 2606 OID 16455)
-- Name: courses teacher; Type: FK CONSTRAINT; Schema: hogwarts; Owner: postgres
--

ALTER TABLE ONLY hogwarts.courses
    ADD CONSTRAINT teacher FOREIGN KEY (teacher) REFERENCES hogwarts.teachers(id) NOT VALID;


-- Completed on 2026-10-30 20:28:55

--
-- PostgreSQL database dump complete
--

\unrestrict HRfuT9r0ojEVFWc0mA5QzAg59XbwqtJNrjN0vgFBcXs5gEx3UlgaI6XjRMNwoRC


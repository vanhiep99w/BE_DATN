toc.dat                                                                                             0000600 0004000 0002000 00000024324 13716217716 0014457 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                            x         	   timecloud    12.3    12.3 #    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         <           1262    24765 	   timecloud    DATABASE     �   CREATE DATABASE timecloud WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE timecloud;
                postgres    false         �            1259    24796    company    TABLE     k  CREATE TABLE public.company (
    "companyId" integer NOT NULL,
    "companyName" character varying(20) NOT NULL,
    avatar character varying(50),
    description character varying(50),
    "companyLogo" character varying(50),
    "createAt" timestamp with time zone NOT NULL,
    "createBy" integer NOT NULL,
    "modifyAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.company;
       public         heap    postgres    false         �            1259    24794    company_companyId_seq    SEQUENCE     �   ALTER TABLE public.company ALTER COLUMN "companyId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."company_companyId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209         �            1259    24789    project    TABLE     C  CREATE TABLE public.project (
    "projectId" integer NOT NULL,
    "projectName" character varying(20) NOT NULL,
    "clientName" character varying(20),
    "createAt" timestamp with time zone NOT NULL,
    "createBy" integer NOT NULL,
    "modifyAt" timestamp with time zone NOT NULL,
    "companyId" integer NOT NULL
);
    DROP TABLE public.project;
       public         heap    postgres    false         �            1259    24787    project_projectId_seq    SEQUENCE     �   ALTER TABLE public.project ALTER COLUMN "projectId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."project_projectId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207         �            1259    24806    project_user    TABLE     f   CREATE TABLE public.project_user (
    "projectId" integer NOT NULL,
    "userId" integer NOT NULL
);
     DROP TABLE public.project_user;
       public         heap    postgres    false         �            1259    24782    task    TABLE     �   CREATE TABLE public.task (
    "taskId" integer NOT NULL,
    "taskName" character varying(30) NOT NULL,
    "createAt" timestamp with time zone NOT NULL,
    "modifyAt" timestamp with time zone NOT NULL,
    "projectId" integer NOT NULL
);
    DROP TABLE public.task;
       public         heap    postgres    false         �            1259    24780    task_taskId_seq    SEQUENCE     �   ALTER TABLE public.task ALTER COLUMN "taskId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."task_taskId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205         �            1259    24775    time    TABLE     �   CREATE TABLE public."time" (
    "timeId" integer NOT NULL,
    "startTime" date NOT NULL,
    "endTime" date NOT NULL,
    description character varying(20) NOT NULL,
    "taskId" integer NOT NULL,
    "userId" integer NOT NULL
);
    DROP TABLE public."time";
       public         heap    postgres    false         �            1259    24773    time_timeId_seq    SEQUENCE     �   ALTER TABLE public."time" ALTER COLUMN "timeId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."time_timeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203         �            1259    24813    user    TABLE     p  CREATE TABLE public."user" (
    "userId" integer NOT NULL,
    "userName" character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(50) NOT NULL,
    gender boolean NOT NULL,
    address character varying(50),
    "phoneNumber" character varying(15),
    avatar character varying(50),
    "isActive" boolean NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false         �            1259    24801    user_company    TABLE     �   CREATE TABLE public.user_company (
    "userId" integer NOT NULL,
    "companyId" integer NOT NULL,
    role integer NOT NULL
);
     DROP TABLE public.user_company;
       public         heap    postgres    false         �            1259    24811    user_userId_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN "userId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."user_userId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213         2          0    24796    company 
   TABLE DATA           �   COPY public.company ("companyId", "companyName", avatar, description, "companyLogo", "createAt", "createBy", "modifyAt") FROM stdin;
    public          postgres    false    209       2866.dat 0          0    24789    project 
   TABLE DATA           |   COPY public.project ("projectId", "projectName", "clientName", "createAt", "createBy", "modifyAt", "companyId") FROM stdin;
    public          postgres    false    207       2864.dat 4          0    24806    project_user 
   TABLE DATA           =   COPY public.project_user ("projectId", "userId") FROM stdin;
    public          postgres    false    211       2868.dat .          0    24782    task 
   TABLE DATA           Y   COPY public.task ("taskId", "taskName", "createAt", "modifyAt", "projectId") FROM stdin;
    public          postgres    false    205       2862.dat ,          0    24775    time 
   TABLE DATA           c   COPY public."time" ("timeId", "startTime", "endTime", description, "taskId", "userId") FROM stdin;
    public          postgres    false    203       2860.dat 6          0    24813    user 
   TABLE DATA           {   COPY public."user" ("userId", "userName", email, password, gender, address, "phoneNumber", avatar, "isActive") FROM stdin;
    public          postgres    false    213       2870.dat 3          0    24801    user_company 
   TABLE DATA           C   COPY public.user_company ("userId", "companyId", role) FROM stdin;
    public          postgres    false    210       2867.dat =           0    0    company_companyId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."company_companyId_seq"', 10, true);
          public          postgres    false    208         >           0    0    project_projectId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."project_projectId_seq"', 10, true);
          public          postgres    false    206         ?           0    0    task_taskId_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."task_taskId_seq"', 235, true);
          public          postgres    false    204         @           0    0    time_timeId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."time_timeId_seq"', 1, false);
          public          postgres    false    202         A           0    0    user_userId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."user_userId_seq"', 21, true);
          public          postgres    false    212         �
           2606    24800    company company_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY ("companyId");
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public            postgres    false    209         �
           2606    24793    project project_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY ("projectId");
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public            postgres    false    207         �
           2606    24810    project_user project_user_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_pkey PRIMARY KEY ("projectId", "userId");
 H   ALTER TABLE ONLY public.project_user DROP CONSTRAINT project_user_pkey;
       public            postgres    false    211    211         �
           2606    24786    task task_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY ("taskId");
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public            postgres    false    205         �
           2606    24779    time time_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."time"
    ADD CONSTRAINT time_pkey PRIMARY KEY ("timeId", "taskId", "userId");
 :   ALTER TABLE ONLY public."time" DROP CONSTRAINT time_pkey;
       public            postgres    false    203    203    203         �
           2606    24805    user_company user_company_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.user_company
    ADD CONSTRAINT user_company_pkey PRIMARY KEY ("userId", "companyId");
 H   ALTER TABLE ONLY public.user_company DROP CONSTRAINT user_company_pkey;
       public            postgres    false    210    210         �
           2606    24817    user user_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userId");
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    213                                                                                                                                                                                                                                                                                                                    2866.dat                                                                                            0000600 0004000 0002000 00000001241 13716217716 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Jatri	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
2	Zoomcast	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
3	Tambee	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
4	Abata	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
5	Roombo	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
6	Skimia	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
7	Leenti	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
8	Linklinks	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
9	Skilith	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
10	Youbridge	\N	\N	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07
\.


                                                                                                                                                                                                                                                                                                                                                               2864.dat                                                                                            0000600 0004000 0002000 00000001170 13716217716 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Myworks	\N	2020-08-16 00:00:00+07	9	2020-08-16 00:00:00+07	5
2	Jazzy	\N	2020-08-16 00:00:00+07	1	2020-08-16 00:00:00+07	3
3	Quamba	\N	2020-08-16 00:00:00+07	2	2020-08-16 00:00:00+07	7
4	Meeveo	\N	2020-08-16 00:00:00+07	10	2020-08-16 00:00:00+07	8
5	Dablist	\N	2020-08-16 00:00:00+07	18	2020-08-16 00:00:00+07	4
6	Vipe	\N	2020-08-16 00:00:00+07	7	2020-08-16 00:00:00+07	2
7	Mycat	\N	2020-08-16 00:00:00+07	18	2020-08-16 00:00:00+07	5
8	Trunyx	\N	2020-08-16 00:00:00+07	6	2020-08-16 00:00:00+07	5
9	Linkbuzz	\N	2020-08-16 00:00:00+07	15	2020-08-16 00:00:00+07	8
10	Cogidoo	\N	2020-08-16 00:00:00+07	13	2020-08-16 00:00:00+07	4
\.


                                                                                                                                                                                                                                                                                                                                                                                                        2868.dat                                                                                            0000600 0004000 0002000 00000000005 13716217716 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2862.dat                                                                                            0000600 0004000 0002000 00000006767 13716217716 0014306 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        186	Social Worker	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	7
187	Community Outreach Specialist	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	2
188	Research Associate	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	3
189	Health Coach IV	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	3
190	VP Marketing	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	9
191	Product Engineer	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	2
192	Human Resources Manager	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	6
193	Analog Circuit Design manager	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	5
194	Assistant Media Planner	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	4
195	Media Manager II	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	7
196	Software Engineer III	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	10
197	Administrative Officer	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	7
198	Financial Advisor	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	7
199	Senior Cost Accountant	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	8
200	Social Worker	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	6
201	Editor	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	7
202	Occupational Therapist	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	10
203	Actuary	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	6
204	Internal Auditor	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	8
205	Executive Secretary	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	10
206	Speech Pathologist	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	1
207	Human Resources Assistant IV	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	5
208	Developer IV	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	6
209	Dental Hygienist	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	6
210	Teacher	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	10
211	Project Manager	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	2
212	Occupational Therapist	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	8
213	GIS Technical Architect	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	7
214	Librarian	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	1
215	Programmer Analyst III	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	9
216	Senior Cost Accountant	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	4
217	Accounting Assistant IV	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	2
218	Assistant Professor	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	7
219	Graphic Designer	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	10
220	Structural Engineer	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	3
221	Junior Executive	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	9
222	Quality Control Specialist	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	7
223	Account Coordinator	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	4
224	VP Product Management	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	4
225	Web Designer III	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	6
226	Information Systems Manager	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	7
227	Biostatistician II	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	4
228	Nurse Practicioner	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	2
229	Software Test Engineer I	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	9
230	Geologist IV	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	9
231	Associate Professor	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	5
232	Social Worker	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	4
233	Research Associate	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	4
234	Account Coordinator	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	5
235	Biostatistician III	2020-08-16 00:00:00+07	2020-08-16 00:00:00+07	2
\.


         2860.dat                                                                                            0000600 0004000 0002000 00000000005 13716217716 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2870.dat                                                                                            0000600 0004000 0002000 00000002754 13716217716 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	mgrandisson0	skuhlen0@jugem.jp	123	f	0581 Arizona Junction	287-239-9984	\N	f
3	ehuskinson1	mcommin1@microsoft.com	123	t	2677 Logan Way	500-494-4653	\N	f
4	cdunbabin2	ngreenland2@amazon.de	123	t	0411 International Lane	393-180-9962	\N	f
5	bhardan3	bmaggiori3@wsj.com	123	t	9950 Summerview Parkway	301-197-8854	\N	f
6	rwiddowes4	eprydden4@time.com	123	f	754 Cascade Circle	207-492-2977	\N	f
7	ogore5	cstratiff5@blogtalkradio.com	123	t	9649 Monica Avenue	696-603-0327	\N	f
8	dsilversmidt6	vwalworche6@4shared.com	123	f	2 American Road	188-945-1557	\N	f
9	jwait7	rstroban7@ihg.com	123	t	1 Merry Way	796-923-3511	\N	f
10	adoig8	gfishley8@dion.ne.jp	123	f	49 Dapin Parkway	344-581-8640	\N	f
11	ijuares9	sworsnip9@usda.gov	123	t	71699 Tomscot Road	356-269-1480	\N	f
12	haylletta	jgebharda@census.gov	123	t	49054 Thackeray Crossing	518-221-5893	\N	f
13	dgettenb	cgodspedeb@exblog.jp	123	f	90190 Mcguire Pass	615-623-8443	\N	f
14	gpreshoc	bculpc@bbb.org	123	f	432 Roxbury Crossing	803-208-1653	\N	f
15	atilburyd	bhardied@live.com	123	f	1 Alpine Lane	460-440-1407	\N	f
16	fwortone	gmarline@hao123.com	123	f	633 Mitchell Pass	421-728-8280	\N	f
17	nadderleyf	jsexstonef@sciencedirect.com	123	f	4 Grim Road	190-206-9452	\N	f
18	ckochelg	jnunnsg@psu.edu	123	t	31 Miller Alley	548-155-6331	\N	f
19	abonseyh	sduigedh@wired.com	123	f	4293 Longview Junction	558-230-8219	\N	f
20	oiacoboi	cbatterhami@chron.com	123	t	892 Service Pass	320-935-0007	\N	f
21	eswanwickj	rbaterj@princeton.edu	123	t	079 Leroy Trail	431-466-6902	\N	f
\.


                    2867.dat                                                                                            0000600 0004000 0002000 00000000261 13716217716 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	1	3
15	5	5
19	1	8
18	6	6
18	1	2
18	7	4
2	3	7
10	9	1
20	9	5
13	9	5
16	9	7
16	2	1
17	3	5
19	3	4
14	5	6
7	4	5
4	10	4
3	5	6
8	10	1
1	4	7
18	5	8
8	3	1
1	2	5
6	4	5
8	6	3
2	2	7
\.


                                                                                                                                                                                                                                                                                                                                               restore.sql                                                                                         0000600 0004000 0002000 00000022665 13716217716 0015412 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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

DROP DATABASE timecloud;
--
-- Name: timecloud; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE timecloud WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE timecloud OWNER TO postgres;

\connect timecloud

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
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    "companyId" integer NOT NULL,
    "companyName" character varying(20) NOT NULL,
    avatar character varying(50),
    description character varying(50),
    "companyLogo" character varying(50),
    "createAt" timestamp with time zone NOT NULL,
    "createBy" integer NOT NULL,
    "modifyAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: company_companyId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.company ALTER COLUMN "companyId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."company_companyId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    "projectId" integer NOT NULL,
    "projectName" character varying(20) NOT NULL,
    "clientName" character varying(20),
    "createAt" timestamp with time zone NOT NULL,
    "createBy" integer NOT NULL,
    "modifyAt" timestamp with time zone NOT NULL,
    "companyId" integer NOT NULL
);


ALTER TABLE public.project OWNER TO postgres;

--
-- Name: project_projectId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.project ALTER COLUMN "projectId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."project_projectId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: project_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_user (
    "projectId" integer NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.project_user OWNER TO postgres;

--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    "taskId" integer NOT NULL,
    "taskName" character varying(30) NOT NULL,
    "createAt" timestamp with time zone NOT NULL,
    "modifyAt" timestamp with time zone NOT NULL,
    "projectId" integer NOT NULL
);


ALTER TABLE public.task OWNER TO postgres;

--
-- Name: task_taskId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.task ALTER COLUMN "taskId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."task_taskId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."time" (
    "timeId" integer NOT NULL,
    "startTime" date NOT NULL,
    "endTime" date NOT NULL,
    description character varying(20) NOT NULL,
    "taskId" integer NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public."time" OWNER TO postgres;

--
-- Name: time_timeId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."time" ALTER COLUMN "timeId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."time_timeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    "userId" integer NOT NULL,
    "userName" character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(50) NOT NULL,
    gender boolean NOT NULL,
    address character varying(50),
    "phoneNumber" character varying(15),
    avatar character varying(50),
    "isActive" boolean NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_company (
    "userId" integer NOT NULL,
    "companyId" integer NOT NULL,
    role integer NOT NULL
);


ALTER TABLE public.user_company OWNER TO postgres;

--
-- Name: user_userId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN "userId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."user_userId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company ("companyId", "companyName", avatar, description, "companyLogo", "createAt", "createBy", "modifyAt") FROM stdin;
\.
COPY public.company ("companyId", "companyName", avatar, description, "companyLogo", "createAt", "createBy", "modifyAt") FROM '$$PATH$$/2866.dat';

--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project ("projectId", "projectName", "clientName", "createAt", "createBy", "modifyAt", "companyId") FROM stdin;
\.
COPY public.project ("projectId", "projectName", "clientName", "createAt", "createBy", "modifyAt", "companyId") FROM '$$PATH$$/2864.dat';

--
-- Data for Name: project_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_user ("projectId", "userId") FROM stdin;
\.
COPY public.project_user ("projectId", "userId") FROM '$$PATH$$/2868.dat';

--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task ("taskId", "taskName", "createAt", "modifyAt", "projectId") FROM stdin;
\.
COPY public.task ("taskId", "taskName", "createAt", "modifyAt", "projectId") FROM '$$PATH$$/2862.dat';

--
-- Data for Name: time; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."time" ("timeId", "startTime", "endTime", description, "taskId", "userId") FROM stdin;
\.
COPY public."time" ("timeId", "startTime", "endTime", description, "taskId", "userId") FROM '$$PATH$$/2860.dat';

--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" ("userId", "userName", email, password, gender, address, "phoneNumber", avatar, "isActive") FROM stdin;
\.
COPY public."user" ("userId", "userName", email, password, gender, address, "phoneNumber", avatar, "isActive") FROM '$$PATH$$/2870.dat';

--
-- Data for Name: user_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_company ("userId", "companyId", role) FROM stdin;
\.
COPY public.user_company ("userId", "companyId", role) FROM '$$PATH$$/2867.dat';

--
-- Name: company_companyId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."company_companyId_seq"', 10, true);


--
-- Name: project_projectId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."project_projectId_seq"', 10, true);


--
-- Name: task_taskId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."task_taskId_seq"', 235, true);


--
-- Name: time_timeId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."time_timeId_seq"', 1, false);


--
-- Name: user_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."user_userId_seq"', 21, true);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY ("companyId");


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY ("projectId");


--
-- Name: project_user project_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_pkey PRIMARY KEY ("projectId", "userId");


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY ("taskId");


--
-- Name: time time_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."time"
    ADD CONSTRAINT time_pkey PRIMARY KEY ("timeId", "taskId", "userId");


--
-- Name: user_company user_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_company
    ADD CONSTRAINT user_company_pkey PRIMARY KEY ("userId", "companyId");


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userId");


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
PGDMP                         x         	   timecloud    12.3    12.3 #    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    24765 	   timecloud    DATABASE     �   CREATE DATABASE timecloud WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE timecloud;
                postgres    false            �            1259    24796    company    TABLE     k  CREATE TABLE public.company (
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
       public         heap    postgres    false            �            1259    24794    company_companyId_seq    SEQUENCE     �   ALTER TABLE public.company ALTER COLUMN "companyId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."company_companyId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    24789    project    TABLE     C  CREATE TABLE public.project (
    "projectId" integer NOT NULL,
    "projectName" character varying(20) NOT NULL,
    "clientName" character varying(20),
    "createAt" timestamp with time zone NOT NULL,
    "createBy" integer NOT NULL,
    "modifyAt" timestamp with time zone NOT NULL,
    "companyId" integer NOT NULL
);
    DROP TABLE public.project;
       public         heap    postgres    false            �            1259    24787    project_projectId_seq    SEQUENCE     �   ALTER TABLE public.project ALTER COLUMN "projectId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."project_projectId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            �            1259    24806    project_user    TABLE     f   CREATE TABLE public.project_user (
    "projectId" integer NOT NULL,
    "userId" integer NOT NULL
);
     DROP TABLE public.project_user;
       public         heap    postgres    false            �            1259    24782    task    TABLE     �   CREATE TABLE public.task (
    "taskId" integer NOT NULL,
    "taskName" character varying(30) NOT NULL,
    "createAt" timestamp with time zone NOT NULL,
    "modifyAt" timestamp with time zone NOT NULL,
    "projectId" integer NOT NULL
);
    DROP TABLE public.task;
       public         heap    postgres    false            �            1259    24780    task_taskId_seq    SEQUENCE     �   ALTER TABLE public.task ALTER COLUMN "taskId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."task_taskId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205            �            1259    24775    time    TABLE     �   CREATE TABLE public."time" (
    "timeId" integer NOT NULL,
    "startTime" date NOT NULL,
    "endTime" date NOT NULL,
    description character varying(20) NOT NULL,
    "taskId" integer NOT NULL,
    "userId" integer NOT NULL
);
    DROP TABLE public."time";
       public         heap    postgres    false            �            1259    24773    time_timeId_seq    SEQUENCE     �   ALTER TABLE public."time" ALTER COLUMN "timeId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."time_timeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            �            1259    24813    user    TABLE     p  CREATE TABLE public."user" (
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
       public         heap    postgres    false            �            1259    24801    user_company    TABLE     �   CREATE TABLE public.user_company (
    "userId" integer NOT NULL,
    "companyId" integer NOT NULL,
    role integer NOT NULL
);
     DROP TABLE public.user_company;
       public         heap    postgres    false            �            1259    24811    user_userId_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN "userId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."user_userId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            2          0    24796    company 
   TABLE DATA           �   COPY public.company ("companyId", "companyName", avatar, description, "companyLogo", "createAt", "createBy", "modifyAt") FROM stdin;
    public          postgres    false    209   ()       0          0    24789    project 
   TABLE DATA           |   COPY public.project ("projectId", "projectName", "clientName", "createAt", "createBy", "modifyAt", "companyId") FROM stdin;
    public          postgres    false    207   �)       4          0    24806    project_user 
   TABLE DATA           =   COPY public.project_user ("projectId", "userId") FROM stdin;
    public          postgres    false    211   �*       .          0    24782    task 
   TABLE DATA           Y   COPY public.task ("taskId", "taskName", "createAt", "modifyAt", "projectId") FROM stdin;
    public          postgres    false    205   �*       ,          0    24775    time 
   TABLE DATA           c   COPY public."time" ("timeId", "startTime", "endTime", description, "taskId", "userId") FROM stdin;
    public          postgres    false    203   �-       6          0    24813    user 
   TABLE DATA           {   COPY public."user" ("userId", "userName", email, password, gender, address, "phoneNumber", avatar, "isActive") FROM stdin;
    public          postgres    false    213   �-       3          0    24801    user_company 
   TABLE DATA           C   COPY public.user_company ("userId", "companyId", role) FROM stdin;
    public          postgres    false    210   K1       =           0    0    company_companyId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."company_companyId_seq"', 10, true);
          public          postgres    false    208            >           0    0    project_projectId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."project_projectId_seq"', 10, true);
          public          postgres    false    206            ?           0    0    task_taskId_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."task_taskId_seq"', 235, true);
          public          postgres    false    204            @           0    0    time_timeId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."time_timeId_seq"', 1, false);
          public          postgres    false    202            A           0    0    user_userId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."user_userId_seq"', 21, true);
          public          postgres    false    212            �
           2606    24800    company company_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY ("companyId");
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public            postgres    false    209            �
           2606    24793    project project_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY ("projectId");
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public            postgres    false    207            �
           2606    24810    project_user project_user_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_pkey PRIMARY KEY ("projectId", "userId");
 H   ALTER TABLE ONLY public.project_user DROP CONSTRAINT project_user_pkey;
       public            postgres    false    211    211            �
           2606    24786    task task_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY ("taskId");
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public            postgres    false    205            �
           2606    24779    time time_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."time"
    ADD CONSTRAINT time_pkey PRIMARY KEY ("timeId", "taskId", "userId");
 :   ALTER TABLE ONLY public."time" DROP CONSTRAINT time_pkey;
       public            postgres    false    203    203    203            �
           2606    24805    user_company user_company_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.user_company
    ADD CONSTRAINT user_company_pkey PRIMARY KEY ("userId", "companyId");
 H   ALTER TABLE ONLY public.user_company DROP CONSTRAINT user_company_pkey;
       public            postgres    false    210    210            �
           2606    24817    user user_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userId");
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    213            2   �   x�3��J,)���"##]]C3+0�60�4�!�e������X\B�Ɯ!��I���`�阔X�H���A@o$�o�gpvfn&n0��IM�+� 2,8}2�s���|C,A��,� �C���Ҥ�̔t
"5F��� �b      0   �   x���1�0F�_�.�4m��U'�� N.�	�FZ�6���~7�=�R��w�N;�B�D�$-fB,7J
(���1���R ����ז�%4�P9�r��1�`m�o(�cG�p��ɟPO����e��ЎF/h���o�z���Wt�)�*\�%��3��i��_](}�      4      x������ � �      .   �  x���Oo1���S�^����g�7J҄�mhAɥ������N˷�3IH���H9��͛7CY��*-��ֺ��(DqV�g�Ż�ߛb���G����m�`�����I���E��|"Q�X�oԑt���.>�S"��aW$�~�'6>iz��h
v3�%��ڬ %�9����ֆ�%� �`W���C��O2r���U���[���TО�S�׆�Y��}�.���x���Z��V���5`����t���&zz�IGG�J%�P#6^�ڠ:'��'~�Zi�3'M�>h#�a���{��J��d�u0u��X)LT>U�DQ�4�CJv��>���]+v�|�!'w�q�&��V>H��(�ϦƓ�o��b��v�T8dNʑO̡8wG���I����E������ kvN����8I��(s |��W��&�^ e�q�$[5J[��!��S��J��eʊ]N�|�^���������g��O��I��I7K9�¬�l[47�=�%=.���N}��_��=Ž�m���ZW��d�(v�~o�zܙYF�]�p��g8%�b�'�cB��gN��5��m���D��5�[bߥ*�/���z:�浥����c�2|��C,��u�a��Bm�e��\�5�6�wN��f_��BI96ݑ�<�K����)�PU�.�qq�k��x�g+VV%N�n oU��3$b��0���?L��!���������2�      ,      x������ � �      6   �  x�U��n�6�ד��� )�;)P�H��7@7wC�4E["R��>}Ǳ��nm��3ߌ��gm(%E帎���?��ͻ�	��`��8y��5�s�f	)��Z**E��$����q-�Q��l�<���9��J�/;��CrѴ-yN^G�@��JR���MK��k����sqB��׳F;�6%&9'��娯��D�utP��򎡽F�$kF�����>���\w�����γ�o����:�h�b�r�Ү����s�6�]��N�b���_�����֒<�b�u�)d39�Ŭ�
ն7��O��`ʒ1�~_�Ô���c�6�{��T�%�`4y|squШ�6����`�����2�4�v��9e3���Kp�Σ �#�'i�먒5�u��)8�uXZ�h0:�}��+N^\Η�Y�hG��V5��9mS��}(�إ�1U�E���M�B��\J��Ѯ�l��+�/

�)1�T��w>�mVZ�(E^�\LZn�����Q���SI��/��E����q���NL*�|�9��/�	A.!z�yG��hPm��
�G=0>�rr��{�N�;�b\1�b��ì�@�k�`a���Z�	c���`��d�av)�ϲ*��އ5�y��:ʿ��׀8M�����l?��{Dq�'����F6���aWl>o`�e/	����>ۏ:��w*MU��� b�t�%��Vt�_��5�IF�p(�\U�}1�E�,Vb�;QI~�aިT�5W2�}��c�~��!�1ߟʺsv��W!���1"~j�]��h�MzH���Ů�;;����H�*<V����X��@�0 �|�	)h���aȣ�Coƌ��K��q�0fC�x���2�ٺ���Y�s0�ds�Пr�������U���t!�Y�	��xG�$(��s����?ˠ�P      3   i   x�%��1�R1� >�������;	9*�#���tG��r���*m�[x���G�=Hv�q�[E,��\@["�\W:3`g�����)1���W����}�����     
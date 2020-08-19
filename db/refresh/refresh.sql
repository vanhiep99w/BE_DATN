PGDMP         8                x         	   timecloud    12.3    12.3 #    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    24899 	   timecloud    DATABASE     �   CREATE DATABASE timecloud WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE timecloud;
                postgres    false            �            1259    24900    company    TABLE     e  CREATE TABLE public.company (
    company_id integer NOT NULL,
    company_name character varying(20) NOT NULL,
    avatar character varying(50),
    description character varying(50),
    company_logo character varying(50),
    create_at timestamp with time zone NOT NULL,
    create_by integer NOT NULL,
    modify_at timestamp with time zone NOT NULL
);
    DROP TABLE public.company;
       public         heap    postgres    false            �            1259    24903    company_companyId_seq    SEQUENCE     �   ALTER TABLE public.company ALTER COLUMN company_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."company_companyId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            �            1259    24905    project    TABLE     <  CREATE TABLE public.project (
    project_id integer NOT NULL,
    project_name character varying(20) NOT NULL,
    client_name character varying(20),
    create_at timestamp with time zone NOT NULL,
    create_by integer NOT NULL,
    modify_at timestamp with time zone NOT NULL,
    company_id integer NOT NULL
);
    DROP TABLE public.project;
       public         heap    postgres    false            �            1259    24908    project_projectId_seq    SEQUENCE     �   ALTER TABLE public.project ALTER COLUMN project_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."project_projectId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            �            1259    24910    project_user    TABLE     d   CREATE TABLE public.project_user (
    project_id integer NOT NULL,
    user_id integer NOT NULL
);
     DROP TABLE public.project_user;
       public         heap    postgres    false            �            1259    24913    task    TABLE     �   CREATE TABLE public.task (
    task_id integer NOT NULL,
    task_name character varying(30) NOT NULL,
    create_at timestamp with time zone NOT NULL,
    modify_at timestamp with time zone NOT NULL,
    project_id integer NOT NULL
);
    DROP TABLE public.task;
       public         heap    postgres    false            �            1259    24916    task_taskId_seq    SEQUENCE     �   ALTER TABLE public.task ALTER COLUMN task_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."task_taskId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            �            1259    24918    time    TABLE     �   CREATE TABLE public."time" (
    time_id integer NOT NULL,
    start_time date NOT NULL,
    end_time date NOT NULL,
    description character varying(20) NOT NULL,
    task_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public."time";
       public         heap    postgres    false            �            1259    24921    time_timeId_seq    SEQUENCE     �   ALTER TABLE public."time" ALTER COLUMN time_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."time_timeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    24923    user    TABLE     l  CREATE TABLE public."user" (
    user_id integer NOT NULL,
    user_name character varying(20) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(50) NOT NULL,
    gender boolean NOT NULL,
    address character varying(50),
    phone_number character varying(15),
    avatar character varying(50),
    is_active boolean NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    24926    user_company    TABLE        CREATE TABLE public.user_company (
    user_id integer NOT NULL,
    company_id integer NOT NULL,
    role integer NOT NULL
);
     DROP TABLE public.user_company;
       public         heap    postgres    false            �            1259    24929    user_userId_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."user_userId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            +          0    24900    company 
   TABLE DATA              COPY public.company (company_id, company_name, avatar, description, company_logo, create_at, create_by, modify_at) FROM stdin;
    public          postgres    false    202   �(       -          0    24905    project 
   TABLE DATA           u   COPY public.project (project_id, project_name, client_name, create_at, create_by, modify_at, company_id) FROM stdin;
    public          postgres    false    204   {)       /          0    24910    project_user 
   TABLE DATA           ;   COPY public.project_user (project_id, user_id) FROM stdin;
    public          postgres    false    206   5*       0          0    24913    task 
   TABLE DATA           T   COPY public.task (task_id, task_name, create_at, modify_at, project_id) FROM stdin;
    public          postgres    false    207   R*       2          0    24918    time 
   TABLE DATA           ^   COPY public."time" (time_id, start_time, end_time, description, task_id, user_id) FROM stdin;
    public          postgres    false    209   I-       4          0    24923    user 
   TABLE DATA           w   COPY public."user" (user_id, user_name, email, password, gender, address, phone_number, avatar, is_active) FROM stdin;
    public          postgres    false    211   f-       5          0    24926    user_company 
   TABLE DATA           A   COPY public.user_company (user_id, company_id, role) FROM stdin;
    public          postgres    false    212   �0       =           0    0    company_companyId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."company_companyId_seq"', 10, true);
          public          postgres    false    203            >           0    0    project_projectId_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."project_projectId_seq"', 10, true);
          public          postgres    false    205            ?           0    0    task_taskId_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."task_taskId_seq"', 235, true);
          public          postgres    false    208            @           0    0    time_timeId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."time_timeId_seq"', 1, false);
          public          postgres    false    210            A           0    0    user_userId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."user_userId_seq"', 21, true);
          public          postgres    false    213            �
           2606    24932    company company_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (company_id);
 >   ALTER TABLE ONLY public.company DROP CONSTRAINT company_pkey;
       public            postgres    false    202            �
           2606    24934    project project_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (project_id);
 >   ALTER TABLE ONLY public.project DROP CONSTRAINT project_pkey;
       public            postgres    false    204            �
           2606    24936    project_user project_user_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_pkey PRIMARY KEY (project_id, user_id);
 H   ALTER TABLE ONLY public.project_user DROP CONSTRAINT project_user_pkey;
       public            postgres    false    206    206            �
           2606    24938    task task_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_id);
 8   ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
       public            postgres    false    207            �
           2606    24940    time time_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."time"
    ADD CONSTRAINT time_pkey PRIMARY KEY (time_id, task_id, user_id);
 :   ALTER TABLE ONLY public."time" DROP CONSTRAINT time_pkey;
       public            postgres    false    209    209    209            �
           2606    24942    user_company user_company_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.user_company
    ADD CONSTRAINT user_company_pkey PRIMARY KEY (user_id, company_id);
 H   ALTER TABLE ONLY public.user_company DROP CONSTRAINT user_company_pkey;
       public            postgres    false    212    212            �
           2606    24944    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    211            +   �   x�3��J,)���"##]]C3+0�60�4�!�e������X\B�Ɯ!��I���`�阔X�H���A@o$�o�gpvfn&n0��IM�+� 2,8}2�s���|C,A��,� �C���Ҥ�̔t
"5F��� �b      -   �   x���1�0F�_�.�4m��U'�� N.�	�FZ�6���~7�=�R��w�N;�B�D�$-fB,7J
(���1���R ����ז�%4�P9�r��1�`m�o(�cG�p��ɟPO����e��ЎF/h���o�z���Wt�)�*\�%��3��i��_](}�      /      x������ � �      0   �  x���Oo1���S�^����g�7J҄�mhAɥ������N˷�3IH���H9��͛7CY��*-��ֺ��(DqV�g�Ż�ߛb���G����m�`�����I���E��|"Q�X�oԑt���.>�S"��aW$�~�'6>iz��h
v3�%��ڬ %�9����ֆ�%� �`W���C��O2r���U���[���TО�S�׆�Y��}�.���x���Z��V���5`����t���&zz�IGG�J%�P#6^�ڠ:'��'~�Zi�3'M�>h#�a���{��J��d�u0u��X)LT>U�DQ�4�CJv��>���]+v�|�!'w�q�&��V>H��(�ϦƓ�o��b��v�T8dNʑO̡8wG���I����E������ kvN����8I��(s |��W��&�^ e�q�$[5J[��!��S��J��eʊ]N�|�^���������g��O��I��I7K9�¬�l[47�=�%=.���N}��_��=Ž�m���ZW��d�(v�~o�zܙYF�]�p��g8%�b�'�cB��gN��5��m���D��5�[bߥ*�/���z:�浥����c�2|��C,��u�a��Bm�e��\�5�6�wN��f_��BI96ݑ�<�K����)�PU�.�qq�k��x�g+VV%N�n oU��3$b��0���?L��!���������2�      2      x������ � �      4   �  x�U��n�6�ד��� )�;)P�H��7@7wC�4E["R��>}Ǳ��nm��3ߌ��gm(%E帎���?��ͻ�	��`��8y��5�s�f	)��Z**E��$����q-�Q��l�<���9��J�/;��CrѴ-yN^G�@��JR���MK��k����sqB��׳F;�6%&9'��娯��D�utP��򎡽F�$kF�����>���\w�����γ�o����:�h�b�r�Ү����s�6�]��N�b���_�����֒<�b�u�)d39�Ŭ�
ն7��O��`ʒ1�~_�Ô���c�6�{��T�%�`4y|squШ�6����`�����2�4�v��9e3���Kp�Σ �#�'i�먒5�u��)8�uXZ�h0:�}��+N^\Η�Y�hG��V5��9mS��}(�إ�1U�E���M�B��\J��Ѯ�l��+�/

�)1�T��w>�mVZ�(E^�\LZn�����Q���SI��/��E����q���NL*�|�9��/�	A.!z�yG��hPm��
�G=0>�rr��{�N�;�b\1�b��ì�@�k�`a���Z�	c���`��d�av)�ϲ*��އ5�y��:ʿ��׀8M�����l?��{Dq�'����F6���aWl>o`�e/	����>ۏ:��w*MU��� b�t�%��Vt�_��5�IF�p(�\U�}1�E�,Vb�;QI~�aިT�5W2�}��c�~��!�1ߟʺsv��W!���1"~j�]��h�MzH���Ů�;;����H�*<V����X��@�0 �|�	)h���aȣ�Coƌ��K��q�0fC�x���2�ٺ���Y�s0�ds�Пr�������U���t!�Y�	��xG�$(��s����?ˠ�P      5   i   x�%��1�R1� >�������;	9*�#���tG��r���*m�[x���G�=Hv�q�[E,��\@["�\W:3`g�����)1���W����}�����     
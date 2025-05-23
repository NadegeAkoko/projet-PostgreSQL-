PGDMP      7                }        	   biblio_db    17.4    17.4     9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            <           1262    16440 	   biblio_db    DATABASE     o   CREATE DATABASE biblio_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'fr-FR';
    DROP DATABASE biblio_db;
                     postgres    false            =           0    0    DATABASE biblio_db    ACL     1   GRANT ALL ON DATABASE biblio_db TO biblio_admin;
                        postgres    false    4924            �            1259    16452    emprunteurs    TABLE        CREATE TABLE public.emprunteurs (
    id integer NOT NULL,
    nom character varying(100),
    email character varying(100)
);
    DROP TABLE public.emprunteurs;
       public         heap r       postgres    false            �            1259    16451    emprunteurs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.emprunteurs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.emprunteurs_id_seq;
       public               postgres    false    220            >           0    0    emprunteurs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.emprunteurs_id_seq OWNED BY public.emprunteurs.id;
          public               postgres    false    219            �            1259    16460    emprunts    TABLE     �   CREATE TABLE public.emprunts (
    id_emprunteur integer NOT NULL,
    id_livre integer NOT NULL,
    date_emprunt date DEFAULT CURRENT_DATE,
    date_retour_prevue date
);
    DROP TABLE public.emprunts;
       public         heap r       postgres    false            �            1259    16443    livres    TABLE     �   CREATE TABLE public.livres (
    id integer NOT NULL,
    titre character varying(255),
    auteur character varying(255),
    annee integer,
    genre character varying(50)
);
    DROP TABLE public.livres;
       public         heap r       postgres    false            �            1259    16442    livres_id_seq    SEQUENCE     �   CREATE SEQUENCE public.livres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.livres_id_seq;
       public               postgres    false    218            ?           0    0    livres_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.livres_id_seq OWNED BY public.livres.id;
          public               postgres    false    217            �            1259    16499    vue_livres_empruntes    VIEW       CREATE VIEW public.vue_livres_empruntes AS
 SELECT l.titre,
    e.nom,
    emp.date_emprunt,
    emp.date_retour_prevue
   FROM ((public.emprunts emp
     JOIN public.livres l ON ((emp.id_livre = l.id)))
     JOIN public.emprunteurs e ON ((emp.id_emprunteur = e.id)));
 '   DROP VIEW public.vue_livres_empruntes;
       public       v       postgres    false    221    221    220    218    218    220    221    221            �           2604    16455    emprunteurs id    DEFAULT     p   ALTER TABLE ONLY public.emprunteurs ALTER COLUMN id SET DEFAULT nextval('public.emprunteurs_id_seq'::regclass);
 =   ALTER TABLE public.emprunteurs ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    16446 	   livres id    DEFAULT     f   ALTER TABLE ONLY public.livres ALTER COLUMN id SET DEFAULT nextval('public.livres_id_seq'::regclass);
 8   ALTER TABLE public.livres ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            5          0    16452    emprunteurs 
   TABLE DATA           5   COPY public.emprunteurs (id, nom, email) FROM stdin;
    public               postgres    false    220   3       6          0    16460    emprunts 
   TABLE DATA           ]   COPY public.emprunts (id_emprunteur, id_livre, date_emprunt, date_retour_prevue) FROM stdin;
    public               postgres    false    221   �       3          0    16443    livres 
   TABLE DATA           A   COPY public.livres (id, titre, auteur, annee, genre) FROM stdin;
    public               postgres    false    218          @           0    0    emprunteurs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.emprunteurs_id_seq', 10, true);
          public               postgres    false    219            A           0    0    livres_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.livres_id_seq', 150, true);
          public               postgres    false    217            �           2606    16459 !   emprunteurs emprunteurs_email_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.emprunteurs
    ADD CONSTRAINT emprunteurs_email_key UNIQUE (email);
 K   ALTER TABLE ONLY public.emprunteurs DROP CONSTRAINT emprunteurs_email_key;
       public                 postgres    false    220            �           2606    16457    emprunteurs emprunteurs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.emprunteurs
    ADD CONSTRAINT emprunteurs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.emprunteurs DROP CONSTRAINT emprunteurs_pkey;
       public                 postgres    false    220            �           2606    16465    emprunts emprunts_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.emprunts
    ADD CONSTRAINT emprunts_pkey PRIMARY KEY (id_emprunteur, id_livre);
 @   ALTER TABLE ONLY public.emprunts DROP CONSTRAINT emprunts_pkey;
       public                 postgres    false    221    221            �           2606    16450    livres livres_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.livres
    ADD CONSTRAINT livres_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.livres DROP CONSTRAINT livres_pkey;
       public                 postgres    false    218            �           2606    16466 $   emprunts emprunts_id_emprunteur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.emprunts
    ADD CONSTRAINT emprunts_id_emprunteur_fkey FOREIGN KEY (id_emprunteur) REFERENCES public.emprunteurs(id);
 N   ALTER TABLE ONLY public.emprunts DROP CONSTRAINT emprunts_id_emprunteur_fkey;
       public               postgres    false    221    220    4763            �           2606    16471    emprunts emprunts_id_livre_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.emprunts
    ADD CONSTRAINT emprunts_id_livre_fkey FOREIGN KEY (id_livre) REFERENCES public.livres(id);
 I   ALTER TABLE ONLY public.emprunts DROP CONSTRAINT emprunts_id_livre_fkey;
       public               postgres    false    221    218    4759            5   a   x�3�t�OR�M,*���L�O��3R+srR���s��9�s�|R�RˊR9�A<�E�!�_~iYjb�_~.gbNfr�^JiA~^	��=... ��)�      6   P   x�M��� ��.T�	�a���a~'�|rX��y����4�� ݺ��<�2KVM�P�oծ
s֦_q������X      3   �  x���Kn�0�5u
^�����XM]������Fq'a�j�p�#��X��h%@��B?�o�pγ~s9�ږy����.�y��m���}�)HΪ]>�y(���ѩ/8�g������'�:�2��^�?i�ax��|��=�?���_sߣ����b�����#�s�e�����7�u��^�q�/��u��S����tk6��I�T7ٽ�8����0��r�
ިO}7M������休�7��B�	lA��2���V�lY�V�l�ΖmeҎ%��Ҏ.��Y&�x�Y��C{zh/�y����������e�X��ҁ.��A&X�A���K�t�IG�tKG�t�KG�tdIG�tdT�t�I'�tK'�t�K'�tbIC+���n-Za�uQ0bo0tp0tq02r0<s#77s�07Bs�3�wq`�q`�q�q��q�r`4r`Trvr����u�4� ��>�     
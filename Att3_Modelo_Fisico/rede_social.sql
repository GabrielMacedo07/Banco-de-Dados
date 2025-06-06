PGDMP  !                    }            rede_social    17.4    17.4 0    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            /           1262    16733    rede_social    DATABASE     q   CREATE DATABASE rede_social WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-BR';
    DROP DATABASE rede_social;
                     postgres    false            �            1259    16804 
   tb_amizade    TABLE       CREATE TABLE public.tb_amizade (
    amizade_id integer NOT NULL,
    usuario1_id integer NOT NULL,
    usuario2_id integer NOT NULL,
    amizade_data timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    amizade_status character varying(10) DEFAULT 'pendente'::character varying,
    CONSTRAINT tb_amizade_amizade_status_check CHECK (((amizade_status)::text = ANY ((ARRAY['pendente'::character varying, 'aceita'::character varying])::text[]))),
    CONSTRAINT tb_amizade_check CHECK ((usuario1_id <> usuario2_id))
);
    DROP TABLE public.tb_amizade;
       public         heap r       postgres    false            �            1259    16803    tb_amizade_amizade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_amizade_amizade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tb_amizade_amizade_id_seq;
       public               postgres    false    226            0           0    0    tb_amizade_amizade_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tb_amizade_amizade_id_seq OWNED BY public.tb_amizade.amizade_id;
          public               postgres    false    225            �            1259    16764    tb_comentario    TABLE     �   CREATE TABLE public.tb_comentario (
    comentario_id integer NOT NULL,
    post_id integer NOT NULL,
    usuario_id integer NOT NULL,
    comentario_texto text NOT NULL,
    comentario_data timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.tb_comentario;
       public         heap r       postgres    false            �            1259    16763    tb_comentario_comentario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_comentario_comentario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tb_comentario_comentario_id_seq;
       public               postgres    false    222            1           0    0    tb_comentario_comentario_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tb_comentario_comentario_id_seq OWNED BY public.tb_comentario.comentario_id;
          public               postgres    false    221            �            1259    16784 
   tb_curtida    TABLE     �   CREATE TABLE public.tb_curtida (
    curtida_id integer NOT NULL,
    post_id integer NOT NULL,
    usuario_id integer NOT NULL,
    curtida_data timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.tb_curtida;
       public         heap r       postgres    false            �            1259    16783    tb_curtida_curtida_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_curtida_curtida_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tb_curtida_curtida_id_seq;
       public               postgres    false    224            2           0    0    tb_curtida_curtida_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tb_curtida_curtida_id_seq OWNED BY public.tb_curtida.curtida_id;
          public               postgres    false    223            �            1259    16747    tb_post    TABLE     �  CREATE TABLE public.tb_post (
    post_id integer NOT NULL,
    usuario_id integer NOT NULL,
    post_conteudo text NOT NULL,
    post_data timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    post_visibilidade character varying(10) DEFAULT 'publico'::character varying,
    CONSTRAINT tb_post_post_visibilidade_check CHECK (((post_visibilidade)::text = ANY ((ARRAY['publico'::character varying, 'privado'::character varying])::text[])))
);
    DROP TABLE public.tb_post;
       public         heap r       postgres    false            �            1259    16746    tb_post_post_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_post_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tb_post_post_id_seq;
       public               postgres    false    220            3           0    0    tb_post_post_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tb_post_post_id_seq OWNED BY public.tb_post.post_id;
          public               postgres    false    219            �            1259    16735 
   tb_usuario    TABLE     �  CREATE TABLE public.tb_usuario (
    usuario_id integer NOT NULL,
    usuario_nome character varying(100) NOT NULL,
    usuario_email character varying(100) NOT NULL,
    usuario_senha character varying(255) NOT NULL,
    usuario_data_nascimento date,
    usuario_genero character varying(20),
    usuario_cidade character varying(50),
    usuario_foto_perfil character varying(255),
    usuario_data_cadastro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.tb_usuario;
       public         heap r       postgres    false            �            1259    16734    tb_usuario_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_usuario_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tb_usuario_usuario_id_seq;
       public               postgres    false    218            4           0    0    tb_usuario_usuario_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tb_usuario_usuario_id_seq OWNED BY public.tb_usuario.usuario_id;
          public               postgres    false    217            t           2604    16807    tb_amizade amizade_id    DEFAULT     ~   ALTER TABLE ONLY public.tb_amizade ALTER COLUMN amizade_id SET DEFAULT nextval('public.tb_amizade_amizade_id_seq'::regclass);
 D   ALTER TABLE public.tb_amizade ALTER COLUMN amizade_id DROP DEFAULT;
       public               postgres    false    226    225    226            p           2604    16767    tb_comentario comentario_id    DEFAULT     �   ALTER TABLE ONLY public.tb_comentario ALTER COLUMN comentario_id SET DEFAULT nextval('public.tb_comentario_comentario_id_seq'::regclass);
 J   ALTER TABLE public.tb_comentario ALTER COLUMN comentario_id DROP DEFAULT;
       public               postgres    false    221    222    222            r           2604    16787    tb_curtida curtida_id    DEFAULT     ~   ALTER TABLE ONLY public.tb_curtida ALTER COLUMN curtida_id SET DEFAULT nextval('public.tb_curtida_curtida_id_seq'::regclass);
 D   ALTER TABLE public.tb_curtida ALTER COLUMN curtida_id DROP DEFAULT;
       public               postgres    false    224    223    224            m           2604    16750    tb_post post_id    DEFAULT     r   ALTER TABLE ONLY public.tb_post ALTER COLUMN post_id SET DEFAULT nextval('public.tb_post_post_id_seq'::regclass);
 >   ALTER TABLE public.tb_post ALTER COLUMN post_id DROP DEFAULT;
       public               postgres    false    219    220    220            k           2604    16738    tb_usuario usuario_id    DEFAULT     ~   ALTER TABLE ONLY public.tb_usuario ALTER COLUMN usuario_id SET DEFAULT nextval('public.tb_usuario_usuario_id_seq'::regclass);
 D   ALTER TABLE public.tb_usuario ALTER COLUMN usuario_id DROP DEFAULT;
       public               postgres    false    217    218    218            )          0    16804 
   tb_amizade 
   TABLE DATA           h   COPY public.tb_amizade (amizade_id, usuario1_id, usuario2_id, amizade_data, amizade_status) FROM stdin;
    public               postgres    false    226   @       %          0    16764    tb_comentario 
   TABLE DATA           n   COPY public.tb_comentario (comentario_id, post_id, usuario_id, comentario_texto, comentario_data) FROM stdin;
    public               postgres    false    222   "@       '          0    16784 
   tb_curtida 
   TABLE DATA           S   COPY public.tb_curtida (curtida_id, post_id, usuario_id, curtida_data) FROM stdin;
    public               postgres    false    224   ?@       #          0    16747    tb_post 
   TABLE DATA           c   COPY public.tb_post (post_id, usuario_id, post_conteudo, post_data, post_visibilidade) FROM stdin;
    public               postgres    false    220   \@       !          0    16735 
   tb_usuario 
   TABLE DATA           �   COPY public.tb_usuario (usuario_id, usuario_nome, usuario_email, usuario_senha, usuario_data_nascimento, usuario_genero, usuario_cidade, usuario_foto_perfil, usuario_data_cadastro) FROM stdin;
    public               postgres    false    218   y@       5           0    0    tb_amizade_amizade_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tb_amizade_amizade_id_seq', 1, false);
          public               postgres    false    225            6           0    0    tb_comentario_comentario_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tb_comentario_comentario_id_seq', 1, false);
          public               postgres    false    221            7           0    0    tb_curtida_curtida_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tb_curtida_curtida_id_seq', 1, false);
          public               postgres    false    223            8           0    0    tb_post_post_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tb_post_post_id_seq', 1, false);
          public               postgres    false    219            9           0    0    tb_usuario_usuario_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.tb_usuario_usuario_id_seq', 1, true);
          public               postgres    false    217            �           2606    16792    tb_curtida curtida_unica 
   CONSTRAINT     b   ALTER TABLE ONLY public.tb_curtida
    ADD CONSTRAINT curtida_unica UNIQUE (post_id, usuario_id);
 B   ALTER TABLE ONLY public.tb_curtida DROP CONSTRAINT curtida_unica;
       public                 postgres    false    224    224            �           2606    16813    tb_amizade tb_amizade_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tb_amizade
    ADD CONSTRAINT tb_amizade_pkey PRIMARY KEY (amizade_id);
 D   ALTER TABLE ONLY public.tb_amizade DROP CONSTRAINT tb_amizade_pkey;
       public                 postgres    false    226            �           2606    16772     tb_comentario tb_comentario_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tb_comentario
    ADD CONSTRAINT tb_comentario_pkey PRIMARY KEY (comentario_id);
 J   ALTER TABLE ONLY public.tb_comentario DROP CONSTRAINT tb_comentario_pkey;
       public                 postgres    false    222            �           2606    16790    tb_curtida tb_curtida_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tb_curtida
    ADD CONSTRAINT tb_curtida_pkey PRIMARY KEY (curtida_id);
 D   ALTER TABLE ONLY public.tb_curtida DROP CONSTRAINT tb_curtida_pkey;
       public                 postgres    false    224                       2606    16757    tb_post tb_post_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tb_post
    ADD CONSTRAINT tb_post_pkey PRIMARY KEY (post_id);
 >   ALTER TABLE ONLY public.tb_post DROP CONSTRAINT tb_post_pkey;
       public                 postgres    false    220            {           2606    16743    tb_usuario tb_usuario_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_pkey PRIMARY KEY (usuario_id);
 D   ALTER TABLE ONLY public.tb_usuario DROP CONSTRAINT tb_usuario_pkey;
       public                 postgres    false    218            }           2606    16745 '   tb_usuario tb_usuario_usuario_email_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.tb_usuario
    ADD CONSTRAINT tb_usuario_usuario_email_key UNIQUE (usuario_email);
 Q   ALTER TABLE ONLY public.tb_usuario DROP CONSTRAINT tb_usuario_usuario_email_key;
       public                 postgres    false    218            �           2606    16814 &   tb_amizade tb_amizade_usuario1_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_amizade
    ADD CONSTRAINT tb_amizade_usuario1_id_fkey FOREIGN KEY (usuario1_id) REFERENCES public.tb_usuario(usuario_id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.tb_amizade DROP CONSTRAINT tb_amizade_usuario1_id_fkey;
       public               postgres    false    218    4731    226            �           2606    16819 &   tb_amizade tb_amizade_usuario2_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_amizade
    ADD CONSTRAINT tb_amizade_usuario2_id_fkey FOREIGN KEY (usuario2_id) REFERENCES public.tb_usuario(usuario_id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.tb_amizade DROP CONSTRAINT tb_amizade_usuario2_id_fkey;
       public               postgres    false    4731    226    218            �           2606    16773 (   tb_comentario tb_comentario_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comentario
    ADD CONSTRAINT tb_comentario_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.tb_post(post_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.tb_comentario DROP CONSTRAINT tb_comentario_post_id_fkey;
       public               postgres    false    220    4735    222            �           2606    16778 +   tb_comentario tb_comentario_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_comentario
    ADD CONSTRAINT tb_comentario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.tb_usuario(usuario_id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.tb_comentario DROP CONSTRAINT tb_comentario_usuario_id_fkey;
       public               postgres    false    222    218    4731            �           2606    16793 "   tb_curtida tb_curtida_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_curtida
    ADD CONSTRAINT tb_curtida_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.tb_post(post_id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.tb_curtida DROP CONSTRAINT tb_curtida_post_id_fkey;
       public               postgres    false    4735    224    220            �           2606    16798 %   tb_curtida tb_curtida_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_curtida
    ADD CONSTRAINT tb_curtida_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.tb_usuario(usuario_id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.tb_curtida DROP CONSTRAINT tb_curtida_usuario_id_fkey;
       public               postgres    false    4731    224    218            �           2606    16758    tb_post tb_post_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_post
    ADD CONSTRAINT tb_post_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.tb_usuario(usuario_id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.tb_post DROP CONSTRAINT tb_post_usuario_id_fkey;
       public               postgres    false    220    4731    218            )      x������ � �      %      x������ � �      '      x������ � �      #      x������ � �      !   �   x�-�;!����
6 �!�Le2����NsE2��0�+r)nL2Z���r$��V�tF��N�6�WL-W�۬?7pZ#��m��
JÄd� �}�2L����h���`z|��K�s͔�R�r7���Z�,��K�-�     
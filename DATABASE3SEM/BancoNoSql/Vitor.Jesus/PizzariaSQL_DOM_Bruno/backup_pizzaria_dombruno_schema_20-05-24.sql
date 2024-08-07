PGDMP  "                    |            Locadora_Veiculo    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16463    Locadora_Veiculo    DATABASE     �   CREATE DATABASE "Locadora_Veiculo" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 "   DROP DATABASE "Locadora_Veiculo";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16479    alugueis    TABLE     �   CREATE TABLE public.alugueis (
    id integer NOT NULL,
    id_carro integer,
    id_cliente integer,
    data_inicio date,
    data_fim date,
    valor numeric(10,2)
);
    DROP TABLE public.alugueis;
       public         heap    postgres    false    4            �            1259    16478    alugueis_id_seq    SEQUENCE     �   CREATE SEQUENCE public.alugueis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.alugueis_id_seq;
       public          postgres    false    220    4            �           0    0    alugueis_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.alugueis_id_seq OWNED BY public.alugueis.id;
          public          postgres    false    219            �            1259    16465    carros    TABLE     �   CREATE TABLE public.carros (
    id integer NOT NULL,
    marca character varying(100),
    modelo character varying(100),
    ano integer,
    cor character varying(50),
    disponivel boolean
);
    DROP TABLE public.carros;
       public         heap    postgres    false    4            �            1259    16464    carros_id_seq    SEQUENCE     �   CREATE SEQUENCE public.carros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.carros_id_seq;
       public          postgres    false    4    216            �           0    0    carros_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.carros_id_seq OWNED BY public.carros.id;
          public          postgres    false    215            �            1259    16472    clientes    TABLE     �   CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(100),
    email character varying(100),
    telefone character varying(20),
    endereco character varying(200)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false    4            �            1259    16471    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    218    4            �           0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    217            \           2604    16482    alugueis id    DEFAULT     j   ALTER TABLE ONLY public.alugueis ALTER COLUMN id SET DEFAULT nextval('public.alugueis_id_seq'::regclass);
 :   ALTER TABLE public.alugueis ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            Z           2604    16468 	   carros id    DEFAULT     f   ALTER TABLE ONLY public.carros ALTER COLUMN id SET DEFAULT nextval('public.carros_id_seq'::regclass);
 8   ALTER TABLE public.carros ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            [           2604    16475    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            b           2606    16484    alugueis alugueis_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.alugueis
    ADD CONSTRAINT alugueis_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.alugueis DROP CONSTRAINT alugueis_pkey;
       public            postgres    false    220            ^           2606    16470    carros carros_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.carros
    ADD CONSTRAINT carros_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.carros DROP CONSTRAINT carros_pkey;
       public            postgres    false    216            `           2606    16477    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    218            c           2606    16485    alugueis alugueis_id_carro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alugueis
    ADD CONSTRAINT alugueis_id_carro_fkey FOREIGN KEY (id_carro) REFERENCES public.carros(id);
 I   ALTER TABLE ONLY public.alugueis DROP CONSTRAINT alugueis_id_carro_fkey;
       public          postgres    false    220    216    4702            d           2606    16490 !   alugueis alugueis_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alugueis
    ADD CONSTRAINT alugueis_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);
 K   ALTER TABLE ONLY public.alugueis DROP CONSTRAINT alugueis_id_cliente_fkey;
       public          postgres    false    220    218    4704           
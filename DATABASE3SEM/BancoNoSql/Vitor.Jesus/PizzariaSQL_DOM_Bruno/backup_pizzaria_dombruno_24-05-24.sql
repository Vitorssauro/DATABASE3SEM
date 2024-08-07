PGDMP  %    -                |            pizzaria    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16462    pizzaria    DATABASE        CREATE DATABASE pizzaria WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE pizzaria;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16463    contatos    TABLE     !  CREATE TABLE public.contatos (
    id_contato integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    cel character varying(255) NOT NULL,
    pizza character varying(255) NOT NULL,
    cadastro date DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.contatos;
       public         heap    postgres    false    4            �            1259    16471    entregas    TABLE     �  CREATE TABLE public.entregas (
    id_entregas integer NOT NULL,
    nome character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    cel character varying(255) NOT NULL,
    pizza character varying(255) NOT NULL,
    cadastro date DEFAULT CURRENT_TIMESTAMP NOT NULL,
    situacao character varying(20),
    CONSTRAINT situacao_check CHECK (((situacao)::text = ANY ((ARRAY['entregue'::character varying, 'andamento'::character varying, 'cancelada'::character varying])::text[])))
);
    DROP TABLE public.entregas;
       public         heap    postgres    false    4            �            1259    16494    pedido    TABLE     a   CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    id_entregas integer NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false    4            �            1259    16493    pedido_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pedido_id_pedido_seq;
       public          postgres    false    218    4            �           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_id_pedido_seq OWNED BY public.pedido.id_pedido;
          public          postgres    false    217            $           2604    16497    pedido id_pedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);
 ?   ALTER TABLE public.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       public          postgres    false    218    217    218            �          0    16463    contatos 
   TABLE DATA                 public          postgres    false    215   <       �          0    16471    entregas 
   TABLE DATA                 public          postgres    false    216          �          0    16494    pedido 
   TABLE DATA                 public          postgres    false    218   #       �           0    0    pedido_id_pedido_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 1, false);
          public          postgres    false    217            '           2606    16470    contatos contatos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.contatos
    ADD CONSTRAINT contatos_pkey PRIMARY KEY (id_contato);
 @   ALTER TABLE ONLY public.contatos DROP CONSTRAINT contatos_pkey;
       public            postgres    false    215            )           2606    16478    entregas entregas_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.entregas
    ADD CONSTRAINT entregas_pkey PRIMARY KEY (id_entregas);
 @   ALTER TABLE ONLY public.entregas DROP CONSTRAINT entregas_pkey;
       public            postgres    false    216            +           2606    16499    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    218            ,           2606    16500    pedido fk_id_entregas    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_id_entregas FOREIGN KEY (id_entregas) REFERENCES public.entregas(id_entregas);
 ?   ALTER TABLE ONLY public.pedido DROP CONSTRAINT fk_id_entregas;
       public          postgres    false    216    4649    218            �   �  x�ŔMN�0��=���J5jҤ?bC�@*���)F�9�ÚS�b�$E�"�ae��/��[����o`y~sy��U��X���z*��06��*=�D�%W��H��b�������h�` �����R��4>[���\K2�X�Af��8�(XZ��'��pFb�0���;�? ���BX����5�5G��Ǔi�~o�$��-����q�����E*W'���K�� �K�2ϥ�F����� K�Y�����9�9d�ءY[�`��̕{k9�]�R#,lQk�c33!O!W��*����R��:F�;�5%�k�jӜ�f\�� ڰʂu�\���g�����ެ֚�9���G,"��;�JgФ;��U�Y9��끥;�����v�gUp��|&Tes�I�n��J~�3�������dsZ&X�T�湙��+�&~��N��      �     x�͕�N�@��y��%���v��!)�B�k5�������E-��s���MTPͱ���ٞ��|�xs�=�����Q��V��p����!���%FKP:9ҥR@�P@흍D�|��Xܮ�nN�b�Db��>��b��=)��`?�(+�G�-97J��X.泩�&i©5h�9��w�8�d<�i�Q��S����`�R�����m��K���t���l������S���m+� L��t���B�{T�S�T7QL%Q,9��
�5�_
0�Ԟ}�)�A�Xۺ=Ҋ�n��� ˸��e �������6�Ys�use�K�a7+ID���:�˾-1?X��A�m����$	d©cȭ�WM�FM�=����+]�*�4��_�7+J�;�ъJb*xr����9�f`=IB�����r��I�ٯ��S���K^����=�V��N#�z+rѸ�3^uOA2�N���X��r?{�I�?�c����4Z����3���c8I*x��n���I���`��ᚇ      �   
   x���         
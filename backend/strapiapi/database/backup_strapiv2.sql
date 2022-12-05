PGDMP     #                    z         	   strapiapi    14.1    14.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394 	   strapiapi    DATABASE     T   CREATE DATABASE strapiapi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE strapiapi;
                postgres    false            �            1259    16430    admin_permissions    TABLE     J  CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 %   DROP TABLE public.admin_permissions;
       public         heap    postgres    false            �            1259    16429    admin_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.admin_permissions_id_seq;
       public          postgres    false    218            �           0    0    admin_permissions_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;
          public          postgres    false    217            �            1259    16526    admin_permissions_role_links    TABLE     e   CREATE TABLE public.admin_permissions_role_links (
    permission_id integer,
    role_id integer
);
 0   DROP TABLE public.admin_permissions_role_links;
       public         heap    postgres    false            �            1259    16452    admin_roles    TABLE     ;  CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.admin_roles;
       public         heap    postgres    false            �            1259    16451    admin_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_roles_id_seq;
       public          postgres    false    222            �           0    0    admin_roles_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;
          public          postgres    false    221            �            1259    16441    admin_users    TABLE     B  CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.admin_users;
       public         heap    postgres    false            �            1259    16440    admin_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_users_id_seq;
       public          postgres    false    220            �           0    0    admin_users_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;
          public          postgres    false    219            �            1259    16531    admin_users_roles_links    TABLE     Z   CREATE TABLE public.admin_users_roles_links (
    user_id integer,
    role_id integer
);
 +   DROP TABLE public.admin_users_roles_links;
       public         heap    postgres    false            �            1259    16935    clientes    TABLE     3  CREATE TABLE public.clientes (
    id integer NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    just_for_validation_rol character varying(255)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16934    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public          postgres    false    244            �           0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public          postgres    false    243            �            1259    16474    files    TABLE     {  CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.files;
       public         heap    postgres    false            �            1259    16473    files_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public          postgres    false    226            �           0    0    files_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
          public          postgres    false    225            �            1259    16536    files_related_morphs    TABLE     �   CREATE TABLE public.files_related_morphs (
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);
 (   DROP TABLE public.files_related_morphs;
       public         heap    postgres    false            �            1259    16516    i18n_locale    TABLE       CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.i18n_locale;
       public         heap    postgres    false            �            1259    16515    i18n_locale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.i18n_locale_id_seq;
       public          postgres    false    234            �           0    0    i18n_locale_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;
          public          postgres    false    233            �            1259    16893    ingresos    TABLE     �  CREATE TABLE public.ingresos (
    id integer NOT NULL,
    fecha date,
    nombre_cliente character varying(255),
    nombre_trabajador character varying(255),
    cantidad integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    vueltas_restantes integer
);
    DROP TABLE public.ingresos;
       public         heap    postgres    false            �            1259    16892    ingresos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingresos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.ingresos_id_seq;
       public          postgres    false    240            �           0    0    ingresos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.ingresos_id_seq OWNED BY public.ingresos.id;
          public          postgres    false    239            �            1259    16915 	   servicios    TABLE     O  CREATE TABLE public.servicios (
    id integer NOT NULL,
    nombre_servicio character varying(255),
    precio_servicio numeric(10,2),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.servicios;
       public         heap    postgres    false            �            1259    16914    servicios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.servicios_id_seq;
       public          postgres    false    242            �           0    0    servicios_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.servicios_id_seq OWNED BY public.servicios.id;
          public          postgres    false    241            �            1259    16463    strapi_api_tokens    TABLE     h  CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 %   DROP TABLE public.strapi_api_tokens;
       public         heap    postgres    false            �            1259    16462    strapi_api_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_api_tokens_id_seq;
       public          postgres    false    224            �           0    0    strapi_api_tokens_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;
          public          postgres    false    223            �            1259    16412    strapi_core_store_settings    TABLE     �   CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);
 .   DROP TABLE public.strapi_core_store_settings;
       public         heap    postgres    false            �            1259    16411 !   strapi_core_store_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.strapi_core_store_settings_id_seq;
       public          postgres    false    214            �           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;
          public          postgres    false    213            �            1259    16403    strapi_database_schema    TABLE     �   CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);
 *   DROP TABLE public.strapi_database_schema;
       public         heap    postgres    false            �            1259    16402    strapi_database_schema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_database_schema_id_seq;
       public          postgres    false    212            �           0    0    strapi_database_schema_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;
          public          postgres    false    211            �            1259    16396    strapi_migrations    TABLE     �   CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);
 %   DROP TABLE public.strapi_migrations;
       public         heap    postgres    false            �            1259    16395    strapi_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_migrations_id_seq;
       public          postgres    false    210            �           0    0    strapi_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;
          public          postgres    false    209            �            1259    16421    strapi_webhooks    TABLE     �   CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);
 #   DROP TABLE public.strapi_webhooks;
       public         heap    postgres    false            �            1259    16420    strapi_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strapi_webhooks_id_seq;
       public          postgres    false    216            �           0    0    strapi_webhooks_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;
          public          postgres    false    215            �            1259    16485    up_permissions    TABLE     �   CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 "   DROP TABLE public.up_permissions;
       public         heap    postgres    false            �            1259    16484    up_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.up_permissions_id_seq;
       public          postgres    false    228            �           0    0    up_permissions_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;
          public          postgres    false    227            �            1259    16542    up_permissions_role_links    TABLE     b   CREATE TABLE public.up_permissions_role_links (
    permission_id integer,
    role_id integer
);
 -   DROP TABLE public.up_permissions_role_links;
       public         heap    postgres    false            �            1259    16494    up_roles    TABLE     8  CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.up_roles;
       public         heap    postgres    false            �            1259    16493    up_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_roles_id_seq;
       public          postgres    false    230            �           0    0    up_roles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;
          public          postgres    false    229            �            1259    16505    up_users    TABLE     �  CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    nombre character varying(255),
    apellidos character varying(255),
    no_identidad bigint,
    telefono bigint,
    direccion_particular text,
    no_solapin bigint
);
    DROP TABLE public.up_users;
       public         heap    postgres    false            �            1259    16504    up_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_users_id_seq;
       public          postgres    false    232            �           0    0    up_users_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;
          public          postgres    false    231            �            1259    17429    up_users_role_links    TABLE     V   CREATE TABLE public.up_users_role_links (
    user_id integer,
    role_id integer
);
 '   DROP TABLE public.up_users_role_links;
       public         heap    postgres    false            �           2604    16433    admin_permissions id    DEFAULT     |   ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);
 C   ALTER TABLE public.admin_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16455    admin_roles id    DEFAULT     p   ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);
 =   ALTER TABLE public.admin_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16444    admin_users id    DEFAULT     p   ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);
 =   ALTER TABLE public.admin_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    16938    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244            �           2604    16477    files id    DEFAULT     d   ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16519    i18n_locale id    DEFAULT     p   ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);
 =   ALTER TABLE public.i18n_locale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    16896    ingresos id    DEFAULT     j   ALTER TABLE ONLY public.ingresos ALTER COLUMN id SET DEFAULT nextval('public.ingresos_id_seq'::regclass);
 :   ALTER TABLE public.ingresos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240            �           2604    16918    servicios id    DEFAULT     l   ALTER TABLE ONLY public.servicios ALTER COLUMN id SET DEFAULT nextval('public.servicios_id_seq'::regclass);
 ;   ALTER TABLE public.servicios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    16466    strapi_api_tokens id    DEFAULT     |   ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);
 C   ALTER TABLE public.strapi_api_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16415    strapi_core_store_settings id    DEFAULT     �   ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);
 L   ALTER TABLE public.strapi_core_store_settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    16406    strapi_database_schema id    DEFAULT     �   ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);
 H   ALTER TABLE public.strapi_database_schema ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    16399    strapi_migrations id    DEFAULT     |   ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);
 C   ALTER TABLE public.strapi_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    16424    strapi_webhooks id    DEFAULT     x   ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);
 A   ALTER TABLE public.strapi_webhooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16488    up_permissions id    DEFAULT     v   ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);
 @   ALTER TABLE public.up_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    16497    up_roles id    DEFAULT     j   ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);
 :   ALTER TABLE public.up_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    16508    up_users id    DEFAULT     j   ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);
 :   ALTER TABLE public.up_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            �          0    16430    admin_permissions 
   TABLE DATA           �   COPY public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    218   K�       �          0    16526    admin_permissions_role_links 
   TABLE DATA           N   COPY public.admin_permissions_role_links (permission_id, role_id) FROM stdin;
    public          postgres    false    235   �       �          0    16452    admin_roles 
   TABLE DATA           x   COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    222   �      �          0    16441    admin_users 
   TABLE DATA           �   COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    220         �          0    16531    admin_users_roles_links 
   TABLE DATA           C   COPY public.admin_users_roles_links (user_id, role_id) FROM stdin;
    public          postgres    false    236   "      �          0    16935    clientes 
   TABLE DATA           �   COPY public.clientes (id, created_at, updated_at, published_at, created_by_id, updated_by_id, just_for_validation_rol) FROM stdin;
    public          postgres    false    244   C      �          0    16474    files 
   TABLE DATA           �   COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    226   `      �          0    16536    files_related_morphs 
   TABLE DATA           a   COPY public.files_related_morphs (file_id, related_id, related_type, field, "order") FROM stdin;
    public          postgres    false    237   }      �          0    16516    i18n_locale 
   TABLE DATA           k   COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    234   �      �          0    16893    ingresos 
   TABLE DATA           �   COPY public.ingresos (id, fecha, nombre_cliente, nombre_trabajador, cantidad, created_at, updated_at, published_at, created_by_id, updated_by_id, vueltas_restantes) FROM stdin;
    public          postgres    false    240         �          0    16915 	   servicios 
   TABLE DATA           �   COPY public.servicios (id, nombre_servicio, precio_servicio, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    242   d      �          0    16463    strapi_api_tokens 
   TABLE DATA           �   COPY public.strapi_api_tokens (id, name, description, type, access_key, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    224   �      �          0    16412    strapi_core_store_settings 
   TABLE DATA           \   COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
    public          postgres    false    214   �      �          0    16403    strapi_database_schema 
   TABLE DATA           J   COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
    public          postgres    false    212         �          0    16396    strapi_migrations 
   TABLE DATA           =   COPY public.strapi_migrations (id, name, "time") FROM stdin;
    public          postgres    false    210   !      �          0    16421    strapi_webhooks 
   TABLE DATA           R   COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
    public          postgres    false    216   :!      �          0    16485    up_permissions 
   TABLE DATA           j   COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    228   W!      �          0    16542    up_permissions_role_links 
   TABLE DATA           K   COPY public.up_permissions_role_links (permission_id, role_id) FROM stdin;
    public          postgres    false    238   �'      �          0    16494    up_roles 
   TABLE DATA           u   COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    230   �)      �          0    16505    up_users 
   TABLE DATA             COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id, nombre, apellidos, no_identidad, telefono, direccion_particular, no_solapin) FROM stdin;
    public          postgres    false    232   +      �          0    17429    up_users_role_links 
   TABLE DATA           ?   COPY public.up_users_role_links (user_id, role_id) FROM stdin;
    public          postgres    false    245   �-      �           0    0    admin_permissions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.admin_permissions_id_seq', 313, true);
          public          postgres    false    217            �           0    0    admin_roles_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);
          public          postgres    false    221            �           0    0    admin_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);
          public          postgres    false    219                        0    0    clientes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.clientes_id_seq', 2, true);
          public          postgres    false    243                       0    0    files_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.files_id_seq', 1, false);
          public          postgres    false    225                       0    0    i18n_locale_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.i18n_locale_id_seq', 2, true);
          public          postgres    false    233                       0    0    ingresos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.ingresos_id_seq', 44, true);
          public          postgres    false    239                       0    0    servicios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.servicios_id_seq', 2, true);
          public          postgres    false    241                       0    0    strapi_api_tokens_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, true);
          public          postgres    false    223                       0    0 !   strapi_core_store_settings_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 24, true);
          public          postgres    false    213                       0    0    strapi_database_schema_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 71, true);
          public          postgres    false    211                       0    0    strapi_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);
          public          postgres    false    209            	           0    0    strapi_webhooks_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);
          public          postgres    false    215            
           0    0    up_permissions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.up_permissions_id_seq', 311, true);
          public          postgres    false    227                       0    0    up_roles_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.up_roles_id_seq', 17, true);
          public          postgres    false    229                       0    0    up_users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.up_users_id_seq', 42, true);
          public          postgres    false    231            �           2606    16437 (   admin_permissions admin_permissions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_pkey;
       public            postgres    false    218            �           2606    16459    admin_roles admin_roles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_pkey;
       public            postgres    false    222            �           2606    16448    admin_users admin_users_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_pkey;
       public            postgres    false    220                       2606    16942    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    244            �           2606    16481    files files_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public            postgres    false    226            �           2606    16523    i18n_locale i18n_locale_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_pkey;
       public            postgres    false    234            
           2606    16900    ingresos ingresos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.ingresos
    ADD CONSTRAINT ingresos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.ingresos DROP CONSTRAINT ingresos_pkey;
       public            postgres    false    240                       2606    16920    servicios servicios_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.servicios DROP CONSTRAINT servicios_pkey;
       public            postgres    false    242            �           2606    16470 (   strapi_api_tokens strapi_api_tokens_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_pkey;
       public            postgres    false    224            �           2606    16419 :   strapi_core_store_settings strapi_core_store_settings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.strapi_core_store_settings DROP CONSTRAINT strapi_core_store_settings_pkey;
       public            postgres    false    214            �           2606    16410 2   strapi_database_schema strapi_database_schema_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_database_schema DROP CONSTRAINT strapi_database_schema_pkey;
       public            postgres    false    212            �           2606    16401 (   strapi_migrations strapi_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_migrations DROP CONSTRAINT strapi_migrations_pkey;
       public            postgres    false    210            �           2606    16428 $   strapi_webhooks strapi_webhooks_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strapi_webhooks DROP CONSTRAINT strapi_webhooks_pkey;
       public            postgres    false    216            �           2606    16490 "   up_permissions up_permissions_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_pkey;
       public            postgres    false    228            �           2606    16501    up_roles up_roles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_pkey;
       public            postgres    false    230            �           2606    16512    up_users up_users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_pkey;
       public            postgres    false    232            �           1259    16438 "   admin_permissions_created_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);
 6   DROP INDEX public.admin_permissions_created_by_id_fk;
       public            postgres    false    218                       1259    16529    admin_permissions_role_links_fk    INDEX     q   CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);
 3   DROP INDEX public.admin_permissions_role_links_fk;
       public            postgres    false    235                       1259    16530 #   admin_permissions_role_links_inv_fk    INDEX     o   CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);
 7   DROP INDEX public.admin_permissions_role_links_inv_fk;
       public            postgres    false    235            �           1259    16439 "   admin_permissions_updated_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);
 6   DROP INDEX public.admin_permissions_updated_by_id_fk;
       public            postgres    false    218            �           1259    16460    admin_roles_created_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);
 0   DROP INDEX public.admin_roles_created_by_id_fk;
       public            postgres    false    222            �           1259    16461    admin_roles_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);
 0   DROP INDEX public.admin_roles_updated_by_id_fk;
       public            postgres    false    222            �           1259    16449    admin_users_created_by_id_fk    INDEX     ]   CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);
 0   DROP INDEX public.admin_users_created_by_id_fk;
       public            postgres    false    220                       1259    16534    admin_users_roles_links_fk    INDEX     a   CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);
 .   DROP INDEX public.admin_users_roles_links_fk;
       public            postgres    false    236                       1259    16535    admin_users_roles_links_inv_fk    INDEX     e   CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);
 2   DROP INDEX public.admin_users_roles_links_inv_fk;
       public            postgres    false    236            �           1259    16450    admin_users_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);
 0   DROP INDEX public.admin_users_updated_by_id_fk;
       public            postgres    false    220                       1259    16943    clientes_created_by_id_fk    INDEX     W   CREATE INDEX clientes_created_by_id_fk ON public.clientes USING btree (created_by_id);
 -   DROP INDEX public.clientes_created_by_id_fk;
       public            postgres    false    244                       1259    16944    clientes_updated_by_id_fk    INDEX     W   CREATE INDEX clientes_updated_by_id_fk ON public.clientes USING btree (updated_by_id);
 -   DROP INDEX public.clientes_updated_by_id_fk;
       public            postgres    false    244            �           1259    16482    files_created_by_id_fk    INDEX     Q   CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);
 *   DROP INDEX public.files_created_by_id_fk;
       public            postgres    false    226                       1259    16541    files_related_morphs_fk    INDEX     [   CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);
 +   DROP INDEX public.files_related_morphs_fk;
       public            postgres    false    237            �           1259    16483    files_updated_by_id_fk    INDEX     Q   CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);
 *   DROP INDEX public.files_updated_by_id_fk;
       public            postgres    false    226            �           1259    16524    i18n_locale_created_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);
 0   DROP INDEX public.i18n_locale_created_by_id_fk;
       public            postgres    false    234                        1259    16525    i18n_locale_updated_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);
 0   DROP INDEX public.i18n_locale_updated_by_id_fk;
       public            postgres    false    234                       1259    16901    ingresos_created_by_id_fk    INDEX     W   CREATE INDEX ingresos_created_by_id_fk ON public.ingresos USING btree (created_by_id);
 -   DROP INDEX public.ingresos_created_by_id_fk;
       public            postgres    false    240                       1259    16902    ingresos_updated_by_id_fk    INDEX     W   CREATE INDEX ingresos_updated_by_id_fk ON public.ingresos USING btree (updated_by_id);
 -   DROP INDEX public.ingresos_updated_by_id_fk;
       public            postgres    false    240                       1259    16921    servicios_created_by_id_fk    INDEX     Y   CREATE INDEX servicios_created_by_id_fk ON public.servicios USING btree (created_by_id);
 .   DROP INDEX public.servicios_created_by_id_fk;
       public            postgres    false    242                       1259    16922    servicios_updated_by_id_fk    INDEX     Y   CREATE INDEX servicios_updated_by_id_fk ON public.servicios USING btree (updated_by_id);
 .   DROP INDEX public.servicios_updated_by_id_fk;
       public            postgres    false    242            �           1259    16471 "   strapi_api_tokens_created_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);
 6   DROP INDEX public.strapi_api_tokens_created_by_id_fk;
       public            postgres    false    224            �           1259    16472 "   strapi_api_tokens_updated_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);
 6   DROP INDEX public.strapi_api_tokens_updated_by_id_fk;
       public            postgres    false    224            �           1259    16491    up_permissions_created_by_id_fk    INDEX     c   CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);
 3   DROP INDEX public.up_permissions_created_by_id_fk;
       public            postgres    false    228                       1259    16545    up_permissions_role_links_fk    INDEX     k   CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);
 0   DROP INDEX public.up_permissions_role_links_fk;
       public            postgres    false    238                       1259    16546     up_permissions_role_links_inv_fk    INDEX     i   CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);
 4   DROP INDEX public.up_permissions_role_links_inv_fk;
       public            postgres    false    238            �           1259    16492    up_permissions_updated_by_id_fk    INDEX     c   CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);
 3   DROP INDEX public.up_permissions_updated_by_id_fk;
       public            postgres    false    228            �           1259    16502    up_roles_created_by_id_fk    INDEX     W   CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);
 -   DROP INDEX public.up_roles_created_by_id_fk;
       public            postgres    false    230            �           1259    16503    up_roles_updated_by_id_fk    INDEX     W   CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);
 -   DROP INDEX public.up_roles_updated_by_id_fk;
       public            postgres    false    230            �           1259    16513    up_users_created_by_id_fk    INDEX     W   CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);
 -   DROP INDEX public.up_users_created_by_id_fk;
       public            postgres    false    232                       1259    17432    up_users_role_links_fk    INDEX     Y   CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);
 *   DROP INDEX public.up_users_role_links_fk;
       public            postgres    false    245                       1259    17433    up_users_role_links_inv_fk    INDEX     ]   CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);
 .   DROP INDEX public.up_users_role_links_inv_fk;
       public            postgres    false    245            �           1259    16514    up_users_updated_by_id_fk    INDEX     W   CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);
 -   DROP INDEX public.up_users_updated_by_id_fk;
       public            postgres    false    232                       2606    16552 4   admin_permissions admin_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_created_by_id_fk;
       public          postgres    false    218    220    3555            (           2606    16642 <   admin_permissions_role_links admin_permissions_role_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_fk;
       public          postgres    false    3551    218    235            )           2606    16647 @   admin_permissions_role_links admin_permissions_role_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_inv_fk;
       public          postgres    false    235    3559    222                       2606    16557 4   admin_permissions admin_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_updated_by_id_fk;
       public          postgres    false    3555    218    220                       2606    16572 (   admin_roles admin_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_created_by_id_fk;
       public          postgres    false    3555    220    222                       2606    16577 (   admin_roles admin_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_updated_by_id_fk;
       public          postgres    false    220    222    3555                       2606    16562 (   admin_users admin_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_created_by_id_fk;
       public          postgres    false    220    3555    220            *           2606    16652 2   admin_users_roles_links admin_users_roles_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_fk;
       public          postgres    false    3555    236    220            +           2606    16657 6   admin_users_roles_links admin_users_roles_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_inv_fk;
       public          postgres    false    236    222    3559                       2606    16567 (   admin_users admin_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_updated_by_id_fk;
       public          postgres    false    220    220    3555            3           2606    16945 "   clientes clientes_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_created_by_id_fk;
       public          postgres    false    244    220    3555            4           2606    16950 "   clientes clientes_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_updated_by_id_fk;
       public          postgres    false    220    3555    244                       2606    16592    files files_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_created_by_id_fk;
       public          postgres    false    220    3555    226            ,           2606    16662 ,   files_related_morphs files_related_morphs_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.files_related_morphs DROP CONSTRAINT files_related_morphs_fk;
       public          postgres    false    226    237    3567                       2606    16597    files files_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_updated_by_id_fk;
       public          postgres    false    220    226    3555            &           2606    16632 (   i18n_locale i18n_locale_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_created_by_id_fk;
       public          postgres    false    234    3555    220            '           2606    16637 (   i18n_locale i18n_locale_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_updated_by_id_fk;
       public          postgres    false    234    220    3555            /           2606    16903 "   ingresos ingresos_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingresos
    ADD CONSTRAINT ingresos_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.ingresos DROP CONSTRAINT ingresos_created_by_id_fk;
       public          postgres    false    3555    240    220            0           2606    16908 "   ingresos ingresos_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingresos
    ADD CONSTRAINT ingresos_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.ingresos DROP CONSTRAINT ingresos_updated_by_id_fk;
       public          postgres    false    240    3555    220            1           2606    16923 $   servicios servicios_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.servicios DROP CONSTRAINT servicios_created_by_id_fk;
       public          postgres    false    3555    220    242            2           2606    16928 $   servicios servicios_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.servicios DROP CONSTRAINT servicios_updated_by_id_fk;
       public          postgres    false    242    3555    220                       2606    16582 4   strapi_api_tokens strapi_api_tokens_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_created_by_id_fk;
       public          postgres    false    224    3555    220                       2606    16587 4   strapi_api_tokens strapi_api_tokens_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_updated_by_id_fk;
       public          postgres    false    224    3555    220                        2606    16602 .   up_permissions up_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_created_by_id_fk;
       public          postgres    false    3555    228    220            -           2606    16667 6   up_permissions_role_links up_permissions_role_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_fk;
       public          postgres    false    3571    228    238            .           2606    16672 :   up_permissions_role_links up_permissions_role_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_inv_fk;
       public          postgres    false    238    230    3575            !           2606    16607 .   up_permissions up_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_updated_by_id_fk;
       public          postgres    false    3555    220    228            "           2606    16612 "   up_roles up_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_created_by_id_fk;
       public          postgres    false    3555    230    220            #           2606    16617 "   up_roles up_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_updated_by_id_fk;
       public          postgres    false    230    3555    220            $           2606    16622 "   up_users up_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_created_by_id_fk;
       public          postgres    false    232    220    3555            5           2606    17434 *   up_users_role_links up_users_role_links_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_fk;
       public          postgres    false    232    3579    245            6           2606    17439 .   up_users_role_links up_users_role_links_inv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_inv_fk;
       public          postgres    false    245    3575    230            %           2606    16627 "   up_users up_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_updated_by_id_fk;
       public          postgres    false    232    3555    220            �   �  x��YMo�8=;���y%��>(�]�=A���@[L�-
��lP�_�"�q,�� =�PD}�����P4��b�XV���a�Y1���}�w��~�#��8��d��e�� �>xw}�OIY��׊��S�9���`���4{��x��|���'��=y#��@��Ӕ@�@z.�Vl���6�%C6@'% ��doIr
$9�I�^I�_N�x/��-��{v�1��[j��w-��W]�a{�M��Q��z(��ʼ!��7mP�fS�m)+�B�DA�;
��(0����ך�eW����s�_ί���ҸQMAյ��;��Rv7�ƍrvFyS�J!�����m7����W�U:RՋV�RJzz���`5n4��7��*�N���aO�ݦq3!F���
$���7�H4J;������3w(rJ��	�5��R ��&C��s�9�>$`4�.��<r׌�}zf�j��~��ݻIn7�M�x���Ҹ���2>��c��ָ�'��\�r�l��sYtF�n�s��&/�P
ĖA^R^�%��g�v{c��M-����b��x0�\ ��$q#��d�3�ּ.ig����G�\$���e6�r����V��k&�߾�-�ٖ&����,
�E�����
��-w�{�
�Pȇ�G3sH߰�w�l�Ӟ$a�r�f�b�W҆�_Ǆ�A����F��V�2����!V慯�I��3�v5v��xD��=q�c��dD;]�� 0bx����t*�0"��,�n��7|H�1���@�C��1���)DjY�����h��6G2t���Kڵc��a�Ǭ�:��7����U瑺�k|���jĚ����2���<�́��mw%��z�_�<���!��>&����5uP�8��{�h����K�W$J�7����}_<�\�b9���k�ve�R�[c>I��?�̣h�%&!���u4�.{�p�C���
x��r���7Q�ԪCf�[����}��ol��|q-7��藰n�b�B6���N-���_�\t����1A}�=Y��(Z&�2J^Ƹ]|��(��`I�E��K�oМe�,j��cܾ�z�)������i�b�݂v������Y۾�f�"��np��M��"�ͮ�NA���J���G=�����k.T�ʶ��,���[�'?�J��?ʆ��J�5]��
����,�Jcud/	�t���tI�7c�ڋ=�����&�\�7�x7�/{Om�!�\��T�9۸w���As����T��ĭ�Gf��J�����	q�����@V��\�4��Ḟ��~6��	�Qi+�ܻ�MT\!:��;�m�����}�Pn�Nq�Ǚ�p��c�_���6X�iX��`a�����k����:��l����G'f�x������V���@=�}�{������?w^��      �   �   x�-��1D�o���0��^��B>Y+��hl��:�E]�]K��{��:;D,ۖ�E��C�~#��p�#�G!�B!�B!D �@"�D ��D$"�HD"��jju���NW9��t��֍��Y����f�Yif��z�i����B�3=      �   �   x�u���!@k�+�v#��%v�6�6#�.�
f0�����+H(�G�{��9/���>(������z�E�,@k�08x`�;�3�%'��Ić;�l��7�7#�q�w�q7|�m�_NeuF�����S��bUے���	lBA|�sv% d�Loe*��L�eL�ר�:�r�'
�TῨ�Zc��L�,$�/"��5y�_���~ ,A~_      �   �   x�3�t,�L��tK-*J-J���L	�A����F鹉�9z����*F�*�*�e��i��af�^z��&�&�Ei�YQ�!�Nޅ��f�9���!e��Uz� ����3D���*�Z������	Nq�f�=... ��0      �      x�3�4����� ]      �      x������ � �      �      x������ � �      �      x������ � �      �   j   x�3�t�K��,�P�H���L��4202�50�52U04�24�25�33��)�D\F���y`s���<M�yź��@#A\���������������)NqCNC�=... �"�      �   @  x�}��j�@��3O!?��s�eB���M!���!���M޾G�%#Y.�ƣΧ���x���=�6���3w��}�{���(4�)sp�㼮��@��B����6��'Z��9�á$&�EdY�a�ٹdI�����'����i������f��Y�� h ���R���D2���o��DN��$�_��p�@P���Č��T��*͝���1qE�4�/�-qBU�_�t{M�Y}n��������@�f��iE_��#;�ᢠ>~]�z߼�}g��LѵRࠞQQ��3i�tC�O���X�<b/%x�!fRӸ��Q���0u��K�|2��	�^1����%�2`fr��<���ŏN"4o퓦����H�J�����+p>�5M؉к>������8�4����(. .���"\�<�!^�E������?��L��2RW�U��+�5pfq$���B�rY3V���Y�ZZM���c�Y�9�Op�~UO��e{�	��y�*m��n�}	gd���:#�⺌#Ijl\IᆞO�`˅��������y�y�vެD��j=�u������Yk��'^�      �   f   x�u�1�0D�z}�\�����m��'�r%JCA�~��'{.��1���ڤ�P�y^�م��Fc�=����f��_BmBdWV���/y���_^J�h�#z      �   �   x�u�=�0@�99h�8�`b�Ķ�ĀT�?� қ>=L?>��3��R|_����Ǒ\�@k"Ε��
��
M�n8:���>��&�
Ɣ�ͬ��D;O2`���f�]J�Y1(�W��!�ܘ��"T�D@� -a���������j�6�      �      x��]�rܶ�[y��u��|��|87iZY�'nYcI�tl����!�	JQ<��k���$@��ǒ���|q9��:\,���.K��AsO�$�8��%��g���̋Q�ԥ�.��x��%���gK�����aA��x��9����|8�8��5�Fx8�Y��3Q��Or��`�?IC�7�����p�H���H�в��Pы$���
�d!�X���������"�������YaDr��0BS�w^�C�����߳e�5���I�Rd$-�ك4B^$Q�{pCr���)i���U�}8̋��8����k�>L�Y�D��C|�ץ]�j�׹��(7�8�L?U���i]��y?~���t9}˟oͣ��1Z�!��l�G�#��PjO�µ���zt5�>�i���UU�	�:�ռr�.)�ڒ�;��5~��
��P2�GHJ�;���~���q�s�_�VE5YU��~15�D�'F����Ƈ���DP>x�����6��qf6��S�6#YNE/]��P� ��n�c��7���j��5�Q��R0Yj��J�u��F܇O��3��|!
��PQ��P��&Yqx��:�j�>|f���z�2�Ơ��֭��`3~��3R%n�t®�M�V|�@r�0߀z�J�u��F�k��a�ɷ���4�r%�5u�,�bdk�~�<�_�x^0K�1�:ݬ4�Fzwx�a��j#_�&�8�b���k�!߸�l��.Vfr�5k��&���9��(�� 2��U�j����ǽ�r��O���gjMڕ{���"����<���<��:�$y;�ϻ	������,��w��I�w��W�`ǮDp��$Ñ@�xǝ���j�z{���&["j�d�)���A�����v ����h̾�Ș���E%(1�T5��7n{a��q��
*ډU���#�/ˌ-�)���մ}��%!]@,�St����������˒.�H{|�l�(hu_ʢN��m?ú@98�?��bI�+p
k�������/	�?���Q�ڟ�؜��;ٙ.	{yF�ʺ���t=#Z7�^���ץE�j��7D4��e��+���9QJ�u�.9�[�W���]��o k�5\�в#@����p�< 8����pV[gh[~!m��ldsIz�KX�(�|%5�N,�����P��䂯��>��<�<�j� ��~��K��]�����%����_zd�����\�V��$I���M����f�L��!�!?�"��Z]jCw�|O,%&�O�`������:$Q�E��L��kMR#�L�Y�+Kv���jg2sf+�e�����LU�"�D,�I�����i�MV�����CO|S=��>���?2�L�u��<�$
��(�ȴ�e�C�I]ڐ1�ߐ�^��8���α�_[]j3�KA2�� �V�zފ�ꕙ�,I�����!Q�X>�N�V��}�|�w%�L�����9d(��L��XH��r
����9�Cs�ԆM�J�� ��r���;�f4����fFfi����5؈�^�[B�K�R���W%O���&����ݫ�F��ɤ���>G(j~��IB]�MK��z!J �e�b,���a�WO���B�`%S���O�#S�uHh�H�Oi��U�,-�xc蟢hj� ��jf��۪Q�䗢���4EO�н��'�*�Z�S	^{_{�Ǹ�X�LO��mi	ck5�`1��g{�@�.) y#Jz*�$0M| ����9sxSI��k{��O��m�S:ߡ�rq"^�������:�V�5+���^������۬�f�6��Y����~�Q��ʅF��K��X7u&������p��D@�(�@�V��>݂�	�L5��oq���wO�ڇ��{-�{�ŷT�%JS��jNA7���^�a����ͦ�*�����m���z8�]���.A��v	jyow	��;�&�"J'��OT��$%��C@C�LC�Wur���Tt'���2N�}�0�� ��%Δh�_��T��GIq��Q�������Y��S<v1\�M�67��=��P�d{{����Q�Ķ�23y-ŕ�<%�q��� 4)��n�]�,�RT-��^4�鴪ߦL�0C3z���4"��h�T�Q��9}�d�@	��1Oŝ�؃�䬩�J�,�dz3�K3�|��=H�o�(b�8t4��G�L��]��wAF�W �:��<��0�N�+��k/���������Y��i�%�i�Okw��q�����$+���2��c߄����8�(�s�bj�i�z�졳׬�k���]�jжaU������x�6���d��X��K-�Uѵ�KՔ��Ǝ䩔���L�g�UB�|��M{4�?��AN��(�␎s�C�.���H���./h�Yy��1��sF_h�j/�P~�'��= �����\,��T�>Z�����������#���Zc���ج)u���Ⱦ���.6k�<�¯�����
��3���yE��I�.�����+�����+z�G����{�X�J�o��Xm.��M��J<8�����Y<�� ��o��
ҕOs( P�0�ZZ/DTI�>�#߷㛍K��p���F�kH�Z�f�;{Ŧ���������[͗ ���0�g�瓪��=~v&'XL�L�GZ��h��!E���~�П�����'E^��2�#�¢�	��-��&`���|����硏ۛ�c$��_w��z��ϋ��
 yh��n�(#�꣌}�]T��S_	���+�r������jD�KY�1���bŷ��D�/�)�6�2�=����{���=�ϾV�9�z	�
4�F��6�Qtu�����_�9E�4��0�k;���M>���q����wpFF�Gb�J|�l{$������[-��0e��;���$�QD�$KϒW!v2!�d�%C^�ϒ8i���� `�������V��=0��E��čtz�m�T
6+{:a4X�0���UGG6���o��_���8,�ȑ��[�T����U���m�v�j{w��৕k�M��������&e>�D]Dr�Q�����&�D�l)�Gn��b�",�PA�7�LC�R
������S>���T�����^���q��C_�R}?�\�'
:��OR�a���ǹ�ԝ�c��϶�m̹V�;�F|��?{r��e�\�Y��� ��ש��@#�E2��u��d��`*��ׇ�7�8�\i�s5�.��%e���j�m��pTlv֜�h�mw�tKֽX�=f۝���ˮ}�
���;��VK��ӊ��^͡r�m���[�;�z9�a�V����T����A બ����"�|]֓��{�։���g�ٞ��s�N���,54�k�j=8W�^7Mj��O��o�h)��+b����.?�ũ*���b���ueI���=��A9E��>�uw&	�\������/Tf�q<<(���7y��o�Y`z'Љ]G"�l�j�� ��J���	�]�3��s���s�F�;M������ȗ3mk��+�,��Q����� H2<)�G]0�R��e2A����>�r%X��8.�ȡ�e��dG�X[7(p��QlSO�γ�.���v�UMJ��U&�F�Y"v{'�&�pAi:>:P�Hr:~����?�a&�K��	�Ơ��&"5^N��
�ߓ����h|���������`=3�U�k�}��r,l&_�d��s�(����m�FM�u�u/F�l��:m��[�
��I(N֭�� �����wigW�Ƒ �Y���
�Y���}X�2|lF�ˢ.جi�;
u����p}�ɡ����#U��l%i�����rG�.�fXu�>��`6�UY�j�}�l�J�Y��u�=܎��h�s�|��n���ޯ��pU\�>��1��3���^pW���ʡeC�C�*9��6�4�j��Ӭ^@�:f8-7�$�Ǣ�AK���u��O���b�� ����j�1�x��3�FV��!	�h�wq04��gY�����䡉����9�qTI[xg�G��,c���o�}�׹h7`4� {  ���*��V�1!��偞��\\;�.���x�`�����A��⏬zg4`k��n��LD�?|w�~��}��c4���a������[^��1B�l��x0Kx$�����4�14�K���w�����������o����|��g��������?V�R+��2�@�j6���Hh�~��I$EL��܊�s:K���B�I0�����`>+�\9/��
C�c>�G��"\X?����d��܎�����y<}�Ë�i���I���3S��u0"��]}\,��7��2��	C��۪�����q8��W6�of03���;@Q4E�5�ut�@�̎�KGU){)�M
S�QrvWI�>�et�*#Pt����oq�M��g]�1;8M�떾�*� ��'�2ة�{�Re]�'�\.����
k�_��[�m��wBŴ����z��w@�e0��3޼}�$A��Ɍ�t��x������"�؝�/m�n �YO�-�T���~�k�C���b]~��C��"�d�~�:kq\��8�4K��>@�u��n����͎�����`�BNX���$X4������kS˛�y�r�
����VO�[`_�ID(V��:R�0�aؤkns"�9�	MZ����(/�a��o���nT����k�b��qw�b���8�0�K���
M���'�M�+	��)�n���d���r��-]�G���.'L4���&5o[L��
�r믡{�3[K���^*�h�jNd�d4m{���xӗ��=6}3�s ��.�o�Z�19A\����A߇au�!/?[� :^���5��r6}ͣ0w��$�i�6��F�^HP��Q�UQ�)��*rڐ���w%�4I����BC�ʑ5߇��T*aK.�uTj)�N����/��Ή��      �   �  x��\Ko�8>7����-l�Mߊ����4{�Jٌ)R )�i����,�r�h���:�1��<��Ǐ#Ro~y��7���'H���F����T�k��1LL����#���y�md�7<?����X�ƨ��<$�w*�A�LQ��`�XLԃ76*�G��BDRnn�7)�=OH��~�<]H��Thk�7����[���ʢ��:���S{�m��9�)��aV�=.�$��xC��@@̙�"�L3�L�W[1P��=S)g�#G��7=U�):BA镩;-E�h�΋�@3 2�J�Rr ��%4f�O@�Lk&�z�n�m.�|F�h�U��[k���ӄnѴ�j5�NS>�<(!Л��+T�z�J��땖ťR|&�����������k.��]{!hCBc�&��4��uI��=k`�A(e��hF�A*�+KD��Ia�6�n~.�%
B�e�7�؝�g�"����P&�������G�d���%bl�\�Hx_�h��t�@[�S�`�GN�md��mb�8�D����b�P`��~i�7r����	�U�<�o�i?�'�J4F�WV.�
ͯ2�Q�ω��d����h?�P��V�I":�%~��@[K"���PRT�t�X����@�� [�����l�ښ�3��55�G��	�G�A�ˆH�T$Ak��^�m��3;�7Q��֗
�Bs7�0A�-��b�]��o;ϟ��Pb�B�$8����F���-7 e���KM��G�@�bk�2�pJ�i��(d(���	~Kv-�;B�B�z"��V��}l)pC�o�Ր��Y릯n��/耚��m���������
7n>�l܂l�V@y[0�?��S����5���*w��
P9b�b�M�h���)$v���k/#��	7�V�l�_l�G���%�{F���O� �Tv��u����)f7 'R�p�f?+����9>5gp�sF�&P��c0��>A-l3c�K�s�+�RoEGc�^W�P���vl��-�Я��&��a��8c�5M��1�a"�1��^vp�r��r
�l=������2,u;��m��v�Zń-���cP�٣�n!�jw(�mg�OQ�l�y�P��eO+Nr^���|���+P�%�9�Rc�b<ݱ��_�?3#)$��,��|N�2,L9�����Ԓ��	�;��f�WX��9��o�5Z���޵�&�5Uy���\�߷��j[��V�����ן>��ҵ}#vr���<���dp�� �wة^/U�5v&uM�NӭĶWLU�=.���)=�u�>9{`l'J�2�מ��l
x���T�t�.�u�Z7dB�m��Wс�Yncܿ'KK�=Y�z+�E��G]��`uy��|q'��(~ �ج����:pL��n�m�@w�O'�����Tp/r��uG$��>��1��:ER�n*q��f�����������b<�^�/G��Bz>
FpuA��� �������������.�r      �      x������ � �      �      x������ � �      �   �  x��\Ɏ�6=wE����}�$A��\<��#Ė�N0��^Ԭ��6~�"��U�E��=췧��_.Oc{����Ʊ�1Y��'�vl�����y����/|��6ˬZ�,�˚�������D�<^��!�o<��3���ݪ�~���[������ב�߬�m4~#�?w���>����ðm�������e4�_�Lv��6��,$h��Ϛ�iV}�QE/����N�1�����O+^yA]?���r��/S��_jV�:�#ǯ�MqA]o��?Nz���
���KW$eU���,�bN��o�����q����j���Z�sr_>�r�gKW%MF_'"�	� ��=���o��8t/?�K7�C|ܦ�p����@Ӷ	rUP��ň���Ahq/��1�L��v<��q�\�d :��g�]$0���$�������]�8x�e��v�Zf�s%1m���p~�KL�~��R�i��-�^�u⪜�B�4�ǌDm¨�6���r�Z�a�Y��0���bA}8cd�I������I/��Z�QmSZ��p�R�� h́���pM6P��ijKG��̠|ߦ���8����s�.~���朼��C?����w�t6��vXm���p��DΣ$�������灿^��r�������S�X����su�l����v*�~���En�u��mY��}$e�r��9	���}����*D�\f.sYxH�UT�����)V@s�A	�\VJ��ts������H$�!AO+=֍*ACM2��|׆(y¶�J�l:,�Q�t��m]*�o�iR�9~�t���A�{��w�������2�$�YO�_1��o>��7�꾹��^UM����2�*c*K?�����JF�U(*qZd4��3.���Cq�6��ں�͌�%�g��P���(�=*�SQu����,A�����ّ;�Ԁ(v�/�Qh���R݀�b����cT��	���χ�8W6�]T w�C�� ���4�`T��`�-H'�옶�Zl�G͝��O�qt�[��k��C-S <��a�$��]��pnM6���c�{�0��sgB8&�)������=��y������
�_�<���a2�~� ��-aD�Jn�x�F%��pѦF%�L�b�4��5�C$5*�h`Z,O�����i��-jT��ղ`%&`�qI�ɸh�}5_sGEAK�H��f���E�QӉ]zaD͙��5d�
#Zd�a�-u�4b�6Q�j	ОU� �[�G�b9���=.�(�c/�(��/�(�ϣ;���bQ��Ʈ��<�f����<n�gT�f:)���"�!��Q(=Mn�M�0v�
�Ѿe�Jl��$Te���������;���)<���@}�	F�2$��i�)��G��s���-��\l1���3���1�&
�Q���j����[CǞ�U3���j���AWe���-��܊��Վ%&��S#�sE���8JC+����4zBc6�_����h��{%Ɇ&�wl�F�5A�Mp}�OT?1�>�_JQ���9�nD��ڍ�s
cc0y%̄�?�4��WFm������.�I�ѡ���%���_�P�8��jU5��Cc�A�؀��!To���Ŧ'�'I��٠S�*�1�̬�<���KUJ�
C�W�ԧ�E�~S��=y||����?      �   �  x�-���� ���l�r��Ǳ�4�����׿Sq.ǭX�/��.�Sw>�c�i����!�B(L�R
Ka+���Sũ��\�.��|�� ��M=L	�S�)�1e�.V"�u��Rq	+Օ��TlɲT��.�������_�ţN
R�i�^�"a)�BV�R����$x!+,��]/�/����z8mkٌ�!��6��l#��6�8/a9Xγ��\ٺi�����5F�t�� %i�&�HXzc�=Y�ұt,K�ҟ��p�3�����,_%��|��K�w)}�|��o�Q��t�G�9;ʷ잫�4��,0G�����:�>ݜ}�n�p��w%�9؆uV�o!�s�u�i?)/mٱ�8����|���i�~�*8.M7򒒷:Mk��@�Pr6���7�߸�����I�o�e���\��k��>��������?߷��      �   ?  x�m��n� ���)x����C­�v����K�����I{��m�Hi%$l���� ��FF��>����1D��uc�V���&v)MJp�yIG�戛6XI���*UU��7�ȼ5Ec0W��b��+C�2�{�=B߰�:*q<�<&��X�
�j&B-v��bo$i���Pi�6Jo���ȏ��L�W�����;V@��t_)�J�&S���'8�)�p}.Od���.}�ar�
<�.�H���؊E݆�䠁B5%����R馘�b�3ե1�(vac�o�;�n`�RHZ�k	�)Z�x�>k�U��ܫ,�����[      �   �  x�}�ے�8��姠*s�nIq�>��:��;�ؕ!���Ǝ��W>Lv/�E���.$}� Fma�A�}%���S,V�(}S�HY]��7@oJSϋa^� ^�f�_�z���71�튙*��a�<ft�d �����ط$'H?R׹A$ ��ٯ0�GU*b��\Kt���C����n��#��T�@����{�2[zS���� ���A�1q滭�n:�ϐ�����^r�܏QVOcl&�7~�q���x�'�D��~2T�.��/��7�G�0"��a/q���ȥ|��j��-�7nd��Yg�Lu�g��^��bN����g�X~2p��h=K��^���c��l*�J��o�v�̋�&��AD�� ��@�H�� Oz���0$��7���8�]Z�̱>�k��a:�/Ŷ���n�������8���d��O�t��ϣ���?�.���;�}.�8(���~�ŉcPڥ�2g��m[�j* �^{�4 ��%���À��:��Ve��:��E@)�F�J��ш�q$'����7:��m;n���'��6K;zRI�;l�2�^��,Oe.�L�*��ZS)S���m����;d��Q(Jk1��!����J��b6@3�wkυ0����ܸ����"���<�4��+q��pLy��������g���ƅ~#
)���,��N�Ƕ��Lg�fW~<t� ����z� WKu      �   &   x�34�4�24Ʀ���\�f��f\����\1z\\\ K$h     
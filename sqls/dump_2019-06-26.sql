--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO ben;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO ben;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO ben;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO ben;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO ben;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO ben;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO ben;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO ben;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO ben;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO ben;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO ben;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO ben;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO ben;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO ben;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO ben;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO ben;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO ben;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO ben;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO ben;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO ben;

--
-- Name: iaer_category; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE iaer_category (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    sequence smallint NOT NULL,
    created date,
    modified date,
    CONSTRAINT iaer_category_sequence_check CHECK ((sequence >= 0))
);


ALTER TABLE iaer_category OWNER TO ben;

--
-- Name: iaer_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE iaer_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE iaer_category_id_seq OWNER TO ben;

--
-- Name: iaer_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE iaer_category_id_seq OWNED BY iaer_category.id;


--
-- Name: iaer_fund; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE iaer_fund (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    monthly_money smallint NOT NULL,
    yearly_money integer NOT NULL,
    alternate_money integer NOT NULL,
    created date,
    modified date,
    CONSTRAINT iaer_fund_alternate_money_check CHECK ((alternate_money >= 0)),
    CONSTRAINT iaer_fund_monthly_money_check CHECK ((monthly_money >= 0)),
    CONSTRAINT iaer_fund_yearly_money_check CHECK ((yearly_money >= 0))
);


ALTER TABLE iaer_fund OWNER TO ben;

--
-- Name: iaer_fund_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE iaer_fund_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE iaer_fund_id_seq OWNER TO ben;

--
-- Name: iaer_fund_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE iaer_fund_id_seq OWNED BY iaer_fund.id;


--
-- Name: iaer_iaer; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE iaer_iaer (
    id integer NOT NULL,
    money integer NOT NULL,
    category character varying(30) NOT NULL,
    money_type integer NOT NULL,
    remark character varying(100) NOT NULL,
    created timestamp with time zone,
    type integer NOT NULL,
    chart_type integer NOT NULL,
    format character varying(50),
    datetime timestamp with time zone,
    description text,
    timing character varying(100),
    user_id integer NOT NULL
);


ALTER TABLE iaer_iaer OWNER TO ben;

--
-- Name: iaer_iaer_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE iaer_iaer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE iaer_iaer_id_seq OWNER TO ben;

--
-- Name: iaer_iaer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE iaer_iaer_id_seq OWNED BY iaer_iaer.id;


--
-- Name: iaer_redenvelope; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE iaer_redenvelope (
    id integer NOT NULL,
    money character varying(10),
    money_type integer NOT NULL,
    money_from character varying(100),
    remark character varying(100) NOT NULL,
    created timestamp with time zone,
    user_id integer NOT NULL
);


ALTER TABLE iaer_redenvelope OWNER TO ben;

--
-- Name: iaer_redenvelope_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE iaer_redenvelope_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE iaer_redenvelope_id_seq OWNER TO ben;

--
-- Name: iaer_redenvelope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE iaer_redenvelope_id_seq OWNED BY iaer_redenvelope.id;


--
-- Name: iaer_setting; Type: TABLE; Schema: public; Owner: pi
--

CREATE TABLE iaer_setting (
    id integer NOT NULL,
    home_show_current boolean NOT NULL,
    home_show_this_month boolean NOT NULL,
    home_show_this_year boolean NOT NULL,
    created date,
    modified date,
    user_id integer NOT NULL,
    monthly_fund integer NOT NULL,
    yearly_fund integer NOT NULL,
    CONSTRAINT iaer_setting_monthly_fund_check CHECK ((monthly_fund >= 0)),
    CONSTRAINT iaer_setting_yearly_fund_check CHECK ((yearly_fund >= 0))
);


ALTER TABLE iaer_setting OWNER TO pi;

--
-- Name: iaer_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: pi
--

CREATE SEQUENCE iaer_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE iaer_setting_id_seq OWNER TO pi;

--
-- Name: iaer_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pi
--

ALTER SEQUENCE iaer_setting_id_seq OWNED BY iaer_setting.id;


--
-- Name: iaer_user; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE iaer_user (
    id integer NOT NULL,
    is_master_user boolean NOT NULL,
    phone character varying(30),
    gender smallint NOT NULL,
    profile character varying(200),
    user_type smallint NOT NULL,
    region character varying(100),
    locale character varying(10),
    whats_up character varying(200),
    zone character varying(50),
    birthday timestamp with time zone,
    hobbies text,
    highlighted text,
    created timestamp with time zone,
    modified timestamp with time zone,
    is_email_activate boolean NOT NULL,
    is_phone_activate boolean NOT NULL,
    auth_user_id integer NOT NULL,
    fund_id integer,
    CONSTRAINT iaer_user_gender_check CHECK ((gender >= 0)),
    CONSTRAINT iaer_user_user_type_check CHECK ((user_type >= 0))
);


ALTER TABLE iaer_user OWNER TO ben;

--
-- Name: iaer_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE iaer_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE iaer_user_id_seq OWNER TO ben;

--
-- Name: iaer_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE iaer_user_id_seq OWNED BY iaer_user.id;


--
-- Name: iaer_user_slave_user; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE iaer_user_slave_user (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL
);


ALTER TABLE iaer_user_slave_user OWNER TO ben;

--
-- Name: iaer_user_slave_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE iaer_user_slave_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE iaer_user_slave_user_id_seq OWNER TO ben;

--
-- Name: iaer_user_slave_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE iaer_user_slave_user_id_seq OWNED BY iaer_user_slave_user.id;


--
-- Name: iaer_verify; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE iaer_verify (
    id integer NOT NULL,
    email_verify_code character varying(10),
    phone_verify_code character varying(10),
    created timestamp with time zone,
    user_id integer NOT NULL
);


ALTER TABLE iaer_verify OWNER TO ben;

--
-- Name: iaer_verify_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE iaer_verify_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE iaer_verify_id_seq OWNER TO ben;

--
-- Name: iaer_verify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE iaer_verify_id_seq OWNED BY iaer_verify.id;


--
-- Name: photo_gallery; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE photo_gallery (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    date_format character varying(50) NOT NULL,
    description text
);


ALTER TABLE photo_gallery OWNER TO ben;

--
-- Name: photo_gallery_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE photo_gallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photo_gallery_id_seq OWNER TO ben;

--
-- Name: photo_gallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE photo_gallery_id_seq OWNED BY photo_gallery.id;


--
-- Name: photo_photo; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE photo_photo (
    id integer NOT NULL,
    exif_image_width smallint,
    exif_image_height smallint,
    exif_make character varying(50),
    exif_model character varying(100),
    exif_lens_make character varying(50),
    exif_lens_model character varying(100),
    exif_version character varying(10),
    exif_subject_location character varying(30),
    exif_datetime date,
    exif_datetime_original date,
    exif_datetime_digitized date,
    name character varying(50) NOT NULL,
    labels character varying(50)[],
    sub_dir character varying(10) NOT NULL,
    duration interval NOT NULL,
    sha1sum character varying(50) NOT NULL,
    category smallint NOT NULL,
    version smallint NOT NULL,
    description text,
    pub_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL,
    user_id integer,
    size integer NOT NULL,
    CONSTRAINT photo_photo_category_check CHECK ((category >= 0)),
    CONSTRAINT photo_photo_exif_image_height_check CHECK ((exif_image_height >= 0)),
    CONSTRAINT photo_photo_exif_image_width_check CHECK ((exif_image_width >= 0)),
    CONSTRAINT photo_photo_size_check CHECK ((size >= 0)),
    CONSTRAINT photo_photo_version_check CHECK ((version >= 0))
);


ALTER TABLE photo_photo OWNER TO ben;

--
-- Name: photo_photo_galleries; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE photo_photo_galleries (
    id integer NOT NULL,
    photo_id integer NOT NULL,
    gallery_id integer NOT NULL
);


ALTER TABLE photo_photo_galleries OWNER TO ben;

--
-- Name: photo_photo_galleries_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE photo_photo_galleries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photo_photo_galleries_id_seq OWNER TO ben;

--
-- Name: photo_photo_galleries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE photo_photo_galleries_id_seq OWNED BY photo_photo_galleries.id;


--
-- Name: photo_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE photo_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photo_photo_id_seq OWNER TO ben;

--
-- Name: photo_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE photo_photo_id_seq OWNED BY photo_photo.id;


--
-- Name: photo_user; Type: TABLE; Schema: public; Owner: ben
--

CREATE TABLE photo_user (
    id integer NOT NULL,
    phone character varying(30),
    gender smallint NOT NULL,
    profile character varying(200),
    user_type smallint NOT NULL,
    region character varying(100),
    locale character varying(10),
    whats_up character varying(200),
    zone character varying(50),
    birthday timestamp with time zone,
    hobbies text,
    highlighted text,
    created timestamp with time zone,
    modified timestamp with time zone,
    is_email_activate boolean NOT NULL,
    is_phone_activate boolean NOT NULL,
    auth_user_id integer NOT NULL,
    date_format character varying(50) NOT NULL,
    CONSTRAINT photo_user_gender_check CHECK ((gender >= 0)),
    CONSTRAINT photo_user_user_type_check CHECK ((user_type >= 0))
);


ALTER TABLE photo_user OWNER TO ben;

--
-- Name: photo_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ben
--

CREATE SEQUENCE photo_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photo_user_id_seq OWNER TO ben;

--
-- Name: photo_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ben
--

ALTER SEQUENCE photo_user_id_seq OWNED BY photo_user.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: iaer_category id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_category ALTER COLUMN id SET DEFAULT nextval('iaer_category_id_seq'::regclass);


--
-- Name: iaer_fund id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_fund ALTER COLUMN id SET DEFAULT nextval('iaer_fund_id_seq'::regclass);


--
-- Name: iaer_iaer id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_iaer ALTER COLUMN id SET DEFAULT nextval('iaer_iaer_id_seq'::regclass);


--
-- Name: iaer_redenvelope id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_redenvelope ALTER COLUMN id SET DEFAULT nextval('iaer_redenvelope_id_seq'::regclass);


--
-- Name: iaer_setting id; Type: DEFAULT; Schema: public; Owner: pi
--

ALTER TABLE ONLY iaer_setting ALTER COLUMN id SET DEFAULT nextval('iaer_setting_id_seq'::regclass);


--
-- Name: iaer_user id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user ALTER COLUMN id SET DEFAULT nextval('iaer_user_id_seq'::regclass);


--
-- Name: iaer_user_slave_user id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user_slave_user ALTER COLUMN id SET DEFAULT nextval('iaer_user_slave_user_id_seq'::regclass);


--
-- Name: iaer_verify id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_verify ALTER COLUMN id SET DEFAULT nextval('iaer_verify_id_seq'::regclass);


--
-- Name: photo_gallery id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_gallery ALTER COLUMN id SET DEFAULT nextval('photo_gallery_id_seq'::regclass);


--
-- Name: photo_photo id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_photo ALTER COLUMN id SET DEFAULT nextval('photo_photo_id_seq'::regclass);


--
-- Name: photo_photo_galleries id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_photo_galleries ALTER COLUMN id SET DEFAULT nextval('photo_photo_galleries_id_seq'::regclass);


--
-- Name: photo_user id; Type: DEFAULT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_user ALTER COLUMN id SET DEFAULT nextval('photo_user_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add user	2	add_user
5	Can change user	2	change_user
6	Can delete user	2	delete_user
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add photo	7	add_photo
20	Can change photo	7	change_photo
21	Can delete photo	7	delete_photo
22	Can add user	8	add_user
23	Can change user	8	change_user
24	Can delete user	8	delete_user
25	Can add gallery	9	add_gallery
26	Can change gallery	9	change_gallery
27	Can delete gallery	9	delete_gallery
28	Can add red envelope	10	add_redenvelope
29	Can change red envelope	10	change_redenvelope
30	Can delete red envelope	10	delete_redenvelope
31	Can add user	11	add_user
32	Can change user	11	change_user
33	Can delete user	11	delete_user
34	Can add iaer	12	add_iaer
35	Can change iaer	12	change_iaer
36	Can delete iaer	12	delete_iaer
37	Can add fund	13	add_fund
38	Can change fund	13	change_fund
39	Can delete fund	13	delete_fund
40	Can add verify	14	add_verify
41	Can change verify	14	change_verify
42	Can delete verify	14	delete_verify
43	Can add category	15	add_category
44	Can change category	15	change_category
45	Can delete category	15	delete_category
46	Can add Token	16	add_token
47	Can change Token	16	change_token
48	Can delete Token	16	delete_token
49	Can add setting	17	add_setting
50	Can change setting	17	change_setting
51	Can delete setting	17	delete_setting
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('auth_permission_id_seq', 51, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$100000$SABjp1Y6rBBg$h1Y3cmommkotw/LrDo04qiKBczb7IlgRYKAqjnZIGRg=	\N	f	dudu				f	t	2018-11-14 06:57:08+00
1	pbkdf2_sha256$100000$LSq0zdu7Ff86$VIuxIS/NtkfTyocPYuw9pLyQ2phAJ1YJAZ2wVGGJAmo=	2018-11-20 08:57:17.924281+00	t	ben			benying1988@gmail.com	t	t	2018-11-14 05:56:53.874445+00
2	pbkdf2_sha256$100000$TzVSNSCItUQg$mnbv4eC/RCBnyiJ7hf0kAbC/l8OQduc+tgiHPh0/hw8=	\N	f	emily				f	t	2018-11-14 06:21:13+00
4	pbkdf2_sha256$100000$wJAFdVCMDAc1$aJ/WKhuWY6SxeS/iNx3zHgSDSNvEsH51osrRYllCuaU=	2018-12-10 06:40:32.032137+00	t	admin	Ben	Ying	benying1988@gmail.com	t	t	2018-11-20 08:59:15+00
7	pbkdf2_sha256$100000$dR1AvLIocZ8d$VGEvhhDXjQSCw94RjgScJRwt7v0zSgWR2eA+4//23C4=	\N	f	test			test@gmail.com	t	t	2018-12-10 06:45:57.760148+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('auth_user_id_seq', 7, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	4	1
2	4	2
3	4	3
4	4	4
5	4	5
6	4	6
7	4	7
8	4	8
9	4	9
10	4	10
11	4	11
12	4	12
13	4	13
14	4	14
15	4	15
16	4	16
17	4	17
18	4	18
19	4	19
20	4	20
21	4	21
22	4	22
23	4	23
24	4	24
25	4	25
26	4	26
27	4	27
28	4	28
29	4	29
30	4	30
31	4	31
32	4	32
33	4	33
34	4	34
35	4	35
36	4	36
37	4	37
38	4	38
39	4	39
40	4	40
41	4	41
42	4	42
43	4	43
44	4	44
45	4	45
46	4	46
47	4	47
48	4	48
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 48, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY authtoken_token (key, created, user_id) FROM stdin;
69f31e3c77384c4ab4d1c1f2d145f9dddaba17df	2018-11-14 07:15:33.934495+00	1
83cd0f7a0483db73ce4223658cb61deac6531e85	2018-11-14 07:15:38.737136+00	3
379a22b0cf5f772960ac6677d165eaf85d9cd8e2	2018-11-14 07:15:44.31914+00	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-11-14 06:21:14.682353+00	2	Emily	1	[{"added": {}}]	2	1
2	2018-11-14 06:23:10.162651+00	1	2018.11	1	[{"added": {}}]	13	1
3	2018-11-14 06:23:20.885913+00	1	ben	1	[{"added": {}}]	11	1
4	2018-11-14 06:23:36.983065+00	2	Emily	1	[{"added": {}}]	11	1
5	2018-11-14 06:24:03.207741+00	1	ben	2	[{"changed": {"fields": ["is_master_user", "slave_user"]}}]	11	1
6	2018-11-14 06:56:54.701479+00	2	emily	2	[{"changed": {"fields": ["username"]}}]	2	1
7	2018-11-14 06:57:09.183161+00	3	dudu	1	[{"added": {}}]	2	1
8	2018-11-14 06:57:16.886333+00	3	dudu	2	[]	2	1
9	2018-11-14 07:09:51.935138+00	2	emily	2	[{"changed": {"fields": ["fund"]}}]	11	1
10	2018-11-14 07:15:23.011156+00	4	dudu	1	[{"added": {}}]	11	1
11	2018-11-14 07:15:33.937726+00	69f31e3c77384c4ab4d1c1f2d145f9dddaba17df	69f31e3c77384c4ab4d1c1f2d145f9dddaba17df	1	[{"added": {}}]	16	1
12	2018-11-14 07:15:38.739829+00	83cd0f7a0483db73ce4223658cb61deac6531e85	83cd0f7a0483db73ce4223658cb61deac6531e85	1	[{"added": {}}]	16	1
13	2018-11-14 07:15:44.321859+00	379a22b0cf5f772960ac6677d165eaf85d9cd8e2	379a22b0cf5f772960ac6677d165eaf85d9cd8e2	1	[{"added": {}}]	16	1
14	2018-11-14 07:24:22.800374+00	1	Category object (1)	1	[{"added": {}}]	15	1
15	2018-11-14 07:24:41.073215+00	2	Category object (2)	1	[{"added": {}}]	15	1
16	2018-11-14 07:24:48.969149+00	2	Category object (2)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
17	2018-11-14 07:25:04.238577+00	3	Category object (3)	1	[{"added": {}}]	15	1
18	2018-11-14 07:25:21.574873+00	4	Category object (4)	1	[{"added": {}}]	15	1
19	2018-11-14 07:25:31.251969+00	3	Category object (3)	2	[{"changed": {"fields": ["name"]}}]	15	1
20	2018-11-14 07:26:08.583799+00	5	Category object (5)	1	[{"added": {}}]	15	1
21	2018-11-14 07:26:22.700524+00	6	Category object (6)	1	[{"added": {}}]	15	1
22	2018-11-14 07:26:31.891079+00	7	Category object (7)	1	[{"added": {}}]	15	1
23	2018-11-14 07:26:44.936486+00	8	Category object (8)	1	[{"added": {}}]	15	1
24	2018-11-14 07:26:59.664538+00	9	Category object (9)	1	[{"added": {}}]	15	1
25	2018-11-14 07:28:12.276275+00	10	Category object (10)	1	[{"added": {}}]	15	1
26	2018-11-14 07:28:59.564074+00	8	Category object (8)	2	[{"changed": {"fields": ["name"]}}]	15	1
27	2018-11-14 07:29:30.708988+00	11	Category object (11)	1	[{"added": {}}]	15	1
28	2018-11-14 07:29:39.859225+00	12	Category object (12)	1	[{"added": {}}]	15	1
29	2018-11-14 07:29:47.354043+00	13	Category object (13)	1	[{"added": {}}]	15	1
30	2018-11-14 07:30:20.094294+00	13	Category object (13)	2	[{"changed": {"fields": ["name"]}}]	15	1
31	2018-11-14 07:30:32.334763+00	14	Category object (14)	1	[{"added": {}}]	15	1
32	2018-11-14 07:30:45.31747+00	14	Category object (14)	2	[{"changed": {"fields": ["name"]}}]	15	1
33	2018-11-14 07:30:56.89538+00	15	Category object (15)	1	[{"added": {}}]	15	1
34	2018-11-14 07:31:54.954542+00	16	Category object (16)	1	[{"added": {}}]	15	1
35	2018-11-14 07:32:03.021295+00	2	Category object (2)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
36	2018-11-14 07:32:09.260467+00	3	Category object (3)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
37	2018-11-14 07:32:15.643672+00	4	Category object (4)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
38	2018-11-14 07:32:21.225008+00	5	Category object (5)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
39	2018-11-14 07:32:27.251946+00	6	Category object (6)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
40	2018-11-14 07:32:33.723955+00	7	Category object (7)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
41	2018-11-14 07:32:39.685293+00	8	Category object (8)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
42	2018-11-14 07:32:44.86605+00	9	Category object (9)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
43	2018-11-14 07:32:49.54209+00	10	Category object (10)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
44	2018-11-14 07:33:06.470783+00	11	Category object (11)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
45	2018-11-14 07:33:12.178224+00	12	Category object (12)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
46	2018-11-14 07:33:18.12206+00	13	Category object (13)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
47	2018-11-14 07:33:23.816153+00	14	Category object (14)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
48	2018-11-14 07:33:29.711382+00	15	Category object (15)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
49	2018-11-14 07:33:44.212801+00	16	Category object (16)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
50	2018-11-15 09:51:59.148594+00	6	Iaer object (6)	1	[{"added": {}}]	12	1
51	2018-11-15 09:55:55.652532+00	6	Iaer object (6)	2	[{"changed": {"fields": ["money"]}}]	12	1
52	2018-11-15 10:07:13.326318+00	6	Iaer object (6)	2	[{"changed": {"fields": ["remark"]}}]	12	1
53	2018-11-15 10:11:35.973832+00	6	Iaer object (6)	3		12	1
54	2018-11-16 03:25:04.396738+00	9	Category object (9)	3		15	1
55	2018-11-16 03:25:24.529119+00	10	Category object (10)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
56	2018-11-16 03:25:57.033848+00	17	Category object (17)	1	[{"added": {}}]	15	1
57	2018-11-16 03:26:59.74316+00	18	Category object (18)	1	[{"added": {}}]	15	1
58	2018-11-16 03:49:28.061933+00	962	Iaer object (962)	2	[{"changed": {"fields": ["category"]}}]	12	1
59	2018-11-16 03:49:48.969347+00	877	Iaer object (877)	2	[{"changed": {"fields": ["category"]}}]	12	1
60	2018-11-16 03:50:06.499795+00	961	Iaer object (961)	2	[{"changed": {"fields": ["category"]}}]	12	1
61	2018-11-16 03:50:19.829147+00	876	Iaer object (876)	2	[{"changed": {"fields": ["category"]}}]	12	1
62	2018-11-16 03:54:01.960049+00	174	RedEnvelope object (174)	3		10	1
63	2018-11-16 03:54:01.974596+00	173	RedEnvelope object (173)	3		10	1
64	2018-11-16 03:54:01.988937+00	172	RedEnvelope object (172)	3		10	1
65	2018-11-16 03:54:02.001534+00	171	RedEnvelope object (171)	3		10	1
66	2018-11-16 03:54:02.012008+00	170	RedEnvelope object (170)	3		10	1
67	2018-11-16 03:54:02.022192+00	169	RedEnvelope object (169)	3		10	1
68	2018-11-16 03:54:02.032496+00	167	RedEnvelope object (167)	3		10	1
69	2018-11-16 03:54:02.051418+00	166	RedEnvelope object (166)	3		10	1
70	2018-11-16 03:54:02.061024+00	165	RedEnvelope object (165)	3		10	1
71	2018-11-16 03:54:02.068943+00	164	RedEnvelope object (164)	3		10	1
72	2018-11-16 03:54:02.08071+00	163	RedEnvelope object (163)	3		10	1
73	2018-11-16 03:54:02.091925+00	162	RedEnvelope object (162)	3		10	1
74	2018-11-16 03:54:02.099599+00	161	RedEnvelope object (161)	3		10	1
75	2018-11-16 03:54:02.107714+00	160	RedEnvelope object (160)	3		10	1
76	2018-11-16 03:54:02.117983+00	159	RedEnvelope object (159)	3		10	1
77	2018-11-16 03:54:02.125394+00	158	RedEnvelope object (158)	3		10	1
78	2018-11-16 03:54:02.134347+00	157	RedEnvelope object (157)	3		10	1
79	2018-11-16 03:54:02.145314+00	156	RedEnvelope object (156)	3		10	1
80	2018-11-16 03:54:02.155835+00	155	RedEnvelope object (155)	3		10	1
81	2018-11-16 03:54:02.171643+00	154	RedEnvelope object (154)	3		10	1
82	2018-11-16 03:54:02.179189+00	153	RedEnvelope object (153)	3		10	1
83	2018-11-16 03:54:02.187612+00	152	RedEnvelope object (152)	3		10	1
84	2018-11-16 03:54:02.197384+00	151	RedEnvelope object (151)	3		10	1
85	2018-11-16 03:54:02.205405+00	149	RedEnvelope object (149)	3		10	1
86	2018-11-16 03:54:02.218351+00	148	RedEnvelope object (148)	3		10	1
87	2018-11-16 03:54:02.238683+00	147	RedEnvelope object (147)	3		10	1
88	2018-11-16 03:54:02.245739+00	146	RedEnvelope object (146)	3		10	1
89	2018-11-16 03:54:02.253239+00	145	RedEnvelope object (145)	3		10	1
90	2018-11-16 03:54:02.264443+00	144	RedEnvelope object (144)	3		10	1
91	2018-11-16 03:54:02.273422+00	143	RedEnvelope object (143)	3		10	1
92	2018-11-16 03:54:02.292158+00	45	RedEnvelope object (45)	3		10	1
93	2018-11-16 03:54:02.299469+00	44	RedEnvelope object (44)	3		10	1
94	2018-11-16 03:54:02.306688+00	43	RedEnvelope object (43)	3		10	1
95	2018-11-16 03:54:02.313617+00	42	RedEnvelope object (42)	3		10	1
96	2018-11-16 03:54:02.326901+00	40	RedEnvelope object (40)	3		10	1
97	2018-11-16 03:54:02.338268+00	39	RedEnvelope object (39)	3		10	1
98	2018-11-16 03:54:02.348367+00	38	RedEnvelope object (38)	3		10	1
99	2018-11-16 03:54:02.355429+00	36	RedEnvelope object (36)	3		10	1
100	2018-11-16 03:54:02.362632+00	34	RedEnvelope object (34)	3		10	1
101	2018-11-16 03:54:02.376679+00	33	RedEnvelope object (33)	3		10	1
102	2018-11-16 03:54:02.389054+00	32	RedEnvelope object (32)	3		10	1
103	2018-11-16 03:54:02.396006+00	31	RedEnvelope object (31)	3		10	1
104	2018-11-16 03:54:02.403488+00	30	RedEnvelope object (30)	3		10	1
105	2018-11-16 03:54:02.411419+00	29	RedEnvelope object (29)	3		10	1
106	2018-11-16 03:54:02.418822+00	28	RedEnvelope object (28)	3		10	1
107	2018-11-16 03:54:02.427141+00	27	RedEnvelope object (27)	3		10	1
108	2018-11-16 03:54:02.434578+00	26	RedEnvelope object (26)	3		10	1
109	2018-11-16 03:54:02.444756+00	25	RedEnvelope object (25)	3		10	1
110	2018-11-16 03:54:02.451887+00	24	RedEnvelope object (24)	3		10	1
111	2018-11-16 03:54:02.45903+00	18	RedEnvelope object (18)	3		10	1
112	2018-11-16 03:54:02.466426+00	17	RedEnvelope object (17)	3		10	1
113	2018-11-16 03:54:02.477032+00	16	RedEnvelope object (16)	3		10	1
114	2018-11-16 03:54:02.484327+00	15	RedEnvelope object (15)	3		10	1
115	2018-11-16 03:54:02.493746+00	14	RedEnvelope object (14)	3		10	1
116	2018-11-16 03:54:02.503853+00	13	RedEnvelope object (13)	3		10	1
117	2018-11-16 03:54:02.511266+00	12	RedEnvelope object (12)	3		10	1
118	2018-11-16 03:54:02.518888+00	11	RedEnvelope object (11)	3		10	1
119	2018-11-16 03:54:02.526822+00	10	RedEnvelope object (10)	3		10	1
120	2018-11-16 03:54:02.542276+00	9	RedEnvelope object (9)	3		10	1
121	2018-11-16 03:54:02.556097+00	8	RedEnvelope object (8)	3		10	1
122	2018-11-16 03:54:02.569606+00	7	RedEnvelope object (7)	3		10	1
123	2018-11-16 03:54:02.587109+00	6	RedEnvelope object (6)	3		10	1
124	2018-11-16 03:54:02.600279+00	5	RedEnvelope object (5)	3		10	1
125	2018-11-16 03:54:02.609523+00	4	RedEnvelope object (4)	3		10	1
126	2018-11-16 03:54:02.619093+00	3	RedEnvelope object (3)	3		10	1
127	2018-11-16 03:54:02.629026+00	2	RedEnvelope object (2)	3		10	1
128	2018-11-16 03:54:34.88695+00	963	Iaer object (963)	3		12	1
129	2018-11-16 03:54:34.907783+00	878	Iaer object (878)	3		12	1
130	2018-11-16 03:54:34.918509+00	962	Iaer object (962)	3		12	1
131	2018-11-16 03:54:34.928895+00	877	Iaer object (877)	3		12	1
132	2018-11-16 03:54:34.946565+00	961	Iaer object (961)	3		12	1
133	2018-11-16 03:54:34.96266+00	876	Iaer object (876)	3		12	1
134	2018-11-16 03:54:34.973586+00	960	Iaer object (960)	3		12	1
135	2018-11-16 03:54:34.988238+00	875	Iaer object (875)	3		12	1
136	2018-11-16 03:54:35.001926+00	959	Iaer object (959)	3		12	1
137	2018-11-16 03:54:35.052453+00	874	Iaer object (874)	3		12	1
138	2018-11-16 03:54:35.062371+00	958	Iaer object (958)	3		12	1
139	2018-11-16 03:54:35.091773+00	873	Iaer object (873)	3		12	1
140	2018-11-16 03:54:35.11253+00	957	Iaer object (957)	3		12	1
141	2018-11-16 03:54:35.144552+00	872	Iaer object (872)	3		12	1
142	2018-11-16 03:54:35.163157+00	956	Iaer object (956)	3		12	1
143	2018-11-16 03:54:35.175635+00	871	Iaer object (871)	3		12	1
144	2018-11-16 03:54:35.186419+00	955	Iaer object (955)	3		12	1
145	2018-11-16 03:54:35.197255+00	870	Iaer object (870)	3		12	1
146	2018-11-16 03:54:35.20793+00	954	Iaer object (954)	3		12	1
147	2018-11-16 03:54:35.219318+00	869	Iaer object (869)	3		12	1
148	2018-11-16 03:54:35.230153+00	953	Iaer object (953)	3		12	1
149	2018-11-16 03:54:35.240934+00	868	Iaer object (868)	3		12	1
150	2018-11-16 03:54:35.253654+00	952	Iaer object (952)	3		12	1
151	2018-11-16 03:54:35.266258+00	867	Iaer object (867)	3		12	1
152	2018-11-16 03:54:35.277594+00	951	Iaer object (951)	3		12	1
153	2018-11-16 03:54:35.296255+00	866	Iaer object (866)	3		12	1
154	2018-11-16 03:54:35.310194+00	950	Iaer object (950)	3		12	1
155	2018-11-16 03:54:35.320212+00	865	Iaer object (865)	3		12	1
156	2018-11-16 03:54:35.336947+00	949	Iaer object (949)	3		12	1
157	2018-11-16 03:54:35.345249+00	864	Iaer object (864)	3		12	1
158	2018-11-16 03:54:35.360726+00	948	Iaer object (948)	3		12	1
159	2018-11-16 03:54:35.373186+00	863	Iaer object (863)	3		12	1
160	2018-11-16 03:54:35.388899+00	947	Iaer object (947)	3		12	1
161	2018-11-16 03:54:35.403457+00	862	Iaer object (862)	3		12	1
162	2018-11-16 03:54:35.41738+00	946	Iaer object (946)	3		12	1
163	2018-11-16 03:54:35.430074+00	861	Iaer object (861)	3		12	1
164	2018-11-16 03:54:35.446995+00	945	Iaer object (945)	3		12	1
165	2018-11-16 03:54:35.460717+00	860	Iaer object (860)	3		12	1
166	2018-11-16 03:54:35.48483+00	944	Iaer object (944)	3		12	1
167	2018-11-16 03:54:35.498641+00	859	Iaer object (859)	3		12	1
168	2018-11-16 03:54:35.51819+00	943	Iaer object (943)	3		12	1
169	2018-11-16 03:54:35.530063+00	858	Iaer object (858)	3		12	1
170	2018-11-16 03:54:35.541662+00	942	Iaer object (942)	3		12	1
171	2018-11-16 03:54:35.556594+00	857	Iaer object (857)	3		12	1
172	2018-11-16 03:54:35.567745+00	941	Iaer object (941)	3		12	1
173	2018-11-16 03:54:35.576431+00	856	Iaer object (856)	3		12	1
174	2018-11-16 03:54:35.596161+00	940	Iaer object (940)	3		12	1
175	2018-11-16 03:54:35.608799+00	855	Iaer object (855)	3		12	1
176	2018-11-16 03:54:35.620764+00	939	Iaer object (939)	3		12	1
177	2018-11-16 03:54:35.638334+00	854	Iaer object (854)	3		12	1
178	2018-11-16 03:54:35.645612+00	938	Iaer object (938)	3		12	1
179	2018-11-16 03:54:35.658712+00	853	Iaer object (853)	3		12	1
180	2018-11-16 03:54:35.671117+00	937	Iaer object (937)	3		12	1
181	2018-11-16 03:54:35.678207+00	852	Iaer object (852)	3		12	1
182	2018-11-16 03:54:35.692802+00	936	Iaer object (936)	3		12	1
183	2018-11-16 03:54:35.703094+00	851	Iaer object (851)	3		12	1
184	2018-11-16 03:54:35.71354+00	935	Iaer object (935)	3		12	1
185	2018-11-16 03:54:35.720952+00	850	Iaer object (850)	3		12	1
186	2018-11-16 03:54:35.728447+00	934	Iaer object (934)	3		12	1
187	2018-11-16 03:54:35.738708+00	849	Iaer object (849)	3		12	1
188	2018-11-16 03:54:35.752012+00	933	Iaer object (933)	3		12	1
189	2018-11-16 03:54:35.761317+00	848	Iaer object (848)	3		12	1
190	2018-11-16 03:54:35.7692+00	932	Iaer object (932)	3		12	1
191	2018-11-16 03:54:35.786092+00	847	Iaer object (847)	3		12	1
192	2018-11-16 03:54:35.805065+00	931	Iaer object (931)	3		12	1
193	2018-11-16 03:54:35.81737+00	846	Iaer object (846)	3		12	1
194	2018-11-16 03:54:35.82447+00	930	Iaer object (930)	3		12	1
195	2018-11-16 03:54:35.831954+00	845	Iaer object (845)	3		12	1
196	2018-11-16 03:54:35.84525+00	929	Iaer object (929)	3		12	1
197	2018-11-16 03:54:35.85331+00	844	Iaer object (844)	3		12	1
198	2018-11-16 03:54:35.860392+00	928	Iaer object (928)	3		12	1
199	2018-11-16 03:54:35.871008+00	843	Iaer object (843)	3		12	1
200	2018-11-16 03:54:35.882313+00	927	Iaer object (927)	3		12	1
201	2018-11-16 03:54:35.892563+00	842	Iaer object (842)	3		12	1
202	2018-11-16 03:54:35.905605+00	926	Iaer object (926)	3		12	1
203	2018-11-16 03:54:35.934264+00	841	Iaer object (841)	3		12	1
204	2018-11-16 03:54:35.945463+00	925	Iaer object (925)	3		12	1
205	2018-11-16 03:54:35.952561+00	840	Iaer object (840)	3		12	1
206	2018-11-16 03:54:35.960442+00	924	Iaer object (924)	3		12	1
207	2018-11-16 03:54:35.972121+00	839	Iaer object (839)	3		12	1
208	2018-11-16 03:54:35.98726+00	923	Iaer object (923)	3		12	1
209	2018-11-16 03:54:35.997596+00	838	Iaer object (838)	3		12	1
210	2018-11-16 03:54:36.00523+00	922	Iaer object (922)	3		12	1
211	2018-11-16 03:54:36.012477+00	837	Iaer object (837)	3		12	1
212	2018-11-16 03:54:36.020285+00	921	Iaer object (921)	3		12	1
213	2018-11-16 03:54:36.028148+00	836	Iaer object (836)	3		12	1
214	2018-11-16 03:54:36.035627+00	920	Iaer object (920)	3		12	1
215	2018-11-16 03:54:36.042747+00	835	Iaer object (835)	3		12	1
216	2018-11-16 03:54:36.050731+00	919	Iaer object (919)	3		12	1
217	2018-11-16 03:54:36.05976+00	834	Iaer object (834)	3		12	1
218	2018-11-16 03:54:36.067315+00	918	Iaer object (918)	3		12	1
219	2018-11-16 03:54:36.074726+00	833	Iaer object (833)	3		12	1
220	2018-11-16 03:54:36.082547+00	917	Iaer object (917)	3		12	1
221	2018-11-16 03:54:36.090108+00	832	Iaer object (832)	3		12	1
222	2018-11-16 03:54:36.097481+00	916	Iaer object (916)	3		12	1
223	2018-11-16 03:54:36.105147+00	831	Iaer object (831)	3		12	1
224	2018-11-16 03:54:36.113079+00	915	Iaer object (915)	3		12	1
225	2018-11-16 03:54:36.12527+00	830	Iaer object (830)	3		12	1
226	2018-11-16 03:54:36.133234+00	914	Iaer object (914)	3		12	1
227	2018-11-16 03:54:36.141127+00	829	Iaer object (829)	3		12	1
228	2018-11-16 03:54:52.526946+00	913	Iaer object (913)	3		12	1
229	2018-11-16 03:54:52.546311+00	828	Iaer object (828)	3		12	1
230	2018-11-16 03:54:52.559048+00	912	Iaer object (912)	3		12	1
231	2018-11-16 03:54:52.569603+00	827	Iaer object (827)	3		12	1
232	2018-11-16 03:54:52.577017+00	911	Iaer object (911)	3		12	1
233	2018-11-16 03:54:52.584868+00	826	Iaer object (826)	3		12	1
234	2018-11-16 03:54:52.594742+00	910	Iaer object (910)	3		12	1
235	2018-11-16 03:54:52.601717+00	825	Iaer object (825)	3		12	1
236	2018-11-16 03:54:52.609777+00	909	Iaer object (909)	3		12	1
237	2018-11-16 03:54:52.619892+00	824	Iaer object (824)	3		12	1
238	2018-11-16 03:54:52.627443+00	908	Iaer object (908)	3		12	1
239	2018-11-16 03:54:52.634693+00	823	Iaer object (823)	3		12	1
240	2018-11-16 03:54:52.641852+00	907	Iaer object (907)	3		12	1
241	2018-11-16 03:54:52.6491+00	822	Iaer object (822)	3		12	1
242	2018-11-16 03:54:52.657435+00	906	Iaer object (906)	3		12	1
243	2018-11-16 03:54:52.667171+00	821	Iaer object (821)	3		12	1
244	2018-11-16 03:54:52.675163+00	905	Iaer object (905)	3		12	1
245	2018-11-16 03:54:52.688874+00	820	Iaer object (820)	3		12	1
246	2018-11-16 03:54:52.696886+00	904	Iaer object (904)	3		12	1
247	2018-11-16 03:54:52.713711+00	819	Iaer object (819)	3		12	1
248	2018-11-16 03:54:52.724271+00	903	Iaer object (903)	3		12	1
249	2018-11-16 03:54:52.733681+00	818	Iaer object (818)	3		12	1
250	2018-11-16 03:54:52.741313+00	902	Iaer object (902)	3		12	1
251	2018-11-16 03:54:52.750158+00	817	Iaer object (817)	3		12	1
252	2018-11-16 03:54:52.761491+00	901	Iaer object (901)	3		12	1
253	2018-11-16 03:54:52.772417+00	816	Iaer object (816)	3		12	1
254	2018-11-16 03:54:52.785062+00	900	Iaer object (900)	3		12	1
255	2018-11-16 03:54:52.792275+00	815	Iaer object (815)	3		12	1
256	2018-11-16 03:54:52.799985+00	899	Iaer object (899)	3		12	1
257	2018-11-16 03:54:52.810554+00	814	Iaer object (814)	3		12	1
258	2018-11-16 03:54:52.818731+00	898	Iaer object (898)	3		12	1
259	2018-11-16 03:54:52.825861+00	813	Iaer object (813)	3		12	1
260	2018-11-16 03:54:52.837199+00	897	Iaer object (897)	3		12	1
261	2018-11-16 03:54:52.848346+00	812	Iaer object (812)	3		12	1
262	2018-11-16 03:54:52.861729+00	896	Iaer object (896)	3		12	1
263	2018-11-16 03:54:52.879461+00	811	Iaer object (811)	3		12	1
264	2018-11-16 03:54:52.891257+00	895	Iaer object (895)	3		12	1
265	2018-11-16 03:54:52.903708+00	810	Iaer object (810)	3		12	1
266	2018-11-16 03:54:52.918725+00	894	Iaer object (894)	3		12	1
267	2018-11-16 03:54:52.929259+00	809	Iaer object (809)	3		12	1
268	2018-11-16 03:54:52.942793+00	893	Iaer object (893)	3		12	1
269	2018-11-16 03:54:52.953427+00	808	Iaer object (808)	3		12	1
270	2018-11-16 03:54:52.967562+00	892	Iaer object (892)	3		12	1
271	2018-11-16 03:54:52.977085+00	807	Iaer object (807)	3		12	1
272	2018-11-16 03:54:52.987434+00	891	Iaer object (891)	3		12	1
273	2018-11-16 03:54:52.99953+00	806	Iaer object (806)	3		12	1
274	2018-11-16 03:54:53.010368+00	890	Iaer object (890)	3		12	1
275	2018-11-16 03:54:53.020871+00	805	Iaer object (805)	3		12	1
276	2018-11-16 03:54:53.034438+00	889	Iaer object (889)	3		12	1
277	2018-11-16 03:54:53.048702+00	804	Iaer object (804)	3		12	1
278	2018-11-16 03:54:53.058775+00	888	Iaer object (888)	3		12	1
279	2018-11-16 03:54:53.073651+00	803	Iaer object (803)	3		12	1
280	2018-11-16 03:54:53.084789+00	887	Iaer object (887)	3		12	1
281	2018-11-16 03:54:53.094672+00	802	Iaer object (802)	3		12	1
282	2018-11-16 03:54:53.102243+00	886	Iaer object (886)	3		12	1
283	2018-11-16 03:54:53.109872+00	801	Iaer object (801)	3		12	1
284	2018-11-16 03:54:53.122362+00	885	Iaer object (885)	3		12	1
285	2018-11-16 03:54:53.147234+00	800	Iaer object (800)	3		12	1
286	2018-11-16 03:54:53.161517+00	884	Iaer object (884)	3		12	1
287	2018-11-16 03:54:53.169721+00	799	Iaer object (799)	3		12	1
288	2018-11-16 03:54:53.186551+00	883	Iaer object (883)	3		12	1
289	2018-11-16 03:54:53.199547+00	798	Iaer object (798)	3		12	1
290	2018-11-16 03:54:53.210881+00	882	Iaer object (882)	3		12	1
291	2018-11-16 03:54:53.223106+00	797	Iaer object (797)	3		12	1
292	2018-11-16 03:54:53.236209+00	881	Iaer object (881)	3		12	1
293	2018-11-16 03:54:53.255651+00	796	Iaer object (796)	3		12	1
294	2018-11-16 03:54:53.265465+00	880	Iaer object (880)	3		12	1
295	2018-11-16 03:54:53.276374+00	795	Iaer object (795)	3		12	1
296	2018-11-16 03:54:53.286581+00	879	Iaer object (879)	3		12	1
297	2018-11-16 03:54:53.294328+00	794	Iaer object (794)	3		12	1
298	2018-11-16 03:54:53.307246+00	793	Iaer object (793)	3		12	1
299	2018-11-16 03:54:53.321158+00	792	Iaer object (792)	3		12	1
300	2018-11-16 03:54:53.328972+00	791	Iaer object (791)	3		12	1
301	2018-11-16 03:54:53.35819+00	790	Iaer object (790)	3		12	1
302	2018-11-16 03:54:53.369204+00	789	Iaer object (789)	3		12	1
303	2018-11-16 03:54:53.379239+00	788	Iaer object (788)	3		12	1
304	2018-11-16 03:54:53.391558+00	787	Iaer object (787)	3		12	1
305	2018-11-16 03:54:53.405789+00	786	Iaer object (786)	3		12	1
306	2018-11-16 03:54:53.418035+00	785	Iaer object (785)	3		12	1
307	2018-11-16 03:54:53.425573+00	784	Iaer object (784)	3		12	1
308	2018-11-16 03:54:53.434166+00	783	Iaer object (783)	3		12	1
309	2018-11-16 03:54:53.443686+00	782	Iaer object (782)	3		12	1
310	2018-11-16 03:54:53.454961+00	781	Iaer object (781)	3		12	1
311	2018-11-16 03:54:53.46534+00	780	Iaer object (780)	3		12	1
312	2018-11-16 03:54:53.473008+00	779	Iaer object (779)	3		12	1
313	2018-11-16 03:54:53.48075+00	778	Iaer object (778)	3		12	1
314	2018-11-16 03:54:53.490744+00	777	Iaer object (777)	3		12	1
315	2018-11-16 03:54:53.504337+00	776	Iaer object (776)	3		12	1
316	2018-11-16 03:54:53.512234+00	775	Iaer object (775)	3		12	1
317	2018-11-16 03:54:53.522573+00	774	Iaer object (774)	3		12	1
318	2018-11-16 03:54:53.547439+00	773	Iaer object (773)	3		12	1
319	2018-11-16 03:54:53.558022+00	772	Iaer object (772)	3		12	1
320	2018-11-16 03:54:53.565635+00	771	Iaer object (771)	3		12	1
321	2018-11-16 03:54:53.574817+00	770	Iaer object (770)	3		12	1
322	2018-11-16 03:54:53.595009+00	769	Iaer object (769)	3		12	1
323	2018-11-16 03:54:53.602656+00	768	Iaer object (768)	3		12	1
324	2018-11-16 03:54:53.610047+00	767	Iaer object (767)	3		12	1
325	2018-11-16 03:54:53.634837+00	766	Iaer object (766)	3		12	1
326	2018-11-16 03:54:53.654832+00	765	Iaer object (765)	3		12	1
327	2018-11-16 03:54:53.665025+00	764	Iaer object (764)	3		12	1
328	2018-11-16 03:55:28.275939+00	763	Iaer object (763)	3		12	1
329	2018-11-16 03:55:28.294816+00	762	Iaer object (762)	3		12	1
330	2018-11-16 03:55:28.3157+00	761	Iaer object (761)	3		12	1
331	2018-11-16 03:55:28.326569+00	760	Iaer object (760)	3		12	1
332	2018-11-16 03:55:28.339024+00	759	Iaer object (759)	3		12	1
333	2018-11-16 03:55:28.351299+00	758	Iaer object (758)	3		12	1
334	2018-11-16 03:55:28.362264+00	757	Iaer object (757)	3		12	1
335	2018-11-16 03:55:28.372135+00	756	Iaer object (756)	3		12	1
336	2018-11-16 03:55:28.382493+00	755	Iaer object (755)	3		12	1
337	2018-11-16 03:55:28.38985+00	754	Iaer object (754)	3		12	1
338	2018-11-16 03:55:28.397829+00	753	Iaer object (753)	3		12	1
339	2018-11-16 03:55:28.409838+00	752	Iaer object (752)	3		12	1
340	2018-11-16 03:55:28.420296+00	751	Iaer object (751)	3		12	1
341	2018-11-16 03:55:28.429636+00	750	Iaer object (750)	3		12	1
342	2018-11-16 03:55:28.44013+00	749	Iaer object (749)	3		12	1
343	2018-11-16 03:55:28.452642+00	748	Iaer object (748)	3		12	1
344	2018-11-16 03:55:28.462864+00	747	Iaer object (747)	3		12	1
345	2018-11-16 03:55:28.47663+00	746	Iaer object (746)	3		12	1
346	2018-11-16 03:55:28.484452+00	745	Iaer object (745)	3		12	1
347	2018-11-16 03:55:28.491786+00	744	Iaer object (744)	3		12	1
348	2018-11-16 03:55:28.502241+00	743	Iaer object (743)	3		12	1
349	2018-11-16 03:55:28.509572+00	742	Iaer object (742)	3		12	1
350	2018-11-16 03:55:28.517242+00	741	Iaer object (741)	3		12	1
351	2018-11-16 03:55:28.524419+00	740	Iaer object (740)	3		12	1
352	2018-11-16 03:55:28.532644+00	739	Iaer object (739)	3		12	1
353	2018-11-16 03:55:28.542092+00	738	Iaer object (738)	3		12	1
354	2018-11-16 03:55:28.549577+00	737	Iaer object (737)	3		12	1
355	2018-11-16 03:55:28.556878+00	736	Iaer object (736)	3		12	1
356	2018-11-16 03:55:28.570436+00	735	Iaer object (735)	3		12	1
357	2018-11-16 03:55:28.582985+00	734	Iaer object (734)	3		12	1
358	2018-11-16 03:55:28.598076+00	733	Iaer object (733)	3		12	1
359	2018-11-16 03:55:28.607928+00	732	Iaer object (732)	3		12	1
360	2018-11-16 03:55:28.617887+00	731	Iaer object (731)	3		12	1
361	2018-11-16 03:55:28.631957+00	730	Iaer object (730)	3		12	1
362	2018-11-16 03:55:28.645776+00	729	Iaer object (729)	3		12	1
363	2018-11-16 03:55:28.653244+00	728	Iaer object (728)	3		12	1
364	2018-11-16 03:55:28.668632+00	727	Iaer object (727)	3		12	1
365	2018-11-16 03:55:28.67812+00	726	Iaer object (726)	3		12	1
366	2018-11-16 03:55:28.685866+00	725	Iaer object (725)	3		12	1
367	2018-11-16 03:55:28.694116+00	724	Iaer object (724)	3		12	1
368	2018-11-16 03:55:28.703358+00	723	Iaer object (723)	3		12	1
369	2018-11-16 03:55:28.710821+00	722	Iaer object (722)	3		12	1
370	2018-11-16 03:55:28.720015+00	721	Iaer object (721)	3		12	1
371	2018-11-16 03:55:28.729503+00	720	Iaer object (720)	3		12	1
372	2018-11-16 03:55:28.739531+00	719	Iaer object (719)	3		12	1
373	2018-11-16 03:55:28.747239+00	718	Iaer object (718)	3		12	1
374	2018-11-16 03:55:28.757775+00	717	Iaer object (717)	3		12	1
375	2018-11-16 03:55:28.771608+00	716	Iaer object (716)	3		12	1
376	2018-11-16 03:55:28.781649+00	715	Iaer object (715)	3		12	1
377	2018-11-16 03:55:28.789253+00	714	Iaer object (714)	3		12	1
378	2018-11-16 03:55:28.800438+00	713	Iaer object (713)	3		12	1
379	2018-11-16 03:55:28.813391+00	712	Iaer object (712)	3		12	1
380	2018-11-16 03:55:28.821118+00	711	Iaer object (711)	3		12	1
381	2018-11-16 03:55:28.828593+00	710	Iaer object (710)	3		12	1
382	2018-11-16 03:55:28.836045+00	709	Iaer object (709)	3		12	1
383	2018-11-16 03:55:28.844823+00	708	Iaer object (708)	3		12	1
384	2018-11-16 03:55:28.854641+00	707	Iaer object (707)	3		12	1
385	2018-11-16 03:55:28.86582+00	706	Iaer object (706)	3		12	1
386	2018-11-16 03:55:28.876848+00	705	Iaer object (705)	3		12	1
387	2018-11-16 03:55:28.884295+00	704	Iaer object (704)	3		12	1
388	2018-11-16 03:55:28.891536+00	703	Iaer object (703)	3		12	1
389	2018-11-16 03:55:28.902251+00	702	Iaer object (702)	3		12	1
390	2018-11-16 03:55:28.909744+00	701	Iaer object (701)	3		12	1
391	2018-11-16 03:55:28.918887+00	700	Iaer object (700)	3		12	1
392	2018-11-16 03:55:28.932292+00	699	Iaer object (699)	3		12	1
393	2018-11-16 03:55:28.942023+00	698	Iaer object (698)	3		12	1
394	2018-11-16 03:55:28.95503+00	697	Iaer object (697)	3		12	1
395	2018-11-16 03:55:28.975917+00	696	Iaer object (696)	3		12	1
396	2018-11-16 03:55:28.985716+00	695	Iaer object (695)	3		12	1
397	2018-11-16 03:55:28.999204+00	694	Iaer object (694)	3		12	1
398	2018-11-16 03:55:29.006345+00	693	Iaer object (693)	3		12	1
399	2018-11-16 03:55:29.014037+00	692	Iaer object (692)	3		12	1
400	2018-11-16 03:55:29.024428+00	691	Iaer object (691)	3		12	1
401	2018-11-16 03:55:29.032035+00	690	Iaer object (690)	3		12	1
402	2018-11-16 03:55:29.039294+00	689	Iaer object (689)	3		12	1
403	2018-11-16 03:55:29.046932+00	688	Iaer object (688)	3		12	1
404	2018-11-16 03:55:29.060302+00	687	Iaer object (687)	3		12	1
405	2018-11-16 03:55:29.075617+00	686	Iaer object (686)	3		12	1
406	2018-11-16 03:55:29.08966+00	685	Iaer object (685)	3		12	1
407	2018-11-16 03:55:29.101588+00	684	Iaer object (684)	3		12	1
408	2018-11-16 03:55:29.119426+00	683	Iaer object (683)	3		12	1
409	2018-11-16 03:55:29.130126+00	682	Iaer object (682)	3		12	1
410	2018-11-16 03:55:29.139647+00	681	Iaer object (681)	3		12	1
411	2018-11-16 03:55:29.152834+00	680	Iaer object (680)	3		12	1
412	2018-11-16 03:55:29.167646+00	679	Iaer object (679)	3		12	1
413	2018-11-16 03:55:29.17803+00	678	Iaer object (678)	3		12	1
414	2018-11-16 03:55:29.187654+00	677	Iaer object (677)	3		12	1
415	2018-11-16 03:55:29.195482+00	676	Iaer object (676)	3		12	1
416	2018-11-16 03:55:29.202893+00	675	Iaer object (675)	3		12	1
417	2018-11-16 03:55:29.222597+00	674	Iaer object (674)	3		12	1
418	2018-11-16 03:55:29.230713+00	673	Iaer object (673)	3		12	1
419	2018-11-16 03:55:29.258145+00	672	Iaer object (672)	3		12	1
420	2018-11-16 03:55:29.26906+00	671	Iaer object (671)	3		12	1
421	2018-11-16 03:55:29.286393+00	670	Iaer object (670)	3		12	1
422	2018-11-16 03:55:29.299333+00	669	Iaer object (669)	3		12	1
423	2018-11-16 03:55:29.310286+00	668	Iaer object (668)	3		12	1
424	2018-11-16 03:55:29.322779+00	667	Iaer object (667)	3		12	1
425	2018-11-16 03:55:29.334291+00	666	Iaer object (666)	3		12	1
426	2018-11-16 03:55:29.345368+00	665	Iaer object (665)	3		12	1
427	2018-11-16 03:55:29.356417+00	664	Iaer object (664)	3		12	1
428	2018-11-16 03:55:29.367551+00	663	Iaer object (663)	3		12	1
429	2018-11-16 03:55:29.378446+00	662	Iaer object (662)	3		12	1
430	2018-11-16 03:55:29.389038+00	661	Iaer object (661)	3		12	1
431	2018-11-16 03:55:29.400123+00	660	Iaer object (660)	3		12	1
432	2018-11-16 03:55:29.415587+00	659	Iaer object (659)	3		12	1
433	2018-11-16 03:55:29.432843+00	658	Iaer object (658)	3		12	1
434	2018-11-16 03:55:29.450366+00	657	Iaer object (657)	3		12	1
435	2018-11-16 03:55:29.501026+00	656	Iaer object (656)	3		12	1
436	2018-11-16 03:55:29.518726+00	655	Iaer object (655)	3		12	1
437	2018-11-16 03:55:29.554568+00	654	Iaer object (654)	3		12	1
438	2018-11-16 03:55:29.566117+00	653	Iaer object (653)	3		12	1
439	2018-11-16 03:55:29.581761+00	652	Iaer object (652)	3		12	1
440	2018-11-16 03:55:29.616819+00	651	Iaer object (651)	3		12	1
441	2018-11-16 03:55:29.629156+00	650	Iaer object (650)	3		12	1
442	2018-11-16 03:55:29.643121+00	649	Iaer object (649)	3		12	1
443	2018-11-16 03:55:29.657699+00	648	Iaer object (648)	3		12	1
444	2018-11-16 03:55:29.678869+00	647	Iaer object (647)	3		12	1
445	2018-11-16 03:55:29.695681+00	646	Iaer object (646)	3		12	1
446	2018-11-16 03:55:29.704469+00	645	Iaer object (645)	3		12	1
447	2018-11-16 03:55:29.714529+00	644	Iaer object (644)	3		12	1
448	2018-11-16 03:55:29.728845+00	643	Iaer object (643)	3		12	1
449	2018-11-16 03:55:29.741778+00	642	Iaer object (642)	3		12	1
450	2018-11-16 03:55:29.754309+00	641	Iaer object (641)	3		12	1
451	2018-11-16 03:55:29.762191+00	640	Iaer object (640)	3		12	1
452	2018-11-16 03:55:29.778516+00	639	Iaer object (639)	3		12	1
453	2018-11-16 03:55:29.790128+00	638	Iaer object (638)	3		12	1
454	2018-11-16 03:55:29.804739+00	637	Iaer object (637)	3		12	1
455	2018-11-16 03:55:29.819581+00	636	Iaer object (636)	3		12	1
456	2018-11-16 03:55:29.841863+00	635	Iaer object (635)	3		12	1
457	2018-11-16 03:55:29.852895+00	634	Iaer object (634)	3		12	1
458	2018-11-16 03:55:29.87556+00	633	Iaer object (633)	3		12	1
459	2018-11-16 03:55:29.894393+00	632	Iaer object (632)	3		12	1
460	2018-11-16 03:55:29.905047+00	631	Iaer object (631)	3		12	1
461	2018-11-16 03:55:29.915331+00	630	Iaer object (630)	3		12	1
462	2018-11-16 03:55:29.92604+00	629	Iaer object (629)	3		12	1
463	2018-11-16 03:55:29.935865+00	628	Iaer object (628)	3		12	1
464	2018-11-16 03:55:29.943621+00	627	Iaer object (627)	3		12	1
465	2018-11-16 03:55:29.95403+00	626	Iaer object (626)	3		12	1
466	2018-11-16 03:55:29.964553+00	625	Iaer object (625)	3		12	1
467	2018-11-16 03:55:29.973129+00	624	Iaer object (624)	3		12	1
468	2018-11-16 03:55:29.980909+00	623	Iaer object (623)	3		12	1
469	2018-11-16 03:55:29.991095+00	622	Iaer object (622)	3		12	1
470	2018-11-16 03:55:29.998812+00	621	Iaer object (621)	3		12	1
471	2018-11-16 03:55:30.006017+00	620	Iaer object (620)	3		12	1
472	2018-11-16 03:55:30.014064+00	619	Iaer object (619)	3		12	1
473	2018-11-16 03:55:30.0214+00	618	Iaer object (618)	3		12	1
474	2018-11-16 03:55:30.032239+00	617	Iaer object (617)	3		12	1
475	2018-11-16 03:55:30.043168+00	616	Iaer object (616)	3		12	1
476	2018-11-16 03:55:30.053639+00	615	Iaer object (615)	3		12	1
477	2018-11-16 03:55:30.0646+00	614	Iaer object (614)	3		12	1
478	2018-11-16 03:55:30.0747+00	613	Iaer object (613)	3		12	1
479	2018-11-16 03:55:30.088783+00	612	Iaer object (612)	3		12	1
480	2018-11-16 03:55:30.099698+00	611	Iaer object (611)	3		12	1
481	2018-11-16 03:55:30.109798+00	610	Iaer object (610)	3		12	1
482	2018-11-16 03:55:30.120184+00	609	Iaer object (609)	3		12	1
483	2018-11-16 03:55:30.127759+00	608	Iaer object (608)	3		12	1
484	2018-11-16 03:55:30.135906+00	607	Iaer object (607)	3		12	1
485	2018-11-16 03:55:30.145281+00	606	Iaer object (606)	3		12	1
486	2018-11-16 03:55:30.155173+00	605	Iaer object (605)	3		12	1
487	2018-11-16 03:55:30.162487+00	604	Iaer object (604)	3		12	1
488	2018-11-16 03:55:30.170702+00	603	Iaer object (603)	3		12	1
489	2018-11-16 03:55:30.178095+00	602	Iaer object (602)	3		12	1
490	2018-11-16 03:55:30.185242+00	601	Iaer object (601)	3		12	1
491	2018-11-16 03:55:30.192283+00	600	Iaer object (600)	3		12	1
492	2018-11-16 03:55:30.200579+00	599	Iaer object (599)	3		12	1
493	2018-11-16 03:55:30.211263+00	598	Iaer object (598)	3		12	1
494	2018-11-16 03:55:30.218686+00	597	Iaer object (597)	3		12	1
495	2018-11-16 03:55:30.226437+00	596	Iaer object (596)	3		12	1
496	2018-11-16 03:55:30.234602+00	595	Iaer object (595)	3		12	1
497	2018-11-16 03:55:30.24249+00	594	Iaer object (594)	3		12	1
498	2018-11-16 03:55:30.257778+00	593	Iaer object (593)	3		12	1
499	2018-11-16 03:55:30.268695+00	592	Iaer object (592)	3		12	1
500	2018-11-16 03:55:30.277102+00	591	Iaer object (591)	3		12	1
501	2018-11-16 03:55:30.285718+00	590	Iaer object (590)	3		12	1
502	2018-11-16 03:55:30.294045+00	589	Iaer object (589)	3		12	1
503	2018-11-16 03:55:30.301539+00	588	Iaer object (588)	3		12	1
504	2018-11-16 03:55:30.309125+00	587	Iaer object (587)	3		12	1
505	2018-11-16 03:55:30.319168+00	586	Iaer object (586)	3		12	1
506	2018-11-16 03:55:30.331217+00	585	Iaer object (585)	3		12	1
507	2018-11-16 03:55:30.338651+00	584	Iaer object (584)	3		12	1
508	2018-11-16 03:55:30.346127+00	583	Iaer object (583)	3		12	1
509	2018-11-16 03:55:30.354652+00	582	Iaer object (582)	3		12	1
510	2018-11-16 03:55:30.364173+00	581	Iaer object (581)	3		12	1
511	2018-11-16 03:55:30.37484+00	580	Iaer object (580)	3		12	1
512	2018-11-16 03:55:30.386095+00	579	Iaer object (579)	3		12	1
513	2018-11-16 03:55:30.395612+00	578	Iaer object (578)	3		12	1
514	2018-11-16 03:55:30.403289+00	577	Iaer object (577)	3		12	1
515	2018-11-16 03:55:30.420183+00	576	Iaer object (576)	3		12	1
516	2018-11-16 03:55:30.429832+00	575	Iaer object (575)	3		12	1
517	2018-11-16 03:55:30.437332+00	574	Iaer object (574)	3		12	1
518	2018-11-16 03:55:30.445217+00	573	Iaer object (573)	3		12	1
519	2018-11-16 03:55:30.452452+00	572	Iaer object (572)	3		12	1
520	2018-11-16 03:55:30.459828+00	571	Iaer object (571)	3		12	1
521	2018-11-16 03:55:30.467626+00	570	Iaer object (570)	3		12	1
522	2018-11-16 03:55:30.475925+00	569	Iaer object (569)	3		12	1
523	2018-11-16 03:55:30.485988+00	568	Iaer object (568)	3		12	1
524	2018-11-16 03:55:30.493294+00	567	Iaer object (567)	3		12	1
525	2018-11-16 03:55:30.501187+00	566	Iaer object (566)	3		12	1
526	2018-11-16 03:55:30.511771+00	565	Iaer object (565)	3		12	1
527	2018-11-16 03:55:30.519187+00	564	Iaer object (564)	3		12	1
528	2018-11-16 03:55:30.52655+00	563	Iaer object (563)	3		12	1
529	2018-11-16 03:55:30.534671+00	562	Iaer object (562)	3		12	1
530	2018-11-16 03:55:30.543523+00	561	Iaer object (561)	3		12	1
531	2018-11-16 03:55:30.55126+00	560	Iaer object (560)	3		12	1
532	2018-11-16 03:55:30.559857+00	559	Iaer object (559)	3		12	1
533	2018-11-16 03:55:30.56852+00	558	Iaer object (558)	3		12	1
534	2018-11-16 03:55:30.576071+00	557	Iaer object (557)	3		12	1
535	2018-11-16 03:55:30.583642+00	556	Iaer object (556)	3		12	1
536	2018-11-16 03:55:30.592428+00	555	Iaer object (555)	3		12	1
537	2018-11-16 03:55:30.609915+00	554	Iaer object (554)	3		12	1
538	2018-11-16 03:55:30.623006+00	553	Iaer object (553)	3		12	1
539	2018-11-16 03:55:30.637142+00	552	Iaer object (552)	3		12	1
540	2018-11-16 03:55:30.645076+00	551	Iaer object (551)	3		12	1
541	2018-11-16 03:55:30.653087+00	550	Iaer object (550)	3		12	1
542	2018-11-16 03:55:30.664029+00	549	Iaer object (549)	3		12	1
543	2018-11-16 03:55:30.671444+00	548	Iaer object (548)	3		12	1
544	2018-11-16 03:55:30.679823+00	547	Iaer object (547)	3		12	1
545	2018-11-16 03:55:30.692392+00	546	Iaer object (546)	3		12	1
546	2018-11-16 03:55:30.70222+00	545	Iaer object (545)	3		12	1
547	2018-11-16 03:55:30.709456+00	544	Iaer object (544)	3		12	1
548	2018-11-16 03:55:30.725084+00	543	Iaer object (543)	3		12	1
549	2018-11-16 03:55:30.741561+00	542	Iaer object (542)	3		12	1
550	2018-11-16 03:55:30.754193+00	541	Iaer object (541)	3		12	1
551	2018-11-16 03:55:30.779504+00	540	Iaer object (540)	3		12	1
552	2018-11-16 03:55:30.793672+00	539	Iaer object (539)	3		12	1
553	2018-11-16 03:55:30.804033+00	538	Iaer object (538)	3		12	1
554	2018-11-16 03:55:30.81191+00	537	Iaer object (537)	3		12	1
555	2018-11-16 03:55:30.820182+00	536	Iaer object (536)	3		12	1
556	2018-11-16 03:55:30.829914+00	535	Iaer object (535)	3		12	1
557	2018-11-16 03:55:30.837663+00	534	Iaer object (534)	3		12	1
558	2018-11-16 03:55:30.845594+00	533	Iaer object (533)	3		12	1
559	2018-11-16 03:55:30.855484+00	532	Iaer object (532)	3		12	1
560	2018-11-16 03:55:30.862925+00	531	Iaer object (531)	3		12	1
561	2018-11-16 03:55:30.870607+00	530	Iaer object (530)	3		12	1
562	2018-11-16 03:55:30.881513+00	529	Iaer object (529)	3		12	1
563	2018-11-16 03:55:30.891924+00	528	Iaer object (528)	3		12	1
564	2018-11-16 03:55:30.906394+00	527	Iaer object (527)	3		12	1
565	2018-11-16 03:55:30.915244+00	526	Iaer object (526)	3		12	1
566	2018-11-16 03:55:30.931328+00	525	Iaer object (525)	3		12	1
567	2018-11-16 03:55:30.944259+00	524	Iaer object (524)	3		12	1
568	2018-11-16 03:55:30.957053+00	523	Iaer object (523)	3		12	1
569	2018-11-16 03:55:30.975787+00	522	Iaer object (522)	3		12	1
570	2018-11-16 03:55:30.992067+00	521	Iaer object (521)	3		12	1
571	2018-11-16 03:55:31.008185+00	520	Iaer object (520)	3		12	1
572	2018-11-16 03:55:31.018081+00	519	Iaer object (519)	3		12	1
573	2018-11-16 03:55:31.025871+00	518	Iaer object (518)	3		12	1
574	2018-11-16 03:55:31.041651+00	517	Iaer object (517)	3		12	1
575	2018-11-16 03:55:31.055418+00	516	Iaer object (516)	3		12	1
576	2018-11-16 03:55:31.068904+00	515	Iaer object (515)	3		12	1
577	2018-11-16 03:55:31.081147+00	514	Iaer object (514)	3		12	1
578	2018-11-16 03:55:31.09882+00	513	Iaer object (513)	3		12	1
579	2018-11-16 03:55:31.113369+00	512	Iaer object (512)	3		12	1
580	2018-11-16 03:55:31.123439+00	511	Iaer object (511)	3		12	1
581	2018-11-16 03:55:31.135482+00	510	Iaer object (510)	3		12	1
582	2018-11-16 03:55:31.142972+00	509	Iaer object (509)	3		12	1
583	2018-11-16 03:55:31.15458+00	508	Iaer object (508)	3		12	1
584	2018-11-16 03:55:31.162565+00	507	Iaer object (507)	3		12	1
585	2018-11-16 03:55:31.172728+00	506	Iaer object (506)	3		12	1
586	2018-11-16 03:55:31.180574+00	505	Iaer object (505)	3		12	1
587	2018-11-16 03:55:31.196442+00	504	Iaer object (504)	3		12	1
588	2018-11-16 03:55:31.204907+00	503	Iaer object (503)	3		12	1
589	2018-11-16 03:55:31.213744+00	502	Iaer object (502)	3		12	1
590	2018-11-16 03:55:31.223101+00	501	Iaer object (501)	3		12	1
591	2018-11-16 03:55:31.237279+00	500	Iaer object (500)	3		12	1
592	2018-11-16 03:55:31.249554+00	499	Iaer object (499)	3		12	1
593	2018-11-16 03:55:31.268853+00	498	Iaer object (498)	3		12	1
594	2018-11-16 03:55:31.280526+00	497	Iaer object (497)	3		12	1
595	2018-11-16 03:55:31.29202+00	496	Iaer object (496)	3		12	1
596	2018-11-16 03:55:31.304059+00	495	Iaer object (495)	3		12	1
597	2018-11-16 03:55:31.316357+00	494	Iaer object (494)	3		12	1
598	2018-11-16 03:55:31.326994+00	493	Iaer object (493)	3		12	1
599	2018-11-16 03:55:31.339473+00	492	Iaer object (492)	3		12	1
600	2018-11-16 03:55:31.349823+00	491	Iaer object (491)	3		12	1
601	2018-11-16 03:55:31.36283+00	490	Iaer object (490)	3		12	1
602	2018-11-16 03:55:31.38182+00	489	Iaer object (489)	3		12	1
603	2018-11-16 03:55:31.396151+00	488	Iaer object (488)	3		12	1
604	2018-11-16 03:55:31.421363+00	487	Iaer object (487)	3		12	1
605	2018-11-16 03:55:31.440016+00	486	Iaer object (486)	3		12	1
606	2018-11-16 03:55:31.450468+00	485	Iaer object (485)	3		12	1
607	2018-11-16 03:55:31.461095+00	484	Iaer object (484)	3		12	1
608	2018-11-16 03:55:31.472164+00	483	Iaer object (483)	3		12	1
609	2018-11-16 03:55:31.482367+00	482	Iaer object (482)	3		12	1
610	2018-11-16 03:55:31.493797+00	481	Iaer object (481)	3		12	1
611	2018-11-16 03:55:31.504642+00	480	Iaer object (480)	3		12	1
612	2018-11-16 03:55:31.512702+00	479	Iaer object (479)	3		12	1
613	2018-11-16 03:55:31.532248+00	478	Iaer object (478)	3		12	1
614	2018-11-16 03:55:31.543413+00	477	Iaer object (477)	3		12	1
615	2018-11-16 03:55:31.555773+00	476	Iaer object (476)	3		12	1
616	2018-11-16 03:55:31.566647+00	475	Iaer object (475)	3		12	1
617	2018-11-16 03:55:31.5785+00	474	Iaer object (474)	3		12	1
618	2018-11-16 03:55:31.619977+00	473	Iaer object (473)	3		12	1
619	2018-11-16 03:55:31.631006+00	472	Iaer object (472)	3		12	1
620	2018-11-16 03:55:31.66532+00	471	Iaer object (471)	3		12	1
621	2018-11-16 03:55:31.679057+00	470	Iaer object (470)	3		12	1
622	2018-11-16 03:55:31.690331+00	469	Iaer object (469)	3		12	1
623	2018-11-16 03:55:31.700312+00	468	Iaer object (468)	3		12	1
624	2018-11-16 03:55:31.710354+00	467	Iaer object (467)	3		12	1
625	2018-11-16 03:55:31.717835+00	466	Iaer object (466)	3		12	1
626	2018-11-16 03:55:31.728788+00	465	Iaer object (465)	3		12	1
627	2018-11-16 03:55:31.740972+00	464	Iaer object (464)	3		12	1
628	2018-11-16 03:55:31.752456+00	463	Iaer object (463)	3		12	1
629	2018-11-16 03:55:31.761519+00	462	Iaer object (462)	3		12	1
630	2018-11-16 03:55:31.786584+00	461	Iaer object (461)	3		12	1
631	2018-11-16 03:55:31.803317+00	460	Iaer object (460)	3		12	1
632	2018-11-16 03:55:31.822394+00	459	Iaer object (459)	3		12	1
633	2018-11-16 03:55:31.830365+00	458	Iaer object (458)	3		12	1
634	2018-11-16 03:55:31.840908+00	457	Iaer object (457)	3		12	1
635	2018-11-16 03:55:31.854438+00	456	Iaer object (456)	3		12	1
636	2018-11-16 03:55:31.863414+00	455	Iaer object (455)	3		12	1
637	2018-11-16 03:55:31.874627+00	454	Iaer object (454)	3		12	1
638	2018-11-16 03:55:31.88671+00	453	Iaer object (453)	3		12	1
639	2018-11-16 03:55:31.898468+00	452	Iaer object (452)	3		12	1
640	2018-11-16 03:55:31.909307+00	451	Iaer object (451)	3		12	1
641	2018-11-16 03:55:31.918877+00	450	Iaer object (450)	3		12	1
642	2018-11-16 03:55:31.930019+00	449	Iaer object (449)	3		12	1
643	2018-11-16 03:55:31.940734+00	448	Iaer object (448)	3		12	1
644	2018-11-16 03:55:31.952414+00	447	Iaer object (447)	3		12	1
645	2018-11-16 03:55:31.966516+00	446	Iaer object (446)	3		12	1
646	2018-11-16 03:55:31.977263+00	445	Iaer object (445)	3		12	1
647	2018-11-16 03:55:31.98775+00	444	Iaer object (444)	3		12	1
648	2018-11-16 03:55:31.998963+00	443	Iaer object (443)	3		12	1
649	2018-11-16 03:55:32.008575+00	442	Iaer object (442)	3		12	1
650	2018-11-16 03:55:32.018781+00	441	Iaer object (441)	3		12	1
651	2018-11-16 03:55:32.026706+00	440	Iaer object (440)	3		12	1
652	2018-11-16 03:55:32.034133+00	439	Iaer object (439)	3		12	1
653	2018-11-16 03:55:32.041222+00	438	Iaer object (438)	3		12	1
654	2018-11-16 03:55:32.049642+00	437	Iaer object (437)	3		12	1
655	2018-11-16 03:55:32.059158+00	436	Iaer object (436)	3		12	1
656	2018-11-16 03:55:32.069949+00	435	Iaer object (435)	3		12	1
657	2018-11-16 03:55:32.079991+00	434	Iaer object (434)	3		12	1
658	2018-11-16 03:55:32.087467+00	433	Iaer object (433)	3		12	1
659	2018-11-16 03:55:32.095029+00	432	Iaer object (432)	3		12	1
660	2018-11-16 03:55:32.116494+00	431	Iaer object (431)	3		12	1
661	2018-11-16 03:55:32.126448+00	430	Iaer object (430)	3		12	1
662	2018-11-16 03:55:32.137048+00	429	Iaer object (429)	3		12	1
663	2018-11-16 03:55:32.149333+00	428	Iaer object (428)	3		12	1
664	2018-11-16 03:55:32.156892+00	427	Iaer object (427)	3		12	1
665	2018-11-16 03:55:32.164937+00	426	Iaer object (426)	3		12	1
666	2018-11-16 03:55:32.175483+00	425	Iaer object (425)	3		12	1
667	2018-11-16 03:55:32.182786+00	424	Iaer object (424)	3		12	1
668	2018-11-16 03:55:32.190441+00	423	Iaer object (423)	3		12	1
669	2018-11-16 03:55:32.202554+00	422	Iaer object (422)	3		12	1
670	2018-11-16 03:55:32.212116+00	421	Iaer object (421)	3		12	1
671	2018-11-16 03:55:32.219341+00	420	Iaer object (420)	3		12	1
672	2018-11-16 03:55:32.228357+00	419	Iaer object (419)	3		12	1
673	2018-11-16 03:55:32.242118+00	418	Iaer object (418)	3		12	1
674	2018-11-16 03:55:32.257666+00	417	Iaer object (417)	3		12	1
675	2018-11-16 03:55:32.271856+00	416	Iaer object (416)	3		12	1
676	2018-11-16 03:55:32.284927+00	415	Iaer object (415)	3		12	1
677	2018-11-16 03:55:32.292843+00	414	Iaer object (414)	3		12	1
678	2018-11-16 03:55:32.305815+00	413	Iaer object (413)	3		12	1
679	2018-11-16 03:55:32.315439+00	412	Iaer object (412)	3		12	1
680	2018-11-16 03:55:32.324333+00	411	Iaer object (411)	3		12	1
681	2018-11-16 03:55:32.33246+00	410	Iaer object (410)	3		12	1
682	2018-11-16 03:55:32.339627+00	409	Iaer object (409)	3		12	1
683	2018-11-16 03:55:32.34731+00	408	Iaer object (408)	3		12	1
684	2018-11-16 03:55:32.35518+00	407	Iaer object (407)	3		12	1
685	2018-11-16 03:55:32.365303+00	406	Iaer object (406)	3		12	1
686	2018-11-16 03:55:32.374429+00	405	Iaer object (405)	3		12	1
687	2018-11-16 03:55:32.382555+00	404	Iaer object (404)	3		12	1
688	2018-11-16 03:55:32.391576+00	403	Iaer object (403)	3		12	1
689	2018-11-16 03:55:32.405389+00	402	Iaer object (402)	3		12	1
690	2018-11-16 03:55:32.418388+00	401	Iaer object (401)	3		12	1
691	2018-11-16 03:55:32.435515+00	400	Iaer object (400)	3		12	1
692	2018-11-16 03:55:32.446764+00	399	Iaer object (399)	3		12	1
693	2018-11-16 03:55:32.456821+00	398	Iaer object (398)	3		12	1
694	2018-11-16 03:55:32.464691+00	397	Iaer object (397)	3		12	1
695	2018-11-16 03:55:32.472049+00	396	Iaer object (396)	3		12	1
696	2018-11-16 03:55:32.482783+00	395	Iaer object (395)	3		12	1
697	2018-11-16 03:55:32.491238+00	394	Iaer object (394)	3		12	1
698	2018-11-16 03:55:32.511955+00	393	Iaer object (393)	3		12	1
699	2018-11-16 03:55:32.522146+00	392	Iaer object (392)	3		12	1
700	2018-11-16 03:55:32.530411+00	391	Iaer object (391)	3		12	1
701	2018-11-16 03:55:32.537568+00	390	Iaer object (390)	3		12	1
702	2018-11-16 03:55:32.550344+00	389	Iaer object (389)	3		12	1
703	2018-11-16 03:55:32.55752+00	388	Iaer object (388)	3		12	1
704	2018-11-16 03:55:32.569303+00	387	Iaer object (387)	3		12	1
705	2018-11-16 03:55:32.588605+00	386	Iaer object (386)	3		12	1
706	2018-11-16 03:55:32.601033+00	385	Iaer object (385)	3		12	1
707	2018-11-16 03:55:32.61383+00	384	Iaer object (384)	3		12	1
708	2018-11-16 03:55:32.621238+00	383	Iaer object (383)	3		12	1
709	2018-11-16 03:55:32.629005+00	382	Iaer object (382)	3		12	1
710	2018-11-16 03:55:32.636822+00	381	Iaer object (381)	3		12	1
711	2018-11-16 03:55:32.645005+00	380	Iaer object (380)	3		12	1
712	2018-11-16 03:55:32.655266+00	379	Iaer object (379)	3		12	1
713	2018-11-16 03:55:32.663265+00	378	Iaer object (378)	3		12	1
714	2018-11-16 03:55:32.671692+00	377	Iaer object (377)	3		12	1
715	2018-11-16 03:55:32.681251+00	376	Iaer object (376)	3		12	1
716	2018-11-16 03:55:32.688358+00	375	Iaer object (375)	3		12	1
717	2018-11-16 03:55:32.704762+00	374	Iaer object (374)	3		12	1
718	2018-11-16 03:55:32.717029+00	373	Iaer object (373)	3		12	1
719	2018-11-16 03:55:32.729674+00	372	Iaer object (372)	3		12	1
720	2018-11-16 03:55:32.748876+00	371	Iaer object (371)	3		12	1
721	2018-11-16 03:55:32.760977+00	370	Iaer object (370)	3		12	1
722	2018-11-16 03:55:32.771438+00	369	Iaer object (369)	3		12	1
723	2018-11-16 03:55:32.781544+00	368	Iaer object (368)	3		12	1
724	2018-11-16 03:55:32.791907+00	367	Iaer object (367)	3		12	1
725	2018-11-16 03:55:32.805214+00	366	Iaer object (366)	3		12	1
726	2018-11-16 03:55:32.813166+00	365	Iaer object (365)	3		12	1
727	2018-11-16 03:55:32.826515+00	364	Iaer object (364)	3		12	1
728	2018-11-16 03:55:32.837557+00	363	Iaer object (363)	3		12	1
729	2018-11-16 03:55:32.850743+00	362	Iaer object (362)	3		12	1
730	2018-11-16 03:55:32.861071+00	361	Iaer object (361)	3		12	1
731	2018-11-16 03:55:32.873262+00	360	Iaer object (360)	3		12	1
732	2018-11-16 03:55:32.884129+00	359	Iaer object (359)	3		12	1
733	2018-11-16 03:55:32.894953+00	358	Iaer object (358)	3		12	1
734	2018-11-16 03:55:32.907452+00	357	Iaer object (357)	3		12	1
735	2018-11-16 03:55:32.922108+00	356	Iaer object (356)	3		12	1
736	2018-11-16 03:55:32.932834+00	355	Iaer object (355)	3		12	1
737	2018-11-16 03:55:32.946276+00	354	Iaer object (354)	3		12	1
738	2018-11-16 03:55:32.963194+00	353	Iaer object (353)	3		12	1
739	2018-11-16 03:55:32.97752+00	352	Iaer object (352)	3		12	1
740	2018-11-16 03:55:32.995188+00	351	Iaer object (351)	3		12	1
741	2018-11-16 03:55:33.015249+00	350	Iaer object (350)	3		12	1
742	2018-11-16 03:55:33.033482+00	349	Iaer object (349)	3		12	1
743	2018-11-16 03:55:33.055446+00	348	Iaer object (348)	3		12	1
744	2018-11-16 03:55:33.073748+00	347	Iaer object (347)	3		12	1
745	2018-11-16 03:55:33.095406+00	346	Iaer object (346)	3		12	1
746	2018-11-16 03:55:33.122469+00	345	Iaer object (345)	3		12	1
747	2018-11-16 03:55:33.134923+00	344	Iaer object (344)	3		12	1
748	2018-11-16 03:55:33.145254+00	343	Iaer object (343)	3		12	1
749	2018-11-16 03:55:33.155373+00	342	Iaer object (342)	3		12	1
750	2018-11-16 03:55:33.166194+00	341	Iaer object (341)	3		12	1
751	2018-11-16 03:55:33.177328+00	340	Iaer object (340)	3		12	1
752	2018-11-16 03:55:33.189238+00	339	Iaer object (339)	3		12	1
753	2018-11-16 03:55:33.200132+00	338	Iaer object (338)	3		12	1
754	2018-11-16 03:55:33.214042+00	337	Iaer object (337)	3		12	1
755	2018-11-16 03:55:33.225482+00	336	Iaer object (336)	3		12	1
756	2018-11-16 03:55:33.244412+00	335	Iaer object (335)	3		12	1
757	2018-11-16 03:55:33.255838+00	334	Iaer object (334)	3		12	1
758	2018-11-16 03:55:33.270086+00	333	Iaer object (333)	3		12	1
759	2018-11-16 03:55:33.282476+00	332	Iaer object (332)	3		12	1
760	2018-11-16 03:55:33.300609+00	331	Iaer object (331)	3		12	1
761	2018-11-16 03:55:33.312565+00	330	Iaer object (330)	3		12	1
762	2018-11-16 03:55:33.328057+00	329	Iaer object (329)	3		12	1
763	2018-11-16 03:55:33.341925+00	328	Iaer object (328)	3		12	1
764	2018-11-16 03:55:33.352438+00	327	Iaer object (327)	3		12	1
765	2018-11-16 03:55:33.366091+00	326	Iaer object (326)	3		12	1
766	2018-11-16 03:55:33.376786+00	325	Iaer object (325)	3		12	1
767	2018-11-16 03:55:33.390935+00	324	Iaer object (324)	3		12	1
768	2018-11-16 03:55:33.401407+00	323	Iaer object (323)	3		12	1
769	2018-11-16 03:55:33.421462+00	322	Iaer object (322)	3		12	1
770	2018-11-16 03:55:33.433989+00	321	Iaer object (321)	3		12	1
771	2018-11-16 03:55:33.441+00	320	Iaer object (320)	3		12	1
772	2018-11-16 03:55:33.449181+00	319	Iaer object (319)	3		12	1
773	2018-11-16 03:55:33.461459+00	318	Iaer object (318)	3		12	1
774	2018-11-16 03:55:33.471129+00	317	Iaer object (317)	3		12	1
775	2018-11-16 03:55:33.479444+00	316	Iaer object (316)	3		12	1
776	2018-11-16 03:55:33.488103+00	315	Iaer object (315)	3		12	1
777	2018-11-16 03:55:33.498583+00	314	Iaer object (314)	3		12	1
778	2018-11-16 03:55:33.506274+00	313	Iaer object (313)	3		12	1
779	2018-11-16 03:55:33.517025+00	312	Iaer object (312)	3		12	1
780	2018-11-16 03:55:33.524612+00	311	Iaer object (311)	3		12	1
781	2018-11-16 03:55:33.53255+00	310	Iaer object (310)	3		12	1
782	2018-11-16 03:55:33.54334+00	309	Iaer object (309)	3		12	1
783	2018-11-16 03:55:33.554568+00	308	Iaer object (308)	3		12	1
784	2018-11-16 03:55:33.564316+00	307	Iaer object (307)	3		12	1
785	2018-11-16 03:55:33.575115+00	306	Iaer object (306)	3		12	1
786	2018-11-16 03:55:33.58981+00	305	Iaer object (305)	3		12	1
787	2018-11-16 03:55:33.599777+00	304	Iaer object (304)	3		12	1
788	2018-11-16 03:55:33.614758+00	303	Iaer object (303)	3		12	1
789	2018-11-16 03:55:33.626527+00	302	Iaer object (302)	3		12	1
790	2018-11-16 03:55:33.637152+00	301	Iaer object (301)	3		12	1
791	2018-11-16 03:55:33.653249+00	300	Iaer object (300)	3		12	1
792	2018-11-16 03:55:33.661886+00	299	Iaer object (299)	3		12	1
793	2018-11-16 03:55:33.670597+00	298	Iaer object (298)	3		12	1
794	2018-11-16 03:55:33.684097+00	297	Iaer object (297)	3		12	1
795	2018-11-16 03:55:33.691525+00	296	Iaer object (296)	3		12	1
796	2018-11-16 03:55:33.699701+00	295	Iaer object (295)	3		12	1
797	2018-11-16 03:55:33.713833+00	294	Iaer object (294)	3		12	1
798	2018-11-16 03:55:33.72341+00	293	Iaer object (293)	3		12	1
799	2018-11-16 03:55:33.731364+00	292	Iaer object (292)	3		12	1
800	2018-11-16 03:55:33.739449+00	291	Iaer object (291)	3		12	1
801	2018-11-16 03:55:33.753746+00	290	Iaer object (290)	3		12	1
802	2018-11-16 03:55:33.768704+00	289	Iaer object (289)	3		12	1
803	2018-11-16 03:55:33.780472+00	288	Iaer object (288)	3		12	1
804	2018-11-16 03:55:33.788956+00	287	Iaer object (287)	3		12	1
805	2018-11-16 03:55:33.798547+00	286	Iaer object (286)	3		12	1
806	2018-11-16 03:55:33.806762+00	285	Iaer object (285)	3		12	1
807	2018-11-16 03:55:33.825089+00	284	Iaer object (284)	3		12	1
808	2018-11-16 03:55:33.8355+00	283	Iaer object (283)	3		12	1
809	2018-11-16 03:55:33.842953+00	282	Iaer object (282)	3		12	1
810	2018-11-16 03:55:33.850485+00	281	Iaer object (281)	3		12	1
811	2018-11-16 03:55:33.858336+00	280	Iaer object (280)	3		12	1
812	2018-11-16 03:55:33.871713+00	279	Iaer object (279)	3		12	1
813	2018-11-16 03:55:33.879277+00	278	Iaer object (278)	3		12	1
814	2018-11-16 03:55:33.889645+00	277	Iaer object (277)	3		12	1
815	2018-11-16 03:55:33.900146+00	276	Iaer object (276)	3		12	1
816	2018-11-16 03:55:33.917302+00	275	Iaer object (275)	3		12	1
817	2018-11-16 03:55:33.927459+00	274	Iaer object (274)	3		12	1
818	2018-11-16 03:55:33.934767+00	273	Iaer object (273)	3		12	1
819	2018-11-16 03:55:33.941656+00	272	Iaer object (272)	3		12	1
820	2018-11-16 03:55:33.949243+00	271	Iaer object (271)	3		12	1
821	2018-11-16 03:55:33.960693+00	270	Iaer object (270)	3		12	1
822	2018-11-16 03:55:33.970955+00	269	Iaer object (269)	3		12	1
823	2018-11-16 03:55:33.979079+00	268	Iaer object (268)	3		12	1
824	2018-11-16 03:55:33.992201+00	267	Iaer object (267)	3		12	1
825	2018-11-16 03:55:34.006201+00	266	Iaer object (266)	3		12	1
826	2018-11-16 03:55:34.020483+00	265	Iaer object (265)	3		12	1
827	2018-11-16 03:55:34.039185+00	264	Iaer object (264)	3		12	1
828	2018-11-16 03:55:34.050873+00	263	Iaer object (263)	3		12	1
829	2018-11-16 03:55:34.06124+00	262	Iaer object (262)	3		12	1
830	2018-11-16 03:55:34.07182+00	261	Iaer object (261)	3		12	1
831	2018-11-16 03:55:34.079395+00	260	Iaer object (260)	3		12	1
832	2018-11-16 03:55:34.091857+00	259	Iaer object (259)	3		12	1
833	2018-11-16 03:55:34.104615+00	258	Iaer object (258)	3		12	1
834	2018-11-16 03:55:34.127361+00	257	Iaer object (257)	3		12	1
835	2018-11-16 03:55:34.150103+00	256	Iaer object (256)	3		12	1
836	2018-11-16 03:55:34.158099+00	255	Iaer object (255)	3		12	1
837	2018-11-16 03:55:34.172728+00	254	Iaer object (254)	3		12	1
838	2018-11-16 03:55:34.18767+00	253	Iaer object (253)	3		12	1
839	2018-11-16 03:55:34.197503+00	252	Iaer object (252)	3		12	1
840	2018-11-16 03:55:34.208769+00	251	Iaer object (251)	3		12	1
841	2018-11-16 03:55:34.232998+00	250	Iaer object (250)	3		12	1
842	2018-11-16 03:55:34.270674+00	249	Iaer object (249)	3		12	1
843	2018-11-16 03:55:34.280988+00	248	Iaer object (248)	3		12	1
844	2018-11-16 03:55:34.291677+00	247	Iaer object (247)	3		12	1
845	2018-11-16 03:55:34.303844+00	246	Iaer object (246)	3		12	1
846	2018-11-16 03:55:34.314441+00	245	Iaer object (245)	3		12	1
847	2018-11-16 03:55:34.324734+00	244	Iaer object (244)	3		12	1
848	2018-11-16 03:55:34.334965+00	243	Iaer object (243)	3		12	1
849	2018-11-16 03:55:34.34276+00	242	Iaer object (242)	3		12	1
850	2018-11-16 03:55:34.351392+00	241	Iaer object (241)	3		12	1
851	2018-11-16 03:55:34.364608+00	240	Iaer object (240)	3		12	1
852	2018-11-16 03:55:34.374789+00	239	Iaer object (239)	3		12	1
853	2018-11-16 03:55:34.389216+00	238	Iaer object (238)	3		12	1
854	2018-11-16 03:55:34.403129+00	237	Iaer object (237)	3		12	1
855	2018-11-16 03:55:34.423225+00	236	Iaer object (236)	3		12	1
856	2018-11-16 03:55:34.436448+00	235	Iaer object (235)	3		12	1
857	2018-11-16 03:55:34.460102+00	234	Iaer object (234)	3		12	1
858	2018-11-16 03:55:34.470743+00	233	Iaer object (233)	3		12	1
859	2018-11-16 03:55:34.480733+00	232	Iaer object (232)	3		12	1
860	2018-11-16 03:55:34.491381+00	231	Iaer object (231)	3		12	1
861	2018-11-16 03:55:34.501478+00	230	Iaer object (230)	3		12	1
862	2018-11-16 03:55:34.509428+00	229	Iaer object (229)	3		12	1
863	2018-11-16 03:55:34.519511+00	228	Iaer object (228)	3		12	1
864	2018-11-16 03:55:34.530281+00	227	Iaer object (227)	3		12	1
865	2018-11-16 03:55:34.540712+00	226	Iaer object (226)	3		12	1
866	2018-11-16 03:55:34.552782+00	225	Iaer object (225)	3		12	1
867	2018-11-16 03:55:34.564184+00	224	Iaer object (224)	3		12	1
868	2018-11-16 03:55:34.574409+00	223	Iaer object (223)	3		12	1
869	2018-11-16 03:55:34.588331+00	222	Iaer object (222)	3		12	1
870	2018-11-16 03:55:34.600886+00	221	Iaer object (221)	3		12	1
871	2018-11-16 03:55:34.631086+00	220	Iaer object (220)	3		12	1
872	2018-11-16 03:55:34.641193+00	219	Iaer object (219)	3		12	1
873	2018-11-16 03:55:34.653086+00	218	Iaer object (218)	3		12	1
874	2018-11-16 03:55:34.66353+00	217	Iaer object (217)	3		12	1
875	2018-11-16 03:55:34.673756+00	216	Iaer object (216)	3		12	1
876	2018-11-16 03:55:34.684951+00	215	Iaer object (215)	3		12	1
877	2018-11-16 03:55:34.695411+00	214	Iaer object (214)	3		12	1
878	2018-11-16 03:55:34.70546+00	213	Iaer object (213)	3		12	1
879	2018-11-16 03:55:34.716682+00	212	Iaer object (212)	3		12	1
880	2018-11-16 03:55:34.734985+00	211	Iaer object (211)	3		12	1
881	2018-11-16 03:55:34.745807+00	210	Iaer object (210)	3		12	1
882	2018-11-16 03:55:34.753356+00	209	Iaer object (209)	3		12	1
883	2018-11-16 03:55:34.76175+00	208	Iaer object (208)	3		12	1
884	2018-11-16 03:55:34.772906+00	207	Iaer object (207)	3		12	1
885	2018-11-16 03:55:34.793269+00	206	Iaer object (206)	3		12	1
886	2018-11-16 03:55:34.80513+00	205	Iaer object (205)	3		12	1
887	2018-11-16 03:55:34.816864+00	204	Iaer object (204)	3		12	1
888	2018-11-16 03:55:34.832839+00	203	Iaer object (203)	3		12	1
889	2018-11-16 03:55:34.843816+00	202	Iaer object (202)	3		12	1
890	2018-11-16 03:55:34.855181+00	201	Iaer object (201)	3		12	1
891	2018-11-16 03:55:34.865922+00	200	Iaer object (200)	3		12	1
892	2018-11-16 03:55:34.873644+00	199	Iaer object (199)	3		12	1
893	2018-11-16 03:55:34.881951+00	198	Iaer object (198)	3		12	1
894	2018-11-16 03:55:34.899059+00	197	Iaer object (197)	3		12	1
895	2018-11-16 03:55:34.910199+00	196	Iaer object (196)	3		12	1
896	2018-11-16 03:55:34.920216+00	195	Iaer object (195)	3		12	1
897	2018-11-16 03:55:34.928496+00	194	Iaer object (194)	3		12	1
898	2018-11-16 03:55:34.937185+00	193	Iaer object (193)	3		12	1
899	2018-11-16 03:55:34.960663+00	192	Iaer object (192)	3		12	1
900	2018-11-16 03:55:34.971176+00	191	Iaer object (191)	3		12	1
901	2018-11-16 03:55:34.982304+00	190	Iaer object (190)	3		12	1
902	2018-11-16 03:55:34.99344+00	189	Iaer object (189)	3		12	1
903	2018-11-16 03:55:35.00441+00	188	Iaer object (188)	3		12	1
904	2018-11-16 03:55:35.014519+00	187	Iaer object (187)	3		12	1
905	2018-11-16 03:55:35.023843+00	186	Iaer object (186)	3		12	1
906	2018-11-16 03:55:35.031615+00	185	Iaer object (185)	3		12	1
907	2018-11-16 03:55:35.039987+00	184	Iaer object (184)	3		12	1
908	2018-11-16 03:55:35.050484+00	183	Iaer object (183)	3		12	1
909	2018-11-16 03:55:35.059564+00	182	Iaer object (182)	3		12	1
910	2018-11-16 03:55:35.067329+00	181	Iaer object (181)	3		12	1
911	2018-11-16 03:55:35.074907+00	180	Iaer object (180)	3		12	1
912	2018-11-16 03:55:35.086161+00	179	Iaer object (179)	3		12	1
913	2018-11-16 03:55:35.094651+00	178	Iaer object (178)	3		12	1
914	2018-11-16 03:55:35.108576+00	177	Iaer object (177)	3		12	1
915	2018-11-16 03:55:35.121629+00	176	Iaer object (176)	3		12	1
916	2018-11-16 03:55:35.133119+00	175	Iaer object (175)	3		12	1
917	2018-11-16 03:55:35.143419+00	174	Iaer object (174)	3		12	1
918	2018-11-16 03:55:35.153691+00	173	Iaer object (173)	3		12	1
919	2018-11-16 03:55:35.161139+00	172	Iaer object (172)	3		12	1
920	2018-11-16 03:55:35.168615+00	171	Iaer object (171)	3		12	1
921	2018-11-16 03:55:35.175757+00	170	Iaer object (170)	3		12	1
922	2018-11-16 03:55:35.188069+00	169	Iaer object (169)	3		12	1
923	2018-11-16 03:55:35.197296+00	168	Iaer object (168)	3		12	1
924	2018-11-16 03:55:35.204604+00	167	Iaer object (167)	3		12	1
925	2018-11-16 03:55:35.213335+00	166	Iaer object (166)	3		12	1
926	2018-11-16 03:55:35.223102+00	165	Iaer object (165)	3		12	1
927	2018-11-16 03:55:35.239976+00	164	Iaer object (164)	3		12	1
928	2018-11-16 03:55:35.251416+00	163	Iaer object (163)	3		12	1
929	2018-11-16 03:55:35.265755+00	162	Iaer object (162)	3		12	1
930	2018-11-16 03:55:35.276136+00	161	Iaer object (161)	3		12	1
931	2018-11-16 03:55:35.283512+00	160	Iaer object (160)	3		12	1
932	2018-11-16 03:55:35.291767+00	159	Iaer object (159)	3		12	1
933	2018-11-16 03:55:35.302375+00	158	Iaer object (158)	3		12	1
934	2018-11-16 03:55:35.309776+00	157	Iaer object (157)	3		12	1
935	2018-11-16 03:55:35.317488+00	156	Iaer object (156)	3		12	1
936	2018-11-16 03:55:35.324977+00	155	Iaer object (155)	3		12	1
937	2018-11-16 03:55:35.333096+00	154	Iaer object (154)	3		12	1
938	2018-11-16 03:55:35.342948+00	153	Iaer object (153)	3		12	1
939	2018-11-16 03:55:35.350559+00	152	Iaer object (152)	3		12	1
940	2018-11-16 03:55:35.359877+00	151	Iaer object (151)	3		12	1
941	2018-11-16 03:55:35.374916+00	150	Iaer object (150)	3		12	1
942	2018-11-16 03:55:35.385002+00	149	Iaer object (149)	3		12	1
943	2018-11-16 03:55:35.406775+00	148	Iaer object (148)	3		12	1
944	2018-11-16 03:55:35.430907+00	147	Iaer object (147)	3		12	1
945	2018-11-16 03:55:35.456509+00	146	Iaer object (146)	3		12	1
946	2018-11-16 03:55:35.471214+00	145	Iaer object (145)	3		12	1
947	2018-11-16 03:55:35.479383+00	144	Iaer object (144)	3		12	1
948	2018-11-16 03:55:35.486757+00	143	Iaer object (143)	3		12	1
949	2018-11-16 03:55:35.500774+00	142	Iaer object (142)	3		12	1
950	2018-11-16 03:55:35.511951+00	141	Iaer object (141)	3		12	1
951	2018-11-16 03:55:35.523042+00	140	Iaer object (140)	3		12	1
952	2018-11-16 03:55:35.534028+00	139	Iaer object (139)	3		12	1
953	2018-11-16 03:55:35.541419+00	138	Iaer object (138)	3		12	1
954	2018-11-16 03:55:35.549856+00	137	Iaer object (137)	3		12	1
955	2018-11-16 03:55:35.560998+00	136	Iaer object (136)	3		12	1
956	2018-11-16 03:55:35.57199+00	135	Iaer object (135)	3		12	1
957	2018-11-16 03:55:35.585369+00	134	Iaer object (134)	3		12	1
958	2018-11-16 03:55:35.592537+00	133	Iaer object (133)	3		12	1
959	2018-11-16 03:55:35.600055+00	132	Iaer object (132)	3		12	1
960	2018-11-16 03:55:35.607399+00	131	Iaer object (131)	3		12	1
961	2018-11-16 03:55:35.621206+00	130	Iaer object (130)	3		12	1
962	2018-11-16 03:55:35.62862+00	129	Iaer object (129)	3		12	1
963	2018-11-16 03:55:35.642194+00	128	Iaer object (128)	3		12	1
964	2018-11-16 03:55:35.649892+00	127	Iaer object (127)	3		12	1
965	2018-11-16 03:55:35.657076+00	126	Iaer object (126)	3		12	1
966	2018-11-16 03:55:35.664498+00	125	Iaer object (125)	3		12	1
967	2018-11-16 03:55:35.672813+00	124	Iaer object (124)	3		12	1
968	2018-11-16 03:55:35.683123+00	123	Iaer object (123)	3		12	1
969	2018-11-16 03:55:35.694237+00	122	Iaer object (122)	3		12	1
970	2018-11-16 03:55:35.701711+00	121	Iaer object (121)	3		12	1
971	2018-11-16 03:55:35.70979+00	120	Iaer object (120)	3		12	1
972	2018-11-16 03:55:35.719185+00	119	Iaer object (119)	3		12	1
973	2018-11-16 03:55:35.741681+00	118	Iaer object (118)	3		12	1
974	2018-11-16 03:55:35.7494+00	117	Iaer object (117)	3		12	1
975	2018-11-16 03:55:35.756643+00	116	Iaer object (116)	3		12	1
976	2018-11-16 03:55:35.767825+00	115	Iaer object (115)	3		12	1
977	2018-11-16 03:55:35.779173+00	114	Iaer object (114)	3		12	1
978	2018-11-16 03:55:35.786486+00	113	Iaer object (113)	3		12	1
979	2018-11-16 03:55:35.798012+00	112	Iaer object (112)	3		12	1
980	2018-11-16 03:55:35.807234+00	111	Iaer object (111)	3		12	1
981	2018-11-16 03:55:35.814878+00	110	Iaer object (110)	3		12	1
982	2018-11-16 03:55:35.821897+00	109	Iaer object (109)	3		12	1
983	2018-11-16 03:55:35.842799+00	108	Iaer object (108)	3		12	1
984	2018-11-16 03:55:35.852827+00	107	Iaer object (107)	3		12	1
985	2018-11-16 03:55:35.865558+00	106	Iaer object (106)	3		12	1
986	2018-11-16 03:55:35.875216+00	105	Iaer object (105)	3		12	1
987	2018-11-16 03:55:35.889039+00	104	Iaer object (104)	3		12	1
988	2018-11-16 03:55:35.897079+00	103	Iaer object (103)	3		12	1
989	2018-11-16 03:55:35.904432+00	102	Iaer object (102)	3		12	1
990	2018-11-16 03:55:35.91194+00	101	Iaer object (101)	3		12	1
991	2018-11-16 03:55:35.920702+00	100	Iaer object (100)	3		12	1
992	2018-11-16 03:55:35.930355+00	99	Iaer object (99)	3		12	1
993	2018-11-16 03:55:35.940591+00	98	Iaer object (98)	3		12	1
994	2018-11-16 03:55:35.951577+00	97	Iaer object (97)	3		12	1
995	2018-11-16 03:55:35.961446+00	96	Iaer object (96)	3		12	1
996	2018-11-16 03:55:35.97116+00	95	Iaer object (95)	3		12	1
997	2018-11-16 03:55:35.982499+00	94	Iaer object (94)	3		12	1
998	2018-11-16 03:55:35.995283+00	93	Iaer object (93)	3		12	1
999	2018-11-16 03:55:36.004819+00	92	Iaer object (92)	3		12	1
1000	2018-11-16 03:55:36.017639+00	91	Iaer object (91)	3		12	1
1001	2018-11-16 03:55:36.024627+00	90	Iaer object (90)	3		12	1
1002	2018-11-16 03:55:36.031668+00	89	Iaer object (89)	3		12	1
1003	2018-11-16 03:55:36.040536+00	88	Iaer object (88)	3		12	1
1004	2018-11-16 03:55:36.052276+00	87	Iaer object (87)	3		12	1
1005	2018-11-16 03:55:36.069443+00	86	Iaer object (86)	3		12	1
1006	2018-11-16 03:55:36.084169+00	85	Iaer object (85)	3		12	1
1007	2018-11-16 03:55:36.09498+00	84	Iaer object (84)	3		12	1
1008	2018-11-16 03:55:36.104744+00	83	Iaer object (83)	3		12	1
1009	2018-11-16 03:55:36.117944+00	82	Iaer object (82)	3		12	1
1010	2018-11-16 03:55:36.128299+00	81	Iaer object (81)	3		12	1
1011	2018-11-16 03:55:36.14212+00	80	Iaer object (80)	3		12	1
1012	2018-11-16 03:55:36.15209+00	79	Iaer object (79)	3		12	1
1013	2018-11-16 03:55:36.159885+00	78	Iaer object (78)	3		12	1
1014	2018-11-16 03:55:36.168011+00	77	Iaer object (77)	3		12	1
1015	2018-11-16 03:55:36.179901+00	76	Iaer object (76)	3		12	1
1016	2018-11-16 03:55:36.189887+00	75	Iaer object (75)	3		12	1
1017	2018-11-16 03:55:36.202253+00	74	Iaer object (74)	3		12	1
1018	2018-11-16 03:55:36.212521+00	73	Iaer object (73)	3		12	1
1019	2018-11-16 03:55:36.222709+00	72	Iaer object (72)	3		12	1
1020	2018-11-16 03:55:36.236336+00	71	Iaer object (71)	3		12	1
1021	2018-11-16 03:55:36.251573+00	70	Iaer object (70)	3		12	1
1022	2018-11-16 03:55:36.259725+00	69	Iaer object (69)	3		12	1
1023	2018-11-16 03:55:36.268383+00	68	Iaer object (68)	3		12	1
1024	2018-11-16 03:55:36.278542+00	67	Iaer object (67)	3		12	1
1025	2018-11-16 03:55:36.289138+00	66	Iaer object (66)	3		12	1
1026	2018-11-16 03:55:36.300553+00	65	Iaer object (65)	3		12	1
1027	2018-11-16 03:55:36.311701+00	64	Iaer object (64)	3		12	1
1028	2018-11-16 03:55:36.322258+00	63	Iaer object (63)	3		12	1
1029	2018-11-16 03:55:36.334629+00	62	Iaer object (62)	3		12	1
1030	2018-11-16 03:55:36.3458+00	61	Iaer object (61)	3		12	1
1031	2018-11-16 03:55:36.356137+00	60	Iaer object (60)	3		12	1
1032	2018-11-16 03:55:36.368705+00	59	Iaer object (59)	3		12	1
1033	2018-11-16 03:55:36.378875+00	58	Iaer object (58)	3		12	1
1034	2018-11-16 03:55:36.389828+00	57	Iaer object (57)	3		12	1
1035	2018-11-16 03:55:36.400435+00	56	Iaer object (56)	3		12	1
1036	2018-11-16 03:55:36.424956+00	55	Iaer object (55)	3		12	1
1037	2018-11-16 03:55:36.440318+00	54	Iaer object (54)	3		12	1
1038	2018-11-16 03:55:36.451493+00	53	Iaer object (53)	3		12	1
1039	2018-11-16 03:55:36.462604+00	52	Iaer object (52)	3		12	1
1040	2018-11-16 03:55:36.477018+00	51	Iaer object (51)	3		12	1
1041	2018-11-16 03:55:36.495743+00	50	Iaer object (50)	3		12	1
1042	2018-11-16 03:55:36.506298+00	49	Iaer object (49)	3		12	1
1043	2018-11-16 03:55:36.544562+00	48	Iaer object (48)	3		12	1
1044	2018-11-16 03:55:36.600629+00	47	Iaer object (47)	3		12	1
1045	2018-11-16 03:55:36.61225+00	46	Iaer object (46)	3		12	1
1046	2018-11-16 03:55:36.626496+00	45	Iaer object (45)	3		12	1
1047	2018-11-16 03:55:36.638665+00	44	Iaer object (44)	3		12	1
1048	2018-11-16 03:55:36.653039+00	43	Iaer object (43)	3		12	1
1049	2018-11-16 03:55:36.664661+00	42	Iaer object (42)	3		12	1
1050	2018-11-16 03:55:36.678046+00	41	Iaer object (41)	3		12	1
1051	2018-11-16 03:55:36.691613+00	40	Iaer object (40)	3		12	1
1052	2018-11-16 03:55:36.706883+00	39	Iaer object (39)	3		12	1
1053	2018-11-16 03:55:36.715109+00	38	Iaer object (38)	3		12	1
1054	2018-11-16 03:55:36.7233+00	37	Iaer object (37)	3		12	1
1055	2018-11-16 03:55:36.734455+00	36	Iaer object (36)	3		12	1
1056	2018-11-16 03:55:36.749056+00	35	Iaer object (35)	3		12	1
1057	2018-11-16 03:55:36.760589+00	34	Iaer object (34)	3		12	1
1058	2018-11-16 03:55:36.770421+00	33	Iaer object (33)	3		12	1
1059	2018-11-16 03:55:36.778898+00	32	Iaer object (32)	3		12	1
1060	2018-11-16 03:55:36.787385+00	31	Iaer object (31)	3		12	1
1061	2018-11-16 03:55:36.798506+00	30	Iaer object (30)	3		12	1
1062	2018-11-16 03:55:36.805996+00	29	Iaer object (29)	3		12	1
1063	2018-11-16 03:55:36.813765+00	28	Iaer object (28)	3		12	1
1064	2018-11-16 03:55:36.824587+00	27	Iaer object (27)	3		12	1
1065	2018-11-16 03:55:36.832471+00	26	Iaer object (26)	3		12	1
1066	2018-11-16 03:55:36.840184+00	25	Iaer object (25)	3		12	1
1067	2018-11-16 03:55:36.851276+00	24	Iaer object (24)	3		12	1
1068	2018-11-16 03:55:36.858806+00	23	Iaer object (23)	3		12	1
1069	2018-11-16 03:55:36.867077+00	22	Iaer object (22)	3		12	1
1070	2018-11-16 03:55:36.878404+00	21	Iaer object (21)	3		12	1
1071	2018-11-16 03:55:36.888961+00	20	Iaer object (20)	3		12	1
1072	2018-11-16 03:55:36.896374+00	19	Iaer object (19)	3		12	1
1073	2018-11-16 03:55:36.920049+00	18	Iaer object (18)	3		12	1
1074	2018-11-16 03:55:36.929824+00	17	Iaer object (17)	3		12	1
1075	2018-11-16 03:55:36.93845+00	16	Iaer object (16)	3		12	1
1076	2018-11-16 03:55:36.946969+00	15	Iaer object (15)	3		12	1
1077	2018-11-16 03:55:36.954829+00	14	Iaer object (14)	3		12	1
1078	2018-11-16 03:55:36.962187+00	13	Iaer object (13)	3		12	1
1079	2018-11-16 03:55:36.969935+00	12	Iaer object (12)	3		12	1
1080	2018-11-16 03:55:36.986691+00	11	Iaer object (11)	3		12	1
1081	2018-11-16 03:55:36.996466+00	10	Iaer object (10)	3		12	1
1082	2018-11-16 03:55:37.006578+00	9	Iaer object (9)	3		12	1
1083	2018-11-16 03:55:37.014209+00	8	Iaer object (8)	3		12	1
1084	2018-11-16 03:55:37.021459+00	7	Iaer object (7)	3		12	1
1085	2018-11-16 03:55:37.029182+00	6	Iaer object (6)	3		12	1
1086	2018-11-16 03:55:37.038756+00	5	Iaer object (5)	3		12	1
1087	2018-11-16 03:55:37.046964+00	4	Iaer object (4)	3		12	1
1088	2018-11-16 03:55:37.054282+00	3	Iaer object (3)	3		12	1
1089	2018-11-16 03:55:37.063167+00	2	Iaer object (2)	3		12	1
1090	2018-11-16 03:55:37.075105+00	1	Iaer object (1)	3		12	1
1091	2018-11-16 05:28:10.959604+00	963	Iaer object (963)	3		12	1
1092	2018-11-16 05:28:10.981185+00	878	Iaer object (878)	3		12	1
1093	2018-11-16 05:28:10.997095+00	962	Iaer object (962)	3		12	1
1094	2018-11-16 05:28:11.00712+00	877	Iaer object (877)	3		12	1
1095	2018-11-16 05:28:11.017213+00	961	Iaer object (961)	3		12	1
1096	2018-11-16 05:28:11.032469+00	876	Iaer object (876)	3		12	1
1097	2018-11-16 05:28:11.042641+00	960	Iaer object (960)	3		12	1
1098	2018-11-16 05:28:11.063293+00	875	Iaer object (875)	3		12	1
1099	2018-11-16 05:28:11.074155+00	959	Iaer object (959)	3		12	1
1100	2018-11-16 05:28:11.0896+00	874	Iaer object (874)	3		12	1
1101	2018-11-16 05:28:11.099703+00	958	Iaer object (958)	3		12	1
1102	2018-11-16 05:28:11.111129+00	873	Iaer object (873)	3		12	1
1103	2018-11-16 05:28:11.121081+00	957	Iaer object (957)	3		12	1
1104	2018-11-16 05:28:11.132073+00	872	Iaer object (872)	3		12	1
1105	2018-11-16 05:28:11.142929+00	956	Iaer object (956)	3		12	1
1106	2018-11-16 05:28:11.151072+00	871	Iaer object (871)	3		12	1
1107	2018-11-16 05:28:11.159079+00	955	Iaer object (955)	3		12	1
1108	2018-11-16 05:28:11.1697+00	870	Iaer object (870)	3		12	1
1109	2018-11-16 05:28:11.18199+00	954	Iaer object (954)	3		12	1
1110	2018-11-16 05:28:11.189894+00	869	Iaer object (869)	3		12	1
1111	2018-11-16 05:28:11.200619+00	953	Iaer object (953)	3		12	1
1112	2018-11-16 05:28:11.211168+00	868	Iaer object (868)	3		12	1
1113	2018-11-16 05:28:11.234791+00	952	Iaer object (952)	3		12	1
1114	2018-11-16 05:28:11.244396+00	867	Iaer object (867)	3		12	1
1115	2018-11-16 05:28:11.252727+00	951	Iaer object (951)	3		12	1
1116	2018-11-16 05:28:11.281257+00	866	Iaer object (866)	3		12	1
1117	2018-11-16 05:28:11.295077+00	950	Iaer object (950)	3		12	1
1118	2018-11-16 05:28:11.313375+00	865	Iaer object (865)	3		12	1
1119	2018-11-16 05:28:11.323729+00	949	Iaer object (949)	3		12	1
1120	2018-11-16 05:28:11.337163+00	864	Iaer object (864)	3		12	1
1121	2018-11-16 05:28:11.347634+00	948	Iaer object (948)	3		12	1
1122	2018-11-16 05:28:11.360645+00	863	Iaer object (863)	3		12	1
1123	2018-11-16 05:28:11.387633+00	947	Iaer object (947)	3		12	1
1124	2018-11-16 05:28:11.414246+00	862	Iaer object (862)	3		12	1
1125	2018-11-16 05:28:11.434952+00	946	Iaer object (946)	3		12	1
1126	2018-11-16 05:28:11.459623+00	861	Iaer object (861)	3		12	1
1127	2018-11-16 05:28:11.470538+00	945	Iaer object (945)	3		12	1
1128	2018-11-16 05:28:11.489528+00	860	Iaer object (860)	3		12	1
1129	2018-11-16 05:28:11.502228+00	944	Iaer object (944)	3		12	1
1130	2018-11-16 05:28:11.520526+00	859	Iaer object (859)	3		12	1
1131	2018-11-16 05:28:11.53186+00	943	Iaer object (943)	3		12	1
1132	2018-11-16 05:28:11.548605+00	858	Iaer object (858)	3		12	1
1133	2018-11-16 05:28:11.558605+00	942	Iaer object (942)	3		12	1
1134	2018-11-16 05:28:11.570159+00	857	Iaer object (857)	3		12	1
1135	2018-11-16 05:28:11.581068+00	941	Iaer object (941)	3		12	1
1136	2018-11-16 05:28:11.592212+00	856	Iaer object (856)	3		12	1
1137	2018-11-16 05:28:11.610558+00	940	Iaer object (940)	3		12	1
1138	2018-11-16 05:28:11.623074+00	855	Iaer object (855)	3		12	1
1139	2018-11-16 05:28:11.636893+00	939	Iaer object (939)	3		12	1
1140	2018-11-16 05:28:11.645279+00	854	Iaer object (854)	3		12	1
1141	2018-11-16 05:28:11.656411+00	938	Iaer object (938)	3		12	1
1142	2018-11-16 05:28:11.667347+00	853	Iaer object (853)	3		12	1
1143	2018-11-16 05:28:11.67799+00	937	Iaer object (937)	3		12	1
1144	2018-11-16 05:28:11.688483+00	852	Iaer object (852)	3		12	1
1145	2018-11-16 05:28:11.696117+00	936	Iaer object (936)	3		12	1
1146	2018-11-16 05:28:11.703603+00	851	Iaer object (851)	3		12	1
1147	2018-11-16 05:28:11.713082+00	935	Iaer object (935)	3		12	1
1148	2018-11-16 05:28:11.721028+00	850	Iaer object (850)	3		12	1
1149	2018-11-16 05:28:11.732109+00	934	Iaer object (934)	3		12	1
1150	2018-11-16 05:28:11.741805+00	849	Iaer object (849)	3		12	1
1151	2018-11-16 05:28:11.753668+00	933	Iaer object (933)	3		12	1
1152	2018-11-16 05:28:11.765518+00	848	Iaer object (848)	3		12	1
1153	2018-11-16 05:28:11.772988+00	932	Iaer object (932)	3		12	1
1154	2018-11-16 05:28:11.78079+00	847	Iaer object (847)	3		12	1
1155	2018-11-16 05:28:11.790615+00	931	Iaer object (931)	3		12	1
1156	2018-11-16 05:28:11.797863+00	846	Iaer object (846)	3		12	1
1157	2018-11-16 05:28:11.805575+00	930	Iaer object (930)	3		12	1
1158	2018-11-16 05:28:11.81667+00	845	Iaer object (845)	3		12	1
1159	2018-11-16 05:28:11.831132+00	929	Iaer object (929)	3		12	1
1160	2018-11-16 05:28:11.841679+00	844	Iaer object (844)	3		12	1
1161	2018-11-16 05:28:11.851698+00	928	Iaer object (928)	3		12	1
1162	2018-11-16 05:28:11.859562+00	843	Iaer object (843)	3		12	1
1163	2018-11-16 05:28:11.867449+00	927	Iaer object (927)	3		12	1
1164	2018-11-16 05:28:11.878012+00	842	Iaer object (842)	3		12	1
1165	2018-11-16 05:28:11.887908+00	926	Iaer object (926)	3		12	1
1166	2018-11-16 05:28:11.897308+00	841	Iaer object (841)	3		12	1
1167	2018-11-16 05:28:11.905358+00	925	Iaer object (925)	3		12	1
1168	2018-11-16 05:28:11.913449+00	840	Iaer object (840)	3		12	1
1169	2018-11-16 05:28:11.923031+00	924	Iaer object (924)	3		12	1
1170	2018-11-16 05:28:11.931576+00	839	Iaer object (839)	3		12	1
1171	2018-11-16 05:28:11.940833+00	923	Iaer object (923)	3		12	1
1172	2018-11-16 05:28:11.948598+00	838	Iaer object (838)	3		12	1
1173	2018-11-16 05:28:11.958617+00	922	Iaer object (922)	3		12	1
1174	2018-11-16 05:28:11.968791+00	837	Iaer object (837)	3		12	1
1175	2018-11-16 05:28:11.982524+00	921	Iaer object (921)	3		12	1
1176	2018-11-16 05:28:11.994652+00	836	Iaer object (836)	3		12	1
1177	2018-11-16 05:28:12.004749+00	920	Iaer object (920)	3		12	1
1178	2018-11-16 05:28:12.014939+00	835	Iaer object (835)	3		12	1
1179	2018-11-16 05:28:12.022755+00	919	Iaer object (919)	3		12	1
1180	2018-11-16 05:28:12.031174+00	834	Iaer object (834)	3		12	1
1181	2018-11-16 05:28:12.040766+00	918	Iaer object (918)	3		12	1
1182	2018-11-16 05:28:12.063706+00	833	Iaer object (833)	3		12	1
1183	2018-11-16 05:28:12.0716+00	917	Iaer object (917)	3		12	1
1184	2018-11-16 05:28:12.079741+00	832	Iaer object (832)	3		12	1
1185	2018-11-16 05:28:12.08955+00	916	Iaer object (916)	3		12	1
1186	2018-11-16 05:28:12.101224+00	831	Iaer object (831)	3		12	1
1187	2018-11-16 05:28:12.111+00	915	Iaer object (915)	3		12	1
1188	2018-11-16 05:28:12.118749+00	830	Iaer object (830)	3		12	1
1189	2018-11-16 05:28:12.128903+00	914	Iaer object (914)	3		12	1
1190	2018-11-16 05:28:12.143394+00	829	Iaer object (829)	3		12	1
1191	2018-11-16 05:28:12.15575+00	913	Iaer object (913)	3		12	1
1192	2018-11-16 05:28:12.163325+00	828	Iaer object (828)	3		12	1
1193	2018-11-16 05:28:12.170663+00	912	Iaer object (912)	3		12	1
1194	2018-11-16 05:28:12.178576+00	827	Iaer object (827)	3		12	1
1195	2018-11-16 05:28:12.186677+00	911	Iaer object (911)	3		12	1
1196	2018-11-16 05:28:12.196097+00	826	Iaer object (826)	3		12	1
1197	2018-11-16 05:28:12.204253+00	910	Iaer object (910)	3		12	1
1198	2018-11-16 05:28:12.212166+00	825	Iaer object (825)	3		12	1
1199	2018-11-16 05:28:12.221752+00	909	Iaer object (909)	3		12	1
1200	2018-11-16 05:28:12.229375+00	824	Iaer object (824)	3		12	1
1201	2018-11-16 05:28:12.249088+00	908	Iaer object (908)	3		12	1
1202	2018-11-16 05:28:12.261925+00	823	Iaer object (823)	3		12	1
1203	2018-11-16 05:28:12.269903+00	907	Iaer object (907)	3		12	1
1204	2018-11-16 05:28:12.278367+00	822	Iaer object (822)	3		12	1
1205	2018-11-16 05:28:12.287686+00	906	Iaer object (906)	3		12	1
1206	2018-11-16 05:28:12.305443+00	821	Iaer object (821)	3		12	1
1207	2018-11-16 05:28:12.314966+00	905	Iaer object (905)	3		12	1
1208	2018-11-16 05:28:12.322804+00	820	Iaer object (820)	3		12	1
1209	2018-11-16 05:28:12.334595+00	904	Iaer object (904)	3		12	1
1210	2018-11-16 05:28:12.345205+00	819	Iaer object (819)	3		12	1
1211	2018-11-16 05:28:12.352158+00	903	Iaer object (903)	3		12	1
1212	2018-11-16 05:28:12.364845+00	818	Iaer object (818)	3		12	1
1213	2018-11-16 05:28:12.374654+00	902	Iaer object (902)	3		12	1
1214	2018-11-16 05:28:12.381625+00	817	Iaer object (817)	3		12	1
1215	2018-11-16 05:28:12.392515+00	901	Iaer object (901)	3		12	1
1216	2018-11-16 05:28:12.401369+00	816	Iaer object (816)	3		12	1
1217	2018-11-16 05:28:12.410918+00	900	Iaer object (900)	3		12	1
1218	2018-11-16 05:28:12.418701+00	815	Iaer object (815)	3		12	1
1219	2018-11-16 05:28:12.431989+00	899	Iaer object (899)	3		12	1
1220	2018-11-16 05:28:12.440005+00	814	Iaer object (814)	3		12	1
1221	2018-11-16 05:28:12.447383+00	898	Iaer object (898)	3		12	1
1222	2018-11-16 05:28:12.455049+00	813	Iaer object (813)	3		12	1
1223	2018-11-16 05:28:12.474806+00	897	Iaer object (897)	3		12	1
1224	2018-11-16 05:28:12.48238+00	812	Iaer object (812)	3		12	1
1225	2018-11-16 05:28:12.490975+00	896	Iaer object (896)	3		12	1
1226	2018-11-16 05:28:12.505246+00	811	Iaer object (811)	3		12	1
1227	2018-11-16 05:28:12.515598+00	895	Iaer object (895)	3		12	1
1228	2018-11-16 05:28:12.525917+00	810	Iaer object (810)	3		12	1
1229	2018-11-16 05:28:12.53357+00	894	Iaer object (894)	3		12	1
1230	2018-11-16 05:28:12.541549+00	809	Iaer object (809)	3		12	1
1231	2018-11-16 05:28:12.552003+00	893	Iaer object (893)	3		12	1
1232	2018-11-16 05:28:12.559755+00	808	Iaer object (808)	3		12	1
1233	2018-11-16 05:28:12.567425+00	892	Iaer object (892)	3		12	1
1234	2018-11-16 05:28:12.575329+00	807	Iaer object (807)	3		12	1
1235	2018-11-16 05:28:12.585791+00	891	Iaer object (891)	3		12	1
1236	2018-11-16 05:28:12.595796+00	806	Iaer object (806)	3		12	1
1237	2018-11-16 05:28:12.60338+00	890	Iaer object (890)	3		12	1
1238	2018-11-16 05:28:12.612142+00	805	Iaer object (805)	3		12	1
1239	2018-11-16 05:28:12.625503+00	889	Iaer object (889)	3		12	1
1240	2018-11-16 05:28:12.641695+00	804	Iaer object (804)	3		12	1
1241	2018-11-16 05:28:12.652367+00	888	Iaer object (888)	3		12	1
1242	2018-11-16 05:28:12.662702+00	803	Iaer object (803)	3		12	1
1243	2018-11-16 05:28:12.675748+00	887	Iaer object (887)	3		12	1
1244	2018-11-16 05:28:12.683758+00	802	Iaer object (802)	3		12	1
1245	2018-11-16 05:28:12.694719+00	886	Iaer object (886)	3		12	1
1246	2018-11-16 05:28:12.711177+00	801	Iaer object (801)	3		12	1
1247	2018-11-16 05:28:12.724081+00	885	Iaer object (885)	3		12	1
1248	2018-11-16 05:28:12.738604+00	800	Iaer object (800)	3		12	1
1249	2018-11-16 05:28:12.763605+00	884	Iaer object (884)	3		12	1
1250	2018-11-16 05:28:12.777618+00	799	Iaer object (799)	3		12	1
1251	2018-11-16 05:28:12.799771+00	883	Iaer object (883)	3		12	1
1252	2018-11-16 05:28:12.822111+00	798	Iaer object (798)	3		12	1
1253	2018-11-16 05:28:12.832751+00	882	Iaer object (882)	3		12	1
1254	2018-11-16 05:28:12.842955+00	797	Iaer object (797)	3		12	1
1255	2018-11-16 05:28:12.850628+00	881	Iaer object (881)	3		12	1
1256	2018-11-16 05:28:12.864604+00	796	Iaer object (796)	3		12	1
1257	2018-11-16 05:28:12.874388+00	880	Iaer object (880)	3		12	1
1258	2018-11-16 05:28:12.884655+00	795	Iaer object (795)	3		12	1
1259	2018-11-16 05:28:12.897934+00	879	Iaer object (879)	3		12	1
1260	2018-11-16 05:28:12.909044+00	794	Iaer object (794)	3		12	1
1261	2018-11-16 05:28:12.924946+00	793	Iaer object (793)	3		12	1
1262	2018-11-16 05:28:12.932821+00	792	Iaer object (792)	3		12	1
1263	2018-11-16 05:28:12.959399+00	791	Iaer object (791)	3		12	1
1264	2018-11-16 05:28:12.974352+00	790	Iaer object (790)	3		12	1
1265	2018-11-16 05:28:12.982512+00	789	Iaer object (789)	3		12	1
1266	2018-11-16 05:28:12.990968+00	788	Iaer object (788)	3		12	1
1267	2018-11-16 05:28:13.000551+00	787	Iaer object (787)	3		12	1
1268	2018-11-16 05:28:13.009549+00	786	Iaer object (786)	3		12	1
1269	2018-11-16 05:28:13.019247+00	785	Iaer object (785)	3		12	1
1270	2018-11-16 05:28:13.027174+00	784	Iaer object (784)	3		12	1
1271	2018-11-16 05:28:13.043681+00	783	Iaer object (783)	3		12	1
1272	2018-11-16 05:28:13.065595+00	782	Iaer object (782)	3		12	1
1273	2018-11-16 05:28:13.089757+00	781	Iaer object (781)	3		12	1
1274	2018-11-16 05:28:13.105191+00	780	Iaer object (780)	3		12	1
1275	2018-11-16 05:28:13.114794+00	779	Iaer object (779)	3		12	1
1276	2018-11-16 05:28:13.131177+00	778	Iaer object (778)	3		12	1
1277	2018-11-16 05:28:13.140214+00	777	Iaer object (777)	3		12	1
1278	2018-11-16 05:28:13.149784+00	776	Iaer object (776)	3		12	1
1279	2018-11-16 05:28:13.160379+00	775	Iaer object (775)	3		12	1
1280	2018-11-16 05:28:13.171892+00	774	Iaer object (774)	3		12	1
1281	2018-11-16 05:28:13.183257+00	773	Iaer object (773)	3		12	1
1282	2018-11-16 05:28:13.196794+00	772	Iaer object (772)	3		12	1
1283	2018-11-16 05:28:13.20735+00	771	Iaer object (771)	3		12	1
1284	2018-11-16 05:28:13.214934+00	770	Iaer object (770)	3		12	1
1285	2018-11-16 05:28:13.222863+00	769	Iaer object (769)	3		12	1
1286	2018-11-16 05:28:13.239771+00	768	Iaer object (768)	3		12	1
1287	2018-11-16 05:28:13.24979+00	767	Iaer object (767)	3		12	1
1288	2018-11-16 05:28:13.260134+00	766	Iaer object (766)	3		12	1
1289	2018-11-16 05:28:13.271053+00	765	Iaer object (765)	3		12	1
1290	2018-11-16 05:28:13.282065+00	764	Iaer object (764)	3		12	1
1291	2018-11-16 05:28:13.292705+00	763	Iaer object (763)	3		12	1
1292	2018-11-16 05:28:13.303362+00	762	Iaer object (762)	3		12	1
1293	2018-11-16 05:28:13.348216+00	761	Iaer object (761)	3		12	1
1294	2018-11-16 05:28:13.371221+00	760	Iaer object (760)	3		12	1
1295	2018-11-16 05:28:13.38522+00	759	Iaer object (759)	3		12	1
1296	2018-11-16 05:28:13.397034+00	758	Iaer object (758)	3		12	1
1297	2018-11-16 05:28:13.405317+00	757	Iaer object (757)	3		12	1
1298	2018-11-16 05:28:13.413092+00	756	Iaer object (756)	3		12	1
1299	2018-11-16 05:28:13.423754+00	755	Iaer object (755)	3		12	1
1300	2018-11-16 05:28:13.431409+00	754	Iaer object (754)	3		12	1
1301	2018-11-16 05:28:13.438863+00	753	Iaer object (753)	3		12	1
1302	2018-11-16 05:28:13.446356+00	752	Iaer object (752)	3		12	1
1303	2018-11-16 05:28:13.456087+00	751	Iaer object (751)	3		12	1
1304	2018-11-16 05:28:13.463724+00	750	Iaer object (750)	3		12	1
1305	2018-11-16 05:28:13.471612+00	749	Iaer object (749)	3		12	1
1306	2018-11-16 05:28:13.481833+00	748	Iaer object (748)	3		12	1
1307	2018-11-16 05:28:13.492605+00	747	Iaer object (747)	3		12	1
1308	2018-11-16 05:28:13.500439+00	746	Iaer object (746)	3		12	1
1309	2018-11-16 05:28:13.5106+00	745	Iaer object (745)	3		12	1
1310	2018-11-16 05:28:13.517891+00	744	Iaer object (744)	3		12	1
1311	2018-11-16 05:28:13.527125+00	743	Iaer object (743)	3		12	1
1312	2018-11-16 05:28:13.541435+00	742	Iaer object (742)	3		12	1
1313	2018-11-16 05:28:13.548929+00	741	Iaer object (741)	3		12	1
1314	2018-11-16 05:28:13.556581+00	740	Iaer object (740)	3		12	1
1315	2018-11-16 05:28:13.564048+00	739	Iaer object (739)	3		12	1
1316	2018-11-16 05:28:13.577258+00	738	Iaer object (738)	3		12	1
1317	2018-11-16 05:28:13.584522+00	737	Iaer object (737)	3		12	1
1318	2018-11-16 05:28:13.5925+00	736	Iaer object (736)	3		12	1
1319	2018-11-16 05:28:13.603111+00	735	Iaer object (735)	3		12	1
1320	2018-11-16 05:28:13.613014+00	734	Iaer object (734)	3		12	1
1321	2018-11-16 05:28:13.623351+00	733	Iaer object (733)	3		12	1
1322	2018-11-16 05:28:13.634619+00	732	Iaer object (732)	3		12	1
1323	2018-11-16 05:28:13.645002+00	731	Iaer object (731)	3		12	1
1324	2018-11-16 05:28:13.655637+00	730	Iaer object (730)	3		12	1
1325	2018-11-16 05:28:13.665905+00	729	Iaer object (729)	3		12	1
1326	2018-11-16 05:28:13.675941+00	728	Iaer object (728)	3		12	1
1327	2018-11-16 05:28:13.687245+00	727	Iaer object (727)	3		12	1
1328	2018-11-16 05:28:13.705121+00	726	Iaer object (726)	3		12	1
1329	2018-11-16 05:28:13.712817+00	725	Iaer object (725)	3		12	1
1330	2018-11-16 05:28:13.720206+00	724	Iaer object (724)	3		12	1
1331	2018-11-16 05:28:13.731104+00	723	Iaer object (723)	3		12	1
1332	2018-11-16 05:28:13.738561+00	722	Iaer object (722)	3		12	1
1333	2018-11-16 05:28:13.746898+00	721	Iaer object (721)	3		12	1
1334	2018-11-16 05:28:13.756629+00	720	Iaer object (720)	3		12	1
1335	2018-11-16 05:28:13.766394+00	719	Iaer object (719)	3		12	1
1336	2018-11-16 05:28:13.773855+00	718	Iaer object (718)	3		12	1
1337	2018-11-16 05:28:13.817609+00	717	Iaer object (717)	3		12	1
1338	2018-11-16 05:28:13.827242+00	716	Iaer object (716)	3		12	1
1339	2018-11-16 05:28:13.835734+00	715	Iaer object (715)	3		12	1
1340	2018-11-16 05:28:13.843771+00	714	Iaer object (714)	3		12	1
1341	2018-11-16 05:28:13.854109+00	713	Iaer object (713)	3		12	1
1342	2018-11-16 05:28:13.862015+00	712	Iaer object (712)	3		12	1
1343	2018-11-16 05:28:13.884001+00	711	Iaer object (711)	3		12	1
1344	2018-11-16 05:28:13.902701+00	710	Iaer object (710)	3		12	1
1345	2018-11-16 05:28:13.915694+00	709	Iaer object (709)	3		12	1
1346	2018-11-16 05:28:13.922937+00	708	Iaer object (708)	3		12	1
1347	2018-11-16 05:28:13.930613+00	707	Iaer object (707)	3		12	1
1348	2018-11-16 05:28:13.938457+00	706	Iaer object (706)	3		12	1
1349	2018-11-16 05:28:13.94782+00	705	Iaer object (705)	3		12	1
1350	2018-11-16 05:28:13.955105+00	704	Iaer object (704)	3		12	1
1351	2018-11-16 05:28:13.962995+00	703	Iaer object (703)	3		12	1
1352	2018-11-16 05:28:13.973392+00	702	Iaer object (702)	3		12	1
1353	2018-11-16 05:28:13.985727+00	701	Iaer object (701)	3		12	1
1354	2018-11-16 05:28:13.996673+00	700	Iaer object (700)	3		12	1
1355	2018-11-16 05:28:14.009095+00	699	Iaer object (699)	3		12	1
1356	2018-11-16 05:28:14.019163+00	698	Iaer object (698)	3		12	1
1357	2018-11-16 05:28:14.036876+00	697	Iaer object (697)	3		12	1
1358	2018-11-16 05:28:14.044084+00	696	Iaer object (696)	3		12	1
1359	2018-11-16 05:28:14.052604+00	695	Iaer object (695)	3		12	1
1360	2018-11-16 05:28:14.062944+00	694	Iaer object (694)	3		12	1
1361	2018-11-16 05:28:14.07098+00	693	Iaer object (693)	3		12	1
1362	2018-11-16 05:28:14.078899+00	692	Iaer object (692)	3		12	1
1363	2018-11-16 05:28:14.088405+00	691	Iaer object (691)	3		12	1
1364	2018-11-16 05:28:14.098854+00	690	Iaer object (690)	3		12	1
1365	2018-11-16 05:28:14.109151+00	689	Iaer object (689)	3		12	1
1366	2018-11-16 05:28:14.119513+00	688	Iaer object (688)	3		12	1
1367	2018-11-16 05:28:14.132722+00	687	Iaer object (687)	3		12	1
1368	2018-11-16 05:28:14.141107+00	686	Iaer object (686)	3		12	1
1369	2018-11-16 05:28:14.150964+00	685	Iaer object (685)	3		12	1
1370	2018-11-16 05:28:14.161224+00	684	Iaer object (684)	3		12	1
1371	2018-11-16 05:28:14.168631+00	683	Iaer object (683)	3		12	1
1372	2018-11-16 05:28:14.181279+00	682	Iaer object (682)	3		12	1
1373	2018-11-16 05:28:14.192133+00	681	Iaer object (681)	3		12	1
1374	2018-11-16 05:28:14.209057+00	680	Iaer object (680)	3		12	1
1375	2018-11-16 05:28:14.218959+00	679	Iaer object (679)	3		12	1
1376	2018-11-16 05:28:14.229547+00	678	Iaer object (678)	3		12	1
1377	2018-11-16 05:28:14.239423+00	677	Iaer object (677)	3		12	1
1378	2018-11-16 05:28:14.247455+00	676	Iaer object (676)	3		12	1
1379	2018-11-16 05:28:14.255233+00	675	Iaer object (675)	3		12	1
1380	2018-11-16 05:28:14.265209+00	674	Iaer object (674)	3		12	1
1381	2018-11-16 05:28:14.275184+00	673	Iaer object (673)	3		12	1
1382	2018-11-16 05:28:14.285537+00	672	Iaer object (672)	3		12	1
1383	2018-11-16 05:28:14.293362+00	671	Iaer object (671)	3		12	1
1384	2018-11-16 05:28:14.303801+00	670	Iaer object (670)	3		12	1
1385	2018-11-16 05:28:14.312547+00	669	Iaer object (669)	3		12	1
1386	2018-11-16 05:28:14.321329+00	668	Iaer object (668)	3		12	1
1387	2018-11-16 05:28:14.334902+00	667	Iaer object (667)	3		12	1
1388	2018-11-16 05:28:14.345156+00	666	Iaer object (666)	3		12	1
1389	2018-11-16 05:28:14.352745+00	665	Iaer object (665)	3		12	1
1390	2018-11-16 05:28:14.361404+00	664	Iaer object (664)	3		12	1
1391	2018-11-16 05:28:14.375889+00	663	Iaer object (663)	3		12	1
1392	2018-11-16 05:28:14.387724+00	662	Iaer object (662)	3		12	1
1393	2018-11-16 05:28:14.397745+00	661	Iaer object (661)	3		12	1
1394	2018-11-16 05:28:14.420305+00	660	Iaer object (660)	3		12	1
1395	2018-11-16 05:28:14.434352+00	659	Iaer object (659)	3		12	1
1396	2018-11-16 05:28:14.447078+00	658	Iaer object (658)	3		12	1
1397	2018-11-16 05:28:14.454888+00	657	Iaer object (657)	3		12	1
1398	2018-11-16 05:28:14.468747+00	656	Iaer object (656)	3		12	1
1399	2018-11-16 05:28:14.479384+00	655	Iaer object (655)	3		12	1
1400	2018-11-16 05:28:14.487029+00	654	Iaer object (654)	3		12	1
1401	2018-11-16 05:28:14.502136+00	653	Iaer object (653)	3		12	1
1402	2018-11-16 05:28:14.514473+00	652	Iaer object (652)	3		12	1
1403	2018-11-16 05:28:14.525233+00	651	Iaer object (651)	3		12	1
1404	2018-11-16 05:28:14.5405+00	650	Iaer object (650)	3		12	1
1405	2018-11-16 05:28:14.559057+00	649	Iaer object (649)	3		12	1
1406	2018-11-16 05:28:14.569302+00	648	Iaer object (648)	3		12	1
1407	2018-11-16 05:28:14.58047+00	647	Iaer object (647)	3		12	1
1408	2018-11-16 05:28:14.593862+00	646	Iaer object (646)	3		12	1
1409	2018-11-16 05:28:14.601441+00	645	Iaer object (645)	3		12	1
1410	2018-11-16 05:28:14.609921+00	644	Iaer object (644)	3		12	1
1411	2018-11-16 05:28:14.622514+00	643	Iaer object (643)	3		12	1
1412	2018-11-16 05:28:14.632928+00	642	Iaer object (642)	3		12	1
1413	2018-11-16 05:28:14.645269+00	641	Iaer object (641)	3		12	1
1414	2018-11-16 05:28:14.656871+00	640	Iaer object (640)	3		12	1
1415	2018-11-16 05:28:14.664848+00	639	Iaer object (639)	3		12	1
1416	2018-11-16 05:28:14.672974+00	638	Iaer object (638)	3		12	1
1417	2018-11-16 05:28:14.690105+00	637	Iaer object (637)	3		12	1
1418	2018-11-16 05:28:14.701522+00	636	Iaer object (636)	3		12	1
1419	2018-11-16 05:28:14.726151+00	635	Iaer object (635)	3		12	1
1420	2018-11-16 05:28:14.735699+00	634	Iaer object (634)	3		12	1
1421	2018-11-16 05:28:14.745114+00	633	Iaer object (633)	3		12	1
1422	2018-11-16 05:28:14.752931+00	632	Iaer object (632)	3		12	1
1423	2018-11-16 05:28:14.763627+00	631	Iaer object (631)	3		12	1
1424	2018-11-16 05:28:14.774728+00	630	Iaer object (630)	3		12	1
1425	2018-11-16 05:28:14.786423+00	629	Iaer object (629)	3		12	1
1426	2018-11-16 05:28:14.796927+00	628	Iaer object (628)	3		12	1
1427	2018-11-16 05:28:14.812901+00	627	Iaer object (627)	3		12	1
1428	2018-11-16 05:28:14.826426+00	626	Iaer object (626)	3		12	1
1429	2018-11-16 05:28:14.842824+00	625	Iaer object (625)	3		12	1
1430	2018-11-16 05:28:14.853682+00	624	Iaer object (624)	3		12	1
1431	2018-11-16 05:28:14.873724+00	623	Iaer object (623)	3		12	1
1432	2018-11-16 05:28:14.892381+00	622	Iaer object (622)	3		12	1
1433	2018-11-16 05:28:14.934812+00	621	Iaer object (621)	3		12	1
1434	2018-11-16 05:28:14.962473+00	620	Iaer object (620)	3		12	1
1435	2018-11-16 05:28:14.973635+00	619	Iaer object (619)	3		12	1
1436	2018-11-16 05:28:14.985669+00	618	Iaer object (618)	3		12	1
1437	2018-11-16 05:28:14.999038+00	617	Iaer object (617)	3		12	1
1438	2018-11-16 05:28:15.010988+00	616	Iaer object (616)	3		12	1
1439	2018-11-16 05:28:15.027245+00	615	Iaer object (615)	3		12	1
1440	2018-11-16 05:28:15.048837+00	614	Iaer object (614)	3		12	1
1441	2018-11-16 05:28:15.090924+00	613	Iaer object (613)	3		12	1
1442	2018-11-16 05:28:15.10559+00	612	Iaer object (612)	3		12	1
1443	2018-11-16 05:28:15.128145+00	611	Iaer object (611)	3		12	1
1444	2018-11-16 05:28:15.138063+00	610	Iaer object (610)	3		12	1
1445	2018-11-16 05:28:15.14735+00	609	Iaer object (609)	3		12	1
1446	2018-11-16 05:28:15.157529+00	608	Iaer object (608)	3		12	1
1447	2018-11-16 05:28:15.165104+00	607	Iaer object (607)	3		12	1
1448	2018-11-16 05:28:15.172581+00	606	Iaer object (606)	3		12	1
1449	2018-11-16 05:28:15.183288+00	605	Iaer object (605)	3		12	1
1450	2018-11-16 05:28:15.193671+00	604	Iaer object (604)	3		12	1
1451	2018-11-16 05:28:15.201489+00	603	Iaer object (603)	3		12	1
1452	2018-11-16 05:28:15.209355+00	602	Iaer object (602)	3		12	1
1453	2018-11-16 05:28:15.218722+00	601	Iaer object (601)	3		12	1
1454	2018-11-16 05:28:15.234876+00	600	Iaer object (600)	3		12	1
1455	2018-11-16 05:28:15.247514+00	599	Iaer object (599)	3		12	1
1456	2018-11-16 05:28:15.257893+00	598	Iaer object (598)	3		12	1
1457	2018-11-16 05:28:15.275222+00	597	Iaer object (597)	3		12	1
1458	2018-11-16 05:28:15.288906+00	596	Iaer object (596)	3		12	1
1459	2018-11-16 05:28:15.305641+00	595	Iaer object (595)	3		12	1
1460	2018-11-16 05:28:15.31589+00	594	Iaer object (594)	3		12	1
1461	2018-11-16 05:28:15.323603+00	593	Iaer object (593)	3		12	1
1462	2018-11-16 05:28:15.331649+00	592	Iaer object (592)	3		12	1
1463	2018-11-16 05:28:15.341559+00	591	Iaer object (591)	3		12	1
1464	2018-11-16 05:28:15.348841+00	590	Iaer object (590)	3		12	1
1465	2018-11-16 05:28:15.356045+00	589	Iaer object (589)	3		12	1
1466	2018-11-16 05:28:15.365062+00	588	Iaer object (588)	3		12	1
1467	2018-11-16 05:28:15.372381+00	587	Iaer object (587)	3		12	1
1468	2018-11-16 05:28:15.381849+00	586	Iaer object (586)	3		12	1
1469	2018-11-16 05:28:15.394615+00	585	Iaer object (585)	3		12	1
1470	2018-11-16 05:28:15.404191+00	584	Iaer object (584)	3		12	1
1471	2018-11-16 05:28:15.414445+00	583	Iaer object (583)	3		12	1
1472	2018-11-16 05:28:15.422808+00	582	Iaer object (582)	3		12	1
1473	2018-11-16 05:28:15.436379+00	581	Iaer object (581)	3		12	1
1474	2018-11-16 05:28:15.447831+00	580	Iaer object (580)	3		12	1
1475	2018-11-16 05:28:15.458113+00	579	Iaer object (579)	3		12	1
1476	2018-11-16 05:28:15.469327+00	578	Iaer object (578)	3		12	1
1477	2018-11-16 05:28:15.476984+00	577	Iaer object (577)	3		12	1
1478	2018-11-16 05:28:15.486833+00	576	Iaer object (576)	3		12	1
1479	2018-11-16 05:28:15.501404+00	575	Iaer object (575)	3		12	1
1480	2018-11-16 05:28:15.511688+00	574	Iaer object (574)	3		12	1
1481	2018-11-16 05:28:15.524042+00	573	Iaer object (573)	3		12	1
1482	2018-11-16 05:28:15.531349+00	572	Iaer object (572)	3		12	1
1483	2018-11-16 05:28:15.539238+00	571	Iaer object (571)	3		12	1
1484	2018-11-16 05:28:15.551819+00	570	Iaer object (570)	3		12	1
1485	2018-11-16 05:28:15.564437+00	569	Iaer object (569)	3		12	1
1486	2018-11-16 05:28:15.571657+00	568	Iaer object (568)	3		12	1
1487	2018-11-16 05:28:15.584754+00	567	Iaer object (567)	3		12	1
1488	2018-11-16 05:28:15.603321+00	566	Iaer object (566)	3		12	1
1489	2018-11-16 05:28:15.615784+00	565	Iaer object (565)	3		12	1
1490	2018-11-16 05:28:15.626754+00	564	Iaer object (564)	3		12	1
1491	2018-11-16 05:28:15.63685+00	563	Iaer object (563)	3		12	1
1492	2018-11-16 05:28:15.647235+00	562	Iaer object (562)	3		12	1
1493	2018-11-16 05:28:15.654634+00	561	Iaer object (561)	3		12	1
1494	2018-11-16 05:28:15.662174+00	560	Iaer object (560)	3		12	1
1495	2018-11-16 05:28:15.669998+00	559	Iaer object (559)	3		12	1
1496	2018-11-16 05:28:15.678056+00	558	Iaer object (558)	3		12	1
1497	2018-11-16 05:28:15.687425+00	557	Iaer object (557)	3		12	1
1498	2018-11-16 05:28:15.702157+00	556	Iaer object (556)	3		12	1
1499	2018-11-16 05:28:15.709916+00	555	Iaer object (555)	3		12	1
1500	2018-11-16 05:28:15.717461+00	554	Iaer object (554)	3		12	1
1501	2018-11-16 05:28:15.728791+00	553	Iaer object (553)	3		12	1
1502	2018-11-16 05:28:15.736505+00	552	Iaer object (552)	3		12	1
1503	2018-11-16 05:28:15.744271+00	551	Iaer object (551)	3		12	1
1504	2018-11-16 05:28:15.751392+00	550	Iaer object (550)	3		12	1
1505	2018-11-16 05:28:15.759021+00	549	Iaer object (549)	3		12	1
1506	2018-11-16 05:28:15.785914+00	548	Iaer object (548)	3		12	1
1507	2018-11-16 05:28:15.804827+00	547	Iaer object (547)	3		12	1
1508	2018-11-16 05:28:15.815634+00	546	Iaer object (546)	3		12	1
1509	2018-11-16 05:28:15.823313+00	545	Iaer object (545)	3		12	1
1510	2018-11-16 05:28:15.838833+00	544	Iaer object (544)	3		12	1
1511	2018-11-16 05:28:15.854552+00	543	Iaer object (543)	3		12	1
1512	2018-11-16 05:28:15.878921+00	542	Iaer object (542)	3		12	1
1513	2018-11-16 05:28:15.888693+00	541	Iaer object (541)	3		12	1
1514	2018-11-16 05:28:15.907416+00	540	Iaer object (540)	3		12	1
1515	2018-11-16 05:28:15.933104+00	539	Iaer object (539)	3		12	1
1516	2018-11-16 05:28:15.948429+00	538	Iaer object (538)	3		12	1
1517	2018-11-16 05:28:15.965223+00	537	Iaer object (537)	3		12	1
1518	2018-11-16 05:28:15.980135+00	536	Iaer object (536)	3		12	1
1519	2018-11-16 05:28:15.990153+00	535	Iaer object (535)	3		12	1
1520	2018-11-16 05:28:16.00092+00	534	Iaer object (534)	3		12	1
1521	2018-11-16 05:28:16.013009+00	533	Iaer object (533)	3		12	1
1522	2018-11-16 05:28:16.036307+00	532	Iaer object (532)	3		12	1
1523	2018-11-16 05:28:16.066416+00	531	Iaer object (531)	3		12	1
1524	2018-11-16 05:28:16.086572+00	530	Iaer object (530)	3		12	1
1525	2018-11-16 05:28:16.101269+00	529	Iaer object (529)	3		12	1
1526	2018-11-16 05:28:16.11964+00	528	Iaer object (528)	3		12	1
1527	2018-11-16 05:28:16.132544+00	527	Iaer object (527)	3		12	1
1528	2018-11-16 05:28:16.152879+00	526	Iaer object (526)	3		12	1
1529	2018-11-16 05:28:16.180142+00	525	Iaer object (525)	3		12	1
1530	2018-11-16 05:28:16.193962+00	524	Iaer object (524)	3		12	1
1531	2018-11-16 05:28:16.215197+00	523	Iaer object (523)	3		12	1
1532	2018-11-16 05:28:16.231051+00	522	Iaer object (522)	3		12	1
1533	2018-11-16 05:28:16.255125+00	521	Iaer object (521)	3		12	1
1534	2018-11-16 05:28:16.285382+00	520	Iaer object (520)	3		12	1
1535	2018-11-16 05:28:16.296285+00	519	Iaer object (519)	3		12	1
1536	2018-11-16 05:28:16.316507+00	518	Iaer object (518)	3		12	1
1537	2018-11-16 05:28:16.333549+00	517	Iaer object (517)	3		12	1
1538	2018-11-16 05:28:16.37558+00	516	Iaer object (516)	3		12	1
1539	2018-11-16 05:28:16.408639+00	515	Iaer object (515)	3		12	1
1540	2018-11-16 05:28:16.419029+00	514	Iaer object (514)	3		12	1
1541	2018-11-16 05:28:16.431957+00	513	Iaer object (513)	3		12	1
1542	2018-11-16 05:28:16.444609+00	512	Iaer object (512)	3		12	1
1543	2018-11-16 05:28:16.455544+00	511	Iaer object (511)	3		12	1
1544	2018-11-16 05:28:16.483632+00	510	Iaer object (510)	3		12	1
1545	2018-11-16 05:28:16.496076+00	509	Iaer object (509)	3		12	1
1546	2018-11-16 05:28:16.506765+00	508	Iaer object (508)	3		12	1
1547	2018-11-16 05:28:16.516979+00	507	Iaer object (507)	3		12	1
1548	2018-11-16 05:28:16.529574+00	506	Iaer object (506)	3		12	1
1549	2018-11-16 05:28:16.537718+00	505	Iaer object (505)	3		12	1
1550	2018-11-16 05:28:16.548786+00	504	Iaer object (504)	3		12	1
1551	2018-11-16 05:28:16.565504+00	503	Iaer object (503)	3		12	1
1552	2018-11-16 05:28:16.576459+00	502	Iaer object (502)	3		12	1
1553	2018-11-16 05:28:16.588239+00	501	Iaer object (501)	3		12	1
1554	2018-11-16 05:28:16.604815+00	500	Iaer object (500)	3		12	1
1555	2018-11-16 05:28:16.615949+00	499	Iaer object (499)	3		12	1
1556	2018-11-16 05:28:16.630238+00	498	Iaer object (498)	3		12	1
1557	2018-11-16 05:28:16.642428+00	497	Iaer object (497)	3		12	1
1558	2018-11-16 05:28:16.652468+00	496	Iaer object (496)	3		12	1
1559	2018-11-16 05:28:16.664207+00	495	Iaer object (495)	3		12	1
1560	2018-11-16 05:28:16.674378+00	494	Iaer object (494)	3		12	1
1561	2018-11-16 05:28:16.685377+00	493	Iaer object (493)	3		12	1
1562	2018-11-16 05:28:16.696081+00	492	Iaer object (492)	3		12	1
1563	2018-11-16 05:28:16.707314+00	491	Iaer object (491)	3		12	1
1564	2018-11-16 05:28:16.719015+00	490	Iaer object (490)	3		12	1
1565	2018-11-16 05:28:16.729336+00	489	Iaer object (489)	3		12	1
1566	2018-11-16 05:28:16.73975+00	488	Iaer object (488)	3		12	1
1567	2018-11-16 05:28:16.760412+00	487	Iaer object (487)	3		12	1
1568	2018-11-16 05:28:16.783085+00	486	Iaer object (486)	3		12	1
1569	2018-11-16 05:28:16.796075+00	485	Iaer object (485)	3		12	1
1570	2018-11-16 05:28:16.815141+00	484	Iaer object (484)	3		12	1
1571	2018-11-16 05:28:16.826505+00	483	Iaer object (483)	3		12	1
1572	2018-11-16 05:28:16.838784+00	482	Iaer object (482)	3		12	1
1573	2018-11-16 05:28:16.855777+00	481	Iaer object (481)	3		12	1
1574	2018-11-16 05:28:16.869226+00	480	Iaer object (480)	3		12	1
1575	2018-11-16 05:28:16.880444+00	479	Iaer object (479)	3		12	1
1576	2018-11-16 05:28:16.889165+00	478	Iaer object (478)	3		12	1
1577	2018-11-16 05:28:16.898094+00	477	Iaer object (477)	3		12	1
1578	2018-11-16 05:28:16.91182+00	476	Iaer object (476)	3		12	1
1579	2018-11-16 05:28:16.919234+00	475	Iaer object (475)	3		12	1
1580	2018-11-16 05:28:16.926901+00	474	Iaer object (474)	3		12	1
1581	2018-11-16 05:28:16.935085+00	473	Iaer object (473)	3		12	1
1582	2018-11-16 05:28:16.942521+00	472	Iaer object (472)	3		12	1
1583	2018-11-16 05:28:16.951944+00	471	Iaer object (471)	3		12	1
1584	2018-11-16 05:28:16.959486+00	470	Iaer object (470)	3		12	1
1585	2018-11-16 05:28:16.967823+00	469	Iaer object (469)	3		12	1
1586	2018-11-16 05:28:16.977504+00	468	Iaer object (468)	3		12	1
1587	2018-11-16 05:28:16.985222+00	467	Iaer object (467)	3		12	1
1588	2018-11-16 05:28:17.004303+00	466	Iaer object (466)	3		12	1
1589	2018-11-16 05:28:17.014544+00	465	Iaer object (465)	3		12	1
1590	2018-11-16 05:28:17.025888+00	464	Iaer object (464)	3		12	1
1591	2018-11-16 05:28:17.041622+00	463	Iaer object (463)	3		12	1
1592	2018-11-16 05:28:17.048751+00	462	Iaer object (462)	3		12	1
1593	2018-11-16 05:28:17.056974+00	461	Iaer object (461)	3		12	1
1594	2018-11-16 05:28:17.067976+00	460	Iaer object (460)	3		12	1
1595	2018-11-16 05:28:17.077645+00	459	Iaer object (459)	3		12	1
1596	2018-11-16 05:28:17.085298+00	458	Iaer object (458)	3		12	1
1597	2018-11-16 05:28:17.093436+00	457	Iaer object (457)	3		12	1
1598	2018-11-16 05:28:17.105927+00	456	Iaer object (456)	3		12	1
1599	2018-11-16 05:28:17.115448+00	455	Iaer object (455)	3		12	1
1600	2018-11-16 05:28:17.127526+00	454	Iaer object (454)	3		12	1
1601	2018-11-16 05:28:17.134981+00	453	Iaer object (453)	3		12	1
1602	2018-11-16 05:28:17.144336+00	452	Iaer object (452)	3		12	1
1603	2018-11-16 05:28:17.164329+00	451	Iaer object (451)	3		12	1
1604	2018-11-16 05:28:17.177221+00	450	Iaer object (450)	3		12	1
1605	2018-11-16 05:28:17.19308+00	449	Iaer object (449)	3		12	1
1606	2018-11-16 05:28:17.209507+00	448	Iaer object (448)	3		12	1
1607	2018-11-16 05:28:17.223578+00	447	Iaer object (447)	3		12	1
1608	2018-11-16 05:28:17.24018+00	446	Iaer object (446)	3		12	1
1609	2018-11-16 05:28:17.24856+00	445	Iaer object (445)	3		12	1
1610	2018-11-16 05:28:17.268718+00	444	Iaer object (444)	3		12	1
1611	2018-11-16 05:28:17.291919+00	443	Iaer object (443)	3		12	1
1612	2018-11-16 05:28:17.304138+00	442	Iaer object (442)	3		12	1
1613	2018-11-16 05:28:17.317443+00	441	Iaer object (441)	3		12	1
1614	2018-11-16 05:28:17.339684+00	440	Iaer object (440)	3		12	1
1615	2018-11-16 05:28:17.356869+00	439	Iaer object (439)	3		12	1
1616	2018-11-16 05:28:17.374521+00	438	Iaer object (438)	3		12	1
1617	2018-11-16 05:28:17.387306+00	437	Iaer object (437)	3		12	1
1618	2018-11-16 05:28:17.409427+00	436	Iaer object (436)	3		12	1
1619	2018-11-16 05:28:17.42947+00	435	Iaer object (435)	3		12	1
1620	2018-11-16 05:28:17.449886+00	434	Iaer object (434)	3		12	1
1621	2018-11-16 05:28:17.459953+00	433	Iaer object (433)	3		12	1
1622	2018-11-16 05:28:17.467842+00	432	Iaer object (432)	3		12	1
1623	2018-11-16 05:28:17.492997+00	431	Iaer object (431)	3		12	1
1624	2018-11-16 05:28:17.509504+00	430	Iaer object (430)	3		12	1
1625	2018-11-16 05:28:17.528987+00	429	Iaer object (429)	3		12	1
1626	2018-11-16 05:28:17.536571+00	428	Iaer object (428)	3		12	1
1627	2018-11-16 05:28:17.54415+00	427	Iaer object (427)	3		12	1
1628	2018-11-16 05:28:17.568485+00	426	Iaer object (426)	3		12	1
1629	2018-11-16 05:28:17.582201+00	425	Iaer object (425)	3		12	1
1630	2018-11-16 05:28:17.59433+00	424	Iaer object (424)	3		12	1
1631	2018-11-16 05:28:17.601613+00	423	Iaer object (423)	3		12	1
1632	2018-11-16 05:28:17.618347+00	422	Iaer object (422)	3		12	1
1633	2018-11-16 05:28:17.631858+00	421	Iaer object (421)	3		12	1
1634	2018-11-16 05:28:17.639605+00	420	Iaer object (420)	3		12	1
1635	2018-11-16 05:28:17.649239+00	419	Iaer object (419)	3		12	1
1636	2018-11-16 05:28:17.656631+00	418	Iaer object (418)	3		12	1
1637	2018-11-16 05:28:17.664429+00	417	Iaer object (417)	3		12	1
1638	2018-11-16 05:28:17.671687+00	416	Iaer object (416)	3		12	1
1639	2018-11-16 05:28:17.68468+00	415	Iaer object (415)	3		12	1
1640	2018-11-16 05:28:17.695196+00	414	Iaer object (414)	3		12	1
1641	2018-11-16 05:28:17.702635+00	413	Iaer object (413)	3		12	1
1642	2018-11-16 05:28:17.726824+00	412	Iaer object (412)	3		12	1
1643	2018-11-16 05:28:17.739058+00	411	Iaer object (411)	3		12	1
1644	2018-11-16 05:28:17.750548+00	410	Iaer object (410)	3		12	1
1645	2018-11-16 05:28:17.76381+00	409	Iaer object (409)	3		12	1
1646	2018-11-16 05:28:17.779277+00	408	Iaer object (408)	3		12	1
1647	2018-11-16 05:28:17.791725+00	407	Iaer object (407)	3		12	1
1648	2018-11-16 05:28:17.799702+00	406	Iaer object (406)	3		12	1
1649	2018-11-16 05:28:17.808829+00	405	Iaer object (405)	3		12	1
1650	2018-11-16 05:28:17.827533+00	404	Iaer object (404)	3		12	1
1651	2018-11-16 05:28:17.838148+00	403	Iaer object (403)	3		12	1
1652	2018-11-16 05:28:17.848271+00	402	Iaer object (402)	3		12	1
1653	2018-11-16 05:28:17.855561+00	401	Iaer object (401)	3		12	1
1654	2018-11-16 05:28:17.863522+00	400	Iaer object (400)	3		12	1
1655	2018-11-16 05:28:17.874368+00	399	Iaer object (399)	3		12	1
1656	2018-11-16 05:28:17.891343+00	398	Iaer object (398)	3		12	1
1657	2018-11-16 05:28:17.903479+00	397	Iaer object (397)	3		12	1
1658	2018-11-16 05:28:17.916074+00	396	Iaer object (396)	3		12	1
1659	2018-11-16 05:28:17.928228+00	395	Iaer object (395)	3		12	1
1660	2018-11-16 05:28:17.938019+00	394	Iaer object (394)	3		12	1
1661	2018-11-16 05:28:17.948876+00	393	Iaer object (393)	3		12	1
1662	2018-11-16 05:28:17.960202+00	392	Iaer object (392)	3		12	1
1663	2018-11-16 05:28:17.972323+00	391	Iaer object (391)	3		12	1
1664	2018-11-16 05:28:17.982692+00	390	Iaer object (390)	3		12	1
1665	2018-11-16 05:28:18.004589+00	389	Iaer object (389)	3		12	1
1666	2018-11-16 05:28:18.015425+00	388	Iaer object (388)	3		12	1
1667	2018-11-16 05:28:18.02916+00	387	Iaer object (387)	3		12	1
1668	2018-11-16 05:28:18.038951+00	386	Iaer object (386)	3		12	1
1669	2018-11-16 05:28:18.047538+00	385	Iaer object (385)	3		12	1
1670	2018-11-16 05:28:18.057583+00	384	Iaer object (384)	3		12	1
1671	2018-11-16 05:28:18.067748+00	383	Iaer object (383)	3		12	1
1672	2018-11-16 05:28:18.080601+00	382	Iaer object (382)	3		12	1
1673	2018-11-16 05:28:18.090747+00	381	Iaer object (381)	3		12	1
1674	2018-11-16 05:28:18.100616+00	380	Iaer object (380)	3		12	1
1675	2018-11-16 05:28:18.111016+00	379	Iaer object (379)	3		12	1
1676	2018-11-16 05:28:18.122915+00	378	Iaer object (378)	3		12	1
1677	2018-11-16 05:28:18.138747+00	377	Iaer object (377)	3		12	1
1678	2018-11-16 05:28:18.147577+00	376	Iaer object (376)	3		12	1
1679	2018-11-16 05:28:18.156588+00	375	Iaer object (375)	3		12	1
1680	2018-11-16 05:28:18.169469+00	374	Iaer object (374)	3		12	1
1681	2018-11-16 05:28:18.186507+00	373	Iaer object (373)	3		12	1
1682	2018-11-16 05:28:18.234991+00	372	Iaer object (372)	3		12	1
1683	2018-11-16 05:28:18.249349+00	371	Iaer object (371)	3		12	1
1684	2018-11-16 05:28:18.259986+00	370	Iaer object (370)	3		12	1
1685	2018-11-16 05:28:18.270054+00	369	Iaer object (369)	3		12	1
1686	2018-11-16 05:28:18.284584+00	368	Iaer object (368)	3		12	1
1687	2018-11-16 05:28:18.306664+00	367	Iaer object (367)	3		12	1
1688	2018-11-16 05:28:18.317927+00	366	Iaer object (366)	3		12	1
1689	2018-11-16 05:28:18.327812+00	365	Iaer object (365)	3		12	1
1690	2018-11-16 05:28:18.336205+00	364	Iaer object (364)	3		12	1
1691	2018-11-16 05:28:18.34459+00	363	Iaer object (363)	3		12	1
1692	2018-11-16 05:28:18.360941+00	362	Iaer object (362)	3		12	1
1693	2018-11-16 05:28:18.374404+00	361	Iaer object (361)	3		12	1
1694	2018-11-16 05:28:18.385168+00	360	Iaer object (360)	3		12	1
1695	2018-11-16 05:28:18.396636+00	359	Iaer object (359)	3		12	1
1696	2018-11-16 05:28:18.40747+00	358	Iaer object (358)	3		12	1
1697	2018-11-16 05:28:18.415412+00	357	Iaer object (357)	3		12	1
1698	2018-11-16 05:28:18.437244+00	356	Iaer object (356)	3		12	1
1699	2018-11-16 05:28:18.448528+00	355	Iaer object (355)	3		12	1
1700	2018-11-16 05:28:18.458259+00	354	Iaer object (354)	3		12	1
1701	2018-11-16 05:28:18.471223+00	353	Iaer object (353)	3		12	1
1702	2018-11-16 05:28:18.481651+00	352	Iaer object (352)	3		12	1
1703	2018-11-16 05:28:18.496452+00	351	Iaer object (351)	3		12	1
1704	2018-11-16 05:28:18.507998+00	350	Iaer object (350)	3		12	1
1705	2018-11-16 05:28:18.519455+00	349	Iaer object (349)	3		12	1
1706	2018-11-16 05:28:18.532512+00	348	Iaer object (348)	3		12	1
1707	2018-11-16 05:28:18.54808+00	347	Iaer object (347)	3		12	1
1708	2018-11-16 05:28:18.55842+00	346	Iaer object (346)	3		12	1
1709	2018-11-16 05:28:18.581204+00	345	Iaer object (345)	3		12	1
1710	2018-11-16 05:28:18.59216+00	344	Iaer object (344)	3		12	1
1711	2018-11-16 05:28:18.602967+00	343	Iaer object (343)	3		12	1
1712	2018-11-16 05:28:18.615426+00	342	Iaer object (342)	3		12	1
1713	2018-11-16 05:28:18.630254+00	341	Iaer object (341)	3		12	1
1714	2018-11-16 05:28:18.639636+00	340	Iaer object (340)	3		12	1
1715	2018-11-16 05:28:18.647667+00	339	Iaer object (339)	3		12	1
1716	2018-11-16 05:28:18.661236+00	338	Iaer object (338)	3		12	1
1717	2018-11-16 05:28:18.672211+00	337	Iaer object (337)	3		12	1
1718	2018-11-16 05:28:18.679788+00	336	Iaer object (336)	3		12	1
1719	2018-11-16 05:28:18.69704+00	335	Iaer object (335)	3		12	1
1720	2018-11-16 05:28:18.726714+00	334	Iaer object (334)	3		12	1
1721	2018-11-16 05:28:18.734831+00	333	Iaer object (333)	3		12	1
1722	2018-11-16 05:28:18.745451+00	332	Iaer object (332)	3		12	1
1723	2018-11-16 05:28:18.755422+00	331	Iaer object (331)	3		12	1
1724	2018-11-16 05:28:18.762576+00	330	Iaer object (330)	3		12	1
1725	2018-11-16 05:28:18.769813+00	329	Iaer object (329)	3		12	1
1726	2018-11-16 05:28:18.786044+00	328	Iaer object (328)	3		12	1
1727	2018-11-16 05:28:18.793744+00	327	Iaer object (327)	3		12	1
1728	2018-11-16 05:28:18.800806+00	326	Iaer object (326)	3		12	1
1729	2018-11-16 05:28:18.811505+00	325	Iaer object (325)	3		12	1
1730	2018-11-16 05:28:18.820081+00	324	Iaer object (324)	3		12	1
1731	2018-11-16 05:28:18.841296+00	323	Iaer object (323)	3		12	1
1732	2018-11-16 05:28:18.848562+00	322	Iaer object (322)	3		12	1
1733	2018-11-16 05:28:18.856183+00	321	Iaer object (321)	3		12	1
1734	2018-11-16 05:28:18.866901+00	320	Iaer object (320)	3		12	1
1735	2018-11-16 05:28:18.879538+00	319	Iaer object (319)	3		12	1
1736	2018-11-16 05:28:18.891812+00	318	Iaer object (318)	3		12	1
1737	2018-11-16 05:28:18.904752+00	317	Iaer object (317)	3		12	1
1738	2018-11-16 05:28:18.912145+00	316	Iaer object (316)	3		12	1
1739	2018-11-16 05:28:18.922434+00	315	Iaer object (315)	3		12	1
1740	2018-11-16 05:28:18.933593+00	314	Iaer object (314)	3		12	1
1741	2018-11-16 05:28:18.941049+00	313	Iaer object (313)	3		12	1
1742	2018-11-16 05:28:18.948441+00	312	Iaer object (312)	3		12	1
1743	2018-11-16 05:28:18.956297+00	311	Iaer object (311)	3		12	1
1744	2018-11-16 05:28:18.964032+00	310	Iaer object (310)	3		12	1
1745	2018-11-16 05:28:18.971421+00	309	Iaer object (309)	3		12	1
1746	2018-11-16 05:28:18.978828+00	308	Iaer object (308)	3		12	1
1747	2018-11-16 05:28:18.986135+00	307	Iaer object (307)	3		12	1
1748	2018-11-16 05:28:18.998422+00	306	Iaer object (306)	3		12	1
1749	2018-11-16 05:28:19.006385+00	305	Iaer object (305)	3		12	1
1750	2018-11-16 05:28:19.014004+00	304	Iaer object (304)	3		12	1
1751	2018-11-16 05:28:19.02496+00	303	Iaer object (303)	3		12	1
1752	2018-11-16 05:28:19.035344+00	302	Iaer object (302)	3		12	1
1753	2018-11-16 05:28:19.049772+00	301	Iaer object (301)	3		12	1
1754	2018-11-16 05:28:19.069615+00	300	Iaer object (300)	3		12	1
1755	2018-11-16 05:28:19.081127+00	299	Iaer object (299)	3		12	1
1756	2018-11-16 05:28:19.090572+00	298	Iaer object (298)	3		12	1
1757	2018-11-16 05:28:19.0979+00	297	Iaer object (297)	3		12	1
1758	2018-11-16 05:28:19.10517+00	296	Iaer object (296)	3		12	1
1759	2018-11-16 05:28:19.118009+00	295	Iaer object (295)	3		12	1
1760	2018-11-16 05:28:19.12799+00	294	Iaer object (294)	3		12	1
1761	2018-11-16 05:28:19.13569+00	293	Iaer object (293)	3		12	1
1762	2018-11-16 05:28:19.14947+00	292	Iaer object (292)	3		12	1
1763	2018-11-16 05:28:19.159922+00	291	Iaer object (291)	3		12	1
1764	2018-11-16 05:28:19.167126+00	290	Iaer object (290)	3		12	1
1765	2018-11-16 05:28:19.181913+00	289	Iaer object (289)	3		12	1
1766	2018-11-16 05:28:19.189845+00	288	Iaer object (288)	3		12	1
1767	2018-11-16 05:28:19.197143+00	287	Iaer object (287)	3		12	1
1768	2018-11-16 05:28:19.212304+00	286	Iaer object (286)	3		12	1
1769	2018-11-16 05:28:19.225913+00	285	Iaer object (285)	3		12	1
1770	2018-11-16 05:28:19.236978+00	284	Iaer object (284)	3		12	1
1771	2018-11-16 05:28:19.24435+00	283	Iaer object (283)	3		12	1
1772	2018-11-16 05:28:19.251537+00	282	Iaer object (282)	3		12	1
1773	2018-11-16 05:28:19.259226+00	281	Iaer object (281)	3		12	1
1774	2018-11-16 05:28:19.267725+00	280	Iaer object (280)	3		12	1
1775	2018-11-16 05:28:19.279362+00	279	Iaer object (279)	3		12	1
1776	2018-11-16 05:28:19.286656+00	278	Iaer object (278)	3		12	1
1777	2018-11-16 05:28:19.295499+00	277	Iaer object (277)	3		12	1
1778	2018-11-16 05:28:19.305483+00	276	Iaer object (276)	3		12	1
1779	2018-11-16 05:28:19.312875+00	275	Iaer object (275)	3		12	1
1780	2018-11-16 05:28:19.320099+00	274	Iaer object (274)	3		12	1
1781	2018-11-16 05:28:19.33134+00	273	Iaer object (273)	3		12	1
1782	2018-11-16 05:28:19.346702+00	272	Iaer object (272)	3		12	1
1783	2018-11-16 05:28:19.355163+00	271	Iaer object (271)	3		12	1
1784	2018-11-16 05:28:19.364044+00	270	Iaer object (270)	3		12	1
1785	2018-11-16 05:28:19.372112+00	269	Iaer object (269)	3		12	1
1786	2018-11-16 05:28:19.3905+00	268	Iaer object (268)	3		12	1
1787	2018-11-16 05:28:19.397537+00	267	Iaer object (267)	3		12	1
1788	2018-11-16 05:28:19.413437+00	266	Iaer object (266)	3		12	1
1789	2018-11-16 05:28:19.42894+00	265	Iaer object (265)	3		12	1
1790	2018-11-16 05:28:19.439422+00	264	Iaer object (264)	3		12	1
1791	2018-11-16 05:28:19.446666+00	263	Iaer object (263)	3		12	1
1792	2018-11-16 05:28:19.455482+00	262	Iaer object (262)	3		12	1
1793	2018-11-16 05:28:19.464702+00	261	Iaer object (261)	3		12	1
1794	2018-11-16 05:28:19.472+00	260	Iaer object (260)	3		12	1
1795	2018-11-16 05:28:19.479536+00	259	Iaer object (259)	3		12	1
1796	2018-11-16 05:28:19.487382+00	258	Iaer object (258)	3		12	1
1797	2018-11-16 05:28:19.494663+00	257	Iaer object (257)	3		12	1
1798	2018-11-16 05:28:19.502117+00	256	Iaer object (256)	3		12	1
1799	2018-11-16 05:28:19.510231+00	255	Iaer object (255)	3		12	1
1800	2018-11-16 05:28:19.521015+00	254	Iaer object (254)	3		12	1
1801	2018-11-16 05:28:19.536092+00	253	Iaer object (253)	3		12	1
1802	2018-11-16 05:28:19.546789+00	252	Iaer object (252)	3		12	1
1803	2018-11-16 05:28:19.568723+00	251	Iaer object (251)	3		12	1
1804	2018-11-16 05:28:19.591293+00	250	Iaer object (250)	3		12	1
1805	2018-11-16 05:28:19.608124+00	249	Iaer object (249)	3		12	1
1806	2018-11-16 05:28:19.625947+00	248	Iaer object (248)	3		12	1
1807	2018-11-16 05:28:19.642293+00	247	Iaer object (247)	3		12	1
1808	2018-11-16 05:28:19.653671+00	246	Iaer object (246)	3		12	1
1809	2018-11-16 05:28:19.664851+00	245	Iaer object (245)	3		12	1
1810	2018-11-16 05:28:19.675834+00	244	Iaer object (244)	3		12	1
1811	2018-11-16 05:28:19.68925+00	243	Iaer object (243)	3		12	1
1812	2018-11-16 05:28:19.700605+00	242	Iaer object (242)	3		12	1
1813	2018-11-16 05:28:19.71156+00	241	Iaer object (241)	3		12	1
1814	2018-11-16 05:28:19.722178+00	240	Iaer object (240)	3		12	1
1815	2018-11-16 05:28:19.746647+00	239	Iaer object (239)	3		12	1
1816	2018-11-16 05:28:19.757096+00	238	Iaer object (238)	3		12	1
1817	2018-11-16 05:28:19.79787+00	237	Iaer object (237)	3		12	1
1818	2018-11-16 05:28:19.840152+00	236	Iaer object (236)	3		12	1
1819	2018-11-16 05:28:19.860928+00	235	Iaer object (235)	3		12	1
1820	2018-11-16 05:28:19.871565+00	234	Iaer object (234)	3		12	1
1821	2018-11-16 05:28:19.895955+00	233	Iaer object (233)	3		12	1
1822	2018-11-16 05:28:19.931874+00	232	Iaer object (232)	3		12	1
1823	2018-11-16 05:28:19.945+00	231	Iaer object (231)	3		12	1
1824	2018-11-16 05:28:19.955619+00	230	Iaer object (230)	3		12	1
1825	2018-11-16 05:28:19.982241+00	229	Iaer object (229)	3		12	1
1826	2018-11-16 05:28:20.004859+00	228	Iaer object (228)	3		12	1
1827	2018-11-16 05:28:20.018223+00	227	Iaer object (227)	3		12	1
1828	2018-11-16 05:28:20.031234+00	226	Iaer object (226)	3		12	1
1829	2018-11-16 05:28:20.050322+00	225	Iaer object (225)	3		12	1
1830	2018-11-16 05:28:20.064962+00	224	Iaer object (224)	3		12	1
1831	2018-11-16 05:28:20.074514+00	223	Iaer object (223)	3		12	1
1832	2018-11-16 05:28:20.090948+00	222	Iaer object (222)	3		12	1
1833	2018-11-16 05:28:20.105152+00	221	Iaer object (221)	3		12	1
1834	2018-11-16 05:28:20.119277+00	220	Iaer object (220)	3		12	1
1835	2018-11-16 05:28:20.128908+00	219	Iaer object (219)	3		12	1
1836	2018-11-16 05:28:20.175656+00	218	Iaer object (218)	3		12	1
1837	2018-11-16 05:28:20.196038+00	217	Iaer object (217)	3		12	1
1838	2018-11-16 05:28:20.214904+00	216	Iaer object (216)	3		12	1
1839	2018-11-16 05:28:20.226868+00	215	Iaer object (215)	3		12	1
1840	2018-11-16 05:28:20.245331+00	214	Iaer object (214)	3		12	1
1841	2018-11-16 05:28:20.257941+00	213	Iaer object (213)	3		12	1
1842	2018-11-16 05:28:20.281915+00	212	Iaer object (212)	3		12	1
1843	2018-11-16 05:28:20.297741+00	211	Iaer object (211)	3		12	1
1844	2018-11-16 05:28:20.312828+00	210	Iaer object (210)	3		12	1
1845	2018-11-16 05:28:20.36819+00	209	Iaer object (209)	3		12	1
1846	2018-11-16 05:28:20.390654+00	208	Iaer object (208)	3		12	1
1847	2018-11-16 05:28:20.434435+00	207	Iaer object (207)	3		12	1
1848	2018-11-16 05:28:20.446785+00	206	Iaer object (206)	3		12	1
1849	2018-11-16 05:28:20.461468+00	205	Iaer object (205)	3		12	1
1850	2018-11-16 05:28:20.495157+00	204	Iaer object (204)	3		12	1
1851	2018-11-16 05:28:20.512219+00	203	Iaer object (203)	3		12	1
1852	2018-11-16 05:28:20.527874+00	202	Iaer object (202)	3		12	1
1853	2018-11-16 05:28:20.542126+00	201	Iaer object (201)	3		12	1
1854	2018-11-16 05:28:20.562109+00	200	Iaer object (200)	3		12	1
1855	2018-11-16 05:28:20.576524+00	199	Iaer object (199)	3		12	1
1856	2018-11-16 05:28:20.586789+00	198	Iaer object (198)	3		12	1
1857	2018-11-16 05:28:20.595037+00	197	Iaer object (197)	3		12	1
1858	2018-11-16 05:28:20.609422+00	196	Iaer object (196)	3		12	1
1859	2018-11-16 05:28:20.617368+00	195	Iaer object (195)	3		12	1
1860	2018-11-16 05:28:20.632606+00	194	Iaer object (194)	3		12	1
1861	2018-11-16 05:28:20.655471+00	193	Iaer object (193)	3		12	1
1862	2018-11-16 05:28:20.666802+00	192	Iaer object (192)	3		12	1
1863	2018-11-16 05:28:20.681433+00	191	Iaer object (191)	3		12	1
1864	2018-11-16 05:28:20.702655+00	190	Iaer object (190)	3		12	1
1865	2018-11-16 05:28:20.712216+00	189	Iaer object (189)	3		12	1
1866	2018-11-16 05:28:20.724891+00	188	Iaer object (188)	3		12	1
1867	2018-11-16 05:28:20.75537+00	187	Iaer object (187)	3		12	1
1868	2018-11-16 05:28:20.767692+00	186	Iaer object (186)	3		12	1
1869	2018-11-16 05:28:20.775541+00	185	Iaer object (185)	3		12	1
1870	2018-11-16 05:28:20.783483+00	184	Iaer object (184)	3		12	1
1871	2018-11-16 05:28:20.80346+00	183	Iaer object (183)	3		12	1
1872	2018-11-16 05:28:20.815233+00	182	Iaer object (182)	3		12	1
1873	2018-11-16 05:28:20.825897+00	181	Iaer object (181)	3		12	1
1874	2018-11-16 05:28:20.835657+00	180	Iaer object (180)	3		12	1
1875	2018-11-16 05:28:20.843679+00	179	Iaer object (179)	3		12	1
1876	2018-11-16 05:28:20.863591+00	178	Iaer object (178)	3		12	1
1877	2018-11-16 05:28:20.876456+00	177	Iaer object (177)	3		12	1
1878	2018-11-16 05:28:20.886366+00	176	Iaer object (176)	3		12	1
1879	2018-11-16 05:28:20.89364+00	175	Iaer object (175)	3		12	1
1880	2018-11-16 05:28:20.905201+00	174	Iaer object (174)	3		12	1
1881	2018-11-16 05:28:20.914475+00	173	Iaer object (173)	3		12	1
1882	2018-11-16 05:28:20.938417+00	172	Iaer object (172)	3		12	1
1883	2018-11-16 05:28:20.955267+00	171	Iaer object (171)	3		12	1
1884	2018-11-16 05:28:20.995856+00	170	Iaer object (170)	3		12	1
1885	2018-11-16 05:28:21.007025+00	169	Iaer object (169)	3		12	1
1886	2018-11-16 05:28:21.017693+00	168	Iaer object (168)	3		12	1
1887	2018-11-16 05:28:21.043838+00	167	Iaer object (167)	3		12	1
1888	2018-11-16 05:28:21.056419+00	166	Iaer object (166)	3		12	1
1889	2018-11-16 05:28:21.066586+00	165	Iaer object (165)	3		12	1
1890	2018-11-16 05:28:21.080652+00	164	Iaer object (164)	3		12	1
1891	2018-11-16 05:28:21.101197+00	163	Iaer object (163)	3		12	1
1892	2018-11-16 05:28:21.111389+00	162	Iaer object (162)	3		12	1
1893	2018-11-16 05:28:21.121695+00	161	Iaer object (161)	3		12	1
1894	2018-11-16 05:28:21.131885+00	160	Iaer object (160)	3		12	1
1895	2018-11-16 05:28:21.142406+00	159	Iaer object (159)	3		12	1
1896	2018-11-16 05:28:21.15091+00	158	Iaer object (158)	3		12	1
1897	2018-11-16 05:28:21.164906+00	157	Iaer object (157)	3		12	1
1898	2018-11-16 05:28:21.176612+00	156	Iaer object (156)	3		12	1
1899	2018-11-16 05:28:21.190326+00	155	Iaer object (155)	3		12	1
1900	2018-11-16 05:28:21.201356+00	154	Iaer object (154)	3		12	1
1901	2018-11-16 05:28:21.211527+00	153	Iaer object (153)	3		12	1
1902	2018-11-16 05:28:21.22184+00	152	Iaer object (152)	3		12	1
1903	2018-11-16 05:28:21.237251+00	151	Iaer object (151)	3		12	1
1904	2018-11-16 05:28:21.249508+00	150	Iaer object (150)	3		12	1
1905	2018-11-16 05:28:21.259827+00	149	Iaer object (149)	3		12	1
1906	2018-11-16 05:28:21.270077+00	148	Iaer object (148)	3		12	1
1907	2018-11-16 05:28:21.284073+00	147	Iaer object (147)	3		12	1
1908	2018-11-16 05:28:21.294687+00	146	Iaer object (146)	3		12	1
1909	2018-11-16 05:28:21.306196+00	145	Iaer object (145)	3		12	1
1910	2018-11-16 05:28:21.315828+00	144	Iaer object (144)	3		12	1
1911	2018-11-16 05:28:21.32342+00	143	Iaer object (143)	3		12	1
1912	2018-11-16 05:28:21.331449+00	142	Iaer object (142)	3		12	1
1913	2018-11-16 05:28:21.345134+00	141	Iaer object (141)	3		12	1
1914	2018-11-16 05:28:21.356597+00	140	Iaer object (140)	3		12	1
1915	2018-11-16 05:28:21.384119+00	139	Iaer object (139)	3		12	1
1916	2018-11-16 05:28:21.395943+00	138	Iaer object (138)	3		12	1
1917	2018-11-16 05:28:21.406048+00	137	Iaer object (137)	3		12	1
1918	2018-11-16 05:28:21.418358+00	136	Iaer object (136)	3		12	1
1919	2018-11-16 05:28:21.431144+00	135	Iaer object (135)	3		12	1
1920	2018-11-16 05:28:21.441626+00	134	Iaer object (134)	3		12	1
1921	2018-11-16 05:28:21.449528+00	133	Iaer object (133)	3		12	1
1922	2018-11-16 05:28:21.458496+00	132	Iaer object (132)	3		12	1
1923	2018-11-16 05:28:21.468274+00	131	Iaer object (131)	3		12	1
1924	2018-11-16 05:28:21.478077+00	130	Iaer object (130)	3		12	1
1925	2018-11-16 05:28:21.488822+00	129	Iaer object (129)	3		12	1
1926	2018-11-16 05:28:21.498349+00	128	Iaer object (128)	3		12	1
1927	2018-11-16 05:28:21.506131+00	127	Iaer object (127)	3		12	1
1928	2018-11-16 05:28:21.513503+00	126	Iaer object (126)	3		12	1
1929	2018-11-16 05:28:21.53164+00	125	Iaer object (125)	3		12	1
1930	2018-11-16 05:28:21.544604+00	124	Iaer object (124)	3		12	1
1931	2018-11-16 05:28:21.555661+00	123	Iaer object (123)	3		12	1
1932	2018-11-16 05:28:21.565611+00	122	Iaer object (122)	3		12	1
1933	2018-11-16 05:28:21.574586+00	121	Iaer object (121)	3		12	1
1934	2018-11-16 05:28:21.582933+00	120	Iaer object (120)	3		12	1
1935	2018-11-16 05:28:21.593086+00	119	Iaer object (119)	3		12	1
1936	2018-11-16 05:28:21.606985+00	118	Iaer object (118)	3		12	1
1937	2018-11-16 05:28:21.632182+00	117	Iaer object (117)	3		12	1
1938	2018-11-16 05:28:21.644479+00	116	Iaer object (116)	3		12	1
1939	2018-11-16 05:28:21.664332+00	115	Iaer object (115)	3		12	1
1940	2018-11-16 05:28:21.67517+00	114	Iaer object (114)	3		12	1
1941	2018-11-16 05:28:21.685215+00	113	Iaer object (113)	3		12	1
1942	2018-11-16 05:28:21.695061+00	112	Iaer object (112)	3		12	1
1943	2018-11-16 05:28:21.712288+00	111	Iaer object (111)	3		12	1
1944	2018-11-16 05:28:21.720102+00	110	Iaer object (110)	3		12	1
1945	2018-11-16 05:28:21.730825+00	109	Iaer object (109)	3		12	1
1946	2018-11-16 05:28:21.745129+00	108	Iaer object (108)	3		12	1
1947	2018-11-16 05:28:21.756583+00	107	Iaer object (107)	3		12	1
1948	2018-11-16 05:28:21.771802+00	106	Iaer object (106)	3		12	1
1949	2018-11-16 05:28:21.785642+00	105	Iaer object (105)	3		12	1
1950	2018-11-16 05:28:21.816482+00	104	Iaer object (104)	3		12	1
1951	2018-11-16 05:28:21.825554+00	103	Iaer object (103)	3		12	1
1952	2018-11-16 05:28:21.835832+00	102	Iaer object (102)	3		12	1
1953	2018-11-16 05:28:21.846153+00	101	Iaer object (101)	3		12	1
1954	2018-11-16 05:28:21.860857+00	100	Iaer object (100)	3		12	1
1955	2018-11-16 05:28:21.872018+00	99	Iaer object (99)	3		12	1
1956	2018-11-16 05:28:21.882406+00	98	Iaer object (98)	3		12	1
1957	2018-11-16 05:28:21.893468+00	97	Iaer object (97)	3		12	1
1958	2018-11-16 05:28:21.903632+00	96	Iaer object (96)	3		12	1
1959	2018-11-16 05:28:21.916528+00	95	Iaer object (95)	3		12	1
1960	2018-11-16 05:28:21.930451+00	94	Iaer object (94)	3		12	1
1961	2018-11-16 05:28:21.945072+00	93	Iaer object (93)	3		12	1
1962	2018-11-16 05:28:21.97049+00	92	Iaer object (92)	3		12	1
1963	2018-11-16 05:28:21.981019+00	91	Iaer object (91)	3		12	1
1964	2018-11-16 05:28:21.996789+00	90	Iaer object (90)	3		12	1
1965	2018-11-16 05:28:22.00906+00	89	Iaer object (89)	3		12	1
1966	2018-11-16 05:28:22.017692+00	88	Iaer object (88)	3		12	1
1967	2018-11-16 05:28:22.028943+00	87	Iaer object (87)	3		12	1
1968	2018-11-16 05:28:22.051861+00	86	Iaer object (86)	3		12	1
1969	2018-11-16 05:28:22.074596+00	85	Iaer object (85)	3		12	1
1970	2018-11-16 05:28:22.094081+00	84	Iaer object (84)	3		12	1
1971	2018-11-16 05:28:22.114057+00	83	Iaer object (83)	3		12	1
1972	2018-11-16 05:28:22.126772+00	82	Iaer object (82)	3		12	1
1973	2018-11-16 05:28:22.143617+00	81	Iaer object (81)	3		12	1
1974	2018-11-16 05:28:22.167377+00	80	Iaer object (80)	3		12	1
1975	2018-11-16 05:28:22.194421+00	79	Iaer object (79)	3		12	1
1976	2018-11-16 05:28:22.222282+00	78	Iaer object (78)	3		12	1
1977	2018-11-16 05:28:22.277823+00	77	Iaer object (77)	3		12	1
1978	2018-11-16 05:28:22.30657+00	76	Iaer object (76)	3		12	1
1979	2018-11-16 05:28:22.321248+00	75	Iaer object (75)	3		12	1
1980	2018-11-16 05:28:22.339953+00	74	Iaer object (74)	3		12	1
1981	2018-11-16 05:28:22.359768+00	73	Iaer object (73)	3		12	1
1982	2018-11-16 05:28:22.382592+00	72	Iaer object (72)	3		12	1
1983	2018-11-16 05:28:22.394118+00	71	Iaer object (71)	3		12	1
1984	2018-11-16 05:28:22.405943+00	70	Iaer object (70)	3		12	1
1985	2018-11-16 05:28:22.426517+00	69	Iaer object (69)	3		12	1
1986	2018-11-16 05:28:22.477196+00	68	Iaer object (68)	3		12	1
1987	2018-11-16 05:28:22.488868+00	67	Iaer object (67)	3		12	1
1988	2018-11-16 05:28:22.506415+00	66	Iaer object (66)	3		12	1
1989	2018-11-16 05:28:22.520737+00	65	Iaer object (65)	3		12	1
1990	2018-11-16 05:28:22.528514+00	64	Iaer object (64)	3		12	1
1991	2018-11-16 05:28:22.535625+00	63	Iaer object (63)	3		12	1
1992	2018-11-16 05:28:22.546211+00	62	Iaer object (62)	3		12	1
1993	2018-11-16 05:28:22.585584+00	61	Iaer object (61)	3		12	1
1994	2018-11-16 05:28:22.595644+00	60	Iaer object (60)	3		12	1
1995	2018-11-16 05:28:22.625933+00	59	Iaer object (59)	3		12	1
1996	2018-11-16 05:28:22.634238+00	58	Iaer object (58)	3		12	1
1997	2018-11-16 05:28:22.647918+00	57	Iaer object (57)	3		12	1
1998	2018-11-16 05:28:22.655495+00	56	Iaer object (56)	3		12	1
1999	2018-11-16 05:28:22.664853+00	55	Iaer object (55)	3		12	1
2000	2018-11-16 05:28:22.677468+00	54	Iaer object (54)	3		12	1
2001	2018-11-16 05:28:22.685473+00	53	Iaer object (53)	3		12	1
2002	2018-11-16 05:28:22.705743+00	52	Iaer object (52)	3		12	1
2003	2018-11-16 05:28:22.715685+00	51	Iaer object (51)	3		12	1
2004	2018-11-16 05:28:22.723013+00	50	Iaer object (50)	3		12	1
2005	2018-11-16 05:28:22.732362+00	49	Iaer object (49)	3		12	1
2006	2018-11-16 05:28:22.748447+00	48	Iaer object (48)	3		12	1
2007	2018-11-16 05:28:22.762705+00	47	Iaer object (47)	3		12	1
2008	2018-11-16 05:28:22.777305+00	46	Iaer object (46)	3		12	1
2009	2018-11-16 05:28:22.787235+00	45	Iaer object (45)	3		12	1
2010	2018-11-16 05:28:22.797674+00	44	Iaer object (44)	3		12	1
2011	2018-11-16 05:28:22.805212+00	43	Iaer object (43)	3		12	1
2012	2018-11-16 05:28:22.816237+00	42	Iaer object (42)	3		12	1
2013	2018-11-16 05:28:22.823842+00	41	Iaer object (41)	3		12	1
2014	2018-11-16 05:28:22.833539+00	40	Iaer object (40)	3		12	1
2015	2018-11-16 05:28:22.844553+00	39	Iaer object (39)	3		12	1
2016	2018-11-16 05:28:22.857049+00	38	Iaer object (38)	3		12	1
2017	2018-11-16 05:28:22.872909+00	37	Iaer object (37)	3		12	1
2018	2018-11-16 05:28:22.880388+00	36	Iaer object (36)	3		12	1
2019	2018-11-16 05:28:22.901021+00	35	Iaer object (35)	3		12	1
2020	2018-11-16 05:28:22.911599+00	34	Iaer object (34)	3		12	1
2021	2018-11-16 05:28:22.923369+00	33	Iaer object (33)	3		12	1
2022	2018-11-16 05:28:22.934023+00	32	Iaer object (32)	3		12	1
2023	2018-11-16 05:28:22.941688+00	31	Iaer object (31)	3		12	1
2024	2018-11-16 05:28:22.955865+00	30	Iaer object (30)	3		12	1
2025	2018-11-16 05:28:22.970063+00	29	Iaer object (29)	3		12	1
2026	2018-11-16 05:28:22.993121+00	28	Iaer object (28)	3		12	1
2027	2018-11-16 05:28:23.004275+00	27	Iaer object (27)	3		12	1
2028	2018-11-16 05:28:23.015093+00	26	Iaer object (26)	3		12	1
2029	2018-11-16 05:28:23.02256+00	25	Iaer object (25)	3		12	1
2030	2018-11-16 05:28:23.030186+00	24	Iaer object (24)	3		12	1
2031	2018-11-16 05:28:23.038076+00	23	Iaer object (23)	3		12	1
2032	2018-11-16 05:28:23.047578+00	22	Iaer object (22)	3		12	1
2033	2018-11-16 05:28:23.055098+00	21	Iaer object (21)	3		12	1
2034	2018-11-16 05:28:23.06522+00	20	Iaer object (20)	3		12	1
2035	2018-11-16 05:28:23.073181+00	19	Iaer object (19)	3		12	1
2036	2018-11-16 05:28:23.081238+00	18	Iaer object (18)	3		12	1
2037	2018-11-16 05:28:23.091473+00	17	Iaer object (17)	3		12	1
2038	2018-11-16 05:28:23.103408+00	16	Iaer object (16)	3		12	1
2039	2018-11-16 05:28:23.113125+00	15	Iaer object (15)	3		12	1
2040	2018-11-16 05:28:23.120482+00	14	Iaer object (14)	3		12	1
2041	2018-11-16 05:28:23.127973+00	13	Iaer object (13)	3		12	1
2042	2018-11-16 05:28:23.136985+00	12	Iaer object (12)	3		12	1
2043	2018-11-16 05:28:23.150138+00	11	Iaer object (11)	3		12	1
2044	2018-11-16 05:28:23.15804+00	10	Iaer object (10)	3		12	1
2045	2018-11-16 05:28:23.165911+00	9	Iaer object (9)	3		12	1
2046	2018-11-16 05:28:23.180426+00	8	Iaer object (8)	3		12	1
2047	2018-11-16 05:28:23.187807+00	7	Iaer object (7)	3		12	1
2048	2018-11-16 05:28:23.195781+00	6	Iaer object (6)	3		12	1
2049	2018-11-16 05:28:23.203185+00	5	Iaer object (5)	3		12	1
2050	2018-11-16 05:28:23.21138+00	4	Iaer object (4)	3		12	1
2051	2018-11-16 05:28:23.220824+00	3	Iaer object (3)	3		12	1
2052	2018-11-16 05:28:23.231572+00	2	Iaer object (2)	3		12	1
2053	2018-11-16 05:28:23.238977+00	1	Iaer object (1)	3		12	1
2054	2018-11-16 05:35:04.037393+00	963	Iaer object (963)	3		12	1
2055	2018-11-16 05:35:04.053603+00	878	Iaer object (878)	3		12	1
2056	2018-11-16 05:35:04.064581+00	962	Iaer object (962)	3		12	1
2057	2018-11-16 05:35:04.074694+00	877	Iaer object (877)	3		12	1
2058	2018-11-16 05:35:04.082125+00	961	Iaer object (961)	3		12	1
2059	2018-11-16 05:35:04.090648+00	876	Iaer object (876)	3		12	1
2060	2018-11-16 05:35:04.100326+00	960	Iaer object (960)	3		12	1
2061	2018-11-16 05:35:04.107908+00	875	Iaer object (875)	3		12	1
2062	2018-11-16 05:35:04.115007+00	959	Iaer object (959)	3		12	1
2063	2018-11-16 05:35:04.128059+00	874	Iaer object (874)	3		12	1
2064	2018-11-16 05:35:04.139153+00	958	Iaer object (958)	3		12	1
2065	2018-11-16 05:35:04.15006+00	873	Iaer object (873)	3		12	1
2066	2018-11-16 05:35:04.162515+00	957	Iaer object (957)	3		12	1
2067	2018-11-16 05:35:04.180886+00	872	Iaer object (872)	3		12	1
2068	2018-11-16 05:35:04.193214+00	956	Iaer object (956)	3		12	1
2069	2018-11-16 05:35:04.200604+00	871	Iaer object (871)	3		12	1
2070	2018-11-16 05:35:04.211394+00	955	Iaer object (955)	3		12	1
2071	2018-11-16 05:35:04.220754+00	870	Iaer object (870)	3		12	1
2072	2018-11-16 05:35:04.228232+00	954	Iaer object (954)	3		12	1
2073	2018-11-16 05:35:04.235337+00	869	Iaer object (869)	3		12	1
2074	2018-11-16 05:35:04.248917+00	953	Iaer object (953)	3		12	1
2075	2018-11-16 05:35:04.256137+00	868	Iaer object (868)	3		12	1
2076	2018-11-16 05:35:04.273378+00	952	Iaer object (952)	3		12	1
2077	2018-11-16 05:35:04.282527+00	867	Iaer object (867)	3		12	1
2078	2018-11-16 05:35:04.290158+00	951	Iaer object (951)	3		12	1
2079	2018-11-16 05:35:04.300399+00	866	Iaer object (866)	3		12	1
2080	2018-11-16 05:35:04.310088+00	950	Iaer object (950)	3		12	1
2081	2018-11-16 05:35:04.317417+00	865	Iaer object (865)	3		12	1
2082	2018-11-16 05:35:04.325603+00	949	Iaer object (949)	3		12	1
2083	2018-11-16 05:35:04.348275+00	864	Iaer object (864)	3		12	1
2084	2018-11-16 05:35:04.355237+00	948	Iaer object (948)	3		12	1
2085	2018-11-16 05:35:04.364481+00	863	Iaer object (863)	3		12	1
2086	2018-11-16 05:35:04.374292+00	947	Iaer object (947)	3		12	1
2087	2018-11-16 05:35:04.381712+00	862	Iaer object (862)	3		12	1
2088	2018-11-16 05:35:04.388928+00	946	Iaer object (946)	3		12	1
2089	2018-11-16 05:35:04.39991+00	861	Iaer object (861)	3		12	1
2090	2018-11-16 05:35:04.407268+00	945	Iaer object (945)	3		12	1
2091	2018-11-16 05:35:04.414612+00	860	Iaer object (860)	3		12	1
2092	2018-11-16 05:35:04.421748+00	944	Iaer object (944)	3		12	1
2093	2018-11-16 05:35:04.43238+00	859	Iaer object (859)	3		12	1
2094	2018-11-16 05:35:04.439772+00	943	Iaer object (943)	3		12	1
2095	2018-11-16 05:35:04.44703+00	858	Iaer object (858)	3		12	1
2096	2018-11-16 05:35:04.454545+00	942	Iaer object (942)	3		12	1
2097	2018-11-16 05:35:04.462723+00	857	Iaer object (857)	3		12	1
2098	2018-11-16 05:35:04.470693+00	941	Iaer object (941)	3		12	1
2099	2018-11-16 05:35:04.480449+00	856	Iaer object (856)	3		12	1
2100	2018-11-16 05:35:04.491403+00	940	Iaer object (940)	3		12	1
2101	2018-11-16 05:35:04.502479+00	855	Iaer object (855)	3		12	1
2102	2018-11-16 05:35:04.51735+00	939	Iaer object (939)	3		12	1
2103	2018-11-16 05:35:04.524838+00	854	Iaer object (854)	3		12	1
2104	2018-11-16 05:35:04.532296+00	938	Iaer object (938)	3		12	1
2105	2018-11-16 05:35:04.53985+00	853	Iaer object (853)	3		12	1
2106	2018-11-16 05:35:04.547606+00	937	Iaer object (937)	3		12	1
2107	2018-11-16 05:35:04.55484+00	852	Iaer object (852)	3		12	1
2108	2018-11-16 05:35:04.562393+00	936	Iaer object (936)	3		12	1
2109	2018-11-16 05:35:04.572527+00	851	Iaer object (851)	3		12	1
2110	2018-11-16 05:35:04.582587+00	935	Iaer object (935)	3		12	1
2111	2018-11-16 05:35:04.589948+00	850	Iaer object (850)	3		12	1
2112	2018-11-16 05:35:04.59728+00	934	Iaer object (934)	3		12	1
2113	2018-11-16 05:35:04.604571+00	849	Iaer object (849)	3		12	1
2114	2018-11-16 05:35:04.612719+00	933	Iaer object (933)	3		12	1
2115	2018-11-16 05:35:04.619946+00	848	Iaer object (848)	3		12	1
2116	2018-11-16 05:35:04.627376+00	932	Iaer object (932)	3		12	1
2117	2018-11-16 05:35:04.637875+00	847	Iaer object (847)	3		12	1
2118	2018-11-16 05:35:04.649643+00	931	Iaer object (931)	3		12	1
2119	2018-11-16 05:35:04.660122+00	846	Iaer object (846)	3		12	1
2120	2018-11-16 05:35:04.680171+00	930	Iaer object (930)	3		12	1
2121	2018-11-16 05:35:04.69027+00	845	Iaer object (845)	3		12	1
2122	2018-11-16 05:35:04.701723+00	929	Iaer object (929)	3		12	1
2123	2018-11-16 05:35:04.711435+00	844	Iaer object (844)	3		12	1
2124	2018-11-16 05:35:04.719041+00	928	Iaer object (928)	3		12	1
2125	2018-11-16 05:35:04.726488+00	843	Iaer object (843)	3		12	1
2126	2018-11-16 05:35:04.734597+00	927	Iaer object (927)	3		12	1
2127	2018-11-16 05:35:04.742227+00	842	Iaer object (842)	3		12	1
2128	2018-11-16 05:35:04.751914+00	926	Iaer object (926)	3		12	1
2129	2018-11-16 05:35:04.762564+00	841	Iaer object (841)	3		12	1
2130	2018-11-16 05:35:04.775115+00	925	Iaer object (925)	3		12	1
2131	2018-11-16 05:35:04.782572+00	840	Iaer object (840)	3		12	1
2132	2018-11-16 05:35:04.792723+00	924	Iaer object (924)	3		12	1
2133	2018-11-16 05:35:04.802942+00	839	Iaer object (839)	3		12	1
2134	2018-11-16 05:35:04.813512+00	923	Iaer object (923)	3		12	1
2135	2018-11-16 05:35:04.824542+00	838	Iaer object (838)	3		12	1
2136	2018-11-16 05:35:04.835423+00	922	Iaer object (922)	3		12	1
2137	2018-11-16 05:35:04.856078+00	837	Iaer object (837)	3		12	1
2138	2018-11-16 05:35:04.869385+00	921	Iaer object (921)	3		12	1
2139	2018-11-16 05:35:04.880297+00	836	Iaer object (836)	3		12	1
2140	2018-11-16 05:35:04.89106+00	920	Iaer object (920)	3		12	1
2141	2018-11-16 05:35:04.901289+00	835	Iaer object (835)	3		12	1
2142	2018-11-16 05:35:04.912242+00	919	Iaer object (919)	3		12	1
2143	2018-11-16 05:35:04.92285+00	834	Iaer object (834)	3		12	1
2144	2018-11-16 05:35:04.933345+00	918	Iaer object (918)	3		12	1
2145	2018-11-16 05:35:04.944125+00	833	Iaer object (833)	3		12	1
2146	2018-11-16 05:35:04.955046+00	917	Iaer object (917)	3		12	1
2147	2018-11-16 05:35:04.965361+00	832	Iaer object (832)	3		12	1
2148	2018-11-16 05:35:04.976172+00	916	Iaer object (916)	3		12	1
2149	2018-11-16 05:35:04.988165+00	831	Iaer object (831)	3		12	1
2150	2018-11-16 05:35:05.0006+00	915	Iaer object (915)	3		12	1
2151	2018-11-16 05:35:05.018498+00	830	Iaer object (830)	3		12	1
2152	2018-11-16 05:35:05.042593+00	914	Iaer object (914)	3		12	1
2153	2018-11-16 05:35:05.050881+00	829	Iaer object (829)	3		12	1
2154	2018-11-16 05:35:05.06153+00	913	Iaer object (913)	3		12	1
2155	2018-11-16 05:35:05.091937+00	828	Iaer object (828)	3		12	1
2156	2018-11-16 05:35:05.104534+00	912	Iaer object (912)	3		12	1
2157	2018-11-16 05:35:05.12442+00	827	Iaer object (827)	3		12	1
2158	2018-11-16 05:35:05.13465+00	911	Iaer object (911)	3		12	1
2159	2018-11-16 05:35:05.16221+00	826	Iaer object (826)	3		12	1
2160	2018-11-16 05:35:05.183631+00	910	Iaer object (910)	3		12	1
2161	2018-11-16 05:35:05.194887+00	825	Iaer object (825)	3		12	1
2162	2018-11-16 05:35:05.209152+00	909	Iaer object (909)	3		12	1
2163	2018-11-16 05:35:05.242459+00	824	Iaer object (824)	3		12	1
2164	2018-11-16 05:35:05.25732+00	908	Iaer object (908)	3		12	1
2165	2018-11-16 05:35:05.284267+00	823	Iaer object (823)	3		12	1
2166	2018-11-16 05:35:05.293445+00	907	Iaer object (907)	3		12	1
2167	2018-11-16 05:35:05.302268+00	822	Iaer object (822)	3		12	1
2168	2018-11-16 05:35:05.310552+00	906	Iaer object (906)	3		12	1
2169	2018-11-16 05:35:05.321912+00	821	Iaer object (821)	3		12	1
2170	2018-11-16 05:35:05.336381+00	905	Iaer object (905)	3		12	1
2171	2018-11-16 05:35:05.346695+00	820	Iaer object (820)	3		12	1
2172	2018-11-16 05:35:05.358054+00	904	Iaer object (904)	3		12	1
2173	2018-11-16 05:35:05.371596+00	819	Iaer object (819)	3		12	1
2174	2018-11-16 05:35:05.392515+00	903	Iaer object (903)	3		12	1
2175	2018-11-16 05:35:05.402801+00	818	Iaer object (818)	3		12	1
2176	2018-11-16 05:35:05.415564+00	902	Iaer object (902)	3		12	1
2177	2018-11-16 05:35:05.429094+00	817	Iaer object (817)	3		12	1
2178	2018-11-16 05:35:05.439969+00	901	Iaer object (901)	3		12	1
2179	2018-11-16 05:35:05.448849+00	816	Iaer object (816)	3		12	1
2180	2018-11-16 05:35:05.456294+00	900	Iaer object (900)	3		12	1
2181	2018-11-16 05:35:05.463587+00	815	Iaer object (815)	3		12	1
2182	2018-11-16 05:35:05.476501+00	899	Iaer object (899)	3		12	1
2183	2018-11-16 05:35:05.486307+00	814	Iaer object (814)	3		12	1
2184	2018-11-16 05:35:05.493797+00	898	Iaer object (898)	3		12	1
2185	2018-11-16 05:35:05.501183+00	813	Iaer object (813)	3		12	1
2186	2018-11-16 05:35:05.512209+00	897	Iaer object (897)	3		12	1
2187	2018-11-16 05:35:05.519737+00	812	Iaer object (812)	3		12	1
2188	2018-11-16 05:35:05.526984+00	896	Iaer object (896)	3		12	1
2189	2018-11-16 05:35:05.537939+00	811	Iaer object (811)	3		12	1
2190	2018-11-16 05:35:05.548098+00	895	Iaer object (895)	3		12	1
2191	2018-11-16 05:35:05.555582+00	810	Iaer object (810)	3		12	1
2192	2018-11-16 05:35:05.562817+00	894	Iaer object (894)	3		12	1
2193	2018-11-16 05:35:05.587847+00	809	Iaer object (809)	3		12	1
2194	2018-11-16 05:35:05.597641+00	893	Iaer object (893)	3		12	1
2195	2018-11-16 05:35:05.607098+00	808	Iaer object (808)	3		12	1
2196	2018-11-16 05:35:05.614346+00	892	Iaer object (892)	3		12	1
2197	2018-11-16 05:35:05.623698+00	807	Iaer object (807)	3		12	1
2198	2018-11-16 05:35:05.637349+00	891	Iaer object (891)	3		12	1
2199	2018-11-16 05:35:05.647237+00	806	Iaer object (806)	3		12	1
2200	2018-11-16 05:35:05.654958+00	890	Iaer object (890)	3		12	1
2201	2018-11-16 05:35:05.663524+00	805	Iaer object (805)	3		12	1
2202	2018-11-16 05:35:05.676898+00	889	Iaer object (889)	3		12	1
2203	2018-11-16 05:35:05.686914+00	804	Iaer object (804)	3		12	1
2204	2018-11-16 05:35:05.698953+00	888	Iaer object (888)	3		12	1
2205	2018-11-16 05:35:05.708645+00	803	Iaer object (803)	3		12	1
2206	2018-11-16 05:35:05.716132+00	887	Iaer object (887)	3		12	1
2207	2018-11-16 05:35:05.729077+00	802	Iaer object (802)	3		12	1
2208	2018-11-16 05:35:05.74232+00	886	Iaer object (886)	3		12	1
2209	2018-11-16 05:35:05.749637+00	801	Iaer object (801)	3		12	1
2210	2018-11-16 05:35:05.759836+00	885	Iaer object (885)	3		12	1
2211	2018-11-16 05:35:05.76742+00	800	Iaer object (800)	3		12	1
2212	2018-11-16 05:35:05.774761+00	884	Iaer object (884)	3		12	1
2213	2018-11-16 05:35:05.782854+00	799	Iaer object (799)	3		12	1
2214	2018-11-16 05:35:05.792509+00	883	Iaer object (883)	3		12	1
2215	2018-11-16 05:35:05.800005+00	798	Iaer object (798)	3		12	1
2216	2018-11-16 05:35:05.807591+00	882	Iaer object (882)	3		12	1
2217	2018-11-16 05:35:05.814993+00	797	Iaer object (797)	3		12	1
2218	2018-11-16 05:35:05.822806+00	881	Iaer object (881)	3		12	1
2219	2018-11-16 05:35:05.830822+00	796	Iaer object (796)	3		12	1
2220	2018-11-16 05:35:05.838411+00	880	Iaer object (880)	3		12	1
2221	2018-11-16 05:35:05.848363+00	795	Iaer object (795)	3		12	1
2222	2018-11-16 05:35:05.859101+00	879	Iaer object (879)	3		12	1
2223	2018-11-16 05:35:05.866271+00	794	Iaer object (794)	3		12	1
2224	2018-11-16 05:35:05.873383+00	793	Iaer object (793)	3		12	1
2225	2018-11-16 05:35:05.894363+00	792	Iaer object (792)	3		12	1
2226	2018-11-16 05:35:05.904036+00	791	Iaer object (791)	3		12	1
2227	2018-11-16 05:35:05.911588+00	790	Iaer object (790)	3		12	1
2228	2018-11-16 05:35:05.920334+00	789	Iaer object (789)	3		12	1
2229	2018-11-16 05:35:05.929715+00	788	Iaer object (788)	3		12	1
2230	2018-11-16 05:35:05.937148+00	787	Iaer object (787)	3		12	1
2231	2018-11-16 05:35:05.94676+00	786	Iaer object (786)	3		12	1
2232	2018-11-16 05:35:05.956265+00	785	Iaer object (785)	3		12	1
2233	2018-11-16 05:35:05.963329+00	784	Iaer object (784)	3		12	1
2234	2018-11-16 05:35:05.970911+00	783	Iaer object (783)	3		12	1
2235	2018-11-16 05:35:05.981667+00	782	Iaer object (782)	3		12	1
2236	2018-11-16 05:35:05.992003+00	781	Iaer object (781)	3		12	1
2237	2018-11-16 05:35:06.002854+00	780	Iaer object (780)	3		12	1
2238	2018-11-16 05:35:06.021115+00	779	Iaer object (779)	3		12	1
2239	2018-11-16 05:35:06.033488+00	778	Iaer object (778)	3		12	1
2240	2018-11-16 05:35:06.04408+00	777	Iaer object (777)	3		12	1
2241	2018-11-16 05:35:06.062398+00	776	Iaer object (776)	3		12	1
2242	2018-11-16 05:35:06.07203+00	775	Iaer object (775)	3		12	1
2243	2018-11-16 05:35:06.085745+00	774	Iaer object (774)	3		12	1
2244	2018-11-16 05:35:06.095753+00	773	Iaer object (773)	3		12	1
2245	2018-11-16 05:35:06.108744+00	772	Iaer object (772)	3		12	1
2246	2018-11-16 05:35:06.115904+00	771	Iaer object (771)	3		12	1
2247	2018-11-16 05:35:06.123232+00	770	Iaer object (770)	3		12	1
2248	2018-11-16 05:35:06.136263+00	769	Iaer object (769)	3		12	1
2249	2018-11-16 05:35:06.143515+00	768	Iaer object (768)	3		12	1
2250	2018-11-16 05:35:06.151173+00	767	Iaer object (767)	3		12	1
2251	2018-11-16 05:35:06.163439+00	766	Iaer object (766)	3		12	1
2252	2018-11-16 05:35:06.180248+00	765	Iaer object (765)	3		12	1
2253	2018-11-16 05:35:06.18987+00	764	Iaer object (764)	3		12	1
2254	2018-11-16 05:35:06.200388+00	763	Iaer object (763)	3		12	1
2255	2018-11-16 05:35:06.210266+00	762	Iaer object (762)	3		12	1
2256	2018-11-16 05:35:06.229291+00	761	Iaer object (761)	3		12	1
2257	2018-11-16 05:35:06.236899+00	760	Iaer object (760)	3		12	1
2258	2018-11-16 05:35:06.252903+00	759	Iaer object (759)	3		12	1
2259	2018-11-16 05:35:06.263392+00	758	Iaer object (758)	3		12	1
2260	2018-11-16 05:35:06.28095+00	757	Iaer object (757)	3		12	1
2261	2018-11-16 05:35:06.292522+00	756	Iaer object (756)	3		12	1
2262	2018-11-16 05:35:06.300067+00	755	Iaer object (755)	3		12	1
2263	2018-11-16 05:35:06.308561+00	754	Iaer object (754)	3		12	1
2264	2018-11-16 05:35:06.320791+00	753	Iaer object (753)	3		12	1
2265	2018-11-16 05:35:06.328801+00	752	Iaer object (752)	3		12	1
2266	2018-11-16 05:35:06.336616+00	751	Iaer object (751)	3		12	1
2267	2018-11-16 05:35:06.348808+00	750	Iaer object (750)	3		12	1
2268	2018-11-16 05:35:06.359057+00	749	Iaer object (749)	3		12	1
2269	2018-11-16 05:35:06.369323+00	748	Iaer object (748)	3		12	1
2270	2018-11-16 05:35:06.388716+00	747	Iaer object (747)	3		12	1
2271	2018-11-16 05:35:06.399117+00	746	Iaer object (746)	3		12	1
2272	2018-11-16 05:35:06.410814+00	745	Iaer object (745)	3		12	1
2273	2018-11-16 05:35:06.420353+00	744	Iaer object (744)	3		12	1
2274	2018-11-16 05:35:06.427598+00	743	Iaer object (743)	3		12	1
2275	2018-11-16 05:35:06.43474+00	742	Iaer object (742)	3		12	1
2276	2018-11-16 05:35:06.45086+00	741	Iaer object (741)	3		12	1
2277	2018-11-16 05:35:06.461169+00	740	Iaer object (740)	3		12	1
2278	2018-11-16 05:35:06.473158+00	739	Iaer object (739)	3		12	1
2279	2018-11-16 05:35:06.483701+00	738	Iaer object (738)	3		12	1
2280	2018-11-16 05:35:06.495094+00	737	Iaer object (737)	3		12	1
2281	2018-11-16 05:35:06.510025+00	736	Iaer object (736)	3		12	1
2282	2018-11-16 05:35:06.520501+00	735	Iaer object (735)	3		12	1
2283	2018-11-16 05:35:06.534184+00	734	Iaer object (734)	3		12	1
2284	2018-11-16 05:35:06.570531+00	733	Iaer object (733)	3		12	1
2285	2018-11-16 05:35:06.581093+00	732	Iaer object (732)	3		12	1
2286	2018-11-16 05:35:06.591532+00	731	Iaer object (731)	3		12	1
2287	2018-11-16 05:35:06.602736+00	730	Iaer object (730)	3		12	1
2288	2018-11-16 05:35:06.614179+00	729	Iaer object (729)	3		12	1
2289	2018-11-16 05:35:06.624444+00	728	Iaer object (728)	3		12	1
2290	2018-11-16 05:35:06.635378+00	727	Iaer object (727)	3		12	1
2291	2018-11-16 05:35:06.645371+00	726	Iaer object (726)	3		12	1
2292	2018-11-16 05:35:06.656573+00	725	Iaer object (725)	3		12	1
2293	2018-11-16 05:35:06.670946+00	724	Iaer object (724)	3		12	1
2294	2018-11-16 05:35:06.681662+00	723	Iaer object (723)	3		12	1
2295	2018-11-16 05:35:06.692107+00	722	Iaer object (722)	3		12	1
2296	2018-11-16 05:35:06.704147+00	721	Iaer object (721)	3		12	1
2297	2018-11-16 05:35:06.718319+00	720	Iaer object (720)	3		12	1
2298	2018-11-16 05:35:06.729121+00	719	Iaer object (719)	3		12	1
2299	2018-11-16 05:35:06.73933+00	718	Iaer object (718)	3		12	1
2300	2018-11-16 05:35:06.747347+00	717	Iaer object (717)	3		12	1
2301	2018-11-16 05:35:06.756129+00	716	Iaer object (716)	3		12	1
2302	2018-11-16 05:35:06.764366+00	715	Iaer object (715)	3		12	1
2303	2018-11-16 05:35:06.774647+00	714	Iaer object (714)	3		12	1
2304	2018-11-16 05:35:06.796498+00	713	Iaer object (713)	3		12	1
2305	2018-11-16 05:35:06.806394+00	712	Iaer object (712)	3		12	1
2306	2018-11-16 05:35:06.816709+00	711	Iaer object (711)	3		12	1
2307	2018-11-16 05:35:06.824217+00	710	Iaer object (710)	3		12	1
2308	2018-11-16 05:35:06.831701+00	709	Iaer object (709)	3		12	1
2309	2018-11-16 05:35:06.839536+00	708	Iaer object (708)	3		12	1
2310	2018-11-16 05:35:06.848187+00	707	Iaer object (707)	3		12	1
2311	2018-11-16 05:35:06.865609+00	706	Iaer object (706)	3		12	1
2312	2018-11-16 05:35:06.876216+00	705	Iaer object (705)	3		12	1
2313	2018-11-16 05:35:06.886854+00	704	Iaer object (704)	3		12	1
2314	2018-11-16 05:35:06.899196+00	703	Iaer object (703)	3		12	1
2315	2018-11-16 05:35:06.914115+00	702	Iaer object (702)	3		12	1
2316	2018-11-16 05:35:06.924556+00	701	Iaer object (701)	3		12	1
2317	2018-11-16 05:35:06.936727+00	700	Iaer object (700)	3		12	1
2318	2018-11-16 05:35:06.959705+00	699	Iaer object (699)	3		12	1
2319	2018-11-16 05:35:06.971295+00	698	Iaer object (698)	3		12	1
2320	2018-11-16 05:35:06.981801+00	697	Iaer object (697)	3		12	1
2321	2018-11-16 05:35:06.993368+00	696	Iaer object (696)	3		12	1
2322	2018-11-16 05:35:07.004525+00	695	Iaer object (695)	3		12	1
2323	2018-11-16 05:35:07.017648+00	694	Iaer object (694)	3		12	1
2324	2018-11-16 05:35:07.030313+00	693	Iaer object (693)	3		12	1
2325	2018-11-16 05:35:07.048073+00	692	Iaer object (692)	3		12	1
2326	2018-11-16 05:35:07.055887+00	691	Iaer object (691)	3		12	1
2327	2018-11-16 05:35:07.063297+00	690	Iaer object (690)	3		12	1
2328	2018-11-16 05:35:07.070751+00	689	Iaer object (689)	3		12	1
2329	2018-11-16 05:35:07.098392+00	688	Iaer object (688)	3		12	1
2330	2018-11-16 05:35:07.106379+00	687	Iaer object (687)	3		12	1
2331	2018-11-16 05:35:07.114531+00	686	Iaer object (686)	3		12	1
2332	2018-11-16 05:35:07.135395+00	685	Iaer object (685)	3		12	1
2333	2018-11-16 05:35:07.14607+00	684	Iaer object (684)	3		12	1
2334	2018-11-16 05:35:07.154108+00	683	Iaer object (683)	3		12	1
2335	2018-11-16 05:35:07.162629+00	682	Iaer object (682)	3		12	1
2336	2018-11-16 05:35:07.17261+00	681	Iaer object (681)	3		12	1
2337	2018-11-16 05:35:07.180242+00	680	Iaer object (680)	3		12	1
2338	2018-11-16 05:35:07.193644+00	679	Iaer object (679)	3		12	1
2339	2018-11-16 05:35:07.205053+00	678	Iaer object (678)	3		12	1
2340	2018-11-16 05:35:07.215694+00	677	Iaer object (677)	3		12	1
2341	2018-11-16 05:35:07.223078+00	676	Iaer object (676)	3		12	1
2342	2018-11-16 05:35:07.236559+00	675	Iaer object (675)	3		12	1
2343	2018-11-16 05:35:07.251598+00	674	Iaer object (674)	3		12	1
2344	2018-11-16 05:35:07.26262+00	673	Iaer object (673)	3		12	1
2345	2018-11-16 05:35:07.270019+00	672	Iaer object (672)	3		12	1
2346	2018-11-16 05:35:07.277774+00	671	Iaer object (671)	3		12	1
2347	2018-11-16 05:35:07.292492+00	670	Iaer object (670)	3		12	1
2348	2018-11-16 05:35:07.303823+00	669	Iaer object (669)	3		12	1
2349	2018-11-16 05:35:07.315678+00	668	Iaer object (668)	3		12	1
2350	2018-11-16 05:35:07.328756+00	667	Iaer object (667)	3		12	1
2351	2018-11-16 05:35:07.336122+00	666	Iaer object (666)	3		12	1
2352	2018-11-16 05:35:07.344612+00	665	Iaer object (665)	3		12	1
2353	2018-11-16 05:35:07.354618+00	664	Iaer object (664)	3		12	1
2354	2018-11-16 05:35:07.366136+00	663	Iaer object (663)	3		12	1
2355	2018-11-16 05:35:07.374006+00	662	Iaer object (662)	3		12	1
2356	2018-11-16 05:35:07.385563+00	661	Iaer object (661)	3		12	1
2357	2018-11-16 05:35:07.399603+00	660	Iaer object (660)	3		12	1
2358	2018-11-16 05:35:07.420403+00	659	Iaer object (659)	3		12	1
2359	2018-11-16 05:35:07.430608+00	658	Iaer object (658)	3		12	1
2360	2018-11-16 05:35:07.44077+00	657	Iaer object (657)	3		12	1
2361	2018-11-16 05:35:07.454401+00	656	Iaer object (656)	3		12	1
2362	2018-11-16 05:35:07.46466+00	655	Iaer object (655)	3		12	1
2363	2018-11-16 05:35:07.476937+00	654	Iaer object (654)	3		12	1
2364	2018-11-16 05:35:07.493643+00	653	Iaer object (653)	3		12	1
2365	2018-11-16 05:35:07.508024+00	652	Iaer object (652)	3		12	1
2366	2018-11-16 05:35:07.520024+00	651	Iaer object (651)	3		12	1
2367	2018-11-16 05:35:07.540513+00	650	Iaer object (650)	3		12	1
2368	2018-11-16 05:35:07.554742+00	649	Iaer object (649)	3		12	1
2369	2018-11-16 05:35:07.572946+00	648	Iaer object (648)	3		12	1
2370	2018-11-16 05:35:07.589184+00	647	Iaer object (647)	3		12	1
2371	2018-11-16 05:35:07.61339+00	646	Iaer object (646)	3		12	1
2372	2018-11-16 05:35:07.624668+00	645	Iaer object (645)	3		12	1
2373	2018-11-16 05:35:07.637304+00	644	Iaer object (644)	3		12	1
2374	2018-11-16 05:35:07.650243+00	643	Iaer object (643)	3		12	1
2375	2018-11-16 05:35:07.665656+00	642	Iaer object (642)	3		12	1
2376	2018-11-16 05:35:07.675777+00	641	Iaer object (641)	3		12	1
2377	2018-11-16 05:35:07.687124+00	640	Iaer object (640)	3		12	1
2378	2018-11-16 05:35:07.698336+00	639	Iaer object (639)	3		12	1
2379	2018-11-16 05:35:07.711544+00	638	Iaer object (638)	3		12	1
2380	2018-11-16 05:35:07.722935+00	637	Iaer object (637)	3		12	1
2381	2018-11-16 05:35:07.733354+00	636	Iaer object (636)	3		12	1
2382	2018-11-16 05:35:07.746587+00	635	Iaer object (635)	3		12	1
2383	2018-11-16 05:35:07.776738+00	634	Iaer object (634)	3		12	1
2384	2018-11-16 05:35:07.784793+00	633	Iaer object (633)	3		12	1
2385	2018-11-16 05:35:07.800115+00	632	Iaer object (632)	3		12	1
2386	2018-11-16 05:35:07.810695+00	631	Iaer object (631)	3		12	1
2387	2018-11-16 05:35:07.821123+00	630	Iaer object (630)	3		12	1
2388	2018-11-16 05:35:07.83228+00	629	Iaer object (629)	3		12	1
2389	2018-11-16 05:35:07.847214+00	628	Iaer object (628)	3		12	1
2390	2018-11-16 05:35:07.859673+00	627	Iaer object (627)	3		12	1
2391	2018-11-16 05:35:07.874086+00	626	Iaer object (626)	3		12	1
2392	2018-11-16 05:35:07.883336+00	625	Iaer object (625)	3		12	1
2393	2018-11-16 05:35:07.896443+00	624	Iaer object (624)	3		12	1
2394	2018-11-16 05:35:07.908472+00	623	Iaer object (623)	3		12	1
2395	2018-11-16 05:35:07.918195+00	622	Iaer object (622)	3		12	1
2396	2018-11-16 05:35:07.92969+00	621	Iaer object (621)	3		12	1
2397	2018-11-16 05:35:07.946107+00	620	Iaer object (620)	3		12	1
2398	2018-11-16 05:35:07.955865+00	619	Iaer object (619)	3		12	1
2399	2018-11-16 05:35:07.967304+00	618	Iaer object (618)	3		12	1
2400	2018-11-16 05:35:07.979091+00	617	Iaer object (617)	3		12	1
2401	2018-11-16 05:35:07.992027+00	616	Iaer object (616)	3		12	1
2402	2018-11-16 05:35:08.004159+00	615	Iaer object (615)	3		12	1
2403	2018-11-16 05:35:08.015374+00	614	Iaer object (614)	3		12	1
2404	2018-11-16 05:35:08.026386+00	613	Iaer object (613)	3		12	1
2405	2018-11-16 05:35:08.03798+00	612	Iaer object (612)	3		12	1
2406	2018-11-16 05:35:08.05235+00	611	Iaer object (611)	3		12	1
2407	2018-11-16 05:35:08.072773+00	610	Iaer object (610)	3		12	1
2408	2018-11-16 05:35:08.080828+00	609	Iaer object (609)	3		12	1
2409	2018-11-16 05:35:08.097016+00	608	Iaer object (608)	3		12	1
2410	2018-11-16 05:35:08.111303+00	607	Iaer object (607)	3		12	1
2411	2018-11-16 05:35:08.122223+00	606	Iaer object (606)	3		12	1
2412	2018-11-16 05:35:08.133283+00	605	Iaer object (605)	3		12	1
2413	2018-11-16 05:35:08.143636+00	604	Iaer object (604)	3		12	1
2414	2018-11-16 05:35:08.153741+00	603	Iaer object (603)	3		12	1
2415	2018-11-16 05:35:08.164903+00	602	Iaer object (602)	3		12	1
2416	2018-11-16 05:35:08.175094+00	601	Iaer object (601)	3		12	1
2417	2018-11-16 05:35:08.182796+00	600	Iaer object (600)	3		12	1
2418	2018-11-16 05:35:08.206771+00	599	Iaer object (599)	3		12	1
2419	2018-11-16 05:35:08.222614+00	598	Iaer object (598)	3		12	1
2420	2018-11-16 05:35:08.230317+00	597	Iaer object (597)	3		12	1
2421	2018-11-16 05:35:08.243212+00	596	Iaer object (596)	3		12	1
2422	2018-11-16 05:35:08.255194+00	595	Iaer object (595)	3		12	1
2423	2018-11-16 05:35:08.266163+00	594	Iaer object (594)	3		12	1
2424	2018-11-16 05:35:08.27614+00	593	Iaer object (593)	3		12	1
2425	2018-11-16 05:35:08.296328+00	592	Iaer object (592)	3		12	1
2426	2018-11-16 05:35:08.307647+00	591	Iaer object (591)	3		12	1
2427	2018-11-16 05:35:08.3186+00	590	Iaer object (590)	3		12	1
2428	2018-11-16 05:35:08.326478+00	589	Iaer object (589)	3		12	1
2429	2018-11-16 05:35:08.334255+00	588	Iaer object (588)	3		12	1
2430	2018-11-16 05:35:08.344424+00	587	Iaer object (587)	3		12	1
2431	2018-11-16 05:35:08.359261+00	586	Iaer object (586)	3		12	1
2432	2018-11-16 05:35:08.367072+00	585	Iaer object (585)	3		12	1
2433	2018-11-16 05:35:08.376021+00	584	Iaer object (584)	3		12	1
2434	2018-11-16 05:35:08.389047+00	583	Iaer object (583)	3		12	1
2435	2018-11-16 05:35:08.397831+00	582	Iaer object (582)	3		12	1
2436	2018-11-16 05:35:08.413575+00	581	Iaer object (581)	3		12	1
2437	2018-11-16 05:35:08.423388+00	580	Iaer object (580)	3		12	1
2438	2018-11-16 05:35:08.434921+00	579	Iaer object (579)	3		12	1
2439	2018-11-16 05:35:08.445479+00	578	Iaer object (578)	3		12	1
2440	2018-11-16 05:35:08.456389+00	577	Iaer object (577)	3		12	1
2441	2018-11-16 05:35:08.468107+00	576	Iaer object (576)	3		12	1
2442	2018-11-16 05:35:08.497796+00	575	Iaer object (575)	3		12	1
2443	2018-11-16 05:35:08.525444+00	574	Iaer object (574)	3		12	1
2444	2018-11-16 05:35:08.536598+00	573	Iaer object (573)	3		12	1
2445	2018-11-16 05:35:08.552192+00	572	Iaer object (572)	3		12	1
2446	2018-11-16 05:35:08.56292+00	571	Iaer object (571)	3		12	1
2447	2018-11-16 05:35:08.57362+00	570	Iaer object (570)	3		12	1
2448	2018-11-16 05:35:08.584258+00	569	Iaer object (569)	3		12	1
2449	2018-11-16 05:35:08.594894+00	568	Iaer object (568)	3		12	1
2450	2018-11-16 05:35:08.610549+00	567	Iaer object (567)	3		12	1
2451	2018-11-16 05:35:08.626498+00	566	Iaer object (566)	3		12	1
2452	2018-11-16 05:35:08.638169+00	565	Iaer object (565)	3		12	1
2453	2018-11-16 05:35:08.647724+00	564	Iaer object (564)	3		12	1
2454	2018-11-16 05:35:08.664786+00	563	Iaer object (563)	3		12	1
2455	2018-11-16 05:35:08.6786+00	562	Iaer object (562)	3		12	1
2456	2018-11-16 05:35:08.694981+00	561	Iaer object (561)	3		12	1
2457	2018-11-16 05:35:08.712106+00	560	Iaer object (560)	3		12	1
2458	2018-11-16 05:35:08.727026+00	559	Iaer object (559)	3		12	1
2459	2018-11-16 05:35:08.737125+00	558	Iaer object (558)	3		12	1
2460	2018-11-16 05:35:08.750468+00	557	Iaer object (557)	3		12	1
2461	2018-11-16 05:35:08.76117+00	556	Iaer object (556)	3		12	1
2462	2018-11-16 05:35:08.771069+00	555	Iaer object (555)	3		12	1
2463	2018-11-16 05:35:08.783376+00	554	Iaer object (554)	3		12	1
2464	2018-11-16 05:35:08.793466+00	553	Iaer object (553)	3		12	1
2465	2018-11-16 05:35:08.801342+00	552	Iaer object (552)	3		12	1
2466	2018-11-16 05:35:08.812521+00	551	Iaer object (551)	3		12	1
2467	2018-11-16 05:35:08.822882+00	550	Iaer object (550)	3		12	1
2468	2018-11-16 05:35:08.830168+00	549	Iaer object (549)	3		12	1
2469	2018-11-16 05:35:08.83754+00	548	Iaer object (548)	3		12	1
2470	2018-11-16 05:35:08.846584+00	547	Iaer object (547)	3		12	1
2471	2018-11-16 05:35:08.859558+00	546	Iaer object (546)	3		12	1
2472	2018-11-16 05:35:08.869883+00	545	Iaer object (545)	3		12	1
2473	2018-11-16 05:35:08.880565+00	544	Iaer object (544)	3		12	1
2474	2018-11-16 05:35:08.888096+00	543	Iaer object (543)	3		12	1
2475	2018-11-16 05:35:08.89541+00	542	Iaer object (542)	3		12	1
2476	2018-11-16 05:35:08.909555+00	541	Iaer object (541)	3		12	1
2477	2018-11-16 05:35:08.918785+00	540	Iaer object (540)	3		12	1
2478	2018-11-16 05:35:08.927213+00	539	Iaer object (539)	3		12	1
2479	2018-11-16 05:35:08.940121+00	538	Iaer object (538)	3		12	1
2480	2018-11-16 05:35:08.947561+00	537	Iaer object (537)	3		12	1
2481	2018-11-16 05:35:08.95486+00	536	Iaer object (536)	3		12	1
2482	2018-11-16 05:35:08.965626+00	535	Iaer object (535)	3		12	1
2483	2018-11-16 05:35:08.9759+00	534	Iaer object (534)	3		12	1
2484	2018-11-16 05:35:08.987391+00	533	Iaer object (533)	3		12	1
2485	2018-11-16 05:35:08.999987+00	532	Iaer object (532)	3		12	1
2486	2018-11-16 05:35:09.010677+00	531	Iaer object (531)	3		12	1
2487	2018-11-16 05:35:09.031981+00	530	Iaer object (530)	3		12	1
2488	2018-11-16 05:35:09.040249+00	529	Iaer object (529)	3		12	1
2489	2018-11-16 05:35:09.047715+00	528	Iaer object (528)	3		12	1
2490	2018-11-16 05:35:09.058079+00	527	Iaer object (527)	3		12	1
2491	2018-11-16 05:35:09.067386+00	526	Iaer object (526)	3		12	1
2492	2018-11-16 05:35:09.075195+00	525	Iaer object (525)	3		12	1
2493	2018-11-16 05:35:09.086704+00	524	Iaer object (524)	3		12	1
2494	2018-11-16 05:35:09.094496+00	523	Iaer object (523)	3		12	1
2495	2018-11-16 05:35:09.102102+00	522	Iaer object (522)	3		12	1
2496	2018-11-16 05:35:09.118891+00	521	Iaer object (521)	3		12	1
2497	2018-11-16 05:35:09.129017+00	520	Iaer object (520)	3		12	1
2498	2018-11-16 05:35:09.145361+00	519	Iaer object (519)	3		12	1
2499	2018-11-16 05:35:09.159182+00	518	Iaer object (518)	3		12	1
2500	2018-11-16 05:35:09.169077+00	517	Iaer object (517)	3		12	1
2501	2018-11-16 05:35:09.180408+00	516	Iaer object (516)	3		12	1
2502	2018-11-16 05:35:09.198142+00	515	Iaer object (515)	3		12	1
2503	2018-11-16 05:35:09.21738+00	514	Iaer object (514)	3		12	1
2504	2018-11-16 05:35:09.224916+00	513	Iaer object (513)	3		12	1
2505	2018-11-16 05:35:09.232947+00	512	Iaer object (512)	3		12	1
2506	2018-11-16 05:35:09.243343+00	511	Iaer object (511)	3		12	1
2507	2018-11-16 05:35:09.252994+00	510	Iaer object (510)	3		12	1
2508	2018-11-16 05:35:09.262965+00	509	Iaer object (509)	3		12	1
2509	2018-11-16 05:35:09.273141+00	508	Iaer object (508)	3		12	1
2510	2018-11-16 05:35:09.280515+00	507	Iaer object (507)	3		12	1
2511	2018-11-16 05:35:09.288127+00	506	Iaer object (506)	3		12	1
2512	2018-11-16 05:35:09.297147+00	505	Iaer object (505)	3		12	1
2513	2018-11-16 05:35:09.319081+00	504	Iaer object (504)	3		12	1
2514	2018-11-16 05:35:09.326198+00	503	Iaer object (503)	3		12	1
2515	2018-11-16 05:35:09.334212+00	502	Iaer object (502)	3		12	1
2516	2018-11-16 05:35:09.341399+00	501	Iaer object (501)	3		12	1
2517	2018-11-16 05:35:09.361789+00	500	Iaer object (500)	3		12	1
2518	2018-11-16 05:35:09.373655+00	499	Iaer object (499)	3		12	1
2519	2018-11-16 05:35:09.38715+00	498	Iaer object (498)	3		12	1
2520	2018-11-16 05:35:09.395235+00	497	Iaer object (497)	3		12	1
2521	2018-11-16 05:35:09.402949+00	496	Iaer object (496)	3		12	1
2522	2018-11-16 05:35:09.415412+00	495	Iaer object (495)	3		12	1
2523	2018-11-16 05:35:09.424203+00	494	Iaer object (494)	3		12	1
2524	2018-11-16 05:35:09.432157+00	493	Iaer object (493)	3		12	1
2525	2018-11-16 05:35:09.441698+00	492	Iaer object (492)	3		12	1
2526	2018-11-16 05:35:09.453401+00	491	Iaer object (491)	3		12	1
2527	2018-11-16 05:35:09.474203+00	490	Iaer object (490)	3		12	1
2528	2018-11-16 05:35:09.485287+00	489	Iaer object (489)	3		12	1
2529	2018-11-16 05:35:09.496405+00	488	Iaer object (488)	3		12	1
2530	2018-11-16 05:35:09.508428+00	487	Iaer object (487)	3		12	1
2531	2018-11-16 05:35:09.520956+00	486	Iaer object (486)	3		12	1
2532	2018-11-16 05:35:09.53755+00	485	Iaer object (485)	3		12	1
2533	2018-11-16 05:35:09.550851+00	484	Iaer object (484)	3		12	1
2534	2018-11-16 05:35:09.561163+00	483	Iaer object (483)	3		12	1
2535	2018-11-16 05:35:09.574451+00	482	Iaer object (482)	3		12	1
2536	2018-11-16 05:35:09.584579+00	481	Iaer object (481)	3		12	1
2537	2018-11-16 05:35:09.612781+00	480	Iaer object (480)	3		12	1
2538	2018-11-16 05:35:09.636297+00	479	Iaer object (479)	3		12	1
2539	2018-11-16 05:35:09.648515+00	478	Iaer object (478)	3		12	1
2540	2018-11-16 05:35:09.660507+00	477	Iaer object (477)	3		12	1
2541	2018-11-16 05:35:09.681249+00	476	Iaer object (476)	3		12	1
2542	2018-11-16 05:35:09.696584+00	475	Iaer object (475)	3		12	1
2543	2018-11-16 05:35:09.707787+00	474	Iaer object (474)	3		12	1
2544	2018-11-16 05:35:09.718732+00	473	Iaer object (473)	3		12	1
2545	2018-11-16 05:35:09.729426+00	472	Iaer object (472)	3		12	1
2546	2018-11-16 05:35:09.740493+00	471	Iaer object (471)	3		12	1
2547	2018-11-16 05:35:09.748204+00	470	Iaer object (470)	3		12	1
2548	2018-11-16 05:35:09.756079+00	469	Iaer object (469)	3		12	1
2549	2018-11-16 05:35:09.77517+00	468	Iaer object (468)	3		12	1
2550	2018-11-16 05:35:09.794865+00	467	Iaer object (467)	3		12	1
2551	2018-11-16 05:35:09.807092+00	466	Iaer object (466)	3		12	1
2552	2018-11-16 05:35:09.843234+00	465	Iaer object (465)	3		12	1
2553	2018-11-16 05:35:09.858326+00	464	Iaer object (464)	3		12	1
2554	2018-11-16 05:35:09.871488+00	463	Iaer object (463)	3		12	1
2555	2018-11-16 05:35:09.88479+00	462	Iaer object (462)	3		12	1
2556	2018-11-16 05:35:09.896355+00	461	Iaer object (461)	3		12	1
2557	2018-11-16 05:35:09.931622+00	460	Iaer object (460)	3		12	1
2558	2018-11-16 05:35:09.955312+00	459	Iaer object (459)	3		12	1
2559	2018-11-16 05:35:09.970581+00	458	Iaer object (458)	3		12	1
2560	2018-11-16 05:35:09.987738+00	457	Iaer object (457)	3		12	1
2561	2018-11-16 05:35:09.999441+00	456	Iaer object (456)	3		12	1
2562	2018-11-16 05:35:10.017993+00	455	Iaer object (455)	3		12	1
2563	2018-11-16 05:35:10.02982+00	454	Iaer object (454)	3		12	1
2564	2018-11-16 05:35:10.041493+00	453	Iaer object (453)	3		12	1
2565	2018-11-16 05:35:10.053619+00	452	Iaer object (452)	3		12	1
2566	2018-11-16 05:35:10.065631+00	451	Iaer object (451)	3		12	1
2567	2018-11-16 05:35:10.078476+00	450	Iaer object (450)	3		12	1
2568	2018-11-16 05:35:10.090684+00	449	Iaer object (449)	3		12	1
2569	2018-11-16 05:35:10.105724+00	448	Iaer object (448)	3		12	1
2570	2018-11-16 05:35:10.116323+00	447	Iaer object (447)	3		12	1
2571	2018-11-16 05:35:10.129681+00	446	Iaer object (446)	3		12	1
2572	2018-11-16 05:35:10.13969+00	445	Iaer object (445)	3		12	1
2573	2018-11-16 05:35:10.149468+00	444	Iaer object (444)	3		12	1
2574	2018-11-16 05:35:10.1611+00	443	Iaer object (443)	3		12	1
2575	2018-11-16 05:35:10.173709+00	442	Iaer object (442)	3		12	1
2576	2018-11-16 05:35:10.187197+00	441	Iaer object (441)	3		12	1
2577	2018-11-16 05:35:10.200963+00	440	Iaer object (440)	3		12	1
2578	2018-11-16 05:35:10.213473+00	439	Iaer object (439)	3		12	1
2579	2018-11-16 05:35:10.227036+00	438	Iaer object (438)	3		12	1
2580	2018-11-16 05:35:10.256741+00	437	Iaer object (437)	3		12	1
2581	2018-11-16 05:35:10.268279+00	436	Iaer object (436)	3		12	1
2582	2018-11-16 05:35:10.282138+00	435	Iaer object (435)	3		12	1
2583	2018-11-16 05:35:10.294224+00	434	Iaer object (434)	3		12	1
2584	2018-11-16 05:35:10.307233+00	433	Iaer object (433)	3		12	1
2585	2018-11-16 05:35:10.319345+00	432	Iaer object (432)	3		12	1
2586	2018-11-16 05:35:10.331506+00	431	Iaer object (431)	3		12	1
2587	2018-11-16 05:35:10.341966+00	430	Iaer object (430)	3		12	1
2588	2018-11-16 05:35:10.355704+00	429	Iaer object (429)	3		12	1
2589	2018-11-16 05:35:10.366209+00	428	Iaer object (428)	3		12	1
2590	2018-11-16 05:35:10.376273+00	427	Iaer object (427)	3		12	1
2591	2018-11-16 05:35:10.390074+00	426	Iaer object (426)	3		12	1
2592	2018-11-16 05:35:10.404445+00	425	Iaer object (425)	3		12	1
2593	2018-11-16 05:35:10.413483+00	424	Iaer object (424)	3		12	1
2594	2018-11-16 05:35:10.429077+00	423	Iaer object (423)	3		12	1
2595	2018-11-16 05:35:10.439504+00	422	Iaer object (422)	3		12	1
2596	2018-11-16 05:35:10.449645+00	421	Iaer object (421)	3		12	1
2597	2018-11-16 05:35:10.459348+00	420	Iaer object (420)	3		12	1
2598	2018-11-16 05:35:10.470157+00	419	Iaer object (419)	3		12	1
2599	2018-11-16 05:35:10.480179+00	418	Iaer object (418)	3		12	1
2600	2018-11-16 05:35:10.49112+00	417	Iaer object (417)	3		12	1
2601	2018-11-16 05:35:10.501964+00	416	Iaer object (416)	3		12	1
2602	2018-11-16 05:35:10.511875+00	415	Iaer object (415)	3		12	1
2603	2018-11-16 05:35:10.522998+00	414	Iaer object (414)	3		12	1
2604	2018-11-16 05:35:10.533528+00	413	Iaer object (413)	3		12	1
2605	2018-11-16 05:35:10.544464+00	412	Iaer object (412)	3		12	1
2606	2018-11-16 05:35:10.552246+00	411	Iaer object (411)	3		12	1
2607	2018-11-16 05:35:10.560629+00	410	Iaer object (410)	3		12	1
2608	2018-11-16 05:35:10.571104+00	409	Iaer object (409)	3		12	1
2609	2018-11-16 05:35:10.578846+00	408	Iaer object (408)	3		12	1
2610	2018-11-16 05:35:10.587238+00	407	Iaer object (407)	3		12	1
2611	2018-11-16 05:35:10.59805+00	406	Iaer object (406)	3		12	1
2612	2018-11-16 05:35:10.605073+00	405	Iaer object (405)	3		12	1
2613	2018-11-16 05:35:10.612361+00	404	Iaer object (404)	3		12	1
2614	2018-11-16 05:35:10.619738+00	403	Iaer object (403)	3		12	1
2615	2018-11-16 05:35:10.62837+00	402	Iaer object (402)	3		12	1
2616	2018-11-16 05:35:10.635368+00	401	Iaer object (401)	3		12	1
2617	2018-11-16 05:35:10.644542+00	400	Iaer object (400)	3		12	1
2618	2018-11-16 05:35:10.654339+00	399	Iaer object (399)	3		12	1
2619	2018-11-16 05:35:10.663591+00	398	Iaer object (398)	3		12	1
2620	2018-11-16 05:35:10.671743+00	397	Iaer object (397)	3		12	1
2621	2018-11-16 05:35:10.678878+00	396	Iaer object (396)	3		12	1
2622	2018-11-16 05:35:10.68947+00	395	Iaer object (395)	3		12	1
2623	2018-11-16 05:35:10.696658+00	394	Iaer object (394)	3		12	1
2624	2018-11-16 05:35:10.704095+00	393	Iaer object (393)	3		12	1
2625	2018-11-16 05:35:10.71105+00	392	Iaer object (392)	3		12	1
2626	2018-11-16 05:35:10.721387+00	391	Iaer object (391)	3		12	1
2627	2018-11-16 05:35:10.728665+00	390	Iaer object (390)	3		12	1
2628	2018-11-16 05:35:10.736316+00	389	Iaer object (389)	3		12	1
2629	2018-11-16 05:35:10.743568+00	388	Iaer object (388)	3		12	1
2630	2018-11-16 05:35:10.754438+00	387	Iaer object (387)	3		12	1
2631	2018-11-16 05:35:10.763526+00	386	Iaer object (386)	3		12	1
2632	2018-11-16 05:35:10.770596+00	385	Iaer object (385)	3		12	1
2633	2018-11-16 05:35:10.781098+00	384	Iaer object (384)	3		12	1
2634	2018-11-16 05:35:10.78869+00	383	Iaer object (383)	3		12	1
2635	2018-11-16 05:35:10.796627+00	382	Iaer object (382)	3		12	1
2636	2018-11-16 05:35:10.803506+00	381	Iaer object (381)	3		12	1
2637	2018-11-16 05:35:10.811798+00	380	Iaer object (380)	3		12	1
2638	2018-11-16 05:35:10.823605+00	379	Iaer object (379)	3		12	1
2639	2018-11-16 05:35:10.832477+00	378	Iaer object (378)	3		12	1
2640	2018-11-16 05:35:10.84032+00	377	Iaer object (377)	3		12	1
2641	2018-11-16 05:35:10.847711+00	376	Iaer object (376)	3		12	1
2642	2018-11-16 05:35:10.854994+00	375	Iaer object (375)	3		12	1
2643	2018-11-16 05:35:10.862127+00	374	Iaer object (374)	3		12	1
2644	2018-11-16 05:35:10.869741+00	373	Iaer object (373)	3		12	1
2645	2018-11-16 05:35:10.87929+00	372	Iaer object (372)	3		12	1
2646	2018-11-16 05:35:10.886949+00	371	Iaer object (371)	3		12	1
2647	2018-11-16 05:35:10.895336+00	370	Iaer object (370)	3		12	1
2648	2018-11-16 05:35:10.906136+00	369	Iaer object (369)	3		12	1
2649	2018-11-16 05:35:10.913455+00	368	Iaer object (368)	3		12	1
2650	2018-11-16 05:35:10.928118+00	367	Iaer object (367)	3		12	1
2651	2018-11-16 05:35:10.949175+00	366	Iaer object (366)	3		12	1
2652	2018-11-16 05:35:10.974402+00	365	Iaer object (365)	3		12	1
2653	2018-11-16 05:35:10.984456+00	364	Iaer object (364)	3		12	1
2654	2018-11-16 05:35:10.999354+00	363	Iaer object (363)	3		12	1
2655	2018-11-16 05:35:11.009431+00	362	Iaer object (362)	3		12	1
2656	2018-11-16 05:35:11.017003+00	361	Iaer object (361)	3		12	1
2657	2018-11-16 05:35:11.028219+00	360	Iaer object (360)	3		12	1
2658	2018-11-16 05:35:11.04104+00	359	Iaer object (359)	3		12	1
2659	2018-11-16 05:35:11.050844+00	358	Iaer object (358)	3		12	1
2660	2018-11-16 05:35:11.061392+00	357	Iaer object (357)	3		12	1
2661	2018-11-16 05:35:11.068795+00	356	Iaer object (356)	3		12	1
2662	2018-11-16 05:35:11.076307+00	355	Iaer object (355)	3		12	1
2663	2018-11-16 05:35:11.091408+00	354	Iaer object (354)	3		12	1
2664	2018-11-16 05:35:11.1012+00	353	Iaer object (353)	3		12	1
2665	2018-11-16 05:35:11.112107+00	352	Iaer object (352)	3		12	1
2666	2018-11-16 05:35:11.129932+00	351	Iaer object (351)	3		12	1
2667	2018-11-16 05:35:11.142533+00	350	Iaer object (350)	3		12	1
2668	2018-11-16 05:35:11.153321+00	349	Iaer object (349)	3		12	1
2669	2018-11-16 05:35:11.163544+00	348	Iaer object (348)	3		12	1
2670	2018-11-16 05:35:11.173333+00	347	Iaer object (347)	3		12	1
2671	2018-11-16 05:35:11.181468+00	346	Iaer object (346)	3		12	1
2672	2018-11-16 05:35:11.189615+00	345	Iaer object (345)	3		12	1
2673	2018-11-16 05:35:11.19945+00	344	Iaer object (344)	3		12	1
2674	2018-11-16 05:35:11.207111+00	343	Iaer object (343)	3		12	1
2675	2018-11-16 05:35:11.215323+00	342	Iaer object (342)	3		12	1
2676	2018-11-16 05:35:11.229283+00	341	Iaer object (341)	3		12	1
2677	2018-11-16 05:35:11.238896+00	340	Iaer object (340)	3		12	1
2678	2018-11-16 05:35:11.252347+00	339	Iaer object (339)	3		12	1
2679	2018-11-16 05:35:11.270436+00	338	Iaer object (338)	3		12	1
2680	2018-11-16 05:35:11.283139+00	337	Iaer object (337)	3		12	1
2681	2018-11-16 05:35:11.290427+00	336	Iaer object (336)	3		12	1
2682	2018-11-16 05:35:11.297592+00	335	Iaer object (335)	3		12	1
2683	2018-11-16 05:35:11.30497+00	334	Iaer object (334)	3		12	1
2684	2018-11-16 05:35:11.315926+00	333	Iaer object (333)	3		12	1
2685	2018-11-16 05:35:11.323556+00	332	Iaer object (332)	3		12	1
2686	2018-11-16 05:35:11.33236+00	331	Iaer object (331)	3		12	1
2687	2018-11-16 05:35:11.347774+00	330	Iaer object (330)	3		12	1
2688	2018-11-16 05:35:11.355463+00	329	Iaer object (329)	3		12	1
2689	2018-11-16 05:35:11.362561+00	328	Iaer object (328)	3		12	1
2690	2018-11-16 05:35:11.370836+00	327	Iaer object (327)	3		12	1
2691	2018-11-16 05:35:11.379569+00	326	Iaer object (326)	3		12	1
2692	2018-11-16 05:35:11.389047+00	325	Iaer object (325)	3		12	1
2693	2018-11-16 05:35:11.398634+00	324	Iaer object (324)	3		12	1
2694	2018-11-16 05:35:11.413299+00	323	Iaer object (323)	3		12	1
2695	2018-11-16 05:35:11.421868+00	322	Iaer object (322)	3		12	1
2696	2018-11-16 05:35:11.432865+00	321	Iaer object (321)	3		12	1
2697	2018-11-16 05:35:11.465491+00	320	Iaer object (320)	3		12	1
2698	2018-11-16 05:35:11.477051+00	319	Iaer object (319)	3		12	1
2699	2018-11-16 05:35:11.487829+00	318	Iaer object (318)	3		12	1
2700	2018-11-16 05:35:11.498489+00	317	Iaer object (317)	3		12	1
2701	2018-11-16 05:35:11.510185+00	316	Iaer object (316)	3		12	1
2702	2018-11-16 05:35:11.520606+00	315	Iaer object (315)	3		12	1
2703	2018-11-16 05:35:11.539253+00	314	Iaer object (314)	3		12	1
2704	2018-11-16 05:35:11.549505+00	313	Iaer object (313)	3		12	1
2705	2018-11-16 05:35:11.560004+00	312	Iaer object (312)	3		12	1
2706	2018-11-16 05:35:11.580043+00	311	Iaer object (311)	3		12	1
2707	2018-11-16 05:35:11.589748+00	310	Iaer object (310)	3		12	1
2708	2018-11-16 05:35:11.600167+00	309	Iaer object (309)	3		12	1
2709	2018-11-16 05:35:11.616648+00	308	Iaer object (308)	3		12	1
2710	2018-11-16 05:35:11.635312+00	307	Iaer object (307)	3		12	1
2711	2018-11-16 05:35:11.648601+00	306	Iaer object (306)	3		12	1
2712	2018-11-16 05:35:11.662617+00	305	Iaer object (305)	3		12	1
2713	2018-11-16 05:35:11.671137+00	304	Iaer object (304)	3		12	1
2714	2018-11-16 05:35:11.67908+00	303	Iaer object (303)	3		12	1
2715	2018-11-16 05:35:11.689431+00	302	Iaer object (302)	3		12	1
2716	2018-11-16 05:35:11.699771+00	301	Iaer object (301)	3		12	1
2717	2018-11-16 05:35:11.71009+00	300	Iaer object (300)	3		12	1
2718	2018-11-16 05:35:11.721388+00	299	Iaer object (299)	3		12	1
2719	2018-11-16 05:35:11.733453+00	298	Iaer object (298)	3		12	1
2720	2018-11-16 05:35:11.744498+00	297	Iaer object (297)	3		12	1
2721	2018-11-16 05:35:11.755905+00	296	Iaer object (296)	3		12	1
2722	2018-11-16 05:35:11.763739+00	295	Iaer object (295)	3		12	1
2723	2018-11-16 05:35:11.771518+00	294	Iaer object (294)	3		12	1
2724	2018-11-16 05:35:11.786545+00	293	Iaer object (293)	3		12	1
2725	2018-11-16 05:35:11.797927+00	292	Iaer object (292)	3		12	1
2726	2018-11-16 05:35:11.810835+00	291	Iaer object (291)	3		12	1
2727	2018-11-16 05:35:11.820849+00	290	Iaer object (290)	3		12	1
2728	2018-11-16 05:35:11.831225+00	289	Iaer object (289)	3		12	1
2729	2018-11-16 05:35:11.842475+00	288	Iaer object (288)	3		12	1
2730	2018-11-16 05:35:11.852934+00	287	Iaer object (287)	3		12	1
2731	2018-11-16 05:35:11.863534+00	286	Iaer object (286)	3		12	1
2732	2018-11-16 05:35:11.879031+00	285	Iaer object (285)	3		12	1
2733	2018-11-16 05:35:11.890587+00	284	Iaer object (284)	3		12	1
2734	2018-11-16 05:35:11.903991+00	283	Iaer object (283)	3		12	1
2735	2018-11-16 05:35:11.912198+00	282	Iaer object (282)	3		12	1
2736	2018-11-16 05:35:11.935194+00	281	Iaer object (281)	3		12	1
2737	2018-11-16 05:35:11.945392+00	280	Iaer object (280)	3		12	1
2738	2018-11-16 05:35:11.953536+00	279	Iaer object (279)	3		12	1
2739	2018-11-16 05:35:11.972925+00	278	Iaer object (278)	3		12	1
2740	2018-11-16 05:35:11.989343+00	277	Iaer object (277)	3		12	1
2741	2018-11-16 05:35:12.004692+00	276	Iaer object (276)	3		12	1
2742	2018-11-16 05:35:12.019684+00	275	Iaer object (275)	3		12	1
2743	2018-11-16 05:35:12.0311+00	274	Iaer object (274)	3		12	1
2744	2018-11-16 05:35:12.04288+00	273	Iaer object (273)	3		12	1
2745	2018-11-16 05:35:12.051272+00	272	Iaer object (272)	3		12	1
2746	2018-11-16 05:35:12.059714+00	271	Iaer object (271)	3		12	1
2747	2018-11-16 05:35:12.06744+00	270	Iaer object (270)	3		12	1
2748	2018-11-16 05:35:12.077465+00	269	Iaer object (269)	3		12	1
2749	2018-11-16 05:35:12.088513+00	268	Iaer object (268)	3		12	1
2750	2018-11-16 05:35:12.099818+00	267	Iaer object (267)	3		12	1
2751	2018-11-16 05:35:12.14106+00	266	Iaer object (266)	3		12	1
2752	2018-11-16 05:35:12.18352+00	265	Iaer object (265)	3		12	1
2753	2018-11-16 05:35:12.194248+00	264	Iaer object (264)	3		12	1
2754	2018-11-16 05:35:12.208386+00	263	Iaer object (263)	3		12	1
2755	2018-11-16 05:35:12.217898+00	262	Iaer object (262)	3		12	1
2756	2018-11-16 05:35:12.231629+00	261	Iaer object (261)	3		12	1
2757	2018-11-16 05:35:12.242863+00	260	Iaer object (260)	3		12	1
2758	2018-11-16 05:35:12.253113+00	259	Iaer object (259)	3		12	1
2759	2018-11-16 05:35:12.266366+00	258	Iaer object (258)	3		12	1
2760	2018-11-16 05:35:12.277535+00	257	Iaer object (257)	3		12	1
2761	2018-11-16 05:35:12.290878+00	256	Iaer object (256)	3		12	1
2762	2018-11-16 05:35:12.300504+00	255	Iaer object (255)	3		12	1
2763	2018-11-16 05:35:12.308276+00	254	Iaer object (254)	3		12	1
2764	2018-11-16 05:35:12.328126+00	253	Iaer object (253)	3		12	1
2765	2018-11-16 05:35:12.335408+00	252	Iaer object (252)	3		12	1
2766	2018-11-16 05:35:12.342876+00	251	Iaer object (251)	3		12	1
2767	2018-11-16 05:35:12.35246+00	250	Iaer object (250)	3		12	1
2768	2018-11-16 05:35:12.359994+00	249	Iaer object (249)	3		12	1
2769	2018-11-16 05:35:12.36778+00	248	Iaer object (248)	3		12	1
2770	2018-11-16 05:35:12.375291+00	247	Iaer object (247)	3		12	1
2771	2018-11-16 05:35:12.387957+00	246	Iaer object (246)	3		12	1
2772	2018-11-16 05:35:12.39646+00	245	Iaer object (245)	3		12	1
2773	2018-11-16 05:35:12.40378+00	244	Iaer object (244)	3		12	1
2774	2018-11-16 05:35:12.418821+00	243	Iaer object (243)	3		12	1
2775	2018-11-16 05:35:12.426281+00	242	Iaer object (242)	3		12	1
2776	2018-11-16 05:35:12.433227+00	241	Iaer object (241)	3		12	1
2777	2018-11-16 05:35:12.44485+00	240	Iaer object (240)	3		12	1
2778	2018-11-16 05:35:12.452074+00	239	Iaer object (239)	3		12	1
2779	2018-11-16 05:35:12.459942+00	238	Iaer object (238)	3		12	1
2780	2018-11-16 05:35:12.467719+00	237	Iaer object (237)	3		12	1
2781	2018-11-16 05:35:12.482857+00	236	Iaer object (236)	3		12	1
2782	2018-11-16 05:35:12.493265+00	235	Iaer object (235)	3		12	1
2783	2018-11-16 05:35:12.500769+00	234	Iaer object (234)	3		12	1
2784	2018-11-16 05:35:12.508591+00	233	Iaer object (233)	3		12	1
2785	2018-11-16 05:35:12.51574+00	232	Iaer object (232)	3		12	1
2786	2018-11-16 05:35:12.52415+00	231	Iaer object (231)	3		12	1
2787	2018-11-16 05:35:12.533696+00	230	Iaer object (230)	3		12	1
2788	2018-11-16 05:35:12.543448+00	229	Iaer object (229)	3		12	1
2789	2018-11-16 05:35:12.551703+00	228	Iaer object (228)	3		12	1
2790	2018-11-16 05:35:12.559277+00	227	Iaer object (227)	3		12	1
2791	2018-11-16 05:35:12.569329+00	226	Iaer object (226)	3		12	1
2792	2018-11-16 05:35:12.576835+00	225	Iaer object (225)	3		12	1
2793	2018-11-16 05:35:12.584175+00	224	Iaer object (224)	3		12	1
2794	2018-11-16 05:35:12.592022+00	223	Iaer object (223)	3		12	1
2795	2018-11-16 05:35:12.600241+00	222	Iaer object (222)	3		12	1
2796	2018-11-16 05:35:12.60984+00	221	Iaer object (221)	3		12	1
2797	2018-11-16 05:35:12.623851+00	220	Iaer object (220)	3		12	1
2798	2018-11-16 05:35:12.634095+00	219	Iaer object (219)	3		12	1
2799	2018-11-16 05:35:12.647636+00	218	Iaer object (218)	3		12	1
2800	2018-11-16 05:35:12.656872+00	217	Iaer object (217)	3		12	1
2801	2018-11-16 05:35:12.671765+00	216	Iaer object (216)	3		12	1
2802	2018-11-16 05:35:12.679361+00	215	Iaer object (215)	3		12	1
2803	2018-11-16 05:35:12.688209+00	214	Iaer object (214)	3		12	1
2804	2018-11-16 05:35:12.697982+00	213	Iaer object (213)	3		12	1
2805	2018-11-16 05:35:12.705685+00	212	Iaer object (212)	3		12	1
2806	2018-11-16 05:35:12.712691+00	211	Iaer object (211)	3		12	1
2807	2018-11-16 05:35:12.726666+00	210	Iaer object (210)	3		12	1
2808	2018-11-16 05:35:12.735916+00	209	Iaer object (209)	3		12	1
2809	2018-11-16 05:35:12.746845+00	208	Iaer object (208)	3		12	1
2810	2018-11-16 05:35:12.756828+00	207	Iaer object (207)	3		12	1
2811	2018-11-16 05:35:12.764395+00	206	Iaer object (206)	3		12	1
2812	2018-11-16 05:35:12.774007+00	205	Iaer object (205)	3		12	1
2813	2018-11-16 05:35:12.786469+00	204	Iaer object (204)	3		12	1
2814	2018-11-16 05:35:12.793773+00	203	Iaer object (203)	3		12	1
2815	2018-11-16 05:35:12.801334+00	202	Iaer object (202)	3		12	1
2816	2018-11-16 05:35:12.809104+00	201	Iaer object (201)	3		12	1
2817	2018-11-16 05:35:12.81936+00	200	Iaer object (200)	3		12	1
2818	2018-11-16 05:35:12.832028+00	199	Iaer object (199)	3		12	1
2819	2018-11-16 05:35:12.846655+00	198	Iaer object (198)	3		12	1
2820	2018-11-16 05:35:12.854171+00	197	Iaer object (197)	3		12	1
2821	2018-11-16 05:35:12.861953+00	196	Iaer object (196)	3		12	1
2822	2018-11-16 05:35:12.872838+00	195	Iaer object (195)	3		12	1
2823	2018-11-16 05:35:12.882217+00	194	Iaer object (194)	3		12	1
2824	2018-11-16 05:35:12.890536+00	193	Iaer object (193)	3		12	1
2825	2018-11-16 05:35:12.898052+00	192	Iaer object (192)	3		12	1
2826	2018-11-16 05:35:12.910951+00	191	Iaer object (191)	3		12	1
2827	2018-11-16 05:35:12.91853+00	190	Iaer object (190)	3		12	1
2828	2018-11-16 05:35:12.92611+00	189	Iaer object (189)	3		12	1
2829	2018-11-16 05:35:12.935438+00	188	Iaer object (188)	3		12	1
2830	2018-11-16 05:35:12.944992+00	187	Iaer object (187)	3		12	1
2831	2018-11-16 05:35:12.952371+00	186	Iaer object (186)	3		12	1
2832	2018-11-16 05:35:12.963104+00	185	Iaer object (185)	3		12	1
2833	2018-11-16 05:35:12.974115+00	184	Iaer object (184)	3		12	1
2834	2018-11-16 05:35:12.986928+00	183	Iaer object (183)	3		12	1
2835	2018-11-16 05:35:12.99724+00	182	Iaer object (182)	3		12	1
2836	2018-11-16 05:35:13.004811+00	181	Iaer object (181)	3		12	1
2837	2018-11-16 05:35:13.012766+00	180	Iaer object (180)	3		12	1
2838	2018-11-16 05:35:13.023397+00	179	Iaer object (179)	3		12	1
2839	2018-11-16 05:35:13.034164+00	178	Iaer object (178)	3		12	1
2840	2018-11-16 05:35:13.045783+00	177	Iaer object (177)	3		12	1
2841	2018-11-16 05:35:13.055537+00	176	Iaer object (176)	3		12	1
2842	2018-11-16 05:35:13.06787+00	175	Iaer object (175)	3		12	1
2843	2018-11-16 05:35:13.079224+00	174	Iaer object (174)	3		12	1
2844	2018-11-16 05:35:13.090747+00	173	Iaer object (173)	3		12	1
2845	2018-11-16 05:35:13.101566+00	172	Iaer object (172)	3		12	1
2846	2018-11-16 05:35:13.112536+00	171	Iaer object (171)	3		12	1
2847	2018-11-16 05:35:13.133348+00	170	Iaer object (170)	3		12	1
2848	2018-11-16 05:35:13.145959+00	169	Iaer object (169)	3		12	1
2849	2018-11-16 05:35:13.157679+00	168	Iaer object (168)	3		12	1
2850	2018-11-16 05:35:13.165342+00	167	Iaer object (167)	3		12	1
2851	2018-11-16 05:35:13.173428+00	166	Iaer object (166)	3		12	1
2852	2018-11-16 05:35:13.18356+00	165	Iaer object (165)	3		12	1
2853	2018-11-16 05:35:13.193535+00	164	Iaer object (164)	3		12	1
2854	2018-11-16 05:35:13.203474+00	163	Iaer object (163)	3		12	1
2855	2018-11-16 05:35:13.211435+00	162	Iaer object (162)	3		12	1
2856	2018-11-16 05:35:13.219175+00	161	Iaer object (161)	3		12	1
2857	2018-11-16 05:35:13.228902+00	160	Iaer object (160)	3		12	1
2858	2018-11-16 05:35:13.264989+00	159	Iaer object (159)	3		12	1
2859	2018-11-16 05:35:13.283389+00	158	Iaer object (158)	3		12	1
2860	2018-11-16 05:35:13.292442+00	157	Iaer object (157)	3		12	1
2861	2018-11-16 05:35:13.300321+00	156	Iaer object (156)	3		12	1
2862	2018-11-16 05:35:13.314376+00	155	Iaer object (155)	3		12	1
2863	2018-11-16 05:35:13.324486+00	154	Iaer object (154)	3		12	1
2864	2018-11-16 05:35:13.339187+00	153	Iaer object (153)	3		12	1
2865	2018-11-16 05:35:13.349778+00	152	Iaer object (152)	3		12	1
2866	2018-11-16 05:35:13.36038+00	151	Iaer object (151)	3		12	1
2867	2018-11-16 05:35:13.374125+00	150	Iaer object (150)	3		12	1
2868	2018-11-16 05:35:13.38223+00	149	Iaer object (149)	3		12	1
2869	2018-11-16 05:35:13.390165+00	148	Iaer object (148)	3		12	1
2870	2018-11-16 05:35:13.399906+00	147	Iaer object (147)	3		12	1
2871	2018-11-16 05:35:13.407669+00	146	Iaer object (146)	3		12	1
2872	2018-11-16 05:35:13.417323+00	145	Iaer object (145)	3		12	1
2873	2018-11-16 05:35:13.433854+00	144	Iaer object (144)	3		12	1
2874	2018-11-16 05:35:13.446742+00	143	Iaer object (143)	3		12	1
2875	2018-11-16 05:35:13.457543+00	142	Iaer object (142)	3		12	1
2876	2018-11-16 05:35:13.467734+00	141	Iaer object (141)	3		12	1
2877	2018-11-16 05:35:13.477868+00	140	Iaer object (140)	3		12	1
2878	2018-11-16 05:35:13.48869+00	139	Iaer object (139)	3		12	1
2879	2018-11-16 05:35:13.500356+00	138	Iaer object (138)	3		12	1
2880	2018-11-16 05:35:13.510652+00	137	Iaer object (137)	3		12	1
2881	2018-11-16 05:35:13.522707+00	136	Iaer object (136)	3		12	1
2882	2018-11-16 05:35:13.532899+00	135	Iaer object (135)	3		12	1
2883	2018-11-16 05:35:13.543488+00	134	Iaer object (134)	3		12	1
2884	2018-11-16 05:35:13.555542+00	133	Iaer object (133)	3		12	1
2885	2018-11-16 05:35:13.572002+00	132	Iaer object (132)	3		12	1
2886	2018-11-16 05:35:13.588113+00	131	Iaer object (131)	3		12	1
2887	2018-11-16 05:35:13.598968+00	130	Iaer object (130)	3		12	1
2888	2018-11-16 05:35:13.606694+00	129	Iaer object (129)	3		12	1
2889	2018-11-16 05:35:13.61458+00	128	Iaer object (128)	3		12	1
2890	2018-11-16 05:35:13.623793+00	127	Iaer object (127)	3		12	1
2891	2018-11-16 05:35:13.630945+00	126	Iaer object (126)	3		12	1
2892	2018-11-16 05:35:13.637953+00	125	Iaer object (125)	3		12	1
2893	2018-11-16 05:35:13.65188+00	124	Iaer object (124)	3		12	1
2894	2018-11-16 05:35:13.659167+00	123	Iaer object (123)	3		12	1
2895	2018-11-16 05:35:13.66782+00	122	Iaer object (122)	3		12	1
2896	2018-11-16 05:35:13.677887+00	121	Iaer object (121)	3		12	1
2897	2018-11-16 05:35:13.684754+00	120	Iaer object (120)	3		12	1
2898	2018-11-16 05:35:13.692725+00	119	Iaer object (119)	3		12	1
2899	2018-11-16 05:35:13.700116+00	118	Iaer object (118)	3		12	1
2900	2018-11-16 05:35:13.709369+00	117	Iaer object (117)	3		12	1
2901	2018-11-16 05:35:13.718912+00	116	Iaer object (116)	3		12	1
2902	2018-11-16 05:35:13.725887+00	115	Iaer object (115)	3		12	1
2903	2018-11-16 05:35:13.732771+00	114	Iaer object (114)	3		12	1
2904	2018-11-16 05:35:13.740703+00	113	Iaer object (113)	3		12	1
2905	2018-11-16 05:35:13.748934+00	112	Iaer object (112)	3		12	1
2906	2018-11-16 05:35:13.760071+00	111	Iaer object (111)	3		12	1
2907	2018-11-16 05:35:13.767676+00	110	Iaer object (110)	3		12	1
2908	2018-11-16 05:35:13.774946+00	109	Iaer object (109)	3		12	1
2909	2018-11-16 05:35:13.782036+00	108	Iaer object (108)	3		12	1
2910	2018-11-16 05:35:13.789398+00	107	Iaer object (107)	3		12	1
2911	2018-11-16 05:35:13.796578+00	106	Iaer object (106)	3		12	1
2912	2018-11-16 05:35:13.80596+00	105	Iaer object (105)	3		12	1
2913	2018-11-16 05:35:13.813087+00	104	Iaer object (104)	3		12	1
2914	2018-11-16 05:35:13.82004+00	103	Iaer object (103)	3		12	1
2915	2018-11-16 05:35:13.827515+00	102	Iaer object (102)	3		12	1
2916	2018-11-16 05:35:13.836693+00	101	Iaer object (101)	3		12	1
2917	2018-11-16 05:35:13.843353+00	100	Iaer object (100)	3		12	1
2918	2018-11-16 05:35:13.852514+00	99	Iaer object (99)	3		12	1
2919	2018-11-16 05:35:13.860516+00	98	Iaer object (98)	3		12	1
2920	2018-11-16 05:35:13.867894+00	97	Iaer object (97)	3		12	1
2921	2018-11-16 05:35:13.874737+00	96	Iaer object (96)	3		12	1
2922	2018-11-16 05:35:13.881328+00	95	Iaer object (95)	3		12	1
2923	2018-11-16 05:35:13.891094+00	94	Iaer object (94)	3		12	1
2924	2018-11-16 05:35:13.898472+00	93	Iaer object (93)	3		12	1
2925	2018-11-16 05:35:13.912033+00	92	Iaer object (92)	3		12	1
2926	2018-11-16 05:35:13.925771+00	91	Iaer object (91)	3		12	1
2927	2018-11-16 05:35:13.936474+00	90	Iaer object (90)	3		12	1
2928	2018-11-16 05:35:13.944395+00	89	Iaer object (89)	3		12	1
2929	2018-11-16 05:35:13.953062+00	88	Iaer object (88)	3		12	1
2930	2018-11-16 05:35:13.96302+00	87	Iaer object (87)	3		12	1
2931	2018-11-16 05:35:13.970908+00	86	Iaer object (86)	3		12	1
2932	2018-11-16 05:35:13.980645+00	85	Iaer object (85)	3		12	1
2933	2018-11-16 05:35:13.993375+00	84	Iaer object (84)	3		12	1
2934	2018-11-16 05:35:14.00178+00	83	Iaer object (83)	3		12	1
2935	2018-11-16 05:35:14.009696+00	82	Iaer object (82)	3		12	1
2936	2018-11-16 05:35:14.020247+00	81	Iaer object (81)	3		12	1
2937	2018-11-16 05:35:14.027908+00	80	Iaer object (80)	3		12	1
2938	2018-11-16 05:35:14.036255+00	79	Iaer object (79)	3		12	1
2939	2018-11-16 05:35:14.047551+00	78	Iaer object (78)	3		12	1
2940	2018-11-16 05:35:14.057233+00	77	Iaer object (77)	3		12	1
2941	2018-11-16 05:35:14.065976+00	76	Iaer object (76)	3		12	1
2942	2018-11-16 05:35:14.077796+00	75	Iaer object (75)	3		12	1
2943	2018-11-16 05:35:14.091419+00	74	Iaer object (74)	3		12	1
2944	2018-11-16 05:35:14.111425+00	73	Iaer object (73)	3		12	1
2945	2018-11-16 05:35:14.119151+00	72	Iaer object (72)	3		12	1
2946	2018-11-16 05:35:14.127253+00	71	Iaer object (71)	3		12	1
2947	2018-11-16 05:35:14.139921+00	70	Iaer object (70)	3		12	1
2948	2018-11-16 05:35:14.147742+00	69	Iaer object (69)	3		12	1
2949	2018-11-16 05:35:14.16579+00	68	Iaer object (68)	3		12	1
2950	2018-11-16 05:35:14.175637+00	67	Iaer object (67)	3		12	1
2951	2018-11-16 05:35:14.182821+00	66	Iaer object (66)	3		12	1
2952	2018-11-16 05:35:14.190752+00	65	Iaer object (65)	3		12	1
2953	2018-11-16 05:35:14.20129+00	64	Iaer object (64)	3		12	1
2954	2018-11-16 05:35:14.209154+00	63	Iaer object (63)	3		12	1
2955	2018-11-16 05:35:14.216474+00	62	Iaer object (62)	3		12	1
2956	2018-11-16 05:35:14.224304+00	61	Iaer object (61)	3		12	1
2957	2018-11-16 05:35:14.233399+00	60	Iaer object (60)	3		12	1
2958	2018-11-16 05:35:14.241339+00	59	Iaer object (59)	3		12	1
2959	2018-11-16 05:35:14.257635+00	58	Iaer object (58)	3		12	1
2960	2018-11-16 05:35:14.271346+00	57	Iaer object (57)	3		12	1
2961	2018-11-16 05:35:14.283678+00	56	Iaer object (56)	3		12	1
2962	2018-11-16 05:35:14.29491+00	55	Iaer object (55)	3		12	1
2963	2018-11-16 05:35:14.302321+00	54	Iaer object (54)	3		12	1
2964	2018-11-16 05:35:14.309959+00	53	Iaer object (53)	3		12	1
2965	2018-11-16 05:35:14.320265+00	52	Iaer object (52)	3		12	1
2966	2018-11-16 05:35:14.327962+00	51	Iaer object (51)	3		12	1
2967	2018-11-16 05:35:14.335317+00	50	Iaer object (50)	3		12	1
2968	2018-11-16 05:35:14.342839+00	49	Iaer object (49)	3		12	1
2969	2018-11-16 05:35:14.358019+00	48	Iaer object (48)	3		12	1
2970	2018-11-16 05:35:14.36546+00	47	Iaer object (47)	3		12	1
2971	2018-11-16 05:35:14.373259+00	46	Iaer object (46)	3		12	1
2972	2018-11-16 05:35:14.38359+00	45	Iaer object (45)	3		12	1
2973	2018-11-16 05:35:14.391102+00	44	Iaer object (44)	3		12	1
2974	2018-11-16 05:35:14.398917+00	43	Iaer object (43)	3		12	1
2975	2018-11-16 05:35:14.409747+00	42	Iaer object (42)	3		12	1
2976	2018-11-16 05:35:14.419486+00	41	Iaer object (41)	3		12	1
2977	2018-11-16 05:35:14.427499+00	40	Iaer object (40)	3		12	1
2978	2018-11-16 05:35:14.434872+00	39	Iaer object (39)	3		12	1
2979	2018-11-16 05:35:14.461191+00	38	Iaer object (38)	3		12	1
2980	2018-11-16 05:35:14.46909+00	37	Iaer object (37)	3		12	1
2981	2018-11-16 05:35:14.478339+00	36	Iaer object (36)	3		12	1
2982	2018-11-16 05:35:14.48587+00	35	Iaer object (35)	3		12	1
2983	2018-11-16 05:35:14.493665+00	34	Iaer object (34)	3		12	1
2984	2018-11-16 05:35:14.508492+00	33	Iaer object (33)	3		12	1
2985	2018-11-16 05:35:14.51651+00	32	Iaer object (32)	3		12	1
2986	2018-11-16 05:35:14.52487+00	31	Iaer object (31)	3		12	1
2987	2018-11-16 05:35:14.535982+00	30	Iaer object (30)	3		12	1
2988	2018-11-16 05:35:14.546802+00	29	Iaer object (29)	3		12	1
2989	2018-11-16 05:35:14.56318+00	28	Iaer object (28)	3		12	1
2990	2018-11-16 05:35:14.573729+00	27	Iaer object (27)	3		12	1
2991	2018-11-16 05:35:14.584034+00	26	Iaer object (26)	3		12	1
2992	2018-11-16 05:35:14.591759+00	25	Iaer object (25)	3		12	1
2993	2018-11-16 05:35:14.604197+00	24	Iaer object (24)	3		12	1
2994	2018-11-16 05:35:14.613129+00	23	Iaer object (23)	3		12	1
2995	2018-11-16 05:35:14.621929+00	22	Iaer object (22)	3		12	1
2996	2018-11-16 05:35:14.631424+00	21	Iaer object (21)	3		12	1
2997	2018-11-16 05:35:14.639827+00	20	Iaer object (20)	3		12	1
2998	2018-11-16 05:35:14.649447+00	19	Iaer object (19)	3		12	1
2999	2018-11-16 05:35:14.657491+00	18	Iaer object (18)	3		12	1
3000	2018-11-16 05:35:14.665351+00	17	Iaer object (17)	3		12	1
3001	2018-11-16 05:35:14.675027+00	16	Iaer object (16)	3		12	1
3002	2018-11-16 05:35:14.682639+00	15	Iaer object (15)	3		12	1
3003	2018-11-16 05:35:14.691115+00	14	Iaer object (14)	3		12	1
3004	2018-11-16 05:35:14.701521+00	13	Iaer object (13)	3		12	1
3005	2018-11-16 05:35:14.710394+00	12	Iaer object (12)	3		12	1
3006	2018-11-16 05:35:14.718183+00	11	Iaer object (11)	3		12	1
3007	2018-11-16 05:35:14.730098+00	10	Iaer object (10)	3		12	1
3008	2018-11-16 05:35:14.737527+00	9	Iaer object (9)	3		12	1
3009	2018-11-16 05:35:14.745129+00	8	Iaer object (8)	3		12	1
3010	2018-11-16 05:35:14.759487+00	7	Iaer object (7)	3		12	1
3011	2018-11-16 05:35:14.770768+00	6	Iaer object (6)	3		12	1
3012	2018-11-16 05:35:14.780896+00	5	Iaer object (5)	3		12	1
3013	2018-11-16 05:35:14.78871+00	4	Iaer object (4)	3		12	1
3014	2018-11-16 05:35:14.79677+00	3	Iaer object (3)	3		12	1
3015	2018-11-16 05:35:14.806607+00	2	Iaer object (2)	3		12	1
3016	2018-11-16 05:35:14.819874+00	1	Iaer object (1)	3		12	1
3017	2018-11-16 05:49:30.198243+00	877	Iaer object (877)	2	[{"changed": {"fields": ["category"]}}]	12	1
3018	2018-11-16 05:49:53.041487+00	877	Iaer object (877)	2	[{"changed": {"fields": ["category"]}}]	12	1
3019	2018-11-16 05:50:06.544021+00	875	Iaer object (875)	2	[{"changed": {"fields": ["category"]}}]	12	1
3020	2018-11-16 05:50:25.692542+00	876	Iaer object (876)	2	[{"changed": {"fields": ["category"]}}]	12	1
3021	2018-11-16 05:51:25.846056+00	762	Iaer object (762)	2	[{"changed": {"fields": ["category"]}}]	12	1
3022	2018-11-16 05:51:40.604647+00	746	Iaer object (746)	2	[{"changed": {"fields": ["category"]}}]	12	1
3023	2018-11-16 05:52:35.804013+00	724	Iaer object (724)	2	[{"changed": {"fields": ["category"]}}]	12	1
3024	2018-11-16 05:52:55.503718+00	716	Iaer object (716)	2	[{"changed": {"fields": ["category"]}}]	12	1
3025	2018-11-16 05:53:32.043484+00	712	Iaer object (712)	2	[{"changed": {"fields": ["category", "remark"]}}]	12	1
3026	2018-11-16 05:53:48.06067+00	688	Iaer object (688)	2	[{"changed": {"fields": ["category"]}}]	12	1
3027	2018-11-16 05:54:05.368639+00	686	Iaer object (686)	2	[{"changed": {"fields": ["category"]}}]	12	1
3028	2018-11-16 05:54:20.856949+00	682	Iaer object (682)	2	[{"changed": {"fields": ["category"]}}]	12	1
3029	2018-11-16 05:54:39.341339+00	676	Iaer object (676)	2	[{"changed": {"fields": ["category"]}}]	12	1
3030	2018-11-16 05:55:01.277593+00	627	Iaer object (627)	2	[{"changed": {"fields": ["category"]}}]	12	1
3031	2018-11-16 05:55:22.485846+00	625	Iaer object (625)	2	[{"changed": {"fields": ["category"]}}]	12	1
3032	2018-11-16 05:55:36.563749+00	607	Iaer object (607)	2	[{"changed": {"fields": ["category"]}}]	12	1
3033	2018-11-16 05:55:50.876904+00	575	Iaer object (575)	2	[{"changed": {"fields": ["category"]}}]	12	1
3034	2018-11-16 05:56:05.791674+00	534	Iaer object (534)	2	[{"changed": {"fields": ["category"]}}]	12	1
3035	2018-11-16 05:56:21.077877+00	622	Iaer object (622)	2	[{"changed": {"fields": ["category"]}}]	12	1
3036	2018-11-16 05:56:34.831279+00	484	Iaer object (484)	2	[{"changed": {"fields": ["category"]}}]	12	1
3037	2018-11-16 05:56:49.592871+00	452	Iaer object (452)	2	[{"changed": {"fields": ["category"]}}]	12	1
3038	2018-11-16 05:57:03.934283+00	451	Iaer object (451)	2	[{"changed": {"fields": ["category"]}}]	12	1
3039	2018-11-16 05:57:34.987126+00	606	Iaer object (606)	2	[{"changed": {"fields": ["category"]}}]	12	1
3040	2018-11-16 05:57:50.328353+00	449	Iaer object (449)	2	[{"changed": {"fields": ["category"]}}]	12	1
3041	2018-11-16 05:58:08.552279+00	419	Iaer object (419)	2	[{"changed": {"fields": ["category"]}}]	12	1
3042	2018-11-16 05:58:22.273098+00	413	Iaer object (413)	2	[{"changed": {"fields": ["category"]}}]	12	1
3043	2018-11-16 05:59:04.174395+00	330	Iaer object (330)	2	[{"changed": {"fields": ["category"]}}]	12	1
3044	2018-11-16 05:59:21.393563+00	389	Iaer object (389)	2	[{"changed": {"fields": ["category"]}}]	12	1
3045	2018-11-16 05:59:40.153604+00	405	Iaer object (405)	2	[{"changed": {"fields": ["category"]}}]	12	1
3046	2018-11-16 05:59:56.614478+00	366	Iaer object (366)	2	[{"changed": {"fields": ["category"]}}]	12	1
3047	2018-11-16 06:00:12.554026+00	339	Iaer object (339)	2	[{"changed": {"fields": ["category"]}}]	12	1
3048	2018-11-16 06:00:37.329096+00	401	Iaer object (401)	2	[{"changed": {"fields": ["category"]}}]	12	1
3049	2018-11-16 06:00:56.489893+00	283	Iaer object (283)	2	[{"changed": {"fields": ["category"]}}]	12	1
3050	2018-11-16 06:01:16.656951+00	390	Iaer object (390)	2	[{"changed": {"fields": ["category"]}}]	12	1
3051	2018-11-16 06:01:44.08174+00	1	Iaer object (1)	2	[{"changed": {"fields": ["category"]}}]	12	1
3052	2018-11-16 06:02:19.512102+00	302	Iaer object (302)	2	[{"changed": {"fields": ["category"]}}]	12	1
3053	2018-11-16 06:02:35.641118+00	241	Iaer object (241)	2	[{"changed": {"fields": ["category"]}}]	12	1
3054	2018-11-16 06:03:00.076182+00	190	Iaer object (190)	2	[{"changed": {"fields": ["category"]}}]	12	1
3055	2018-11-16 06:03:16.945877+00	285	Iaer object (285)	2	[{"changed": {"fields": ["category"]}}]	12	1
3056	2018-11-16 06:03:35.893676+00	264	Iaer object (264)	2	[{"changed": {"fields": ["category"]}}]	12	1
3057	2018-11-16 06:35:30.314305+00	55	Iaer object (55)	2	[{"changed": {"fields": ["category"]}}]	12	1
3058	2018-11-16 06:35:47.864338+00	284	Iaer object (284)	2	[{"changed": {"fields": ["category"]}}]	12	1
3059	2018-11-16 06:36:10.742212+00	79	Iaer object (79)	2	[{"changed": {"fields": ["category"]}}]	12	1
3060	2018-11-16 06:38:40.977219+00	206	Iaer object (206)	2	[{"changed": {"fields": ["category"]}}]	12	1
3061	2018-11-16 06:39:01.425787+00	184	Iaer object (184)	2	[{"changed": {"fields": ["category"]}}]	12	1
3062	2018-11-16 06:39:31.016222+00	201	Iaer object (201)	2	[{"changed": {"fields": ["category"]}}]	12	1
3063	2018-11-16 06:39:49.412514+00	736	Iaer object (736)	2	[{"changed": {"fields": ["category"]}}]	12	1
3064	2018-11-16 06:40:05.287756+00	687	Iaer object (687)	2	[{"changed": {"fields": ["category"]}}]	12	1
3065	2018-11-16 06:40:23.350646+00	582	Iaer object (582)	2	[{"changed": {"fields": ["category"]}}]	12	1
3066	2018-11-16 06:40:41.51232+00	295	Iaer object (295)	2	[{"changed": {"fields": ["category"]}}]	12	1
3067	2018-11-16 06:41:13.916124+00	106	Iaer object (106)	2	[{"changed": {"fields": ["category"]}}]	12	1
3068	2018-11-16 06:41:34.529912+00	105	Iaer object (105)	2	[{"changed": {"fields": ["category"]}}]	12	1
3069	2018-11-16 06:42:01.525982+00	118	Iaer object (118)	2	[{"changed": {"fields": ["category"]}}]	12	1
3070	2018-11-16 06:42:36.393031+00	6	Iaer object (6)	2	[{"changed": {"fields": ["category"]}}]	12	1
3071	2018-11-16 06:43:12.474647+00	5	Iaer object (5)	2	[{"changed": {"fields": ["category"]}}]	12	1
3072	2018-11-16 06:43:20.000602+00	4	Iaer object (4)	2	[{"changed": {"fields": ["category"]}}]	12	1
3073	2018-11-16 06:43:27.77882+00	3	Iaer object (3)	2	[{"changed": {"fields": ["category"]}}]	12	1
3074	2018-11-16 06:44:16.955355+00	481	Iaer object (481)	2	[{"changed": {"fields": ["category"]}}]	12	1
3075	2018-11-16 06:44:23.947132+00	318	Iaer object (318)	2	[{"changed": {"fields": ["category"]}}]	12	1
3076	2018-11-16 06:45:20.784291+00	872	Iaer object (872)	2	[{"changed": {"fields": ["category"]}}]	12	1
3077	2018-11-16 06:45:30.834676+00	871	Iaer object (871)	2	[]	12	1
3078	2018-11-16 06:45:41.711458+00	869	Iaer object (869)	2	[{"changed": {"fields": ["category"]}}]	12	1
3079	2018-11-16 06:46:46.828293+00	19	Category object (19)	1	[{"added": {}}]	15	1
3080	2018-11-16 06:47:07.648457+00	15	Category object (15)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
3081	2018-11-16 06:47:24.147616+00	19	Category object (19)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
3082	2018-11-16 06:47:35.326698+00	18	Category object (18)	2	[{"changed": {"fields": ["sequence"]}}]	15	1
3083	2018-11-16 06:50:39.91412+00	20	Category object (20)	1	[{"added": {}}]	15	1
3084	2018-11-16 06:52:36.721108+00	666	Iaer object (666)	2	[{"changed": {"fields": ["category"]}}]	12	1
3085	2018-11-16 06:52:48.919905+00	664	Iaer object (664)	2	[{"changed": {"fields": ["category"]}}]	12	1
3086	2018-11-16 06:53:00.641906+00	663	Iaer object (663)	2	[{"changed": {"fields": ["category"]}}]	12	1
3087	2018-11-16 06:53:12.426024+00	662	Iaer object (662)	2	[{"changed": {"fields": ["category"]}}]	12	1
3088	2018-11-16 06:53:25.109598+00	660	Iaer object (660)	2	[{"changed": {"fields": ["category"]}}]	12	1
3089	2018-11-16 06:53:51.245271+00	658	Iaer object (658)	2	[{"changed": {"fields": ["category"]}}]	12	1
3090	2018-11-16 06:54:00.295497+00	657	Iaer object (657)	2	[{"changed": {"fields": ["category"]}}]	12	1
3091	2018-11-16 06:55:02.077464+00	508	Iaer object (508)	2	[{"changed": {"fields": ["category"]}}]	12	1
3092	2018-11-16 06:55:14.309477+00	507	Iaer object (507)	2	[{"changed": {"fields": ["category"]}}]	12	1
3093	2018-11-16 06:55:26.367475+00	505	Iaer object (505)	2	[{"changed": {"fields": ["category"]}}]	12	1
3094	2018-11-16 06:55:34.189806+00	496	Iaer object (496)	2	[{"changed": {"fields": ["category"]}}]	12	1
3095	2018-11-16 06:55:42.419039+00	487	Iaer object (487)	2	[{"changed": {"fields": ["category"]}}]	12	1
3096	2018-11-16 06:55:49.970058+00	477	Iaer object (477)	2	[{"changed": {"fields": ["category"]}}]	12	1
3097	2018-11-16 06:55:58.768512+00	464	Iaer object (464)	2	[{"changed": {"fields": ["category"]}}]	12	1
3098	2018-11-16 06:56:16.018197+00	443	Iaer object (443)	2	[{"changed": {"fields": ["category"]}}]	12	1
3099	2018-11-16 06:56:25.971255+00	439	Iaer object (439)	2	[{"changed": {"fields": ["category"]}}]	12	1
3100	2018-11-16 06:56:33.715987+00	427	Iaer object (427)	2	[{"changed": {"fields": ["category"]}}]	12	1
3101	2018-11-16 06:56:46.810452+00	416	Iaer object (416)	2	[{"changed": {"fields": ["category"]}}]	12	1
3102	2018-11-16 06:56:56.29286+00	406	Iaer object (406)	2	[{"changed": {"fields": ["category"]}}]	12	1
3103	2018-11-16 06:57:04.653089+00	403	Iaer object (403)	2	[{"changed": {"fields": ["category"]}}]	12	1
3104	2018-11-16 06:57:12.971181+00	395	Iaer object (395)	2	[{"changed": {"fields": ["category"]}}]	12	1
3105	2018-11-16 06:57:29.610462+00	386	Iaer object (386)	2	[{"changed": {"fields": ["category"]}}]	12	1
3106	2018-11-16 06:57:37.130314+00	384	Iaer object (384)	2	[{"changed": {"fields": ["category"]}}]	12	1
3107	2018-11-16 06:57:51.525508+00	378	Iaer object (378)	2	[{"changed": {"fields": ["category"]}}]	12	1
3108	2018-11-16 06:58:06.354329+00	376	Iaer object (376)	2	[{"changed": {"fields": ["category"]}}]	12	1
3109	2018-11-16 06:59:05.900014+00	871	Iaer object (871)	2	[{"changed": {"fields": ["category"]}}]	12	1
3110	2018-11-16 06:59:13.699317+00	866	Iaer object (866)	2	[{"changed": {"fields": ["category"]}}]	12	1
3111	2018-11-16 06:59:20.457708+00	864	Iaer object (864)	2	[{"changed": {"fields": ["category"]}}]	12	1
3112	2018-11-16 06:59:36.153862+00	858	Iaer object (858)	2	[{"changed": {"fields": ["category"]}}]	12	1
3113	2018-11-16 06:59:44.555467+00	844	Iaer object (844)	2	[{"changed": {"fields": ["category"]}}]	12	1
3114	2018-11-16 06:59:51.469433+00	840	Iaer object (840)	2	[{"changed": {"fields": ["category"]}}]	12	1
3115	2018-11-16 06:59:59.026663+00	825	Iaer object (825)	2	[{"changed": {"fields": ["category"]}}]	12	1
3116	2018-11-16 07:00:19.258643+00	814	Iaer object (814)	2	[{"changed": {"fields": ["category"]}}]	12	1
3117	2018-11-16 07:00:26.94346+00	809	Iaer object (809)	2	[{"changed": {"fields": ["category"]}}]	12	1
3118	2018-11-16 07:00:48.59761+00	804	Iaer object (804)	2	[{"changed": {"fields": ["category"]}}]	12	1
3119	2018-11-16 07:00:56.745297+00	800	Iaer object (800)	2	[{"changed": {"fields": ["category"]}}]	12	1
3120	2018-11-16 07:01:03.517657+00	789	Iaer object (789)	2	[{"changed": {"fields": ["category"]}}]	12	1
3121	2018-11-16 07:01:10.24175+00	743	Iaer object (743)	2	[{"changed": {"fields": ["category"]}}]	12	1
3122	2018-11-16 07:01:16.549799+00	742	Iaer object (742)	2	[{"changed": {"fields": ["category"]}}]	12	1
3123	2018-11-16 07:01:21.621752+00	728	Iaer object (728)	2	[{"changed": {"fields": ["category"]}}]	12	1
3124	2018-11-16 07:01:29.049815+00	721	Iaer object (721)	2	[{"changed": {"fields": ["category"]}}]	12	1
3125	2018-11-16 07:01:36.365356+00	719	Iaer object (719)	2	[{"changed": {"fields": ["category"]}}]	12	1
3126	2018-11-16 07:02:37.427124+00	269	Iaer object (269)	2	[{"changed": {"fields": ["category"]}}]	12	1
3127	2018-11-16 07:02:48.042616+00	270	Iaer object (270)	2	[{"changed": {"fields": ["category"]}}]	12	1
3128	2018-11-16 07:02:56.368906+00	275	Iaer object (275)	2	[{"changed": {"fields": ["category"]}}]	12	1
3129	2018-11-16 07:03:04.264476+00	279	Iaer object (279)	2	[{"changed": {"fields": ["category"]}}]	12	1
3130	2018-11-16 07:03:36.913426+00	294	Iaer object (294)	2	[{"changed": {"fields": ["category"]}}]	12	1
3131	2018-11-16 07:04:00.804803+00	322	Iaer object (322)	2	[{"changed": {"fields": ["category"]}}]	12	1
3132	2018-11-16 07:04:25.597295+00	21	Category object (21)	1	[{"added": {}}]	15	1
3133	2018-11-16 07:05:07.524516+00	323	Iaer object (323)	2	[{"changed": {"fields": ["category"]}}]	12	1
3134	2018-11-16 07:05:44.136911+00	333	Iaer object (333)	2	[{"changed": {"fields": ["category"]}}]	12	1
3135	2018-11-16 07:06:05.651459+00	22	Category object (22)	1	[{"added": {}}]	15	1
3136	2018-11-16 07:06:18.379739+00	334	Iaer object (334)	2	[{"changed": {"fields": ["category"]}}]	12	1
3137	2018-11-16 07:06:25.146896+00	338	Iaer object (338)	2	[{"changed": {"fields": ["category"]}}]	12	1
3138	2018-11-16 07:06:32.28632+00	342	Iaer object (342)	2	[{"changed": {"fields": ["category"]}}]	12	1
3139	2018-11-16 07:06:40.292487+00	343	Iaer object (343)	2	[{"changed": {"fields": ["category"]}}]	12	1
3140	2018-11-16 07:06:48.053714+00	352	Iaer object (352)	2	[{"changed": {"fields": ["category"]}}]	12	1
3141	2018-11-16 07:08:16.754841+00	708	Iaer object (708)	2	[{"changed": {"fields": ["category"]}}]	12	1
3142	2018-11-16 07:08:24.08983+00	667	Iaer object (667)	2	[{"changed": {"fields": ["category"]}}]	12	1
3143	2018-11-16 07:08:36.15681+00	619	Iaer object (619)	2	[{"changed": {"fields": ["category"]}}]	12	1
3144	2018-11-16 07:08:44.216563+00	617	Iaer object (617)	2	[{"changed": {"fields": ["category"]}}]	12	1
3145	2018-11-16 07:08:54.470838+00	598	Iaer object (598)	2	[{"changed": {"fields": ["category"]}}]	12	1
3146	2018-11-16 07:09:02.442273+00	597	Iaer object (597)	2	[{"changed": {"fields": ["category"]}}]	12	1
3147	2018-11-16 07:09:12.740177+00	596	Iaer object (596)	2	[{"changed": {"fields": ["category"]}}]	12	1
3148	2018-11-16 07:09:29.321202+00	594	Iaer object (594)	2	[{"changed": {"fields": ["category"]}}]	12	1
3149	2018-11-16 07:09:37.040516+00	591	Iaer object (591)	2	[{"changed": {"fields": ["category"]}}]	12	1
3150	2018-11-16 07:09:42.655299+00	585	Iaer object (585)	2	[{"changed": {"fields": ["category"]}}]	12	1
3151	2018-11-16 07:09:49.42413+00	581	Iaer object (581)	2	[{"changed": {"fields": ["category"]}}]	12	1
3152	2018-11-16 07:09:57.204815+00	574	Iaer object (574)	2	[{"changed": {"fields": ["category"]}}]	12	1
3153	2018-11-16 07:11:36.601389+00	303	Iaer object (303)	2	[{"changed": {"fields": ["category"]}}]	12	1
3154	2018-11-16 07:11:51.69678+00	200	Iaer object (200)	2	[{"changed": {"fields": ["category"]}}]	12	1
3155	2018-11-16 07:11:59.773484+00	199	Iaer object (199)	2	[{"changed": {"fields": ["category"]}}]	12	1
3156	2018-11-16 07:12:07.630765+00	185	Iaer object (185)	2	[{"changed": {"fields": ["category"]}}]	12	1
3157	2018-11-16 07:12:14.583839+00	183	Iaer object (183)	2	[{"changed": {"fields": ["category"]}}]	12	1
3158	2018-11-16 07:12:24.769569+00	166	Iaer object (166)	2	[{"changed": {"fields": ["category"]}}]	12	1
3159	2018-11-16 07:12:30.641677+00	153	Iaer object (153)	2	[{"changed": {"fields": ["category"]}}]	12	1
3160	2018-11-16 07:12:44.207814+00	142	Iaer object (142)	2	[{"changed": {"fields": ["category"]}}]	12	1
3161	2018-11-16 07:13:40.846154+00	109	Iaer object (109)	2	[{"changed": {"fields": ["category"]}}]	12	1
3162	2018-11-16 07:13:46.703686+00	122	Iaer object (122)	2	[{"changed": {"fields": ["category"]}}]	12	1
3163	2018-11-16 07:13:53.272347+00	127	Iaer object (127)	2	[{"changed": {"fields": ["category"]}}]	12	1
3164	2018-11-16 07:14:07.359376+00	141	Iaer object (141)	2	[{"changed": {"fields": ["category"]}}]	12	1
3165	2018-11-16 07:14:30.72619+00	242	Iaer object (242)	2	[{"changed": {"fields": ["category"]}}]	12	1
3166	2018-11-16 07:14:41.902896+00	252	Iaer object (252)	2	[{"changed": {"fields": ["category"]}}]	12	1
3167	2018-11-16 07:14:47.701452+00	253	Iaer object (253)	2	[{"changed": {"fields": ["category"]}}]	12	1
3168	2018-11-16 07:14:56.500327+00	254	Iaer object (254)	2	[{"changed": {"fields": ["category"]}}]	12	1
3169	2018-11-16 07:15:12.463624+00	267	Iaer object (267)	2	[{"changed": {"fields": ["category"]}}]	12	1
3170	2018-11-16 07:17:19.822863+00	74	Iaer object (74)	2	[{"changed": {"fields": ["category"]}}]	12	1
3171	2018-11-16 07:17:39.368902+00	86	Iaer object (86)	2	[{"changed": {"fields": ["category"]}}]	12	1
3172	2018-11-16 07:17:46.620782+00	89	Iaer object (89)	2	[{"changed": {"fields": ["category"]}}]	12	1
3173	2018-11-16 07:17:56.427484+00	103	Iaer object (103)	2	[{"changed": {"fields": ["category"]}}]	12	1
3174	2018-11-16 07:18:11.769069+00	108	Iaer object (108)	2	[{"changed": {"fields": ["category"]}}]	12	1
3175	2018-11-16 07:18:19.443022+00	110	Iaer object (110)	2	[{"changed": {"fields": ["category"]}}]	12	1
3176	2018-11-16 07:18:27.346286+00	139	Iaer object (139)	2	[{"changed": {"fields": ["category"]}}]	12	1
3177	2018-11-16 07:18:44.423778+00	148	Iaer object (148)	2	[{"changed": {"fields": ["category"]}}]	12	1
3178	2018-11-16 07:19:05.049824+00	176	Iaer object (176)	2	[{"changed": {"fields": ["category"]}}]	12	1
3179	2018-11-16 07:19:11.781786+00	220	Iaer object (220)	2	[{"changed": {"fields": ["category"]}}]	12	1
3180	2018-11-16 07:19:16.881128+00	233	Iaer object (233)	2	[{"changed": {"fields": ["category"]}}]	12	1
3181	2018-11-16 07:19:23.191618+00	240	Iaer object (240)	2	[{"changed": {"fields": ["category"]}}]	12	1
3182	2018-11-16 07:19:29.096041+00	265	Iaer object (265)	2	[{"changed": {"fields": ["category"]}}]	12	1
3183	2018-11-16 07:19:35.266055+00	268	Iaer object (268)	2	[{"changed": {"fields": ["category"]}}]	12	1
3184	2018-11-16 07:20:42.901528+00	15	Iaer object (15)	2	[{"changed": {"fields": ["category"]}}]	12	1
3185	2018-11-16 07:20:49.786285+00	16	Iaer object (16)	2	[{"changed": {"fields": ["category"]}}]	12	1
3186	2018-11-16 07:20:56.095377+00	17	Iaer object (17)	2	[{"changed": {"fields": ["category"]}}]	12	1
3187	2018-11-16 07:21:05.818996+00	25	Iaer object (25)	2	[{"changed": {"fields": ["category"]}}]	12	1
3188	2018-11-16 07:21:13.391401+00	31	Iaer object (31)	2	[{"changed": {"fields": ["category"]}}]	12	1
3189	2018-11-16 07:21:19.347948+00	32	Iaer object (32)	2	[{"changed": {"fields": ["category"]}}]	12	1
3190	2018-11-16 07:21:27.134646+00	33	Iaer object (33)	2	[{"changed": {"fields": ["category"]}}]	12	1
3191	2018-11-16 07:21:33.01615+00	49	Iaer object (49)	2	[{"changed": {"fields": ["category"]}}]	12	1
3192	2018-11-16 07:21:39.298621+00	57	Iaer object (57)	2	[{"changed": {"fields": ["category"]}}]	12	1
3193	2018-11-16 07:21:47.803118+00	59	Iaer object (59)	2	[{"changed": {"fields": ["category"]}}]	12	1
3194	2018-11-16 07:21:54.846497+00	65	Iaer object (65)	2	[{"changed": {"fields": ["category"]}}]	12	1
3195	2018-11-16 07:22:01.753663+00	66	Iaer object (66)	2	[{"changed": {"fields": ["category"]}}]	12	1
3196	2018-11-16 07:22:08.751188+00	69	Iaer object (69)	2	[{"changed": {"fields": ["category"]}}]	12	1
3197	2018-11-16 07:22:14.43985+00	73	Iaer object (73)	2	[{"changed": {"fields": ["category"]}}]	12	1
3198	2018-11-16 07:23:09.621048+00	510	Iaer object (510)	2	[{"changed": {"fields": ["category"]}}]	12	1
3199	2018-11-16 07:23:17.516556+00	509	Iaer object (509)	2	[{"changed": {"fields": ["category"]}}]	12	1
3200	2018-11-16 07:23:23.836033+00	447	Iaer object (447)	2	[{"changed": {"fields": ["category"]}}]	12	1
3201	2018-11-16 07:23:29.753115+00	407	Iaer object (407)	2	[{"changed": {"fields": ["category"]}}]	12	1
3202	2018-11-16 07:23:35.91257+00	377	Iaer object (377)	2	[{"changed": {"fields": ["category"]}}]	12	1
3203	2018-11-16 07:23:49.500516+00	372	Iaer object (372)	2	[{"changed": {"fields": ["category"]}}]	12	1
3204	2018-11-16 07:23:55.826686+00	371	Iaer object (371)	2	[{"changed": {"fields": ["category"]}}]	12	1
3205	2018-11-16 07:24:01.793201+00	370	Iaer object (370)	2	[{"changed": {"fields": ["category"]}}]	12	1
3206	2018-11-16 07:24:16.568175+00	368	Iaer object (368)	2	[{"changed": {"fields": ["category"]}}]	12	1
3207	2018-11-16 07:24:23.813505+00	367	Iaer object (367)	2	[{"changed": {"fields": ["category"]}}]	12	1
3208	2018-11-16 07:24:30.33372+00	364	Iaer object (364)	2	[{"changed": {"fields": ["category"]}}]	12	1
3209	2018-11-16 07:24:36.648493+00	363	Iaer object (363)	2	[{"changed": {"fields": ["category"]}}]	12	1
3210	2018-11-16 07:24:43.301634+00	362	Iaer object (362)	2	[{"changed": {"fields": ["category"]}}]	12	1
3211	2018-11-16 07:24:50.625726+00	360	Iaer object (360)	2	[{"changed": {"fields": ["category"]}}]	12	1
3212	2018-11-16 07:24:57.535564+00	356	Iaer object (356)	2	[{"changed": {"fields": ["category"]}}]	12	1
3213	2018-11-16 07:25:53.678872+00	608	Iaer object (608)	2	[{"changed": {"fields": ["category"]}}]	12	1
3214	2018-11-16 07:26:00.251575+00	595	Iaer object (595)	2	[{"changed": {"fields": ["category"]}}]	12	1
3215	2018-11-16 07:26:17.50649+00	570	Iaer object (570)	2	[{"changed": {"fields": ["category"]}}]	12	1
3216	2018-11-16 07:26:24.697521+00	568	Iaer object (568)	2	[{"changed": {"fields": ["category"]}}]	12	1
3217	2018-11-16 07:26:31.076959+00	563	Iaer object (563)	2	[{"changed": {"fields": ["category"]}}]	12	1
3218	2018-11-16 07:26:37.639927+00	562	Iaer object (562)	2	[{"changed": {"fields": ["category"]}}]	12	1
3219	2018-11-16 07:27:03.361137+00	561	Iaer object (561)	2	[{"changed": {"fields": ["category"]}}]	12	1
3220	2018-11-16 07:27:10.135573+00	555	Iaer object (555)	2	[{"changed": {"fields": ["category"]}}]	12	1
3221	2018-11-16 07:27:17.015617+00	530	Iaer object (530)	2	[{"changed": {"fields": ["category"]}}]	12	1
3222	2018-11-16 07:27:24.37678+00	369	Iaer object (369)	2	[{"changed": {"fields": ["category"]}}]	12	1
3223	2018-11-16 07:27:30.176377+00	331	Iaer object (331)	2	[{"changed": {"fields": ["category"]}}]	12	1
3224	2018-11-16 07:27:36.252216+00	329	Iaer object (329)	2	[{"changed": {"fields": ["category"]}}]	12	1
3225	2018-11-16 07:27:41.971942+00	324	Iaer object (324)	2	[{"changed": {"fields": ["category"]}}]	12	1
3226	2018-11-16 07:27:54.411196+00	292	Iaer object (292)	2	[{"changed": {"fields": ["category"]}}]	12	1
3227	2018-11-16 07:28:00.022825+00	280	Iaer object (280)	2	[{"changed": {"fields": ["category"]}}]	12	1
3228	2018-11-16 07:28:48.592571+00	863	Iaer object (863)	2	[{"changed": {"fields": ["category"]}}]	12	1
3229	2018-11-16 07:28:54.480266+00	824	Iaer object (824)	2	[{"changed": {"fields": ["category"]}}]	12	1
3230	2018-11-16 07:29:01.198305+00	717	Iaer object (717)	2	[{"changed": {"fields": ["category"]}}]	12	1
3231	2018-11-16 07:29:06.973375+00	140	Iaer object (140)	2	[{"changed": {"fields": ["category"]}}]	12	1
3232	2018-11-16 07:31:54.770862+00	839	Iaer object (839)	2	[{"changed": {"fields": ["category"]}}]	12	1
3233	2018-11-16 07:32:01.935913+00	871	Iaer object (871)	2	[{"changed": {"fields": ["category"]}}]	12	1
3234	2018-11-16 07:32:09.4554+00	864	Iaer object (864)	2	[{"changed": {"fields": ["category"]}}]	12	1
3235	2018-11-16 07:32:16.143054+00	507	Iaer object (507)	2	[{"changed": {"fields": ["category"]}}]	12	1
3236	2018-11-16 07:32:22.046841+00	386	Iaer object (386)	2	[{"changed": {"fields": ["category"]}}]	12	1
3237	2018-11-16 07:32:27.461693+00	378	Iaer object (378)	2	[{"changed": {"fields": ["category"]}}]	12	1
3238	2018-11-16 07:32:33.345656+00	666	Iaer object (666)	2	[{"changed": {"fields": ["category"]}}]	12	1
3239	2018-11-16 07:34:36.827949+00	596	Iaer object (596)	2	[{"changed": {"fields": ["category"]}}]	12	1
3240	2018-11-16 07:54:24.007901+00	854	Iaer object (854)	2	[{"changed": {"fields": ["category"]}}]	12	1
3241	2018-11-16 07:54:35.216461+00	868	Iaer object (868)	2	[{"changed": {"fields": ["category"]}}]	12	1
3242	2018-11-16 07:54:42.205764+00	852	Iaer object (852)	2	[{"changed": {"fields": ["category"]}}]	12	1
3243	2018-11-16 07:54:52.513809+00	829	Iaer object (829)	2	[{"changed": {"fields": ["category"]}}]	12	1
3244	2018-11-16 07:55:00.618379+00	815	Iaer object (815)	2	[{"changed": {"fields": ["category"]}}]	12	1
3245	2018-11-16 07:55:07.898014+00	803	Iaer object (803)	2	[{"changed": {"fields": ["category"]}}]	12	1
3246	2018-11-16 07:55:16.882898+00	794	Iaer object (794)	2	[{"changed": {"fields": ["category"]}}]	12	1
3247	2018-11-16 07:55:26.1948+00	793	Iaer object (793)	2	[{"changed": {"fields": ["category"]}}]	12	1
3248	2018-11-16 07:55:36.20379+00	783	Iaer object (783)	2	[{"changed": {"fields": ["category"]}}]	12	1
3249	2018-11-16 07:55:43.875206+00	773	Iaer object (773)	2	[{"changed": {"fields": ["category"]}}]	12	1
3250	2018-11-16 07:56:14.103609+00	772	Iaer object (772)	2	[{"changed": {"fields": ["category"]}}]	12	1
3251	2018-11-16 07:57:03.380655+00	770	Iaer object (770)	2	[{"changed": {"fields": ["category"]}}]	12	1
3252	2018-11-16 07:57:15.133632+00	760	Iaer object (760)	2	[{"changed": {"fields": ["category"]}}]	12	1
3253	2018-11-16 07:57:23.675107+00	722	Iaer object (722)	2	[{"changed": {"fields": ["category"]}}]	12	1
3254	2018-11-16 07:57:31.850498+00	713	Iaer object (713)	2	[{"changed": {"fields": ["category"]}}]	12	1
3255	2018-11-16 07:57:39.247748+00	704	Iaer object (704)	2	[{"changed": {"fields": ["category"]}}]	12	1
3256	2018-11-16 07:57:45.195395+00	703	Iaer object (703)	2	[{"changed": {"fields": ["category"]}}]	12	1
3257	2018-11-16 07:57:56.059449+00	702	Iaer object (702)	2	[{"changed": {"fields": ["category"]}}]	12	1
3258	2018-11-16 07:58:04.98918+00	685	Iaer object (685)	2	[{"changed": {"fields": ["category"]}}]	12	1
3259	2018-11-16 07:58:14.822185+00	672	Iaer object (672)	2	[{"changed": {"fields": ["category"]}}]	12	1
3260	2018-11-16 07:58:26.361267+00	665	Iaer object (665)	2	[{"changed": {"fields": ["category"]}}]	12	1
3261	2018-11-16 07:58:36.411718+00	654	Iaer object (654)	2	[{"changed": {"fields": ["category"]}}]	12	1
3262	2018-11-16 07:58:47.183024+00	653	Iaer object (653)	2	[{"changed": {"fields": ["category"]}}]	12	1
3263	2018-11-16 07:58:54.959544+00	652	Iaer object (652)	2	[{"changed": {"fields": ["category"]}}]	12	1
3264	2018-11-16 07:59:01.878745+00	651	Iaer object (651)	2	[{"changed": {"fields": ["category"]}}]	12	1
3265	2018-11-16 07:59:10.606469+00	649	Iaer object (649)	2	[{"changed": {"fields": ["category"]}}]	12	1
3266	2018-11-16 07:59:17.537996+00	648	Iaer object (648)	2	[{"changed": {"fields": ["category"]}}]	12	1
3267	2018-11-16 07:59:23.86652+00	647	Iaer object (647)	2	[{"changed": {"fields": ["category"]}}]	12	1
3268	2018-11-16 07:59:32.516936+00	643	Iaer object (643)	2	[{"changed": {"fields": ["category"]}}]	12	1
3269	2018-11-16 07:59:42.726774+00	642	Iaer object (642)	2	[{"changed": {"fields": ["category"]}}]	12	1
3270	2018-11-16 07:59:48.572488+00	641	Iaer object (641)	2	[{"changed": {"fields": ["category"]}}]	12	1
3271	2018-11-16 07:59:54.700343+00	638	Iaer object (638)	2	[{"changed": {"fields": ["category"]}}]	12	1
3272	2018-11-16 08:02:28.100451+00	747	Iaer object (747)	2	[{"changed": {"fields": ["category"]}}]	12	1
3273	2018-11-16 08:02:50.391937+00	738	Iaer object (738)	2	[{"changed": {"fields": ["category"]}}]	12	1
3274	2018-11-16 08:02:58.078422+00	678	Iaer object (678)	2	[{"changed": {"fields": ["category"]}}]	12	1
3275	2018-11-16 08:03:09.262955+00	629	Iaer object (629)	2	[{"changed": {"fields": ["category"]}}]	12	1
3276	2018-11-16 08:03:15.118508+00	609	Iaer object (609)	2	[{"changed": {"fields": ["category"]}}]	12	1
3277	2018-11-16 08:03:26.638988+00	611	Iaer object (611)	2	[{"changed": {"fields": ["category"]}}]	12	1
3278	2018-11-16 08:03:33.454771+00	609	Iaer object (609)	2	[]	12	1
3279	2018-11-16 08:03:43.335785+00	567	Iaer object (567)	2	[{"changed": {"fields": ["category"]}}]	12	1
3280	2018-11-16 08:03:51.864722+00	560	Iaer object (560)	2	[{"changed": {"fields": ["category"]}}]	12	1
3281	2018-11-16 08:03:58.789688+00	559	Iaer object (559)	2	[{"changed": {"fields": ["category"]}}]	12	1
3282	2018-11-16 08:10:20.012278+00	517	Iaer object (517)	2	[{"changed": {"fields": ["category"]}}]	12	1
3283	2018-11-16 08:10:27.440885+00	518	Iaer object (518)	2	[{"changed": {"fields": ["category"]}}]	12	1
3284	2018-11-16 08:10:34.602218+00	519	Iaer object (519)	2	[{"changed": {"fields": ["category"]}}]	12	1
3285	2018-11-16 08:10:48.125354+00	525	Iaer object (525)	2	[{"changed": {"fields": ["category"]}}]	12	1
3286	2018-11-16 08:10:56.838147+00	494	Iaer object (494)	2	[{"changed": {"fields": ["category"]}}]	12	1
3287	2018-11-16 08:11:02.966344+00	493	Iaer object (493)	2	[{"changed": {"fields": ["category"]}}]	12	1
3288	2018-11-16 08:11:08.543414+00	480	Iaer object (480)	2	[{"changed": {"fields": ["category"]}}]	12	1
3289	2018-11-16 08:12:16.685626+00	479	Iaer object (479)	2	[{"changed": {"fields": ["category"]}}]	12	1
3290	2018-11-16 08:12:24.229922+00	474	Iaer object (474)	2	[{"changed": {"fields": ["category"]}}]	12	1
3291	2018-11-16 08:12:32.350645+00	472	Iaer object (472)	2	[{"changed": {"fields": ["category"]}}]	12	1
3292	2018-11-16 08:12:38.633864+00	467	Iaer object (467)	2	[{"changed": {"fields": ["category"]}}]	12	1
3293	2018-11-16 08:12:45.594921+00	466	Iaer object (466)	2	[{"changed": {"fields": ["category"]}}]	12	1
3294	2018-11-16 08:12:58.917888+00	463	Iaer object (463)	2	[{"changed": {"fields": ["category"]}}]	12	1
3295	2018-11-16 08:13:07.823867+00	458	Iaer object (458)	2	[{"changed": {"fields": ["category"]}}]	12	1
3296	2018-11-16 08:13:14.403094+00	440	Iaer object (440)	2	[{"changed": {"fields": ["category"]}}]	12	1
3297	2018-11-16 08:13:25.458208+00	421	Iaer object (421)	2	[{"changed": {"fields": ["category"]}}]	12	1
3298	2018-11-16 08:13:43.861727+00	417	Iaer object (417)	2	[{"changed": {"fields": ["category"]}}]	12	1
3299	2018-11-16 08:13:52.092981+00	410	Iaer object (410)	2	[{"changed": {"fields": ["category"]}}]	12	1
3300	2018-11-16 08:13:59.989981+00	353	Iaer object (353)	2	[{"changed": {"fields": ["category"]}}]	12	1
3301	2018-11-16 08:14:20.671649+00	312	Iaer object (312)	2	[{"changed": {"fields": ["category"]}}]	12	1
3302	2018-11-16 08:14:27.789929+00	311	Iaer object (311)	2	[{"changed": {"fields": ["category"]}}]	12	1
3303	2018-11-16 08:14:34.23551+00	310	Iaer object (310)	2	[{"changed": {"fields": ["category"]}}]	12	1
3304	2018-11-16 08:14:40.669997+00	309	Iaer object (309)	2	[{"changed": {"fields": ["category"]}}]	12	1
3305	2018-11-16 08:14:57.996956+00	281	Iaer object (281)	2	[{"changed": {"fields": ["category"]}}]	12	1
3306	2018-11-16 08:15:12.509581+00	274	Iaer object (274)	2	[{"changed": {"fields": ["category"]}}]	12	1
3307	2018-11-16 08:15:33.971743+00	259	Iaer object (259)	2	[{"changed": {"fields": ["category"]}}]	12	1
3308	2018-11-16 08:15:44.946934+00	245	Iaer object (245)	2	[{"changed": {"fields": ["category"]}}]	12	1
3309	2018-11-16 08:15:57.817147+00	245	Iaer object (245)	2	[{"changed": {"fields": ["category"]}}]	12	1
3310	2018-11-16 08:16:04.983738+00	243	Iaer object (243)	2	[{"changed": {"fields": ["category"]}}]	12	1
3311	2018-11-16 08:16:13.81229+00	234	Iaer object (234)	2	[{"changed": {"fields": ["category"]}}]	12	1
3312	2018-11-16 08:16:27.971555+00	231	Iaer object (231)	2	[{"changed": {"fields": ["category"]}}]	12	1
3313	2018-11-16 08:16:35.031251+00	222	Iaer object (222)	2	[{"changed": {"fields": ["category"]}}]	12	1
3314	2018-11-16 08:16:40.864485+00	202	Iaer object (202)	2	[{"changed": {"fields": ["category"]}}]	12	1
3315	2018-11-16 08:16:59.61893+00	194	Iaer object (194)	2	[{"changed": {"fields": ["category"]}}]	12	1
3316	2018-11-16 08:17:07.442351+00	539	Iaer object (539)	2	[{"changed": {"fields": ["category"]}}]	12	1
3317	2018-11-16 08:17:14.900208+00	558	Iaer object (558)	2	[]	12	1
3318	2018-11-16 08:17:29.220657+00	557	Iaer object (557)	2	[{"changed": {"fields": ["category"]}}]	12	1
3319	2018-11-16 08:17:36.527473+00	558	Iaer object (558)	2	[{"changed": {"fields": ["category"]}}]	12	1
3320	2018-11-16 08:17:42.193817+00	551	Iaer object (551)	2	[{"changed": {"fields": ["category"]}}]	12	1
3321	2018-11-16 08:21:22.761383+00	187	Iaer object (187)	2	[{"changed": {"fields": ["category"]}}]	12	1
3322	2018-11-16 08:21:41.9864+00	167	Iaer object (167)	2	[{"changed": {"fields": ["category"]}}]	12	1
3323	2018-11-16 08:21:53.241543+00	159	Iaer object (159)	2	[{"changed": {"fields": ["category"]}}]	12	1
3324	2018-11-16 08:21:59.865437+00	149	Iaer object (149)	2	[{"changed": {"fields": ["category"]}}]	12	1
3325	2018-11-16 08:22:07.036281+00	147	Iaer object (147)	2	[{"changed": {"fields": ["category"]}}]	12	1
3326	2018-11-16 08:22:17.796894+00	135	Iaer object (135)	2	[{"changed": {"fields": ["category"]}}]	12	1
3327	2018-11-16 08:22:27.698412+00	134	Iaer object (134)	2	[{"changed": {"fields": ["category"]}}]	12	1
3328	2018-11-16 08:22:35.297273+00	131	Iaer object (131)	2	[{"changed": {"fields": ["category"]}}]	12	1
3329	2018-11-16 08:22:54.53763+00	129	Iaer object (129)	2	[{"changed": {"fields": ["category"]}}]	12	1
3330	2018-11-16 08:23:02.060088+00	128	Iaer object (128)	2	[{"changed": {"fields": ["category"]}}]	12	1
3331	2018-11-16 08:23:10.160489+00	91	Iaer object (91)	2	[{"changed": {"fields": ["category"]}}]	12	1
3332	2018-11-16 08:23:26.365615+00	87	Iaer object (87)	2	[{"changed": {"fields": ["category"]}}]	12	1
3333	2018-11-16 08:23:33.840392+00	85	Iaer object (85)	2	[{"changed": {"fields": ["category"]}}]	12	1
3334	2018-11-16 08:24:09.353738+00	58	Iaer object (58)	2	[{"changed": {"fields": ["category"]}}]	12	1
3335	2018-11-16 08:24:16.892076+00	46	Iaer object (46)	2	[{"changed": {"fields": ["category"]}}]	12	1
3336	2018-11-16 08:24:23.073037+00	40	Iaer object (40)	2	[{"changed": {"fields": ["category"]}}]	12	1
3337	2018-11-16 08:24:31.422227+00	30	Iaer object (30)	2	[{"changed": {"fields": ["category"]}}]	12	1
3338	2018-11-16 08:24:40.443436+00	29	Iaer object (29)	2	[{"changed": {"fields": ["category"]}}]	12	1
3339	2018-11-16 08:24:48.220316+00	27	Iaer object (27)	2	[{"changed": {"fields": ["category"]}}]	12	1
3340	2018-11-16 08:24:57.044051+00	24	Iaer object (24)	2	[{"changed": {"fields": ["category"]}}]	12	1
3341	2018-11-16 08:25:04.113562+00	23	Iaer object (23)	2	[{"changed": {"fields": ["category"]}}]	12	1
3342	2018-11-16 08:25:14.157246+00	10	Iaer object (10)	2	[{"changed": {"fields": ["category"]}}]	12	1
3343	2018-11-16 08:29:21.786677+00	870	Iaer object (870)	2	[{"changed": {"fields": ["category"]}}]	12	1
3344	2018-11-16 08:29:27.463629+00	867	Iaer object (867)	2	[{"changed": {"fields": ["category"]}}]	12	1
3345	2018-11-16 08:29:33.638071+00	865	Iaer object (865)	2	[{"changed": {"fields": ["category"]}}]	12	1
3346	2018-11-16 08:29:39.881352+00	552	Iaer object (552)	2	[{"changed": {"fields": ["category"]}}]	12	1
3347	2018-11-16 08:29:46.290799+00	522	Iaer object (522)	2	[{"changed": {"fields": ["category"]}}]	12	1
3348	2018-11-16 08:29:52.678361+00	221	Iaer object (221)	2	[{"changed": {"fields": ["category"]}}]	12	1
3349	2018-11-16 08:30:04.651149+00	5	Iaer object (5)	2	[{"changed": {"fields": ["category"]}}]	12	1
3350	2018-11-20 08:59:15.763235+00	4	admin	1	[{"added": {}}]	2	1
3351	2018-11-20 09:00:20.63146+00	4	admin	2	[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "is_superuser", "user_permissions", "last_login"]}}]	2	1
3352	2018-11-21 08:23:40.723843+00	2	emily	2	[{"changed": {"fields": ["fund"]}}]	11	4
3353	2018-11-21 08:23:55.233732+00	4	dudu	2	[{"changed": {"fields": ["fund"]}}]	11	4
3354	2018-11-21 09:05:50.094178+00	10001	Iaer object (10001)	3		12	4
3355	2018-11-21 09:19:52.670767+00	880	Iaer object (880)	3		12	4
3356	2018-11-21 09:19:52.68943+00	879	Iaer object (879)	3		12	4
3357	2018-11-22 01:36:01.790775+00	883	Iaer object (883)	1	[{"added": {}}]	12	4
3358	2018-11-22 02:01:14.236686+00	884	Iaer object (884)	1	[{"added": {}}]	12	4
3359	2018-11-23 03:14:33.938121+00	908	Iaer object (908)	3		12	4
3360	2018-11-23 03:14:33.954013+00	907	Iaer object (907)	3		12	4
3361	2018-11-23 03:14:33.966045+00	906	Iaer object (906)	3		12	4
3362	2018-11-23 03:14:33.973564+00	905	Iaer object (905)	3		12	4
3363	2018-11-23 03:14:33.982059+00	904	Iaer object (904)	3		12	4
3364	2018-11-23 03:14:33.992018+00	903	Iaer object (903)	3		12	4
3365	2018-11-23 03:14:34.000711+00	902	Iaer object (902)	3		12	4
3366	2018-11-23 03:14:34.007831+00	901	Iaer object (901)	3		12	4
3367	2018-11-23 03:14:34.014875+00	900	Iaer object (900)	3		12	4
3368	2018-11-23 03:14:34.023321+00	899	Iaer object (899)	3		12	4
3369	2018-11-23 03:14:34.032547+00	898	Iaer object (898)	3		12	4
3370	2018-11-23 03:14:34.03985+00	897	Iaer object (897)	3		12	4
3371	2018-11-23 03:14:34.046829+00	896	Iaer object (896)	3		12	4
3372	2018-11-23 03:14:34.056014+00	895	Iaer object (895)	3		12	4
3373	2018-11-23 03:14:34.068755+00	894	Iaer object (894)	3		12	4
3374	2018-11-23 03:14:34.075793+00	893	Iaer object (893)	3		12	4
3375	2018-11-23 03:14:34.084808+00	892	Iaer object (892)	3		12	4
3376	2018-11-23 03:14:34.091939+00	891	Iaer object (891)	3		12	4
3377	2018-11-23 03:14:34.099229+00	890	Iaer object (890)	3		12	4
3378	2018-11-23 03:14:34.10622+00	889	Iaer object (889)	3		12	4
3379	2018-11-23 03:14:34.115414+00	888	Iaer object (888)	3		12	4
3380	2018-11-23 03:14:34.122304+00	887	Iaer object (887)	3		12	4
3381	2018-11-23 03:14:34.129422+00	886	Iaer object (886)	3		12	4
3382	2018-11-23 03:14:34.136382+00	885	Iaer object (885)	3		12	4
3383	2018-11-23 08:42:06.47626+00	23	Category object (23)	1	[{"added": {}}]	15	4
3384	2018-11-23 08:42:16.71649+00	1	Category object (1)	2	[{"changed": {"fields": ["sequence"]}}]	15	4
3385	2018-11-23 08:44:32.86329+00	911	Iaer object (911)	3		12	4
3386	2018-11-23 08:44:32.882519+00	910	Iaer object (910)	3		12	4
3387	2018-11-23 08:44:32.892665+00	909	Iaer object (909)	3		12	4
3388	2018-11-23 08:50:58.961752+00	2	1	1	[{"added": {}}]	13	4
3389	2018-11-23 08:51:08.134236+00	3	-1	1	[{"added": {}}]	13	4
3390	2018-11-23 08:51:16.958215+00	4	2	1	[{"added": {}}]	13	4
3391	2018-11-23 09:04:54.756808+00	749	Iaer object (749)	2	[{"changed": {"fields": ["created"]}}]	12	4
3392	2018-11-23 09:08:23.613329+00	727	Iaer object (727)	2	[{"changed": {"fields": ["created"]}}]	12	4
3393	2018-11-23 09:09:06.122541+00	730	Iaer object (730)	2	[{"changed": {"fields": ["created"]}}]	12	4
3394	2018-11-23 09:10:39.744904+00	178	Iaer object (178)	2	[{"changed": {"fields": ["created"]}}]	12	4
3395	2018-11-23 09:11:44.139645+00	335	Iaer object (335)	2	[{"changed": {"fields": ["created"]}}]	12	4
3396	2018-11-23 09:17:52.752074+00	727	Iaer object (727)	2	[{"changed": {"fields": ["created"]}}]	12	4
3397	2018-11-23 09:19:18.347689+00	335	Iaer object (335)	2	[{"changed": {"fields": ["created"]}}]	12	4
3398	2018-11-26 05:34:21.913098+00	70	RedEnvelope object (70)	3		10	4
3399	2018-11-26 05:34:21.940437+00	69	RedEnvelope object (69)	3		10	4
3400	2018-11-26 05:34:21.98787+00	68	RedEnvelope object (68)	3		10	4
3401	2018-11-26 05:34:22.00334+00	67	RedEnvelope object (67)	3		10	4
3402	2018-11-28 04:06:55.593331+00	bb9b3bcc265f9928d7e913b6bfc43b622918d430	bb9b3bcc265f9928d7e913b6bfc43b622918d430	1	[{"added": {}}]	16	4
3403	2018-12-10 06:22:19.161664+00	5	test	3		2	4
3404	2018-12-10 06:41:45.7836+00	6	test	3		2	4
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 3404, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	user
3	auth	group
4	auth	permission
5	contenttypes	contenttype
6	sessions	session
7	photo	photo
8	photo	user
9	photo	gallery
10	iaer	redenvelope
11	iaer	user
12	iaer	iaer
13	iaer	fund
14	iaer	verify
15	iaer	category
16	authtoken	token
17	iaer	setting
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('django_content_type_id_seq', 17, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-11-14 05:55:54.057842+00
2	auth	0001_initial	2018-11-14 05:55:54.479714+00
3	admin	0001_initial	2018-11-14 05:55:54.602742+00
4	admin	0002_logentry_remove_auto_add	2018-11-14 05:55:54.662301+00
5	contenttypes	0002_remove_content_type_name	2018-11-14 05:55:54.788654+00
6	auth	0002_alter_permission_name_max_length	2018-11-14 05:55:54.838806+00
7	auth	0003_alter_user_email_max_length	2018-11-14 05:55:54.908795+00
8	auth	0004_alter_user_username_opts	2018-11-14 05:55:54.979872+00
9	auth	0005_alter_user_last_login_null	2018-11-14 05:55:55.054891+00
10	auth	0006_require_contenttypes_0002	2018-11-14 05:55:55.067313+00
11	auth	0007_alter_validators_add_error_messages	2018-11-14 05:55:55.136767+00
12	auth	0008_alter_user_username_max_length	2018-11-14 05:55:55.272895+00
13	auth	0009_alter_user_last_name_max_length	2018-11-14 05:55:55.350953+00
14	authtoken	0001_initial	2018-11-14 05:55:55.47508+00
15	authtoken	0002_auto_20160226_1747	2018-11-14 05:55:55.741624+00
16	iaer	0001_initial	2018-11-14 05:55:56.402898+00
17	iaer	0002_auto_20181113_2332	2018-11-14 05:55:56.485915+00
18	iaer	0003_auto_20181114_1354	2018-11-14 05:55:56.576516+00
19	photo	0001_initial	2018-11-14 05:55:56.937419+00
20	photo	0002_auto_20181113_2338	2018-11-14 05:55:57.414806+00
21	sessions	0001_initial	2018-11-14 05:55:57.481396+00
22	iaer	0004_auto_20181114_1500	2018-11-14 07:00:49.310546+00
23	iaer	0005_auto_20181114_1508	2018-11-14 07:08:46.438637+00
24	iaer	0006_auto_20181114_1511	2018-11-21 08:24:11.100338+00
25	iaer	0007_auto_20181114_1512	2018-11-21 08:24:11.296605+00
26	iaer	0008_auto_20181121_1622	2018-11-21 08:24:11.630821+00
27	iaer	0009_auto_20181220_1538	2018-12-20 07:39:00.408831+00
28	iaer	0010_auto_20181226_1710	2018-12-26 09:10:17.667599+00
29	iaer	0011_auto_20181227_1418	2018-12-27 06:18:15.49854+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('django_migrations_id_seq', 29, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
7yeukeq6jdssao3ig7guv4xji695n20p	YzgxOGU5ZTg3NmM4ZmQ1ZDJhYTQ4OTlkNGY2MjE0MTg4NmFmMzUxMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjMGE5YmFhYmQwYzg3NzEwOTllZWE4ODBlZGUyMWJhZTFkNGNjNSIsInRva2VuIjoiODNjZDBmN2EwNDgzZGI3M2NlNDIyMzY1OGNiNjFkZWFjNjUzMWU4NSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-11-28 07:39:04.09082+00
lh69nkhbcgvk00dy3g5qwu0e1ibv03m7	OGQ2YTc4ZWFiMTZiYzE2ZDIyNjU2Yjk5NTEzYmNkZGJiZDY2YTI1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjMGE5YmFhYmQwYzg3NzEwOTllZWE4ODBlZGUyMWJhZTFkNGNjNSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-11-29 02:51:06.796637+00
bpjoi1w32zcqtmcfoe82woc3o8jq3jzz	M2RmMmQ2NjExNGYxZWNiYzMyZTQxYTZiZTA2NTZiOGRhNzc5ODAxMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmMGMwYTliYWFiZDBjODc3MTA5OWVlYTg4MGVkZTIxYmFlMWQ0Y2M1In0=	2018-11-29 09:05:54.639283+00
e2cy6z5c50xsck9nigasqcvdl1g4gqht	M2Y2NDFkYjk4ZmJkOGIwMjE0YWNmYjM0OTE4ZTc5MmY5NmUyMDgyZjp7InRva2VuIjoiMzc5YTIyYjBjZjVmNzcyOTYwYWM2Njc3ZDE2NWVhZjg1ZDljZDhlMiJ9	2018-11-29 09:43:05.606352+00
8lkr37fo4shwo0b26j8owduima60lowk	YjVjZmJmNTI1YzAyMDE1NWI5YmUwZjY2NmE5MjZkMzQwYzQ1NDY3NTp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwYzBhOWJhYWJkMGM4NzcxMDk5ZWVhODgwZWRlMjFiYWUxZDRjYzUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidG9rZW4iOiIzNzlhMjJiMGNmNWY3NzI5NjBhYzY2NzdkMTY1ZWFmODVkOWNkOGUyIn0=	2018-11-29 09:58:45.331207+00
84thc5klpod55yl1b7bwzv0bdg0ks54u	OGQ2YTc4ZWFiMTZiYzE2ZDIyNjU2Yjk5NTEzYmNkZGJiZDY2YTI1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjMGE5YmFhYmQwYzg3NzEwOTllZWE4ODBlZGUyMWJhZTFkNGNjNSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-11-30 03:11:45.238358+00
wdjtw4ry1wzf1s7vkdzuy5zbny0fmb94	NjU2ZGFkYmJjY2U5ZGY2ZjdjOGI2NTRmYjIyMTEwZTZlZTZjNDUzMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2018-12-07 03:13:41.081168+00
tdsuxl6x3ax1koqfxeor0huj4ikuo28r	ZjlmNjllYmQzZGY0ZWI2OWE1ZTEyMGMxYzU5NDllNmYyMmMwNmEyZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJ0b2tlbiI6IjY5ZjMxZTNjNzczODRjNGFiNGQxYzFmMmQxNDVmOWRkZGFiYTE3ZGYiLCJfYXV0aF91c2VyX2hhc2giOiIzY2I2NzUzMjVmZDUzNWI0ODdiOGMxMGQ1YjkzMDI5NzBhNTFkM2Y3In0=	2018-12-10 05:05:38.406881+00
x88jzo3mnu7p0pfbwevo776pojf4vl3r	NTg4ZDkzNjY4N2Q3MzI5NjcyNDAzNDVmOTZkMDY0NTBiZDExOTcyZTp7InRva2VuIjoiNjlmMzFlM2M3NzM4NGM0YWI0ZDFjMWYyZDE0NWY5ZGRkYWJhMTdkZiJ9	2018-12-10 15:42:37.480239+00
458vbnzvumbl6x6y87voys3w80q44v0n	ZGU5NGEzZjZkMDY2OTc2ZTljNTRlOGI1YWZhYTUxZjFkYzEyYTM2NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYjY3NTMyNWZkNTM1YjQ4N2I4YzEwZDViOTMwMjk3MGE1MWQzZjciLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-12-24 06:22:02.498506+00
8ba5qmrr7xs3ow7shz0yxmtihuf4wi13	ZGU5NGEzZjZkMDY2OTc2ZTljNTRlOGI1YWZhYTUxZjFkYzEyYTM2NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjYjY3NTMyNWZkNTM1YjQ4N2I4YzEwZDViOTMwMjk3MGE1MWQzZjciLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-12-24 06:40:32.059772+00
\.


--
-- Data for Name: iaer_category; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY iaer_category (id, name, sequence, created, modified) FROM stdin;
2	服饰美容	10	\N	2018-11-14
3	生活日用	20	\N	2018-11-14
4	住房缴费	30	\N	2018-11-14
5	交通出行	40	\N	2018-11-14
6	通讯物流	50	\N	2018-11-14
7	文教娱乐	60	\N	2018-11-14
8	健康保险	70	\N	2018-11-14
11	小孩奶粉	100	\N	2018-11-14
12	小孩尿布	110	\N	2018-11-14
13	小孩玩具	120	\N	2018-11-14
14	小孩健康	130	\N	2018-11-14
16	收入	999	\N	2018-11-14
10	人情往来	80	\N	2018-11-16
17	装修	90	\N	2018-11-16
15	小孩其他	300	\N	2018-11-16
19	小孩零食	140	\N	2018-11-16
18	其他消费	400	\N	2018-11-16
20	小孩服饰	150	\N	2018-11-16
21	小孩文具	160	\N	2018-11-16
22	小孩生活用品	170	\N	2018-11-16
23	请选择类型	0	\N	2018-11-23
1	饮食	1	\N	2018-11-23
\.


--
-- Name: iaer_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('iaer_category_id_seq', 23, true);


--
-- Data for Name: iaer_fund; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY iaer_fund (id, name, monthly_money, yearly_money, alternate_money, created, modified) FROM stdin;
1	2018.11	5000	80000	0	\N	2018-11-14
2	1	0	0	0	\N	2018-11-23
3	-1	0	0	0	\N	2018-11-23
4	2	0	0	0	\N	2018-11-23
\.


--
-- Name: iaer_fund_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('iaer_fund_id_seq', 4, true);


--
-- Data for Name: iaer_iaer; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY iaer_iaer (id, money, category, money_type, remark, created, type, chart_type, format, datetime, description, timing, user_id) FROM stdin;
2	-55	饮食	0	老婆大人零食	2017-10-26 01:03:24.445768+00	0	0	\N	2018-11-16 05:47:05.364917+00	\N	\N	1
15	-11	小孩健康	0	挂号费	2017-11-05 01:43:34+00	0	0	\N	2018-11-16 07:20:42.625275+00	\N	\N	2
3	-279	文教娱乐	0	树莓派3b	2017-10-26 02:03:31+00	0	0	\N	2018-11-16 06:43:27.769958+00	\N	\N	1
4	-105	文教娱乐	0	SanDisk TF卡	2017-10-26 02:12:48+00	0	0	\N	2018-11-16 06:43:19.990638+00	\N	\N	1
7	-159	生活日用	0	电饭煲	2017-11-02 10:40:40.375058+00	0	0	\N	2018-11-16 05:47:05.435244+00	\N	\N	2
8	-100	饮食	0	老婆大人	2017-11-02 10:40:59.408416+00	0	0	\N	2018-11-16 05:47:05.44845+00	\N	\N	2
9	-26	饮食	0	零食	2017-11-02 13:34:58.47793+00	0	0	\N	2018-11-16 05:47:05.461349+00	\N	\N	2
5	-102	生活日用	0	micro sd卡和零食	2017-10-27 11:44:36+00	0	0	\N	2018-11-16 08:30:04.638451+00	\N	\N	1
11	-1500	生活日用	0	生活费	2017-11-03 10:39:22.155274+00	0	0	\N	2018-11-16 05:47:05.488936+00	\N	\N	2
12	-36	服饰美容	0	淘宝	2017-11-03 10:40:30.256204+00	0	0	\N	2018-11-16 05:47:05.503853+00	\N	\N	2
14	-22	饮食	0	KFC早餐	2017-11-05 01:43:16.61815+00	0	0	\N	2018-11-16 05:47:05.530818+00	\N	\N	2
16	-183	小孩健康	0	咳嗽，感冒	2017-11-05 01:44:09+00	0	0	\N	2018-11-16 07:20:49.7759+00	\N	\N	1
17	-17	小孩健康	0	挂号费	2017-11-05 01:44:42+00	0	0	\N	2018-11-16 07:20:56.085312+00	\N	\N	1
25	-36	小孩健康	0	嘟嘟看医生	2017-11-08 23:12:36+00	0	0	\N	2018-11-16 07:21:05.809748+00	\N	\N	2
18	-10	饮食	0	蛋卷	2017-11-05 05:15:42.388377+00	0	0	\N	2018-11-16 05:47:05.584487+00	\N	\N	2
19	-32	饮食	0	2碗泡馍	2017-11-05 05:28:48.392915+00	0	0	\N	2018-11-16 05:47:05.595705+00	\N	\N	1
20	-72	生活日用	0	眼镜2付	2017-11-05 12:27:33.211475+00	0	0	\N	2018-11-16 05:47:05.60744+00	\N	\N	1
21	-22	生活日用	0	剪头发	2017-11-06 12:04:08.29547+00	0	0	\N	2018-11-16 05:47:05.635447+00	\N	\N	1
22	-38	生活日用	0	雨刮器	2017-11-08 23:10:53.685936+00	0	0	\N	2018-11-16 05:47:05.646537+00	\N	\N	2
10	-100	通讯物流	0	话费	2017-11-03 09:34:42+00	0	0	\N	2018-11-16 08:25:14.138969+00	\N	\N	1
23	-30	交通出行	0	高速收费两趟	2017-11-08 23:11:23+00	0	0	\N	2018-11-16 08:25:04.104283+00	\N	\N	2
31	-165	小孩生活用品	0	奶瓶，沙茶油，润肤油	2017-11-10 13:22:27+00	0	0	\N	2018-11-16 07:21:13.381218+00	\N	\N	2
26	4627	收入	0	工资	2017-11-08 23:13:20.039306+00	0	0	\N	2018-11-16 05:47:05.728029+00	\N	\N	2
24	-8	交通出行	0	停车费	2017-11-08 23:11:51+00	0	0	\N	2018-11-16 08:24:57.034745+00	\N	\N	2
28	-30	饮食	0	午餐	2017-11-10 13:19:00.028468+00	0	0	\N	2018-11-16 05:47:05.760398+00	\N	\N	2
27	-25	交通出行	0	高速费	2017-11-10 13:18:42+00	0	0	\N	2018-11-16 08:24:48.204412+00	\N	\N	2
29	-10	交通出行	0	高速费	2017-11-10 13:19:19+00	0	0	\N	2018-11-16 08:24:40.435165+00	\N	\N	2
32	-304	小孩生活用品	0	全棉时代柔纸巾	2017-11-11 01:19:13+00	0	0	\N	2018-11-16 07:21:19.332824+00	\N	\N	2
33	-208	小孩生活用品	0	恒温调温器	2017-11-11 01:24:36+00	0	0	\N	2018-11-16 07:21:27.107892+00	\N	\N	2
49	-333	小孩生活用品	0	床上7件套	2017-11-16 13:38:27+00	0	0	\N	2018-11-16 07:21:33.001916+00	\N	\N	2
34	-244	生活日用	0	膳魔师保温杯X2	2017-11-11 01:26:18.38913+00	0	0	\N	2018-11-16 05:47:05.832399+00	\N	\N	2
35	-50	生活日用	0	蓝月亮	2017-11-11 05:38:13.422007+00	0	0	\N	2018-11-16 05:47:05.845741+00	\N	\N	2
36	-103	生活日用	0	食用油3瓶	2017-11-11 05:42:54.766302+00	0	0	\N	2018-11-16 05:47:05.865103+00	\N	\N	2
37	-108	生活日用	0	清风卷纸11x10卷	2017-11-11 05:45:38.708949+00	0	0	\N	2018-11-16 05:47:05.876043+00	\N	\N	2
38	-98	生活日用	0	清风抽纸3包x16	2017-11-11 05:46:25.295459+00	0	0	\N	2018-11-16 05:47:05.891942+00	\N	\N	2
39	-78	生活日用	0	大米5kgx4	2017-11-11 07:53:24.444758+00	0	0	\N	2018-11-16 05:47:05.903071+00	\N	\N	2
30	-1000	交通出行	0	油卡	2017-11-10 13:20:01+00	0	0	\N	2018-11-16 08:24:31.413317+00	\N	\N	2
41	-6	饮食	0	肠粉	2017-11-15 00:07:07.564757+00	0	0	\N	2018-11-16 05:47:05.926079+00	\N	\N	2
42	1400	收入	0	车险报销	2017-11-15 00:07:32.995334+00	0	0	\N	2018-11-16 05:47:05.936891+00	\N	\N	2
43	1000	收入	0	三江卡	2017-11-15 00:07:52.732903+00	0	0	\N	2018-11-16 05:47:05.955879+00	\N	\N	2
44	-20	生活日用	0	手机壳	2017-11-15 07:18:19.533071+00	0	0	\N	2018-11-16 05:47:05.966657+00	\N	\N	1
45	-18	生活日用	0	手机后盖	2017-11-15 07:18:32.691316+00	0	0	\N	2018-11-16 05:47:05.979062+00	\N	\N	1
40	-15	交通出行	0	高速费用	2017-11-15 00:06:43+00	0	0	\N	2018-11-16 08:24:23.064261+00	\N	\N	2
47	-13	饮食	0	甘蔗	2017-11-15 14:02:19.89842+00	0	0	\N	2018-11-16 05:47:06.005259+00	\N	\N	2
48	-91	饮食	0	三江购物	2017-11-15 14:02:46.166259+00	0	0	\N	2018-11-16 05:47:06.031347+00	\N	\N	2
57	-249	小孩服饰	0	max win连体服	2017-11-18 06:38:29+00	0	0	\N	2018-11-16 07:21:39.288582+00	\N	\N	2
50	-13	饮食	0	甘蔗	2017-11-17 13:40:02.836566+00	0	0	\N	2018-11-16 05:47:06.056168+00	\N	\N	2
51	-22	饮食	0	肯德基	2017-11-17 13:40:17.193701+00	0	0	\N	2018-11-16 05:47:06.07047+00	\N	\N	2
52	-9	饮食	0	水果	2017-11-17 13:40:34.946457+00	0	0	\N	2018-11-16 05:47:06.081973+00	\N	\N	2
53	-102	服饰美容	0	睡衣	2017-11-18 00:40:07.123313+00	0	0	\N	2018-11-16 05:47:06.096073+00	\N	\N	2
6	-199	文教娱乐	0	bandwagon vps	2017-11-02 03:21:48+00	0	0	\N	2018-11-16 06:42:36.38521+00	\N	\N	1
56	-103	饮食	0	午饭	2017-11-18 06:37:51.283287+00	0	0	\N	2018-11-16 05:47:06.135974+00	\N	\N	2
59	-158	小孩健康	0	乳钙2盒	2017-11-18 07:15:10+00	0	0	\N	2018-11-16 07:21:47.792114+00	\N	\N	2
46	-100	通讯物流	0	妈妈手机充值	2017-11-15 10:40:16+00	0	0	\N	2018-11-16 08:24:16.881439+00	\N	\N	2
65	-168	小孩生活用品	0	辅食机	2017-11-21 14:07:23+00	0	0	\N	2018-11-16 07:21:54.834643+00	\N	\N	2
61	-11	饮食	0	coco奶茶	2017-11-18 08:46:21.210381+00	0	0	\N	2018-11-16 05:47:06.208+00	\N	\N	2
62	-22	生活日用	0	理发	2017-11-18 23:36:44.214905+00	0	0	\N	2018-11-16 05:47:06.22181+00	\N	\N	2
63	-6	饮食	0	山东煎饼	2017-11-20 00:02:36.69043+00	0	0	\N	2018-11-16 05:47:06.235603+00	\N	\N	1
64	-15	生活日用	0	Z5P边角	2017-11-21 04:31:42.831615+00	0	0	\N	2018-11-16 05:47:06.254409+00	\N	\N	1
66	-34	小孩生活用品	0	奶瓶收纳盒	2017-11-21 14:07:41+00	0	0	\N	2018-11-16 07:22:01.742738+00	\N	\N	2
69	-16	小孩生活用品	0	三角巾	2017-11-24 15:13:42+00	0	0	\N	2018-11-16 07:22:08.741432+00	\N	\N	2
67	-11	饮食	0	coco奶茶	2017-11-24 13:51:13.178445+00	0	0	\N	2018-11-16 05:47:06.296455+00	\N	\N	2
68	-31	饮食	0	KFC	2017-11-24 14:00:50.115141+00	0	0	\N	2018-11-16 05:47:06.309813+00	\N	\N	2
58	-9	交通出行	0	停车费	2017-11-18 06:42:40+00	0	0	\N	2018-11-16 08:24:09.341699+00	\N	\N	2
70	-21000	装修	0	半包30%	2017-11-26 13:16:25.384292+00	0	0	\N	2018-11-16 05:47:06.334277+00	\N	\N	1
71	-3500	装修	0	设计	2017-11-26 13:16:40.25851+00	0	0	\N	2018-11-16 05:47:06.346919+00	\N	\N	1
72	-97	服饰美容	0	背心马甲	2017-11-26 13:18:58.327712+00	0	0	\N	2018-11-16 05:47:06.358242+00	\N	\N	2
55	-8	文教娱乐	0	按摩	2017-11-18 04:40:22+00	0	0	\N	2018-11-16 06:35:30.29971+00	\N	\N	2
13	-31	饮食	0	阿香米线	2017-11-04 06:55:39.884817+00	0	0	\N	2018-11-16 05:47:05.515996+00	\N	\N	2
76	-48	饮食	0	三江购物	2017-11-28 12:50:48.398702+00	0	0	\N	2018-11-16 05:47:06.41415+00	\N	\N	2
77	-72	服饰美容	0	秋衣	2017-11-28 12:51:08.013941+00	0	0	\N	2018-11-16 05:47:06.425709+00	\N	\N	2
78	-8	饮食	0	冬枣	2017-11-28 12:51:26.321286+00	0	0	\N	2018-11-16 05:47:06.437014+00	\N	\N	2
80	-22	饮食	0	夜宵米线	2017-11-29 14:42:16.008659+00	0	0	\N	2018-11-16 05:47:06.463535+00	\N	\N	2
83	4627	收入	0	工资	2017-11-29 14:44:34.750905+00	0	0	\N	2018-11-16 05:47:06.500298+00	\N	\N	2
84	-46	饮食	0	老婆大人零食	2017-11-30 12:21:06.089228+00	0	0	\N	2018-11-16 05:47:06.511616+00	\N	\N	2
89	-21	小孩健康	0	妇儿医院挂号	2017-12-02 05:45:11+00	0	0	\N	2018-11-16 07:17:46.608738+00	\N	\N	2
85	-100	交通出行	0	油费	2017-11-30 12:21:25+00	0	0	\N	2018-11-16 08:23:33.832122+00	\N	\N	2
88	-132	饮食	0	涌上外婆桥	2017-12-02 05:44:16.221191+00	0	0	\N	2018-11-16 05:47:06.562528+00	\N	\N	2
103	-58	小孩生活用品	0	围嘴	2017-12-09 13:17:06+00	0	0	\N	2018-11-16 07:17:56.418604+00	\N	\N	2
90	-22	饮食	0	肯德基早餐	2017-12-02 05:45:49.762954+00	0	0	\N	2018-11-16 05:47:06.586177+00	\N	\N	2
87	-37	饮食	0	红肠	2017-12-02 05:42:59+00	0	0	\N	2018-11-16 08:23:26.355394+00	\N	\N	1
92	-15	饮食	0	油赞子	2017-12-03 03:40:54.8752+00	0	0	\N	2018-11-16 05:47:06.609636+00	\N	\N	2
93	-11600	装修	0	1.5+2.5风管机	2017-12-03 03:42:18.959408+00	0	0	\N	2018-11-16 05:47:06.620529+00	\N	\N	1
94	-108	饮食	0	稻花香米5kg	2017-12-05 07:43:52.450831+00	0	0	\N	2018-11-16 05:47:06.631735+00	\N	\N	1
95	-69	生活日用	0	生活用品	2017-12-05 11:37:46.098004+00	0	0	\N	2018-11-16 05:47:06.647703+00	\N	\N	1
96	-27	饮食	0	零食	2017-12-05 12:43:51.993112+00	0	0	\N	2018-11-16 05:47:06.65975+00	\N	\N	1
97	-1500	生活日用	0	生活费	2017-12-06 14:34:08.039676+00	0	0	\N	2018-11-16 05:47:06.674661+00	\N	\N	2
98	-13	饮食	0	甘蔗	2017-12-06 14:34:23.461944+00	0	0	\N	2018-11-16 05:47:06.686302+00	\N	\N	2
99	-27	饮食	0	五斤锅巴	2017-12-06 14:34:41.155732+00	0	0	\N	2018-11-16 05:47:06.708708+00	\N	\N	2
100	-18	生活日用	0	生活用品	2017-12-06 14:34:56.134455+00	0	0	\N	2018-11-16 05:47:06.720106+00	\N	\N	2
101	-226	饮食	0	柠檬泰	2017-12-09 06:34:05.884473+00	0	0	\N	2018-11-16 05:47:06.732026+00	\N	\N	1
102	-5	生活日用	0	西瓜霜含片	2017-12-09 13:16:45.732218+00	0	0	\N	2018-11-16 05:47:06.747827+00	\N	\N	2
108	-199	小孩生活用品	0	婴儿推车	2017-12-12 11:46:22+00	0	0	\N	2018-11-16 07:18:11.753352+00	\N	\N	2
104	-208	生活日用	0	即热水龙头	2017-12-09 13:18:23.443621+00	0	0	\N	2018-11-16 05:47:06.774459+00	\N	\N	2
107	-6033	装修	0	AO Smith前置+净水器	2017-12-10 07:05:46.270305+00	0	0	\N	2018-11-16 05:47:06.812256+00	\N	\N	1
110	-25	小孩服饰	0	帽子	2017-12-12 11:47:44+00	0	0	\N	2018-11-16 07:18:19.43345+00	\N	\N	2
122	-10	小孩服饰	0	袜子3双	2017-12-23 11:39:59+00	0	0	\N	2018-11-16 07:13:46.693536+00	\N	\N	2
139	-101	小孩生活用品	0	奶嘴LL3个、牙胶一个	2017-12-27 13:44:12+00	0	0	\N	2018-11-16 07:18:27.335531+00	\N	\N	2
111	-59	生活日用	0	润唇膏	2017-12-12 11:48:05.134375+00	0	0	\N	2018-11-16 05:47:06.878516+00	\N	\N	2
112	-81	饮食	0	老婆大人	2017-12-14 14:12:26.929959+00	0	0	\N	2018-11-16 05:47:06.890828+00	\N	\N	2
113	-206	生活日用	0	中石化	2017-12-14 14:13:04.693198+00	0	0	\N	2018-11-16 05:47:06.903985+00	\N	\N	2
114	-400	生活日用	0	眼镜	2017-12-14 14:13:18.034112+00	0	0	\N	2018-11-16 05:47:06.919686+00	\N	\N	2
115	-159	生活日用	0	京东生活用品	2017-12-14 14:14:48.661791+00	0	0	\N	2018-11-16 05:47:06.931665+00	\N	\N	2
116	-23	饮食	0	晚饭	2017-12-14 14:16:12.03599+00	0	0	\N	2018-11-16 05:47:06.944909+00	\N	\N	2
117	11838	收入	0	工资	2017-12-15 14:11:04.518179+00	0	0	\N	2018-11-16 05:47:06.962376+00	\N	\N	1
119	-12773	装修	0	瓷砖	2017-12-20 13:48:10.642265+00	0	0	\N	2018-11-16 05:47:06.998279+00	\N	\N	1
120	-31	饮食	0	午饭	2017-12-23 11:39:13.399385+00	0	0	\N	2018-11-16 05:47:07.024802+00	\N	\N	2
121	-6	生活日用	0	玻璃水	2017-12-23 11:39:25.949935+00	0	0	\N	2018-11-16 05:47:07.05062+00	\N	\N	2
127	-19	小孩服饰	0	松紧带	2017-12-23 12:33:17+00	0	0	\N	2018-11-16 07:13:53.26249+00	\N	\N	2
123	-8	生活日用	0	洗衣液	2017-12-23 11:40:18.54884+00	0	0	\N	2018-11-16 05:47:07.082428+00	\N	\N	2
124	-50	饮食	0	零食	2017-12-23 11:41:00.504886+00	0	0	\N	2018-11-16 05:47:07.095548+00	\N	\N	2
125	-13	饮食	0	大饼&奶茶	2017-12-23 11:41:29.352431+00	0	0	\N	2018-11-16 05:47:07.109078+00	\N	\N	2
126	-28	生活日用	0	手机壳	2017-12-23 11:43:30.489018+00	0	0	\N	2018-11-16 05:47:07.125111+00	\N	\N	2
86	-48	小孩奶粉	0	嘉宝米粉	2017-12-02 05:42:42+00	0	0	\N	2018-11-16 07:17:39.36089+00	\N	\N	1
91	-17	交通出行	0	停车费	2017-12-02 05:47:08+00	0	0	\N	2018-11-16 08:23:10.148533+00	\N	\N	2
128	-9	通讯物流	0	快递	2017-12-23 12:35:04+00	0	0	\N	2018-11-16 08:23:02.047241+00	\N	\N	2
130	-10	饮食	0	苹果	2017-12-23 12:37:22.835202+00	0	0	\N	2018-11-16 05:47:07.200669+00	\N	\N	2
129	-20	通讯物流	0	手机充值	2017-12-23 12:36:53+00	0	0	\N	2018-11-16 08:22:54.527626+00	\N	\N	2
132	-12	生活日用	0	忘记了	2017-12-23 12:39:15.709404+00	0	0	\N	2018-11-16 05:47:07.229661+00	\N	\N	2
133	-400	装修	0	空调铜管+支架	2017-12-24 10:35:17.730471+00	0	0	\N	2018-11-16 05:47:07.246543+00	\N	\N	1
131	-840	通讯物流	0	手机充值包一年流量	2017-12-23 12:38:02+00	0	0	\N	2018-11-16 08:22:35.284938+00	\N	\N	2
134	-315	文教娱乐	0	小米智能家居套装	2017-12-27 12:07:42+00	0	0	\N	2018-11-16 08:22:27.690225+00	\N	\N	1
136	-21000	装修	0	装修半包30%	2017-12-27 12:10:54.1212+00	0	0	\N	2018-11-16 05:47:07.310925+00	\N	\N	1
137	-7	饮食	0	甘蔗	2017-12-27 13:43:02.276259+00	0	0	\N	2018-11-16 05:47:07.332276+00	\N	\N	2
138	-5	饮食	0	包子	2017-12-27 13:43:16.226116+00	0	0	\N	2018-11-16 05:47:07.348663+00	\N	\N	2
148	-26	小孩生活用品	0	磨牙棒	2018-01-01 11:14:20+00	0	0	\N	2018-11-16 07:18:44.410748+00	\N	\N	1
149	-5	交通出行	0	停车费	2018-01-01 11:30:41+00	0	0	\N	2018-11-16 08:21:59.853659+00	\N	\N	1
109	-129	小孩服饰	0	羽绒服+马甲	2017-12-12 11:47:08+00	0	0	\N	2018-11-16 07:13:40.830761+00	\N	\N	2
143	-188	饮食	0	餐饮	2017-12-30 11:29:43.88078+00	0	0	\N	2018-11-16 05:47:07.42696+00	\N	\N	2
144	-13	饮食	0	午餐	2017-12-31 12:53:34.078949+00	0	0	\N	2018-11-16 05:47:07.438367+00	\N	\N	2
145	-2500	装修	0	奥普吊顶+2个灯	2017-12-31 12:55:05.285167+00	0	0	\N	2018-11-16 05:47:07.450339+00	\N	\N	1
146	-16	饮食	0	蛋糕	2017-12-31 13:03:17.443866+00	0	0	\N	2018-11-16 05:47:07.462103+00	\N	\N	2
135	-100	通讯物流	0	手机话费	2017-12-27 12:07:55+00	0	0	\N	2018-11-16 08:22:17.788402+00	\N	\N	1
140	-143	小孩生活用品	0	膳魔师保温杯	2017-12-27 13:44:48+00	0	0	\N	2018-11-16 07:29:06.963306+00	\N	\N	2
147	-280	交通出行	0	汽车保养	2017-12-31 13:03:48+00	0	0	\N	2018-11-16 08:22:07.015553+00	\N	\N	2
142	-12	小孩健康	0	A D剂	2017-12-27 13:46:23+00	0	0	\N	2018-11-16 07:12:44.196754+00	\N	\N	2
60	-350	服饰美容	0	Jason wood外套	2017-11-18 08:45:59.195976+00	0	0	\N	2018-11-16 05:47:06.187659+00	\N	\N	2
81	5095	收入	0	生育保险	2017-11-29 14:43:01.764796+00	0	0	\N	2018-11-16 05:47:06.474828+00	\N	\N	2
82	26858	收入	0	2016提成	2017-11-29 14:43:29.540102+00	0	0	\N	2018-11-16 05:47:06.489527+00	\N	\N	2
200	-185	小孩奶粉	0	4罐米粉	2018-01-20 01:52:52+00	0	0	\N	2018-11-16 07:11:51.684374+00	\N	\N	2
105	-100	人情往来	0	泡脚药	2017-12-09 13:19:16+00	0	0	\N	2018-11-16 06:41:34.519883+00	\N	\N	1
150	-150	服饰美容	0	hm衣服	2018-01-01 12:33:01.651728+00	0	0	\N	2018-11-16 05:47:07.507949+00	\N	\N	1
151	-130	饮食	0	草莓	2018-01-01 12:33:14.219922+00	0	0	\N	2018-11-16 05:47:07.519029+00	\N	\N	1
152	-10	饮食	0	coco奶茶	2018-01-01 12:33:35.578728+00	0	0	\N	2018-11-16 05:47:07.53102+00	\N	\N	1
176	-94	小孩生活用品	0	磨牙棒等用品	2018-01-11 13:44:50+00	0	0	\N	2018-11-16 07:19:05.037891+00	\N	\N	2
154	-51	饮食	0	泡芙加米线	2018-01-01 12:34:44.927631+00	0	0	\N	2018-11-16 05:47:07.556477+00	\N	\N	2
155	-22	饮食	0	肯德基早餐	2018-01-01 12:35:41.646533+00	0	0	\N	2018-11-16 05:47:07.570223+00	\N	\N	2
156	-10	饮食	0	甘蔗	2018-01-03 12:30:22.760883+00	0	0	\N	2018-11-16 05:47:07.597142+00	\N	\N	2
157	-35	生活日用	0	空调外机储水架	2018-01-03 12:30:53.911462+00	0	0	\N	2018-11-16 05:47:07.610961+00	\N	\N	2
158	-500	生活日用	0	三江卡	2018-01-03 12:31:18.286682+00	0	0	\N	2018-11-16 05:47:07.621882+00	\N	\N	2
178	4627	收入	0	工资	2017-12-12 14:04:54+00	0	0	\N	2018-11-23 09:10:39.728765+00	\N	\N	2
160	200	收入	0	车子刮擦	2018-01-03 12:32:04.313747+00	0	0	\N	2018-11-16 05:47:07.650415+00	\N	\N	2
161	-40	生活日用	0	理发	2018-01-04 14:28:39.660332+00	0	0	\N	2018-11-16 05:47:07.66818+00	\N	\N	2
162	-229	饮食	0	自助餐x2	2018-01-05 11:45:47.171477+00	0	0	\N	2018-11-16 05:47:07.679368+00	\N	\N	2
163	-830	其他消费	0	戒指	2018-01-06 08:18:20.947627+00	0	0	\N	2018-11-16 05:47:07.691009+00	\N	\N	1
164	-9	饮食	0	大饼油条豆腐脑x2	2018-01-06 08:18:52.996059+00	0	0	\N	2018-11-16 05:47:07.703171+00	\N	\N	2
165	-230	服饰美容	0	鞋+两件T恤+围巾	2018-01-06 08:19:41.537133+00	0	0	\N	2018-11-16 05:47:07.717056+00	\N	\N	2
153	-40	小孩服饰	0	袜子和衣服	2018-01-01 12:34:13+00	0	0	\N	2018-11-16 07:12:30.632277+00	\N	\N	2
159	-190	交通出行	0	加油	2018-01-03 12:31:41+00	0	0	\N	2018-11-16 08:21:53.231727+00	\N	\N	2
168	-100	饮食	0	螃蟹	2018-01-07 13:41:36.394873+00	0	0	\N	2018-11-16 05:47:07.774362+00	\N	\N	2
169	-24	饮食	0	山药片7包	2018-01-07 13:42:36.501108+00	0	0	\N	2018-11-16 05:47:07.789512+00	\N	\N	2
170	-22	饮食	0	粥	2018-01-07 13:44:00.511642+00	0	0	\N	2018-11-16 05:47:07.800901+00	\N	\N	2
171	-75	饮食	0	老婆大人	2018-01-08 12:28:20.325027+00	0	0	\N	2018-11-16 05:47:07.813848+00	\N	\N	2
172	-5	饮食	0	臭豆腐	2018-01-08 12:28:30.175709+00	0	0	\N	2018-11-16 05:47:07.825706+00	\N	\N	2
173	-1208	生活日用	0	照片打印机	2018-01-10 12:10:45.560806+00	0	0	\N	2018-11-16 05:47:07.83696+00	\N	\N	2
174	-40	饮食	0	三江购物水香蕉梨	2018-01-10 12:11:22.572949+00	0	0	\N	2018-11-16 05:47:07.850487+00	\N	\N	2
175	-558	生活日用	0	倒车雷达	2018-01-11 13:43:04.043907+00	0	0	\N	2018-11-16 05:47:07.861922+00	\N	\N	2
202	-39	饮食	0	药鸡蛋饼矿泉水	2018-01-20 01:56:01+00	0	0	\N	2018-11-16 08:16:40.852892+00	\N	\N	1
177	-55	饮食	0	聚餐	2018-01-12 14:03:19.66514+00	0	0	\N	2018-11-16 05:47:07.886821+00	\N	\N	1
179	-1400	装修	0	奥普浴霸	2018-01-13 12:27:40.896845+00	0	0	\N	2018-11-16 05:47:07.908657+00	\N	\N	1
180	-9745	装修	0	窗	2018-01-13 12:28:00.891141+00	0	0	\N	2018-11-16 05:47:07.922889+00	\N	\N	1
181	-363	装修	0	雷士筒灯21个	2018-01-13 12:29:56.028854+00	0	0	\N	2018-11-16 05:47:07.938633+00	\N	\N	1
182	-328	饮食	0	黄记煌	2018-01-13 12:31:10.777542+00	0	0	\N	2018-11-16 05:47:07.950523+00	\N	\N	2
166	-269	小孩服饰	0	连体衣	2018-01-06 08:19:57+00	0	0	\N	2018-11-16 07:12:24.760855+00	\N	\N	2
201	-129	人情往来	0	小伯伯礼	2018-01-20 01:54:31+00	0	0	\N	2018-11-16 06:39:31.005939+00	\N	\N	2
183	-263	小孩服饰	0	max win连体衣+内衣	2018-01-13 12:31:51+00	0	0	\N	2018-11-16 07:12:14.575766+00	\N	\N	2
186	-66	饮食	0	o2	2018-01-13 12:32:46.633743+00	0	0	\N	2018-11-16 05:47:08.005397+00	\N	\N	2
167	-5	交通出行	0	停车费	2018-01-06 08:20:55+00	0	0	\N	2018-11-16 08:21:41.978154+00	\N	\N	1
188	-60	生活日用	0	洗衣	2018-01-13 12:33:20.785578+00	0	0	\N	2018-11-16 05:47:08.029027+00	\N	\N	2
189	-1500	生活日用	0	生活费	2018-01-13 12:33:42.17357+00	0	0	\N	2018-11-16 05:47:08.039875+00	\N	\N	2
206	-15	交通出行	0	停车费	2018-01-23 13:54:13+00	0	0	\N	2018-11-16 06:38:40.968947+00	\N	\N	2
191	-51	饮食	0	肯德基加关东煮	2018-01-15 11:47:47.450392+00	0	0	\N	2018-11-16 05:47:08.06754+00	\N	\N	2
192	-29	生活日用	0	收纳袋	2018-01-15 11:48:29.613415+00	0	0	\N	2018-11-16 05:47:08.078492+00	\N	\N	2
193	-40	服饰美容	0	毛衣链	2018-01-15 11:48:42.188021+00	0	0	\N	2018-11-16 05:47:08.094641+00	\N	\N	2
187	-15	饮食	0	甘蔗	2018-01-13 12:33:02+00	0	0	\N	2018-11-16 08:21:22.742381+00	\N	\N	2
195	11838	收入	0	工资	2018-01-16 05:09:32.107744+00	0	0	\N	2018-11-16 05:47:08.122583+00	\N	\N	1
196	-269	饮食	0	榴莲14斤	2018-01-18 11:30:24.710136+00	0	0	\N	2018-11-16 05:47:08.13449+00	\N	\N	1
197	-160	生活日用	0	桌面版板	2018-01-20 01:50:56.560414+00	0	0	\N	2018-11-16 05:47:08.14648+00	\N	\N	2
198	-21	生活日用	0	快递桌架	2018-01-20 01:51:27.258964+00	0	0	\N	2018-11-16 05:47:08.161602+00	\N	\N	2
185	-5	小孩服饰	0	泳裤	2018-01-13 12:32:28+00	0	0	\N	2018-11-16 07:12:07.621411+00	\N	\N	2
199	-62	小孩服饰	0	内衣	2018-01-20 01:51:51+00	0	0	\N	2018-11-16 07:11:59.764353+00	\N	\N	2
106	-66	人情往来	0	新人红包	2017-12-10 01:08:54+00	0	0	\N	2018-11-16 06:41:13.907982+00	\N	\N	1
194	-299	文教娱乐	0	echo dot	2018-01-16 02:06:32+00	0	0	\N	2018-11-16 08:16:59.609786+00	\N	\N	1
203	-18	饮食	0	老北京	2018-01-20 01:56:35.181186+00	0	0	\N	2018-11-16 05:47:08.228917+00	\N	\N	1
204	-11	饮食	0	鸡块	2018-01-20 01:58:58.417546+00	0	0	\N	2018-11-16 05:47:08.239718+00	\N	\N	2
205	4612	收入	0	工资	2018-01-20 01:59:35.501686+00	0	0	\N	2018-11-16 05:47:08.26461+00	\N	\N	2
184	-10	交通出行	0	停车费	2018-01-13 12:32:15+00	0	0	\N	2018-11-16 06:39:01.414246+00	\N	\N	2
207	-53	饮食	0	老婆大人	2018-01-23 13:54:31.559062+00	0	0	\N	2018-11-16 05:47:08.28843+00	\N	\N	2
208	-26	饮食	0	山竹	2018-01-23 13:54:47.799303+00	0	0	\N	2018-11-16 05:47:08.300303+00	\N	\N	2
209	-59	生活日用	0	牙膏牙刷	2018-01-26 13:51:13.588052+00	0	0	\N	2018-11-16 05:47:08.314752+00	\N	\N	2
210	-29	服饰美容	0	珍珠项链	2018-01-26 13:51:56.319873+00	0	0	\N	2018-11-16 05:47:08.32573+00	\N	\N	2
211	-20	其他消费	0	公司罚款	2018-01-26 13:54:04.041952+00	0	0	\N	2018-11-16 05:47:08.336953+00	\N	\N	2
213	-66	饮食	0	阿香米线	2018-01-27 03:55:50.113236+00	0	0	\N	2018-11-16 05:47:08.36276+00	\N	\N	1
190	-5	文教娱乐	0	英超直播	2018-01-15 05:31:50+00	0	0	\N	2018-11-16 06:03:00.067603+00	\N	\N	1
216	-36	饮食	0	KFC	2018-01-30 12:50:58.138676+00	0	0	\N	2018-11-16 05:47:08.408276+00	\N	\N	1
217	-55	饮食	0	宜家	2018-01-30 12:51:18.479903+00	0	0	\N	2018-11-16 05:47:08.426974+00	\N	\N	1
218	-7560	装修	0	油烟机+煤气灶	2018-01-30 12:52:27.24554+00	0	0	\N	2018-11-16 05:47:08.45334+00	\N	\N	1
219	-25	饮食	0	夜宵	2018-01-30 12:53:27.166761+00	0	0	\N	2018-11-16 05:47:08.471051+00	\N	\N	2
233	-1840	小孩生活用品	0	cybex安全座椅	2018-02-06 02:29:44+00	0	0	\N	2018-11-16 07:19:16.872043+00	\N	\N	1
221	-170	生活日用	0	牛奶x3，大米x4	2018-01-30 12:54:34+00	0	0	\N	2018-11-16 08:29:52.667065+00	\N	\N	2
223	-65	生活日用	0	雨刮器x4	2018-01-30 12:55:16.230819+00	0	0	\N	2018-11-16 05:47:08.529589+00	\N	\N	2
224	-22	生活日用	0	挂衣架	2018-01-30 12:56:06.860863+00	0	0	\N	2018-11-16 05:47:08.545534+00	\N	\N	2
225	-23	生活日用	0	云石胶	2018-02-02 12:33:45.198158+00	0	0	\N	2018-11-16 05:47:08.559906+00	\N	\N	2
226	-38	饮食	0	老婆大人	2018-02-02 12:34:21.369938+00	0	0	\N	2018-11-16 05:47:08.575025+00	\N	\N	2
227	-22	饮食	0	西瓜	2018-02-02 12:34:32.341006+00	0	0	\N	2018-11-16 05:47:08.590531+00	\N	\N	2
228	-2	饮食	0	肉串	2018-02-02 12:34:46.432633+00	0	0	\N	2018-11-16 05:47:08.610074+00	\N	\N	2
229	-70	饮食	0	甜品	2018-02-04 01:40:31.264191+00	0	0	\N	2018-11-16 05:47:08.621536+00	\N	\N	1
230	-16	装修	0	饰面板样品邮费	2018-02-04 01:41:33.596913+00	0	0	\N	2018-11-16 05:47:08.633577+00	\N	\N	1
222	-200	交通出行	0	加油	2018-01-30 12:54:55+00	0	0	\N	2018-11-16 08:16:35.022614+00	\N	\N	2
232	-676	饮食	0	团圆饭	2018-02-04 12:46:07.901101+00	0	0	\N	2018-11-16 05:47:08.665572+00	\N	\N	1
240	-100	小孩生活用品	0	电炖锅	2018-02-10 23:28:31+00	0	0	\N	2018-11-16 07:19:23.182126+00	\N	\N	2
231	-350	交通出行	0	保养	2018-02-04 06:12:58+00	0	0	\N	2018-11-16 08:16:27.962554+00	\N	\N	1
235	-27	饮食	0	KFC	2018-02-07 02:15:38.375999+00	0	0	\N	2018-11-16 05:47:08.705555+00	\N	\N	1
236	-99	生活日用	0	broadlink MP1插排	2018-02-09 06:22:06.732995+00	0	0	\N	2018-11-16 05:47:08.723499+00	\N	\N	1
237	12072	收入	0	工资	2018-02-09 10:11:12.157577+00	0	0	\N	2018-11-16 05:47:08.737399+00	\N	\N	1
238	14666	收入	0	奖金	2018-02-09 10:11:28.913842+00	0	0	\N	2018-11-16 05:47:08.752841+00	\N	\N	1
239	-182	饮食	0	午餐	2018-02-10 05:04:52.060615+00	0	0	\N	2018-11-16 05:47:08.768859+00	\N	\N	1
265	-69	小孩生活用品	0	安抚奶嘴	2018-02-22 23:33:00+00	0	0	\N	2018-11-16 07:19:29.073717+00	\N	\N	2
264	-100	文教娱乐	0	电影票	2018-02-22 23:32:38+00	0	0	\N	2018-11-16 06:03:35.884822+00	\N	\N	2
252	-168	小孩服饰	0	优衣库外套	2018-02-14 05:01:20+00	0	0	\N	2018-11-16 07:14:41.893412+00	\N	\N	2
234	-50	通讯物流	0	无限流量卡	2018-02-07 02:15:25+00	0	0	\N	2018-11-16 08:16:13.798712+00	\N	\N	1
244	-20	其他消费	0	捐款	2018-02-10 23:31:53.473747+00	0	0	\N	2018-11-16 05:47:08.838178+00	\N	\N	2
245	-15	小孩生活用品	0	两瓶矿泉水	2018-02-10 23:33:22+00	0	0	\N	2018-11-16 08:15:57.808481+00	\N	\N	2
246	-109	服饰美容	0	棉裤	2018-02-10 23:36:07.092754+00	0	0	\N	2018-11-16 05:47:08.867248+00	\N	\N	2
248	-1500	生活日用	0	生活费	2018-02-10 23:38:13.052033+00	0	0	\N	2018-11-16 05:47:08.912534+00	\N	\N	2
249	-30	饮食	0	KFC午餐	2018-02-13 03:19:29.948934+00	0	0	\N	2018-11-16 05:47:08.929692+00	\N	\N	1
250	-200	服饰美容	0	新年毛衣	2018-02-13 04:21:42.941808+00	0	0	\N	2018-11-16 05:47:08.945423+00	\N	\N	1
251	15000	收入	0	提成	2018-02-14 05:00:34.440716+00	0	0	\N	2018-11-16 05:47:08.963797+00	\N	\N	2
253	-49	小孩服饰	0	gap毛衣	2018-02-14 05:01:59+00	0	0	\N	2018-11-16 07:14:47.693435+00	\N	\N	2
254	-149	小孩服饰	0	爱婴岛衣外套＋卫衣	2018-02-14 05:02:43+00	0	0	\N	2018-11-16 07:14:56.490475+00	\N	\N	2
267	-115	小孩健康	0	嘟嘟检查	2018-02-22 23:34:53+00	0	0	\N	2018-11-16 07:15:12.455461+00	\N	\N	2
255	-17	饮食	0	火龙果	2018-02-14 05:03:03.50168+00	0	0	\N	2018-11-16 05:47:09.046079+00	\N	\N	2
256	-6	饮食	0	甜筒	2018-02-14 05:03:24.875836+00	0	0	\N	2018-11-16 05:47:09.062414+00	\N	\N	2
257	-298	服饰美容	0	羽绒服外套	2018-02-14 05:03:51.849129+00	0	0	\N	2018-11-16 05:47:09.073567+00	\N	\N	2
258	-118	饮食	0	胖二哥午餐	2018-02-14 05:08:58.264507+00	0	0	\N	2018-11-16 05:47:09.08474+00	\N	\N	2
243	-1000	人情往来	0	烧酒费	2018-02-10 23:31:23+00	0	0	\N	2018-11-16 08:16:04.970134+00	\N	\N	2
260	-107	饮食	0	KFC	2018-02-20 10:18:17.045178+00	0	0	\N	2018-11-16 05:47:09.109796+00	\N	\N	2
261	-15	饮食	0	三江购物	2018-02-20 10:18:38.521651+00	0	0	\N	2018-11-16 05:47:09.126688+00	\N	\N	2
262	-22	饮食	0	KFC早餐	2018-02-20 10:18:53.413374+00	0	0	\N	2018-11-16 05:47:09.137761+00	\N	\N	2
263	-13	饮食	0	coco饮料	2018-02-22 23:32:05.49678+00	0	0	\N	2018-11-16 05:47:09.156152+00	\N	\N	2
269	-100	小孩健康	0	两盒星鲨D剂＋一盒美林	2018-02-22 23:37:41+00	0	0	\N	2018-11-16 07:02:37.415885+00	\N	\N	2
268	-114	小孩生活用品	0	水杯，温奶器，碗－京东	2018-02-22 23:36:27+00	0	0	\N	2018-11-16 07:19:35.256181+00	\N	\N	2
266	-23	饮食	0	老婆大人	2018-02-22 23:33:27.177025+00	0	0	\N	2018-11-16 05:47:09.192817+00	\N	\N	2
74	-89	小孩生活用品	0	储奶袋	2017-11-26 13:21:50+00	0	0	\N	2018-11-16 07:17:19.807172+00	\N	\N	2
280	-7	小孩生活用品	0	车上遮阳布	2018-02-26 11:02:59+00	0	0	\N	2018-11-16 07:28:00.009237+00	\N	\N	2
270	-78	小孩健康	0	钙片爱因保	2018-02-22 23:40:03+00	0	0	\N	2018-11-16 07:02:48.034114+00	\N	\N	2
275	-237	小孩健康	0	小孩看病	2018-02-26 11:01:15+00	0	0	\N	2018-11-16 07:02:56.360707+00	\N	\N	2
271	-107	饮食	0	肯德基套餐	2018-02-22 23:40:54.204119+00	0	0	\N	2018-11-16 05:47:09.249426+00	\N	\N	2
272	-41	饮食	0	欧文蛋糕	2018-02-22 23:42:18.768683+00	0	0	\N	2018-11-16 05:47:09.260614+00	\N	\N	2
273	-45	生活日用	0	手机后盖	2018-02-23 11:10:17.59287+00	0	0	\N	2018-11-16 05:47:09.27212+00	\N	\N	1
259	-800	人情往来	0	外婆新年红包	2018-02-16 11:52:52+00	0	0	\N	2018-11-16 08:15:33.961947+00	\N	\N	1
279	-16	小孩玩具	0	灯笼	2018-02-26 11:02:39+00	0	0	\N	2018-11-16 07:03:04.253528+00	\N	\N	2
276	-47	饮食	0	欧文蛋糕	2018-02-26 11:01:40.45015+00	0	0	\N	2018-11-16 05:47:09.318829+00	\N	\N	2
277	-20	饮食	0	草莓	2018-02-26 11:01:51.775254+00	0	0	\N	2018-11-16 05:47:09.340709+00	\N	\N	2
278	-16	饮食	0	牛肉干	2018-02-26 11:02:02.916571+00	0	0	\N	2018-11-16 05:47:09.351577+00	\N	\N	2
242	-55	小孩健康	0	检查费	2018-02-10 23:30:23+00	0	0	\N	2018-11-16 07:14:30.706604+00	\N	\N	2
281	-200	交通出行	0	加油	2018-02-26 11:04:33+00	0	0	\N	2018-11-16 08:14:57.984166+00	\N	\N	1
274	-81	文教娱乐	0	鱼缸过滤器	2018-02-23 11:11:01+00	0	0	\N	2018-11-16 08:15:12.499482+00	\N	\N	1
282	-3008	生活日用	0	iPad 128G	2018-02-26 11:07:05.490255+00	0	0	\N	2018-11-16 05:47:09.404036+00	\N	\N	1
241	-30	交通出行	0	停车费＋高速	2018-02-10 23:29:01+00	0	0	\N	2018-11-16 06:02:35.633032+00	\N	\N	2
283	-23	文教娱乐	0	鱼食红虫干	2018-02-27 10:14:56+00	0	0	\N	2018-11-16 06:00:56.481081+00	\N	\N	1
220	-51	小孩生活用品	0	磨牙棒2盒	2018-01-30 12:53:47+00	0	0	\N	2018-11-16 07:19:11.766107+00	\N	\N	2
287	-8	生活日用	0	遮阳帘车子	2018-03-01 13:35:03.062966+00	0	0	\N	2018-11-16 05:47:09.478906+00	\N	\N	2
288	-10	生活日用	0	开水瓶口中子	2018-03-01 13:35:21.828208+00	0	0	\N	2018-11-16 05:47:09.494876+00	\N	\N	2
289	-39	生活日用	0	安全坐椅罩	2018-03-01 13:36:11.426702+00	0	0	\N	2018-11-16 05:47:09.510595+00	\N	\N	2
290	-19	饮食	0	老婆大人	2018-03-01 13:36:26.502206+00	0	0	\N	2018-11-16 05:47:09.522336+00	\N	\N	2
291	-37	饮食	0	绿资	2018-03-01 13:36:54.95502+00	0	0	\N	2018-11-16 05:47:09.534405+00	\N	\N	2
353	-112	住房缴费	0	电费东兴	2018-04-04 13:39:48+00	0	0	\N	2018-11-16 08:13:59.975396+00	\N	\N	2
293	-14	生活日用	0	钢化膜2张	2018-03-01 13:40:48.251921+00	0	0	\N	2018-11-16 05:47:09.564656+00	\N	\N	2
322	-84	小孩服饰	0	max win背心	2018-03-17 13:38:43+00	0	0	\N	2018-11-16 07:04:00.792904+00	\N	\N	2
318	-69	文教娱乐	0	域名	2018-03-16 03:24:13+00	0	0	\N	2018-11-16 06:44:23.930097+00	\N	\N	1
296	-105	生活日用	0	洗发水	2018-03-04 09:12:35.327545+00	0	0	\N	2018-11-16 05:47:09.608061+00	\N	\N	2
298	-7000	装修	0	三扇门x1150+5个门套	2018-03-04 09:21:38.465804+00	0	0	\N	2018-11-16 05:47:09.635396+00	\N	\N	1
299	-89	生活日用	0	生活用品	2018-03-09 12:56:50.367298+00	0	0	\N	2018-11-16 05:47:09.648648+00	\N	\N	2
300	-55	饮食	0	肯德基24＋o216＋鸡本部16	2018-03-09 12:57:56.852463+00	0	0	\N	2018-11-16 05:47:09.674243+00	\N	\N	2
301	-12	生活日用	0	手机壳	2018-03-09 12:59:02.902386+00	0	0	\N	2018-11-16 05:47:09.695653+00	\N	\N	2
79	-55	文教娱乐	0	域名benying.com	2017-11-28 12:52:10+00	0	0	\N	2018-11-16 06:36:10.72716+00	\N	\N	1
331	-78	小孩生活用品	0	勺子	2018-03-22 12:58:25+00	0	0	\N	2018-11-16 07:27:30.159966+00	\N	\N	2
304	5391	收入	0	工资	2018-03-09 13:01:12.548382+00	0	0	\N	2018-11-16 05:47:09.742002+00	\N	\N	2
305	-300	装修	0	奥普结余	2018-03-10 02:10:31.269358+00	0	0	\N	2018-11-16 05:47:09.75581+00	\N	\N	1
306	-1500	生活日用	0	生活费	2018-03-10 09:50:15.357698+00	0	0	\N	2018-11-16 05:47:09.769157+00	\N	\N	2
307	-20	饮食	0	草莓	2018-03-10 09:50:27.237722+00	0	0	\N	2018-11-16 05:47:09.788951+00	\N	\N	2
308	-46	饮食	0	新江厦	2018-03-10 09:51:00.351406+00	0	0	\N	2018-11-16 05:47:09.800427+00	\N	\N	2
309	-15	交通出行	0	高速费	2018-03-11 09:07:48+00	0	0	\N	2018-11-16 08:14:40.661923+00	\N	\N	2
310	-47	饮食	0	超市	2018-03-12 14:23:47+00	0	0	\N	2018-11-16 08:14:34.226266+00	\N	\N	2
311	-209	文教娱乐	0	羽毛球拍一副	2018-03-15 06:19:44+00	0	0	\N	2018-11-16 08:14:27.781075+00	\N	\N	1
313	12287	收入	0	工资	2018-03-15 07:35:57.670828+00	0	0	\N	2018-11-16 05:47:09.865648+00	\N	\N	1
314	-287	饮食	0	牛很鲜火锅	2018-03-15 11:56:24.77846+00	0	0	\N	2018-11-16 05:47:09.877217+00	\N	\N	2
315	-6	饮食	0	肯德基	2018-03-15 11:56:38.43921+00	0	0	\N	2018-11-16 05:47:09.888357+00	\N	\N	2
316	-54	饮食	0	肯德基24基本部15o215	2018-03-15 11:59:18.651479+00	0	0	\N	2018-11-16 05:47:09.900297+00	\N	\N	2
317	-10	饮食	0	薯条	2018-03-15 12:11:29.700135+00	0	0	\N	2018-11-16 05:47:09.912687+00	\N	\N	2
294	-180	小孩奶粉	0	爱他美奶粉	2018-03-03 02:09:43+00	0	0	\N	2018-11-16 07:03:36.898383+00	\N	\N	2
319	-1450	装修	0	开关插座	2018-03-17 04:54:41.99654+00	0	0	\N	2018-11-16 05:47:09.943746+00	\N	\N	1
320	-3798	装修	0	AO Smith热水器	2018-03-17 13:36:41.811631+00	0	0	\N	2018-11-16 05:47:09.96039+00	\N	\N	1
321	-19	饮食	0	盐水鸡鱿鱼须	2018-03-17 13:38:15.132558+00	0	0	\N	2018-11-16 05:47:09.979903+00	\N	\N	2
323	-108	小孩零食	0	米粉面条	2018-03-17 13:39:05+00	0	0	\N	2018-11-16 07:05:07.498326+00	\N	\N	2
333	-17	小孩服饰	0	帽子	2018-03-22 12:59:59+00	0	0	\N	2018-11-16 07:05:44.127824+00	\N	\N	2
292	-198	小孩生活用品	0	全面时代餐巾纸24包	2018-03-01 13:39:14+00	0	0	\N	2018-11-16 07:27:54.401551+00	\N	\N	2
325	-22	生活日用	0	理发	2018-03-17 13:42:22.581668+00	0	0	\N	2018-11-16 05:47:10.041189+00	\N	\N	1
326	-100	装修	0	烟道材料费	2018-03-19 09:59:48.935314+00	0	0	\N	2018-11-16 05:47:10.058532+00	\N	\N	1
327	-250	装修	0	燃气灶安装材料费	2018-03-19 10:27:57.656201+00	0	0	\N	2018-11-16 05:47:10.07273+00	\N	\N	1
328	-1200	装修	0	欧琳水槽	2018-03-19 23:58:58.428982+00	0	0	\N	2018-11-16 05:47:10.094312+00	\N	\N	1
324	-399	小孩生活用品	0	拍照	2018-03-17 13:39:18+00	0	0	\N	2018-11-16 07:27:41.962569+00	\N	\N	2
339	-60	交通出行	0	植物园门票	2018-03-25 13:24:12+00	0	0	\N	2018-11-16 06:00:12.54607+00	\N	\N	2
329	-58	小孩生活用品	0	怡宝矿泉水8瓶	2018-03-22 12:58:01+00	0	0	\N	2018-11-16 07:27:36.239092+00	\N	\N	2
332	-26	饮食	0	茶香香	2018-03-22 12:59:02.873751+00	0	0	\N	2018-11-16 05:47:10.16051+00	\N	\N	2
334	-17	小孩服饰	0	帽子	2018-03-22 13:00:00+00	0	0	\N	2018-11-16 07:06:18.371019+00	\N	\N	2
338	-157	小孩服饰	0	衣服	2018-03-24 06:02:51+00	0	0	\N	2018-11-16 07:06:25.133296+00	\N	\N	2
335	5013	收入	0	工资	2018-03-22 13:01:49+00	0	0	\N	2018-11-23 09:19:18.335764+00	\N	\N	2
336	-96	饮食	0	午餐美蛙	2018-03-24 06:01:49.10461+00	0	0	\N	2018-11-16 05:47:10.233702+00	\N	\N	2
337	-338	服饰美容	0	上衣＋裤子	2018-03-24 06:02:33.872851+00	0	0	\N	2018-11-16 05:47:10.250071+00	\N	\N	2
343	-43	小孩服饰	0	鞋子	2018-03-25 13:26:46+00	0	0	\N	2018-11-16 07:06:40.282945+00	\N	\N	2
302	-200	交通出行	0	加油	2018-03-09 12:59:33+00	0	0	\N	2018-11-16 06:02:19.502915+00	\N	\N	2
340	-37	饮食	0	o2	2018-03-25 13:24:36.736021+00	0	0	\N	2018-11-16 05:47:10.306006+00	\N	\N	2
341	-30	饮食	0	o2	2018-03-25 13:25:03.062174+00	0	0	\N	2018-11-16 05:47:10.323113+00	\N	\N	2
352	-309	小孩奶粉	0	奶粉零食	2018-04-04 13:39:19+00	0	0	\N	2018-11-16 07:06:48.044575+00	\N	\N	2
344	-103	生活日用	0	MacBook网口转换器	2018-03-26 02:51:47.66997+00	0	0	\N	2018-11-16 05:47:10.386366+00	\N	\N	1
345	-48	饮食	0	绿姿	2018-03-26 14:05:17.360084+00	0	0	\N	2018-11-16 05:47:10.398122+00	\N	\N	2
346	-14	饮食	0	老婆大人	2018-03-26 14:05:29.433575+00	0	0	\N	2018-11-16 05:47:10.410978+00	\N	\N	2
347	-179	装修	0	凉霸	2018-03-27 13:02:17.603844+00	0	0	\N	2018-11-16 05:47:10.428298+00	\N	\N	1
348	-15	生活日用	0	勺子筷子	2018-04-04 13:37:34.802246+00	0	0	\N	2018-11-16 05:47:10.440058+00	\N	\N	2
349	-50	服饰美容	0	裤子	2018-04-04 13:38:05.818666+00	0	0	\N	2018-11-16 05:47:10.465337+00	\N	\N	2
350	-21	服饰美容	0	袜子3条	2018-04-04 13:38:28.500231+00	0	0	\N	2018-11-16 05:47:10.484755+00	\N	\N	2
351	-25	饮食	0	美团外卖	2018-04-04 13:38:45.951554+00	0	0	\N	2018-11-16 05:47:10.49668+00	\N	\N	2
303	-100	小孩文具	0	书	2018-03-09 13:00:26+00	0	0	\N	2018-11-16 07:11:36.59153+00	\N	\N	2
312	-328	文教娱乐	0	帐篷	2018-03-15 06:57:09+00	0	0	\N	2018-11-16 08:14:20.662398+00	\N	\N	1
354	-6	饮食	0	肯德基	2018-04-04 13:40:15.752301+00	0	0	\N	2018-11-16 05:47:10.546662+00	\N	\N	2
355	-50	饮食	0	烧烤	2018-04-04 13:40:29.365793+00	0	0	\N	2018-11-16 05:47:10.562174+00	\N	\N	2
330	-200	交通出行	0	加油	2018-03-22 12:58:12+00	0	0	\N	2018-11-16 05:59:04.166389+00	\N	\N	2
295	-21	交通出行	0	滴滴	2018-03-03 02:10:03+00	0	0	\N	2018-11-16 06:40:41.499206+00	\N	\N	2
358	-3	饮食	0	棒冰	2018-04-04 13:46:37.566018+00	0	0	\N	2018-11-16 05:47:10.607645+00	\N	\N	1
359	-350	饮食	0	烧烤	2018-04-10 13:47:12.537877+00	0	0	\N	2018-11-16 05:47:10.62906+00	\N	\N	2
361	-275	饮食	0	湘菜	2018-04-10 13:50:02.166762+00	0	0	\N	2018-11-16 05:47:10.662267+00	\N	\N	2
369	-79	小孩尿布	0	尿不湿	2018-04-10 13:53:53+00	0	0	\N	2018-11-16 07:27:24.366857+00	\N	\N	2
362	-216	小孩生活用品	0	被子	2018-04-10 13:50:12+00	0	0	\N	2018-11-16 07:24:43.292425+00	\N	\N	2
363	-35	小孩健康	0	退热贴	2018-04-10 13:50:54+00	0	0	\N	2018-11-16 07:24:36.639908+00	\N	\N	2
365	-60	饮食	0	西瓜	2018-04-10 13:52:20.227921+00	0	0	\N	2018-11-16 05:47:10.722283+00	\N	\N	2
401	-650	交通出行	0	象山影视城门票5张	2018-05-01 12:14:32+00	0	0	\N	2018-11-16 06:00:37.320442+00	\N	\N	2
364	-325	小孩健康	0	看病	2018-04-10 13:52:07+00	0	0	\N	2018-11-16 07:24:30.325369+00	\N	\N	2
367	-150	小孩生活用品	0	奶瓶x2	2018-04-10 13:53:04+00	0	0	\N	2018-11-16 07:24:23.803256+00	\N	\N	2
386	-77	小孩生活用品	0	12瓶水	2018-04-20 13:50:12+00	0	0	\N	2018-11-16 07:32:22.015096+00	\N	\N	2
368	-193	小孩玩具	0	爬行垫	2018-04-10 13:53:31+00	0	0	\N	2018-11-16 07:24:16.559818+00	\N	\N	2
370	-39	小孩健康	0	退热贴	2018-04-10 13:54:05+00	0	0	\N	2018-11-16 07:24:01.766138+00	\N	\N	2
371	-40	小孩健康	0	退烧药	2018-04-10 13:54:22+00	0	0	\N	2018-11-16 07:23:55.818076+00	\N	\N	2
373	-11087	装修	0	地板	2018-04-14 09:21:07.188517+00	0	0	\N	2018-11-16 05:47:10.829065+00	\N	\N	1
375	12200	收入	0	工资	2018-04-14 09:24:27.511344+00	0	0	\N	2018-11-16 05:47:10.855849+00	\N	\N	1
407	-112	小孩奶粉	0	喜宝奶粉	2018-05-01 13:18:23+00	0	0	\N	2018-11-16 07:23:29.732683+00	\N	\N	2
372	-56	小孩健康	0	看病	2018-04-11 13:24:32+00	0	0	\N	2018-11-16 07:23:49.486143+00	\N	\N	2
376	-23	小孩健康	0	看骨科	2018-04-20 13:40:51+00	0	0	\N	2018-11-16 06:58:06.343643+00	\N	\N	2
379	-57	饮食	0	美团外卖	2018-04-20 13:46:16.464384+00	0	0	\N	2018-11-16 05:47:10.919059+00	\N	\N	2
380	-14	服饰美容	0	袜子	2018-04-20 13:46:41.428938+00	0	0	\N	2018-11-16 05:47:10.93055+00	\N	\N	2
381	-67	饮食	0	肯德基coco	2018-04-20 13:47:06.794787+00	0	0	\N	2018-11-16 05:47:10.944584+00	\N	\N	2
382	-636	饮食	0	阿毛饭店	2018-04-20 13:47:26.419906+00	0	0	\N	2018-11-16 05:47:10.955464+00	\N	\N	2
383	-108	生活日用	0	大米两袋	2018-04-20 13:48:27.362143+00	0	0	\N	2018-11-16 05:47:10.96777+00	\N	\N	2
417	-98	住房缴费	0	电费	2018-05-06 12:22:26+00	0	0	\N	2018-11-16 08:13:43.846497+00	\N	\N	2
385	-118	生活日用	0	3瓶油	2018-04-20 13:49:19.759266+00	0	0	\N	2018-11-16 05:47:10.993754+00	\N	\N	2
384	-151	小孩奶粉	0	奶瓶3个	2018-04-20 13:48:51+00	0	0	\N	2018-11-16 06:57:37.121262+00	\N	\N	2
387	-799	装修	0	九牧花洒	2018-04-20 13:51:02.933762+00	0	0	\N	2018-11-16 05:47:11.035178+00	\N	\N	1
388	-18	装修	0	平拉手	2018-04-20 13:51:56.518205+00	0	0	\N	2018-11-16 05:47:11.053408+00	\N	\N	1
405	-216	交通出行	0	汽车票	2018-05-01 13:16:28+00	0	0	\N	2018-11-16 05:59:40.143561+00	\N	\N	2
118	-66	人情往来	0	公司圣诞礼物音乐台灯	2017-12-20 13:47:14+00	0	0	\N	2018-11-16 06:42:01.517411+00	\N	\N	1
391	7551	收入	0	工资	2018-04-20 13:52:59.652492+00	0	0	\N	2018-11-16 05:47:11.096005+00	\N	\N	2
392	-3500	其他消费	0	合资	2018-04-20 13:53:33.061906+00	0	0	\N	2018-11-16 05:47:11.109161+00	\N	\N	2
393	-8	饮食	0	饮料	2018-04-22 11:14:25.775841+00	0	0	\N	2018-11-16 05:47:11.121811+00	\N	\N	1
394	-143	装修	0	地板尾款	2018-04-22 11:14:41.5846+00	0	0	\N	2018-11-16 05:47:11.138979+00	\N	\N	1
378	-27	小孩生活用品	0	纱布巾	2018-04-20 13:45:58+00	0	0	\N	2018-11-16 07:32:27.446217+00	\N	\N	2
396	-868	饮食	0	奶粉+零食	2018-04-22 11:16:30.511536+00	0	0	\N	2018-11-16 05:47:11.165681+00	\N	\N	2
397	-20	饮食	0	串烧	2018-04-22 11:32:42.459873+00	0	0	\N	2018-11-16 05:47:11.177273+00	\N	\N	1
398	-1679	装修	0	yeelight三室一厅灯	2018-04-24 14:08:46.47179+00	0	0	\N	2018-11-16 05:47:11.192549+00	\N	\N	1
399	-239	装修	0	yeelight餐厅灯	2018-04-24 14:09:11.963699+00	0	0	\N	2018-11-16 05:47:11.204465+00	\N	\N	1
400	-53	生活日用	0	蟑螂贴2付	2018-05-01 12:12:24.511682+00	0	0	\N	2018-11-16 05:47:11.216376+00	\N	\N	1
390	-15	文教娱乐	0	英超	2018-04-20 13:52:27+00	0	0	\N	2018-11-16 06:01:16.648685+00	\N	\N	1
402	-3000	生活日用	0	生活费	2018-05-01 13:13:40.78655+00	0	0	\N	2018-11-16 05:47:11.250882+00	\N	\N	2
395	-100	小孩健康	0	医药费	2018-04-22 11:15:37+00	0	0	\N	2018-11-16 06:57:12.956871+00	\N	\N	2
404	-74	饮食	0	零食	2018-05-01 13:15:45.551463+00	0	0	\N	2018-11-16 05:47:11.274801+00	\N	\N	2
366	-20	交通出行	0	停车费	2018-04-10 13:52:43+00	0	0	\N	2018-11-16 05:59:56.603875+00	\N	\N	2
403	-90	小孩服饰	0	睡衣	2018-05-01 13:14:35+00	0	0	\N	2018-11-16 06:57:04.644222+00	\N	\N	2
377	-39	小孩生活用品	0	饮水杯	2018-04-20 13:45:30+00	0	0	\N	2018-11-16 07:23:35.894456+00	\N	\N	2
408	-556	饮食	0	华侨豪生自助餐	2018-05-01 13:21:34.653436+00	0	0	\N	2018-11-16 05:47:11.330911+00	\N	\N	2
409	-3500	装修	0	大理石	2018-05-06 10:23:12.695054+00	0	0	\N	2018-11-16 05:47:11.342274+00	\N	\N	1
411	-22	饮食	0	水果	2018-05-06 12:20:58.855182+00	0	0	\N	2018-11-16 05:47:11.36905+00	\N	\N	2
412	-22	饮食	0	茶香香	2018-05-06 12:21:13.873467+00	0	0	\N	2018-11-16 05:47:11.382417+00	\N	\N	2
389	-100	交通出行	0	罚单	2018-04-20 13:52:15+00	0	0	\N	2018-11-16 05:59:21.38247+00	\N	\N	1
414	-19	饮食	0	饮料	2018-05-06 12:21:47.658175+00	0	0	\N	2018-11-16 05:47:11.417364+00	\N	\N	2
415	-28	生活日用	0	袖套	2018-05-06 12:21:57.732779+00	0	0	\N	2018-11-16 05:47:11.428783+00	\N	\N	2
406	-312	小孩尿布	0	尿不湿4包	2018-05-01 13:18:02+00	0	0	\N	2018-11-16 06:56:56.284007+00	\N	\N	2
410	-200	交通出行	0	加油	2018-05-06 12:20:47+00	0	0	\N	2018-11-16 08:13:52.084453+00	\N	\N	2
418	-108	服饰美容	0	裙子	2018-05-06 12:22:53.074198+00	0	0	\N	2018-11-16 05:47:11.462954+00	\N	\N	2
413	-300	文教娱乐	0	KTV	2018-05-06 12:21:35+00	0	0	\N	2018-11-16 05:58:22.262484+00	\N	\N	2
420	-42	饮食	0	串烧	2018-05-06 12:23:33.841652+00	0	0	\N	2018-11-16 05:47:11.490072+00	\N	\N	2
422	-76	生活日用	0	超市	2018-05-06 12:24:36.882661+00	0	0	\N	2018-11-16 05:47:11.510267+00	\N	\N	2
423	-66	服饰美容	0	双肩包	2018-05-06 12:24:55.280284+00	0	0	\N	2018-11-16 05:47:11.520077+00	\N	\N	2
424	-10	生活日用	0	锅盖把手	2018-05-06 12:25:11.987785+00	0	0	\N	2018-11-16 05:47:11.539147+00	\N	\N	2
425	-2713	装修	0	衣柜门	2018-05-06 12:25:49.255789+00	0	0	\N	2018-11-16 05:47:11.55382+00	\N	\N	1
426	-18	饮食	0	茶香香	2018-05-06 12:32:56.190693+00	0	0	\N	2018-11-16 05:47:11.568167+00	\N	\N	1
416	-71	小孩服饰	0	衣服	2018-05-06 12:22:08+00	0	0	\N	2018-11-16 06:56:46.801137+00	\N	\N	2
764	13356	收入	0	工资	2018-10-28 10:50:55.847241+00	0	0	\N	2018-11-16 05:47:16.505142+00	\N	\N	1
419	-4833	健康保险	0	车保	2018-05-06 12:23:08+00	0	0	\N	2018-11-16 05:58:08.527755+00	\N	\N	2
427	-220	小孩奶粉	0	奶粉	2018-05-07 13:50:49+00	0	0	\N	2018-11-16 06:56:33.702341+00	\N	\N	2
429	-300	装修	0	门锁	2018-05-07 13:53:01.774947+00	0	0	\N	2018-11-16 05:47:11.612997+00	\N	\N	1
430	-58	饮食	0	零食	2018-05-09 14:00:12.46867+00	0	0	\N	2018-11-16 05:47:11.626238+00	\N	\N	1
431	-70	饮食	0	水果	2018-05-09 14:02:27.220239+00	0	0	\N	2018-11-16 05:47:11.637098+00	\N	\N	2
432	-26	生活日用	0	门吸	2018-05-09 14:03:08.00259+00	0	0	\N	2018-11-16 05:47:11.657273+00	\N	\N	2
433	-26	生活日用	0	插座	2018-05-09 14:03:22.475558+00	0	0	\N	2018-11-16 05:47:11.66981+00	\N	\N	2
434	-88	生活日用	0	防晒霜X4	2018-05-09 14:08:04.081661+00	0	0	\N	2018-11-16 05:47:11.689007+00	\N	\N	2
435	13128	收入	0	工资	2018-05-15 11:47:20.008748+00	0	0	\N	2018-11-16 05:47:11.704786+00	\N	\N	1
436	-112	饮食	0	烘培	2018-05-17 12:27:37.513723+00	0	0	\N	2018-11-16 05:47:11.716907+00	\N	\N	2
437	-26	生活日用	0	米桶	2018-05-17 12:28:01.469213+00	0	0	\N	2018-11-16 05:47:11.728763+00	\N	\N	2
438	-7	生活日用	0	头绳	2018-05-17 12:28:14.316813+00	0	0	\N	2018-11-16 05:47:11.742183+00	\N	\N	2
447	-35	小孩生活用品	0	理发加游泳裤	2018-05-22 13:08:25+00	0	0	\N	2018-11-16 07:23:23.825967+00	\N	\N	2
441	-20	饮食	0	棒冰	2018-05-17 12:31:15.433867+00	0	0	\N	2018-11-16 05:47:11.783847+00	\N	\N	2
442	-37	饮食	0	荔枝	2018-05-17 12:31:26.546622+00	0	0	\N	2018-11-16 05:47:11.801392+00	\N	\N	2
439	-135	小孩服饰	0	夏装T恤	2018-05-17 12:29:37+00	0	0	\N	2018-11-16 06:56:25.958183+00	\N	\N	2
444	-38	饮食	0	零食	2018-05-20 07:37:28.38857+00	0	0	\N	2018-11-16 05:47:11.82942+00	\N	\N	1
446	-59	生活日用	0	伸缩杆	2018-05-22 13:07:54.25265+00	0	0	\N	2018-11-16 05:47:11.859044+00	\N	\N	2
494	-1020	人情往来	0	手表	2018-06-10 08:39:13+00	0	0	\N	2018-11-16 08:10:56.826496+00	\N	\N	2
448	-61	饮食	0	春饼	2018-05-22 13:08:43.673408+00	0	0	\N	2018-11-16 05:47:11.889693+00	\N	\N	2
481	-67	人情往来	0	脚垫	2018-06-05 12:53:03+00	0	0	\N	2018-11-16 06:44:16.940591+00	\N	\N	2
450	-51	生活日用	0	美购超市	2018-05-22 13:09:34.53729+00	0	0	\N	2018-11-16 05:47:11.922666+00	\N	\N	2
449	-10	交通出行	0	停车费	2018-05-22 13:08:56+00	0	0	\N	2018-11-16 05:57:50.31942+00	\N	\N	2
451	-300	交通出行	0	加油	2018-05-22 13:09:47+00	0	0	\N	2018-11-16 05:57:03.926471+00	\N	\N	2
453	-276	饮食	0	韩宫宴烧烤	2018-05-22 13:10:50.419631+00	0	0	\N	2018-11-16 05:47:11.967394+00	\N	\N	2
454	-113	生活日用	0	餐巾纸	2018-05-22 13:11:48.789755+00	0	0	\N	2018-11-16 05:47:11.989391+00	\N	\N	2
455	-74	生活日用	0	大米	2018-05-22 13:12:08.89877+00	0	0	\N	2018-11-16 05:47:12.009066+00	\N	\N	2
456	-46	饮食	0	干脆面	2018-05-22 13:12:23.742701+00	0	0	\N	2018-11-16 05:47:12.023296+00	\N	\N	2
457	5391	收入	0	工资	2018-05-22 13:12:56.700776+00	0	0	\N	2018-11-16 05:47:12.056064+00	\N	\N	2
440	-196	住房缴费	0	水费	2018-05-17 12:30:05+00	0	0	\N	2018-11-16 08:13:14.395299+00	\N	\N	2
459	-54	生活日用	0	补漆笔	2018-05-24 13:06:48.395219+00	0	0	\N	2018-11-16 05:47:12.111379+00	\N	\N	1
460	-216	生活日用	0	帘子	2018-05-24 13:09:22.88405+00	0	0	\N	2018-11-16 05:47:12.133488+00	\N	\N	2
461	-29	生活日用	0	置物架	2018-05-24 13:09:41.992893+00	0	0	\N	2018-11-16 05:47:12.149966+00	\N	\N	2
462	-21	生活日用	0	小风扇	2018-05-24 13:09:56.93909+00	0	0	\N	2018-11-16 05:47:12.161884+00	\N	\N	2
458	-9	文教娱乐	0	电影票	2018-05-22 13:15:30+00	0	0	\N	2018-11-16 08:13:07.808974+00	\N	\N	1
443	-466	小孩奶粉	0	6罐奶粉	2018-05-17 12:32:14+00	0	0	\N	2018-11-16 06:56:16.009259+00	\N	\N	2
465	-58	饮食	0	欧文蛋糕	2018-06-03 12:57:49.961772+00	0	0	\N	2018-11-16 05:47:12.215741+00	\N	\N	1
463	-100	交通出行	0	加油	2018-06-03 12:56:11+00	0	0	\N	2018-11-16 08:12:58.909968+00	\N	\N	1
466	-100	通讯物流	0	手机充值	2018-06-03 12:58:10+00	0	0	\N	2018-11-16 08:12:45.582803+00	\N	\N	1
468	-50	饮食	0	绿姿	2018-06-05 12:39:09.778941+00	0	0	\N	2018-11-16 05:47:12.256561+00	\N	\N	2
469	-19	生活日用	0	灯头带线	2018-06-05 12:40:01.590713+00	0	0	\N	2018-11-16 05:47:12.269552+00	\N	\N	2
470	-14	生活日用	0	窗帘挂钩	2018-06-05 12:40:22.796344+00	0	0	\N	2018-11-16 05:47:12.281948+00	\N	\N	2
471	-373	服饰美容	0	服饰鞋子	2018-06-05 12:42:46.134014+00	0	0	\N	2018-11-16 05:47:12.306269+00	\N	\N	2
467	-45	交通出行	0	高速费	2018-06-03 12:58:52+00	0	0	\N	2018-11-16 08:12:38.621786+00	\N	\N	1
473	-50	饮食	0	重庆小面	2018-06-05 12:44:07.658109+00	0	0	\N	2018-11-16 05:47:12.342506+00	\N	\N	2
472	-57	饮食	0	超市	2018-06-05 12:43:43+00	0	0	\N	2018-11-16 08:12:32.341034+00	\N	\N	2
475	-59	饮食	0	茶香香	2018-06-05 12:45:29.729047+00	0	0	\N	2018-11-16 05:47:12.369285+00	\N	\N	2
476	-208	生活日用	0	大米四袋	2018-06-05 12:48:16.109593+00	0	0	\N	2018-11-16 05:47:12.380677+00	\N	\N	2
464	-290	小孩健康	0	看医生	2018-06-03 12:57:34+00	0	0	\N	2018-11-16 06:55:58.75633+00	\N	\N	1
478	-346	其他消费	0	其他	2018-06-05 12:50:08.914915+00	0	0	\N	2018-11-16 05:47:12.40656+00	\N	\N	2
474	-103	住房缴费	0	电费	2018-06-05 12:44:41+00	0	0	\N	2018-11-16 08:12:24.220836+00	\N	\N	2
479	-230	交通出行	0	加油	2018-06-05 12:51:54+00	0	0	\N	2018-11-16 08:12:16.673529+00	\N	\N	2
496	-77	小孩零食	0	零食	2018-06-10 08:40:23+00	0	0	\N	2018-11-16 06:55:34.177065+00	\N	\N	2
482	-12	生活日用	0	水桶	2018-06-05 12:53:23.543928+00	0	0	\N	2018-11-16 05:47:12.465215+00	\N	\N	2
483	-5200	装修	0	移门	2018-06-07 12:56:35.577261+00	0	0	\N	2018-11-16 05:47:12.475869+00	\N	\N	1
452	-9	文教娱乐	0	电影票	2018-05-22 13:10:06+00	0	0	\N	2018-11-16 05:56:49.579875+00	\N	\N	2
485	-2	生活日用	0	吸管	2018-06-10 08:35:19.791576+00	0	0	\N	2018-11-16 05:47:12.499094+00	\N	\N	1
486	-10	饮食	0	一点点奶茶	2018-06-10 08:35:35.756307+00	0	0	\N	2018-11-16 05:47:12.514476+00	\N	\N	1
477	-161	小孩尿布	0	尿不湿	2018-06-05 12:48:32+00	0	0	\N	2018-11-16 06:55:49.949671+00	\N	\N	2
488	-26	饮食	0	串烧	2018-06-10 08:36:12.012742+00	0	0	\N	2018-11-16 05:47:12.54206+00	\N	\N	1
489	-5	饮食	0	可乐	2018-06-10 08:36:31.122883+00	0	0	\N	2018-11-16 05:47:12.553198+00	\N	\N	1
490	-39	生活日用	0	靠垫	2018-06-10 08:37:01.184432+00	0	0	\N	2018-11-16 05:47:12.566854+00	\N	\N	1
491	-700	饮食	0	儿子生日聚餐	2018-06-10 08:38:14.895493+00	0	0	\N	2018-11-16 05:47:12.578693+00	\N	\N	2
492	-300	饮食	0	生日蛋糕	2018-06-10 08:38:35.292313+00	0	0	\N	2018-11-16 05:47:12.591578+00	\N	\N	2
480	-200	交通出行	0	加油	2018-06-05 12:52:16+00	0	0	\N	2018-11-16 08:11:08.535379+00	\N	\N	2
493	-300	服饰美容	0	包包	2018-06-10 08:38:59+00	0	0	\N	2018-11-16 08:11:02.958145+00	\N	\N	2
495	-152	生活日用	0	椅子	2018-06-10 08:39:57.396621+00	0	0	\N	2018-11-16 05:47:12.628649+00	\N	\N	2
487	-108	小孩尿布	0	尿不湿	2018-06-10 08:35:55+00	0	0	\N	2018-11-16 06:55:42.407021+00	\N	\N	1
497	-588	装修	0	毛巾架	2018-06-10 08:43:02.533797+00	0	0	\N	2018-11-16 05:47:12.659449+00	\N	\N	1
498	-80	装修	0	浴巾架	2018-06-10 08:43:23.160521+00	0	0	\N	2018-11-16 05:47:12.670228+00	\N	\N	1
499	-110	装修	0	雷士阳台灯	2018-06-10 08:43:57.011544+00	0	0	\N	2018-11-16 05:47:12.685506+00	\N	\N	1
502	-4000	装修	0	窗帘	2018-06-10 08:46:12.800218+00	0	0	\N	2018-11-16 05:47:12.722219+00	\N	\N	1
503	-3000	装修	0	墙纸	2018-06-11 13:13:10.911937+00	0	0	\N	2018-11-16 05:47:12.736196+00	\N	\N	1
504	-1000	生活日用	0	生活费	2018-06-11 13:13:28.370153+00	0	0	\N	2018-11-16 05:47:12.748111+00	\N	\N	2
141	-128	小孩服饰	0	保暖衣服一套，一件裤子	2017-12-27 13:45:53+00	0	0	\N	2018-11-16 07:14:07.351252+00	\N	\N	2
506	-28	生活日用	0	窗帘配件	2018-06-11 13:16:09.166077+00	0	0	\N	2018-11-16 05:47:12.776597+00	\N	\N	2
505	-121	小孩零食	0	小孩零食	2018-06-11 13:14:18+00	0	0	\N	2018-11-16 06:55:26.355629+00	\N	\N	2
567	-142	住房缴费	0	水费	2018-07-12 23:43:11+00	0	0	\N	2018-11-16 08:03:43.324523+00	\N	\N	2
570	-183	小孩零食	0	钙零食	2018-07-12 23:45:58+00	0	0	\N	2018-11-16 07:26:17.492492+00	\N	\N	2
509	-23	小孩服饰	0	泳裤	2018-06-15 13:00:54+00	0	0	\N	2018-11-16 07:23:17.506718+00	\N	\N	2
511	-338	装修	0	晾衣架	2018-06-15 13:02:26.634583+00	0	0	\N	2018-11-16 05:47:12.847183+00	\N	\N	1
512	-779	装修	0	马桶	2018-06-15 13:02:44.925568+00	0	0	\N	2018-11-16 05:47:12.859584+00	\N	\N	1
513	13111	收入	0	工资	2018-06-15 13:03:18.918734+00	0	0	\N	2018-11-16 05:47:12.870758+00	\N	\N	1
514	-2249	装修	0	格力空调	2018-06-17 06:08:33.350023+00	0	0	\N	2018-11-16 05:47:12.882724+00	\N	\N	1
515	-137	饮食	0	晚餐	2018-06-17 06:09:22.395555+00	0	0	\N	2018-11-16 05:47:12.896369+00	\N	\N	2
516	-292	饮食	0	午餐	2018-06-17 06:09:38.870307+00	0	0	\N	2018-11-16 05:47:12.910075+00	\N	\N	2
518	-20	交通出行	0	停车费	2018-06-17 06:10:29+00	0	0	\N	2018-11-16 08:10:27.42624+00	\N	\N	2
519	-200	交通出行	0	一个月高速费	2018-06-17 06:10:53+00	0	0	\N	2018-11-16 08:10:34.587901+00	\N	\N	2
525	-3459	健康保险	0	太保3889返430	2018-06-18 02:34:23+00	0	0	\N	2018-11-16 08:10:48.11674+00	\N	\N	1
520	-2199	装修	0	美的空调	2018-06-18 00:55:33.969267+00	0	0	\N	2018-11-16 05:47:12.959873+00	\N	\N	1
521	-5499	装修	0	西门子冰箱	2018-06-18 00:55:53.71055+00	0	0	\N	2018-11-16 05:47:12.971041+00	\N	\N	1
523	-6199	装修	0	索尼65寸电视	2018-06-18 00:56:38.121068+00	0	0	\N	2018-11-16 05:47:13.012454+00	\N	\N	1
524	-3649	装修	0	西门子洗衣机	2018-06-18 00:56:53.763332+00	0	0	\N	2018-11-16 05:47:13.025383+00	\N	\N	1
539	-21	文教娱乐	0	鱼缸气泵	2018-07-05 12:10:23+00	0	0	\N	2018-11-16 08:17:07.429393+00	\N	\N	1
526	-230	装修	0	空调和油烟机安装材料费	2018-06-18 04:15:32.639799+00	0	0	\N	2018-11-16 05:47:13.048528+00	\N	\N	1
527	-179	装修	0	电饭煲	2018-06-18 14:50:07.839546+00	0	0	\N	2018-11-16 05:47:13.059615+00	\N	\N	1
528	-703	装修	0	电压力锅，烤箱，电热水壶	2018-06-18 14:50:35.490175+00	0	0	\N	2018-11-16 05:47:13.072102+00	\N	\N	1
529	-101	生活日用	0	炒锅	2018-06-18 14:50:54.794685+00	0	0	\N	2018-11-16 05:47:13.084043+00	\N	\N	1
507	-153	小孩生活用品	0	奶瓶2个	2018-06-15 12:59:11+00	0	0	\N	2018-11-16 07:32:16.114957+00	\N	\N	2
531	-4	饮食	0	馕	2018-06-18 14:52:30.249187+00	0	0	\N	2018-11-16 05:47:13.112836+00	\N	\N	2
532	-28	装修	0	四把锁	2018-06-18 14:53:09.520126+00	0	0	\N	2018-11-16 05:47:13.127063+00	\N	\N	1
533	-45	生活日用	0	洗衣机管子	2018-06-18 14:53:39.37853+00	0	0	\N	2018-11-16 05:47:13.146762+00	\N	\N	2
508	-25	小孩服饰	0	睡衣	2018-06-15 12:59:41+00	0	0	\N	2018-11-16 06:55:02.058128+00	\N	\N	2
535	-26	饮食	0	水果	2018-06-20 11:39:27.524845+00	0	0	\N	2018-11-16 05:47:13.182259+00	\N	\N	1
536	-1000	装修	0	300材料+700人工费	2018-06-23 02:52:02.226167+00	0	0	\N	2018-11-16 05:47:13.195848+00	\N	\N	1
537	-73	生活日用	0	手机配件	2018-07-05 12:08:44.352416+00	0	0	\N	2018-11-16 05:47:13.207375+00	\N	\N	1
538	-7380	装修	0	防盗窗	2018-07-05 12:09:39.243447+00	0	0	\N	2018-11-16 05:47:13.219105+00	\N	\N	1
551	-27	饮食	0	美购	2018-07-06 12:55:21+00	0	0	\N	2018-11-16 08:17:42.18116+00	\N	\N	2
540	-8484	装修	0	沙发+电视柜+客房床	2018-07-05 12:11:11.482136+00	0	0	\N	2018-11-16 05:47:13.241717+00	\N	\N	1
541	-43	饮食	0	零食	2018-07-05 12:11:36.528204+00	0	0	\N	2018-11-16 05:47:13.252775+00	\N	\N	1
542	-11	饮食	0	荔枝	2018-07-05 12:11:54.276154+00	0	0	\N	2018-11-16 05:47:13.268613+00	\N	\N	1
543	-40	生活日用	0	数据线X2	2018-07-05 12:26:57.825444+00	0	0	\N	2018-11-16 05:47:13.28325+00	\N	\N	1
544	-25	生活日用	0	充电电池套装	2018-07-06 12:52:16.965338+00	0	0	\N	2018-11-16 05:47:13.295879+00	\N	\N	2
546	-35	生活日用	0	茶几脚	2018-07-06 12:53:07.049125+00	0	0	\N	2018-11-16 05:47:13.326429+00	\N	\N	2
547	-26	生活日用	0	迷你烧烤	2018-07-06 12:53:31.017029+00	0	0	\N	2018-11-16 05:47:13.337867+00	\N	\N	2
548	-30	生活日用	0	毛巾架	2018-07-06 12:54:01.351277+00	0	0	\N	2018-11-16 05:47:13.34938+00	\N	\N	2
549	-108	生活日用	0	厨房置物架	2018-07-06 12:54:42.85571+00	0	0	\N	2018-11-16 05:47:13.36135+00	\N	\N	2
550	-58	生活日用	0	风扇	2018-07-06 12:54:56.70791+00	0	0	\N	2018-11-16 05:47:13.372934+00	\N	\N	2
552	-72	生活日用	0	烘培工具	2018-07-06 12:55:39+00	0	0	\N	2018-11-16 08:29:39.871971+00	\N	\N	2
522	-1899	装修	0	松下43寸电视机	2018-06-18 00:56:13+00	0	0	\N	2018-11-16 08:29:46.27873+00	\N	\N	1
553	-19	服饰美容	0	袜子	2018-07-06 12:55:58.469988+00	0	0	\N	2018-11-16 05:47:13.426209+00	\N	\N	2
554	-134	饮食	0	午餐	2018-07-06 12:57:31.351514+00	0	0	\N	2018-11-16 05:47:13.440608+00	\N	\N	2
530	-108	小孩零食	0	小孩零食	2018-06-18 14:51:38+00	0	0	\N	2018-11-16 07:27:17.005975+00	\N	\N	2
556	-22	饮食	0	午餐	2018-07-06 12:58:50.06225+00	0	0	\N	2018-11-16 05:47:13.469125+00	\N	\N	2
558	-10	饮食	0	零食	2018-07-06 12:59:43+00	0	0	\N	2018-11-16 08:17:36.516546+00	\N	\N	2
557	-119	住房缴费	0	电费	2018-07-06 12:59:05+00	0	0	\N	2018-11-16 08:17:29.211237+00	\N	\N	2
517	-100	通讯物流	0	邮费	2018-06-17 06:10:02+00	0	0	\N	2018-11-16 08:10:19.992643+00	\N	\N	2
559	-80	交通出行	0	汽车保养	2018-07-06 13:00:05+00	0	0	\N	2018-11-16 08:03:58.781847+00	\N	\N	2
555	-57	小孩服饰	0	衣服	2018-07-06 12:58:13+00	0	0	\N	2018-11-16 07:27:10.125857+00	\N	\N	2
561	-51	小孩生活用品	0	儿童酱油	2018-07-06 13:00:53+00	0	0	\N	2018-11-16 07:27:03.352455+00	\N	\N	2
562	-193	小孩尿布	0	尿不湿	2018-07-06 13:01:13+00	0	0	\N	2018-11-16 07:26:37.628782+00	\N	\N	2
564	-101	生活日用	0	苏泊尔锅	2018-07-06 13:04:15.433001+00	0	0	\N	2018-11-16 05:47:13.58495+00	\N	\N	2
565	5362	收入	0	工资	2018-07-06 13:04:45.161443+00	0	0	\N	2018-11-16 05:47:13.601783+00	\N	\N	2
566	-1299	生活日用	0	诺基亚手机	2018-07-06 13:24:28.546523+00	0	0	\N	2018-11-16 05:47:13.622978+00	\N	\N	1
560	-200	交通出行	0	加油	2018-07-06 13:00:19+00	0	0	\N	2018-11-16 08:03:51.852764+00	\N	\N	2
563	-441	小孩奶粉	0	奶粉喜宝	2018-07-06 13:02:11+00	0	0	\N	2018-11-16 07:26:31.067688+00	\N	\N	2
569	-81	生活日用	0	美购	2018-07-12 23:45:27.716189+00	0	0	\N	2018-11-16 05:47:13.668022+00	\N	\N	2
568	-87	小孩生活用品	0	马桶和围兜	2018-07-12 23:44:40+00	0	0	\N	2018-11-16 07:26:24.685643+00	\N	\N	2
571	-6000	装修	0	装修尾款	2018-07-15 06:16:29.339395+00	0	0	\N	2018-11-16 05:47:13.695565+00	\N	\N	1
534	-126	文教娱乐	0	鱼+水草	2018-06-20 11:39:17+00	0	0	\N	2018-11-16 05:56:05.781502+00	\N	\N	1
510	-20	小孩生活用品	0	浴巾	2018-06-15 13:01:05+00	0	0	\N	2018-11-16 07:23:09.607779+00	\N	\N	2
212	-679	装修	0	9付50导轨2个挂衣杆	2018-01-26 13:55:42.57114+00	0	0	\N	2018-11-16 05:47:08.348788+00	\N	\N	1
608	-52	小孩生活用品	0	防幢条	2018-07-30 15:13:29+00	0	0	\N	2018-11-16 07:25:53.663691+00	\N	\N	2
606	-818	生活日用	0	椰棕榈床垫1.5＊2	2018-07-30 15:11:44+00	0	0	\N	2018-11-16 05:57:34.978218+00	\N	\N	1
576	-16	饮食	0	零食	2018-07-15 06:19:32.776258+00	0	0	\N	2018-11-16 05:47:13.761693+00	\N	\N	1
577	-125	饮食	0	夜宵	2018-07-15 06:19:50.509415+00	0	0	\N	2018-11-16 05:47:13.775229+00	\N	\N	1
579	-24	饮食	0	零食	2018-07-20 13:28:52.503376+00	0	0	\N	2018-11-16 05:47:13.805974+00	\N	\N	1
580	-10	生活日用	0	停车费	2018-07-20 13:29:13.951582+00	0	0	\N	2018-11-16 05:47:13.822044+00	\N	\N	1
574	-73	小孩零食	0	酱油+肉松	2018-07-15 06:18:37+00	0	0	\N	2018-11-16 07:09:57.193189+00	\N	\N	1
619	-45	小孩健康	0	钙片	2018-08-12 11:39:11+00	0	0	\N	2018-11-16 07:08:36.145071+00	\N	\N	1
583	-1197	装修	0	茶几	2018-07-20 13:57:47.700261+00	0	0	\N	2018-11-16 05:47:13.886895+00	\N	\N	1
584	-632	装修	0	鞋柜	2018-07-20 13:58:37.062662+00	0	0	\N	2018-11-16 05:47:13.900967+00	\N	\N	1
581	-118	小孩玩具	0	洗澡玩具	2018-07-20 13:29:35+00	0	0	\N	2018-11-16 07:09:49.416031+00	\N	\N	1
586	-3	饮食	0	大饼	2018-07-20 14:00:16.679831+00	0	0	\N	2018-11-16 05:47:13.946813+00	\N	\N	2
587	-170	饮食	0	夜宵	2018-07-20 14:00:50.941324+00	0	0	\N	2018-11-16 05:47:13.958951+00	\N	\N	2
588	-61	饮食	0	五天午饭	2018-07-20 14:01:35.995216+00	0	0	\N	2018-11-16 05:47:13.972988+00	\N	\N	2
589	-61	饮食	0	五天午饭	2018-07-20 14:02:25.820082+00	0	0	\N	2018-11-16 05:47:13.982888+00	\N	\N	2
590	-179	服饰美容	0	睡衣	2018-07-20 14:02:38.329936+00	0	0	\N	2018-11-16 05:47:13.998384+00	\N	\N	2
585	-316	小孩服饰	0	鞋子	2018-07-20 13:59:30+00	0	0	\N	2018-11-16 07:09:42.646915+00	\N	\N	2
592	-11	生活日用	0	美购	2018-07-20 14:03:19.716363+00	0	0	\N	2018-11-16 05:47:14.034689+00	\N	\N	2
593	-204	饮食	0	芒果3箱	2018-07-20 14:04:01.886168+00	0	0	\N	2018-11-16 05:47:14.045902+00	\N	\N	2
591	-40	小孩服饰	0	袜子	2018-07-20 14:03:01+00	0	0	\N	2018-11-16 07:09:37.031364+00	\N	\N	2
596	-157	小孩生活用品	0	游泳池	2018-07-20 14:06:54+00	0	0	\N	2018-11-16 07:34:36.809086+00	\N	\N	2
594	-177	小孩零食	0	零食	2018-07-20 14:05:34+00	0	0	\N	2018-11-16 07:09:29.303482+00	\N	\N	2
643	-108	交通出行	0	车票	2018-09-10 13:11:43+00	0	0	\N	2018-11-16 07:59:32.504589+00	\N	\N	2
597	-174	小孩尿布	0	尿不湿	2018-07-20 14:07:07+00	0	0	\N	2018-11-16 07:09:02.434387+00	\N	\N	2
599	-8000	装修	0	黑胡桃木床	2018-07-22 10:31:33.931966+00	0	0	\N	2018-11-16 05:47:14.132388+00	\N	\N	1
600	-1000	装修	0	棕榈床垫	2018-07-22 10:32:05.470991+00	0	0	\N	2018-11-16 05:47:14.144298+00	\N	\N	1
601	-10	饮食	0	西瓜	2018-07-22 10:32:51.941376+00	0	0	\N	2018-11-16 05:47:14.158368+00	\N	\N	1
602	-100	生活日用	0	理发冲卡	2018-07-22 10:33:17.103775+00	0	0	\N	2018-11-16 05:47:14.17531+00	\N	\N	1
603	-2850	装修	0	餐桌带四把椅子	2018-07-30 15:10:20.659926+00	0	0	\N	2018-11-16 05:47:14.189885+00	\N	\N	1
604	-129	装修	0	榻榻米靠垫	2018-07-30 15:10:55.171839+00	0	0	\N	2018-11-16 05:47:14.204346+00	\N	\N	1
605	-49	装修	0	牙刷杯	2018-07-30 15:11:11.818146+00	0	0	\N	2018-11-16 05:47:14.246969+00	\N	\N	1
582	-198	人情往来	0	乐高玩具礼物	2018-07-20 13:30:11+00	0	0	\N	2018-11-16 06:40:23.339754+00	\N	\N	1
575	-58	文教娱乐	0	电影票X2	2018-07-15 06:19:07+00	0	0	\N	2018-11-16 05:55:50.867046+00	\N	\N	1
595	-119	小孩生活用品	0	门栏	2018-07-20 14:05:46+00	0	0	\N	2018-11-16 07:26:00.232976+00	\N	\N	2
611	-20	饮食	0	美购	2018-07-30 15:14:52+00	0	0	\N	2018-11-16 08:03:26.628912+00	\N	\N	2
610	-110	饮食	0	棒冰	2018-07-30 15:14:26.04232+00	0	0	\N	2018-11-16 05:47:14.305815+00	\N	\N	2
609	-23	饮食	0	美购	2018-07-30 15:13:45+00	0	0	\N	2018-11-16 08:03:33.445693+00	\N	\N	2
612	-100	饮食	0	老婆大人	2018-07-30 15:15:08.479093+00	0	0	\N	2018-11-16 05:47:14.352967+00	\N	\N	2
613	-36	生活日用	0	滴滴	2018-07-30 15:15:37.12656+00	0	0	\N	2018-11-16 05:47:14.366816+00	\N	\N	2
614	-16	饮食	0	早餐	2018-07-30 15:15:52.240438+00	0	0	\N	2018-11-16 05:47:14.378074+00	\N	\N	2
615	-198	生活日用	0	洗牙	2018-07-30 15:16:05.025255+00	0	0	\N	2018-11-16 05:47:14.389988+00	\N	\N	2
616	-436	饮食	0	四份自助餐	2018-07-30 15:16:25.0607+00	0	0	\N	2018-11-16 05:47:14.405028+00	\N	\N	2
598	-440	小孩奶粉	0	奶粉	2018-07-20 14:07:26+00	0	0	\N	2018-11-16 07:08:54.461403+00	\N	\N	2
618	-15	饮食	0	蛋糕	2018-08-12 11:38:54.599387+00	0	0	\N	2018-11-16 05:47:14.430296+00	\N	\N	1
617	-18	小孩文具	0	早教书	2018-08-12 11:38:08+00	0	0	\N	2018-11-16 07:08:44.207426+00	\N	\N	1
620	-55	饮食	0	零食	2018-08-12 11:39:39.110393+00	0	0	\N	2018-11-16 05:47:14.457515+00	\N	\N	1
621	-30	饮食	0	蛋糕	2018-08-12 11:40:06.31983+00	0	0	\N	2018-11-16 05:47:14.470655+00	\N	\N	1
623	-97	服饰美容	0	优衣库衣服	2018-08-12 11:41:15.119227+00	0	0	\N	2018-11-16 05:47:14.50154+00	\N	\N	1
624	-30	饮食	0	O2	2018-08-12 11:41:31.799085+00	0	0	\N	2018-11-16 05:47:14.512855+00	\N	\N	1
607	-135	生活日用	0	卫浴置物栏	2018-07-30 15:12:14+00	0	0	\N	2018-11-16 05:55:36.550072+00	\N	\N	1
626	-1214	装修	0	小沙发	2018-08-12 11:42:11.869848+00	0	0	\N	2018-11-16 05:47:14.539684+00	\N	\N	1
625	-5	交通出行	0	停车费	2018-08-12 11:41:54+00	0	0	\N	2018-11-16 05:55:22.47758+00	\N	\N	1
628	-65	饮食	0	美购	2018-08-12 11:52:48.89025+00	0	0	\N	2018-11-16 05:47:14.564803+00	\N	\N	2
630	-77	服饰美容	0	衣服卫衣	2018-08-12 11:53:32.125073+00	0	0	\N	2018-11-16 05:47:14.591813+00	\N	\N	2
631	-172	生活日用	0	洗面奶	2018-08-12 11:54:07.849906+00	0	0	\N	2018-11-16 05:47:14.605182+00	\N	\N	2
632	-100	饮食	0	棒冰	2018-08-12 11:54:24.399845+00	0	0	\N	2018-11-16 05:47:14.625484+00	\N	\N	2
633	-43	生活日用	0	抹布	2018-08-12 11:54:46.130235+00	0	0	\N	2018-11-16 05:47:14.64025+00	\N	\N	2
634	-229	生活日用	0	卸妆水	2018-08-12 11:55:24.305151+00	0	0	\N	2018-11-16 05:47:14.659262+00	\N	\N	2
635	-120	服饰美容	0	鞋子	2018-08-12 11:56:07.303468+00	0	0	\N	2018-11-16 05:47:14.670611+00	\N	\N	2
636	-750	生活日用	0	爽肤水BB霜	2018-08-12 11:57:10.709879+00	0	0	\N	2018-11-16 05:47:14.684848+00	\N	\N	2
637	-19	生活日用	0	玻璃水	2018-09-10 13:05:53.823099+00	0	0	\N	2018-11-16 05:47:14.695747+00	\N	\N	2
629	-251	住房缴费	0	电费	2018-08-12 11:53:09+00	0	0	\N	2018-11-16 08:03:09.251847+00	\N	\N	2
639	-288	服饰美容	0	衣服	2018-09-10 13:09:51.606558+00	0	0	\N	2018-11-16 05:47:14.721258+00	\N	\N	2
640	-55	服饰美容	0	衣服	2018-09-10 13:10:39.011139+00	0	0	\N	2018-11-16 05:47:14.73251+00	\N	\N	2
638	-18	饮食	0	重庆小面	2018-09-10 13:07:17+00	0	0	\N	2018-11-16 07:59:54.691366+00	\N	\N	2
641	-26	文教娱乐	0	优酷	2018-09-10 13:11:02+00	0	0	\N	2018-11-16 07:59:48.556132+00	\N	\N	2
642	-15	饮食	0	购物和停车费	2018-09-10 13:11:28+00	0	0	\N	2018-11-16 07:59:42.714212+00	\N	\N	2
644	-38	生活日用	0	凳子	2018-09-10 13:15:39.900756+00	0	0	\N	2018-11-16 05:47:14.7946+00	\N	\N	2
645	-215	服饰美容	0	衣服	2018-09-10 13:16:03.82115+00	0	0	\N	2018-11-16 05:47:14.80662+00	\N	\N	2
646	-128	饮食	0	蛋糕	2018-09-10 13:16:23.32728+00	0	0	\N	2018-11-16 05:47:14.818435+00	\N	\N	2
627	-100	通讯物流	0	话费	2018-08-12 11:42:29+00	0	0	\N	2018-11-16 05:55:01.265643+00	\N	\N	1
215	-21000	装修	0	装修30%	2018-01-28 06:59:38.120757+00	0	0	\N	2018-11-16 05:47:08.394979+00	\N	\N	1
678	-100	通讯物流	0	话费	2018-09-12 00:04:12+00	0	0	\N	2018-11-16 08:02:58.065488+00	\N	\N	1
650	-214	生活日用	0	面膜	2018-09-10 13:17:46.762276+00	0	0	\N	2018-11-16 05:47:14.870545+00	\N	\N	2
649	-17	住房缴费	0	水费	2018-09-10 13:17:18+00	0	0	\N	2018-11-16 07:59:10.597889+00	\N	\N	2
651	-40	饮食	0	水果	2018-09-10 13:18:15+00	0	0	\N	2018-11-16 07:59:01.870659+00	\N	\N	2
652	-230	饮食	0	超市	2018-09-10 13:18:43+00	0	0	\N	2018-11-16 07:58:54.943495+00	\N	\N	2
653	-142	住房缴费	0	水费	2018-09-10 13:18:57+00	0	0	\N	2018-11-16 07:58:47.170731+00	\N	\N	2
655	-173	生活日用	0	老家凳子	2018-09-10 13:19:53.549757+00	0	0	\N	2018-11-16 05:47:14.934317+00	\N	\N	2
656	-104	服饰美容	0	午餐	2018-09-10 13:20:19.099265+00	0	0	\N	2018-11-16 05:47:14.948976+00	\N	\N	2
721	-110	小孩玩具	0	帐篷和滑梯	2018-09-29 14:46:12+00	0	0	\N	2018-11-16 07:01:29.039566+00	\N	\N	2
657	-42	小孩尿布	0	尿不湿	2018-09-10 13:22:01+00	0	0	\N	2018-11-16 06:54:00.283513+00	\N	\N	2
659	-61	生活日用	0	垃圾袋	2018-09-10 13:22:30.870155+00	0	0	\N	2018-11-16 05:47:14.990421+00	\N	\N	2
658	-126	小孩零食	0	零食	2018-09-10 13:22:18+00	0	0	\N	2018-11-16 06:53:51.23647+00	\N	\N	2
661	-109	生活日用	0	大米	2018-09-10 13:23:49.767052+00	0	0	\N	2018-11-16 05:47:15.025532+00	\N	\N	2
660	-256	小孩尿布	0	尿不湿	2018-09-10 13:23:36+00	0	0	\N	2018-11-16 06:53:25.093605+00	\N	\N	2
662	-29	小孩尿布	0	尿不湿	2018-09-10 13:24:03+00	0	0	\N	2018-11-16 06:53:12.416837+00	\N	\N	2
663	-440	小孩奶粉	0	奶粉	2018-09-10 13:24:21+00	0	0	\N	2018-11-16 06:53:00.631644+00	\N	\N	2
654	-6	饮食	0	饼	2018-09-10 13:19:20+00	0	0	\N	2018-11-16 07:58:36.401848+00	\N	\N	2
664	-83	小孩零食	0	零食	2018-09-10 13:24:33+00	0	0	\N	2018-11-16 06:52:48.911208+00	\N	\N	2
717	-369	小孩生活用品	0	婴儿床	2018-09-29 14:43:16+00	0	0	\N	2018-11-16 07:29:01.169189+00	\N	\N	2
669	-92	生活日用	0	生活用品	2018-09-10 13:26:31.200121+00	0	0	\N	2018-11-16 05:47:15.132969+00	\N	\N	2
670	-364	生活日用	0	硬盘	2018-09-10 13:26:48.149934+00	0	0	\N	2018-11-16 05:47:15.148759+00	\N	\N	2
671	-100	饮食	0	美蛙	2018-09-10 13:29:37.37144+00	0	0	\N	2018-11-16 05:47:15.168381+00	\N	\N	2
665	-41	饮食	0	零食	2018-09-10 13:24:52+00	0	0	\N	2018-11-16 07:58:26.348306+00	\N	\N	2
673	-724	装修	0	塌塌米垫	2018-09-10 13:31:48.156967+00	0	0	\N	2018-11-16 05:47:15.194576+00	\N	\N	1
674	-49	装修	0	植物6盆	2018-09-10 13:32:51.639312+00	0	0	\N	2018-11-16 05:47:15.208597+00	\N	\N	1
675	-10	饮食	0	小吃	2018-09-12 00:01:47.516703+00	0	0	\N	2018-11-16 05:47:15.221967+00	\N	\N	1
687	-88	人情往来	0	助行器	2018-09-12 00:08:58+00	0	0	\N	2018-11-16 06:40:05.272759+00	\N	\N	1
677	-53	生活日用	0	蟑螂贴	2018-09-12 00:03:56.132158+00	0	0	\N	2018-11-16 05:47:15.264029+00	\N	\N	1
679	-119	饮食	0	美购超市	2018-09-12 00:04:41.07638+00	0	0	\N	2018-11-16 05:47:15.289717+00	\N	\N	1
680	-40	饮食	0	阿香米线	2018-09-12 00:05:09.411137+00	0	0	\N	2018-11-16 05:47:15.305468+00	\N	\N	1
681	-373	装修	0	沙发靠脚	2018-09-12 00:05:48.940575+00	0	0	\N	2018-11-16 05:47:15.318149+00	\N	\N	1
676	-27	生活日用	0	百合花	2018-09-12 00:02:07+00	0	0	\N	2018-11-16 05:54:39.333284+00	\N	\N	1
683	-26	饮食	0	石锅饭	2018-09-12 00:06:57.036432+00	0	0	\N	2018-11-16 05:47:15.35634+00	\N	\N	1
684	-65	饮食	0	乐购	2018-09-12 00:07:18.995503+00	0	0	\N	2018-11-16 05:47:15.368125+00	\N	\N	1
672	-1000	交通出行	0	油卡	2018-09-10 13:29:50+00	0	0	\N	2018-11-16 07:58:14.81314+00	\N	\N	2
682	-5	交通出行	0	停车费	2018-09-12 00:06:20+00	0	0	\N	2018-11-16 05:54:20.839603+00	\N	\N	1
713	-16	服饰美容	0	拖鞋	2018-09-29 14:41:36+00	0	0	\N	2018-11-16 07:57:31.834255+00	\N	\N	2
686	-100	通讯物流	0	手机充值	2018-09-12 00:08:19+00	0	0	\N	2018-11-16 05:54:05.359534+00	\N	\N	1
689	-15	饮食	0	绿姿	2018-09-12 00:10:02.282651+00	0	0	\N	2018-11-16 05:47:15.464333+00	\N	\N	1
690	-6	饮食	0	饮料	2018-09-12 00:10:25.712609+00	0	0	\N	2018-11-16 05:47:15.477237+00	\N	\N	1
691	-279	装修	0	电视柜架子	2018-09-12 00:10:46.252111+00	0	0	\N	2018-11-16 05:47:15.490537+00	\N	\N	1
692	-12	装修	0	小挂架	2018-09-12 00:11:19.975291+00	0	0	\N	2018-11-16 05:47:15.52902+00	\N	\N	1
693	-3043	装修	0	酒柜+小东西	2018-09-12 00:12:02.561299+00	0	0	\N	2018-11-16 05:47:15.545103+00	\N	\N	1
694	-2728	生活日用	0	S8	2018-09-12 00:12:24.490773+00	0	0	\N	2018-11-16 05:47:15.558396+00	\N	\N	1
695	12662	收入	0	工资	2018-09-12 00:15:28.706776+00	0	0	\N	2018-11-16 05:47:15.575472+00	\N	\N	1
696	-25	饮食	0	夜宵	2018-09-29 14:31:03.53761+00	0	0	\N	2018-11-16 05:47:15.59207+00	\N	\N	2
697	-34	饮食	0	美团	2018-09-29 14:34:20.140353+00	0	0	\N	2018-11-16 05:47:15.605478+00	\N	\N	2
698	-5	饮食	0	麦饺	2018-09-29 14:34:37.829348+00	0	0	\N	2018-11-16 05:47:15.628641+00	\N	\N	2
699	-18	饮食	0	绿资	2018-09-29 14:34:53.787178+00	0	0	\N	2018-11-16 05:47:15.645831+00	\N	\N	2
700	-18	饮食	0	水果	2018-09-29 14:35:04.557162+00	0	0	\N	2018-11-16 05:47:15.666832+00	\N	\N	2
701	-22	饮食	0	美团外卖	2018-09-29 14:35:18.673503+00	0	0	\N	2018-11-16 05:47:15.685645+00	\N	\N	2
685	-95	交通出行	0	车保养	2018-09-12 00:07:41+00	0	0	\N	2018-11-16 07:58:04.976482+00	\N	\N	1
702	-94	服饰美容	0	支付宝	2018-09-29 14:37:02+00	0	0	\N	2018-11-16 07:57:56.043215+00	\N	\N	2
703	-35	饮食	0	肯德基	2018-09-29 14:37:24+00	0	0	\N	2018-11-16 07:57:45.185671+00	\N	\N	2
705	-58	饮食	0	过桥米线	2018-09-29 14:38:52.194292+00	0	0	\N	2018-11-16 05:47:15.733425+00	\N	\N	2
706	-237	服饰美容	0	鞋子	2018-09-29 14:39:04.738784+00	0	0	\N	2018-11-16 05:47:15.744692+00	\N	\N	2
707	-3	饮食	0	麦饺	2018-09-29 14:39:24.732275+00	0	0	\N	2018-11-16 05:47:15.75649+00	\N	\N	2
667	-176	小孩健康	0	钙	2018-09-10 13:25:35+00	0	0	\N	2018-11-16 07:08:24.067264+00	\N	\N	2
709	-13	饮食	0	水果	2018-09-29 14:39:54.87663+00	0	0	\N	2018-11-16 05:47:15.777695+00	\N	\N	2
710	-23	生活日用	0	水管	2018-09-29 14:40:21.71091+00	0	0	\N	2018-11-16 05:47:15.788748+00	\N	\N	2
711	-8	饮食	0	水果	2018-09-29 14:40:55.743375+00	0	0	\N	2018-11-16 05:47:15.803011+00	\N	\N	2
688	-70	文教娱乐	0	宠物鱼虾	2018-09-12 00:09:28+00	0	0	\N	2018-11-16 05:53:48.050883+00	\N	\N	1
704	-29	饮食	0	三江购物	2018-09-29 14:37:48+00	0	0	\N	2018-11-16 07:57:39.2382+00	\N	\N	2
714	-32	生活日用	0	抽屉垫	2018-09-29 14:42:24.432134+00	0	0	\N	2018-11-16 05:47:15.852803+00	\N	\N	2
712	-2888	人情往来	0	表弟结婚红包	2018-09-29 14:41:21+00	0	0	\N	2018-11-16 05:53:32.035538+00	\N	\N	2
666	-95	小孩生活用品	0	洗衣液	2018-09-10 13:25:15+00	0	0	\N	2018-11-16 07:32:33.335944+00	\N	\N	2
708	-439	小孩玩具	0	三轮车	2018-09-29 14:39:42+00	0	0	\N	2018-11-16 07:08:16.739257+00	\N	\N	2
720	-284	生活日用	0	油米	2018-09-29 14:45:45.193774+00	0	0	\N	2018-11-16 05:47:15.933873+00	\N	\N	2
719	-40	小孩服饰	0	袜子	2018-09-29 14:43:52+00	0	0	\N	2018-11-16 07:01:36.354296+00	\N	\N	2
716	-15	文教娱乐	0	腾讯VIP	2018-09-29 14:43:03+00	0	0	\N	2018-11-16 05:52:55.495056+00	\N	\N	2
724	-250	交通出行	0	过路费	2018-09-29 14:48:00+00	0	0	\N	2018-11-16 05:52:35.791459+00	\N	\N	2
54	11825	收入	0	工资	2017-11-18 00:42:00.108541+00	0	0	\N	2018-11-16 05:47:06.10972+00	\N	\N	1
75	-213	生活日用	0	大米12袋	2017-11-26 13:23:44.03519+00	0	0	\N	2018-11-16 05:47:06.402875+00	\N	\N	2
214	-55	饮食	0	麦当劳	2018-01-28 03:11:57.318761+00	0	0	\N	2018-11-16 05:47:08.376683+00	\N	\N	1
247	-463	服饰美容	0	一件棉服＋毛线裙	2018-02-10 23:37:51.749042+00	0	0	\N	2018-11-16 05:47:08.892488+00	\N	\N	2
286	-30	生活日用	0	iPad外套	2018-03-01 10:32:03.418446+00	0	0	\N	2018-11-16 05:47:09.458155+00	\N	\N	1
297	-185	生活日用	0	华润万家	2018-03-04 09:12:55.169482+00	0	0	\N	2018-11-16 05:47:09.620247+00	\N	\N	2
357	-5	饮食	0	大饼油条	2018-04-04 13:46:26.954467+00	0	0	\N	2018-11-16 05:47:10.587166+00	\N	\N	1
374	-17200	装修	0	橱柜，卫生间，阳台，榻榻米门	2018-04-14 09:22:06.8383+00	0	0	\N	2018-11-16 05:47:10.84351+00	\N	\N	1
428	-578	装修	0	台盆	2018-05-07 13:51:16.266137+00	0	0	\N	2018-11-16 05:47:11.602057+00	\N	\N	1
445	-22	生活日用	0	插座	2018-05-22 13:07:24.424818+00	0	0	\N	2018-11-16 05:47:11.841799+00	\N	\N	2
500	-40	装修	0	空调开关X2	2018-06-10 08:44:13.223936+00	0	0	\N	2018-11-16 05:47:12.695979+00	\N	\N	1
501	-1000	装修	0	背景墙	2018-06-10 08:46:01.279849+00	0	0	\N	2018-11-16 05:47:12.710885+00	\N	\N	1
545	-35	生活日用	0	老家浴室置物架	2018-07-06 12:52:50.792397+00	0	0	\N	2018-11-16 05:47:13.307392+00	\N	\N	2
572	-479	服饰美容	0	优衣库衣服	2018-07-15 06:17:47.622261+00	0	0	\N	2018-11-16 05:47:13.712932+00	\N	\N	1
573	-130	服饰美容	0	hm衣服	2018-07-15 06:18:07.8894+00	0	0	\N	2018-11-16 05:47:13.72584+00	\N	\N	1
578	16800	收入	0	工资+换公司补贴	2018-07-20 13:27:56.917456+00	0	0	\N	2018-11-16 05:47:13.788385+00	\N	\N	1
668	-106	生活日用	0	餐巾纸	2018-09-10 13:26:16.470029+00	0	0	\N	2018-11-16 05:47:15.120156+00	\N	\N	2
725	-200	生活日用	0	零花钱	2018-09-29 14:48:11.364281+00	0	0	\N	2018-11-16 05:47:16.004262+00	\N	\N	2
775	-19	生活日用	0	土豆切丝	2018-10-28 11:01:20.522945+00	0	0	\N	2018-11-16 05:47:16.645021+00	\N	\N	2
784	-138	生活日用	0	实木凳子6把	2018-10-28 11:05:01.59176+00	0	0	\N	2018-11-16 05:47:16.779183+00	\N	\N	2
622	-28	健康保险	0	验血型	2018-08-12 11:40:52+00	0	0	\N	2018-11-16 05:56:21.069096+00	\N	\N	1
1	-179	文教娱乐	0	BroadLink RM pro	2017-10-25 06:10:01+00	0	0	\N	2018-11-16 06:01:44.073133+00	\N	\N	1
285	-252	文教娱乐	0	树莓派3b E14中国版	2018-02-27 13:44:03+00	0	0	\N	2018-11-16 06:03:16.933788+00	\N	\N	1
284	-139	文教娱乐	0	64G micro SD卡	2018-02-27 13:41:19+00	0	0	\N	2018-11-16 06:35:47.855317+00	\N	\N	1
840	-442	小孩奶粉	0	奶粉四合	2018-11-11 07:38:44+00	0	0	\N	2018-11-16 06:59:51.460012+00	\N	\N	1
814	-32	小孩健康	0	A D剂	2018-10-28 11:22:37+00	0	0	\N	2018-11-16 07:00:19.243598+00	\N	\N	2
342	-80	小孩零食	0	米粉＋零食	2018-03-25 13:25:42+00	0	0	\N	2018-11-16 07:06:32.268874+00	\N	\N	2
73	-29	小孩服饰	0	婴儿鞋	2017-11-26 13:19:16+00	0	0	\N	2018-11-16 07:22:14.429159+00	\N	\N	2
360	-82	小孩生活用品	0	退热贴+两双袜子+小馒头	2018-04-10 13:49:26+00	0	0	\N	2018-11-16 07:24:50.616279+00	\N	\N	2
356	-478	小孩生活用品	0	儿童围栏	2018-04-04 13:41:20+00	0	0	\N	2018-11-16 07:24:57.526948+00	\N	\N	2
815	-15	文教娱乐	0	优酷	2018-10-28 11:22:53+00	0	0	\N	2018-11-16 07:55:00.601048+00	\N	\N	2
648	-318	住房缴费	0	电费	2018-09-10 13:17:02+00	0	0	\N	2018-11-16 07:59:17.529836+00	\N	\N	2
647	-7	饮食	0	超市	2018-09-10 13:16:42+00	0	0	\N	2018-11-16 07:59:23.848328+00	\N	\N	2
421	-10	住房缴费	0	水费	2018-05-06 12:24:11+00	0	0	\N	2018-11-16 08:13:25.44998+00	\N	\N	2
915	-200	交通出行	0	加油	2018-11-23 09:26:15.047594+00	0	0	\N	2018-11-23 09:26:15.04951+00	\N	\N	1
931	-216	饮食	0	烘培用品	2018-11-28 14:00:42.879105+00	0	0	\N	2018-11-28 14:00:42.880611+00	\N	\N	2
935	-35	生活日用	0	脸盆2个	2018-11-28 14:02:03.021126+00	0	0	\N	2018-11-28 14:02:03.023854+00	\N	\N	2
939	-51	饮食	0	绿资	2018-11-28 14:03:24.399149+00	0	0	\N	2018-11-28 14:03:24.400558+00	\N	\N	2
943	-200	服饰美容	0	理发	2018-11-28 14:04:41.353525+00	0	0	\N	2018-11-28 14:04:41.355012+00	\N	\N	2
947	-43	生活日用	0	美购超市	2018-11-28 14:06:36.29686+00	0	0	\N	2018-11-28 14:06:36.298313+00	\N	\N	2
951	-148	生活日用	0	2个保温瓶	2018-11-28 14:10:45.971543+00	0	0	\N	2018-11-28 14:10:45.973087+00	\N	\N	2
955	-33	生活日用	0	网线分线器	2018-11-28 14:12:30.037158+00	0	0	\N	2018-11-28 14:12:30.038764+00	\N	\N	2
959	-56	交通出行	0	装轮胎	2018-11-28 14:13:41.332632+00	0	0	\N	2018-11-28 14:13:41.334509+00	\N	\N	2
966	-100	通讯物流	0	话费	2018-12-07 13:51:11.656303+00	0	0	\N	2018-12-07 13:51:11.65863+00	\N	\N	1
970	-232	服饰美容	0	优衣库	2018-12-07 13:52:41.770159+00	0	0	\N	2018-12-07 13:52:41.772653+00	\N	\N	1
974	-50	人情往来	0	泡脚药	2018-12-07 13:56:19.668206+00	0	0	\N	2018-12-07 13:56:19.670541+00	\N	\N	1
978	-4043	住房缴费	0	房产税1.5	2018-12-07 14:00:26.157284+00	0	0	\N	2018-12-07 14:00:26.159619+00	\N	\N	1
986	-60	服饰美容	0	裤子	2018-12-07 15:17:21.588957+00	0	0	\N	2018-12-07 15:17:21.591342+00	\N	\N	2
990	-27	小孩服饰	0	纱布毛巾	2018-12-07 15:18:35.593624+00	0	0	\N	2018-12-07 15:18:35.595916+00	\N	\N	2
994	-108	人情往来	0	给弯弯礼物	2018-12-07 15:20:16.532687+00	0	0	\N	2018-12-07 15:20:16.535102+00	\N	\N	2
998	-114	服饰美容	0	护发精油	2018-12-07 15:21:09.278115+00	0	0	\N	2018-12-07 15:21:09.280355+00	\N	\N	2
1001	-9	饮食	0	绿姿	2018-12-17 01:24:28.860758+00	0	0	\N	2018-12-17 01:24:28.862593+00	\N	\N	1
1004	-11	饮食	0	早餐	2018-12-17 01:25:19.315476+00	0	0	\N	2018-12-17 01:25:19.316826+00	\N	\N	1
1007	-28	饮食	0	吐司	2018-12-17 01:26:54.771478+00	0	0	\N	2018-12-17 01:26:54.773017+00	\N	\N	1
1016	-20	小孩文具	0	专注力训练	2018-12-22 02:43:47.288497+00	0	0	\N	2018-12-22 02:43:47.291387+00	\N	\N	2
1019	-38	服饰美容	0	袜子	2018-12-22 02:45:01.164501+00	0	0	\N	2018-12-22 02:45:01.167114+00	\N	\N	2
1022	-38	服饰美容	0	包	2018-12-22 02:45:50.429539+00	0	0	\N	2018-12-22 02:45:50.43201+00	\N	\N	2
1025	-69	服饰美容	0	隔离	2018-12-22 02:46:51.570178+00	0	0	\N	2018-12-22 02:46:51.572727+00	\N	\N	2
1028	-15	文教娱乐	0	爱奇艺会员	2018-12-22 02:47:46.619548+00	0	0	\N	2018-12-22 02:47:46.624139+00	\N	\N	2
1031	-10	生活日用	0	美购	2018-12-22 02:48:39.351532+00	0	0	\N	2018-12-22 02:48:39.354391+00	\N	\N	2
1034	-184	服饰美容	0	裤子和妈妈鞋	2018-12-22 02:49:43.455184+00	0	0	\N	2018-12-22 02:49:43.457835+00	\N	\N	2
1037	-80	生活日用	0	午餐费用	2018-12-22 02:51:02.108284+00	0	0	\N	2018-12-22 02:51:02.110709+00	\N	\N	2
1040	-99	生活日用	0	剃毛球器	2018-12-23 11:22:45.412624+00	0	0	\N	2018-12-23 11:22:45.414003+00	\N	\N	2
1043	-130	交通出行	0	加油	2018-12-26 10:25:24.401409+00	0	0	\N	2018-12-26 10:25:24.405262+00	\N	\N	1
1046	-173	小孩玩具	0	乐高积木桌	2018-12-26 10:32:23.519572+00	0	0	\N	2018-12-26 10:32:23.522066+00	\N	\N	1
1049	-19	饮食	0	绿姿	2018-12-26 10:35:41.803527+00	0	0	\N	2018-12-26 10:35:41.806002+00	\N	\N	1
1052	-7668	小孩健康	0	平安保险	2018-12-26 10:50:45.419034+00	0	0	\N	2018-12-26 10:50:45.421684+00	\N	\N	2
1055	-75	小孩服饰	0	二套秋衣	2018-12-26 10:54:47.300848+00	0	0	\N	2018-12-26 10:54:47.302221+00	\N	\N	2
1058	-255	小孩尿布	0	1包拉拉裤2包尿不湿	2018-12-26 10:56:23.189856+00	0	0	\N	2018-12-26 10:56:23.193057+00	\N	\N	2
1059	-199	生活日用	0	被套	2018-12-29 15:31:47.133022+00	0	0	\N	2018-12-29 15:31:47.134537+00	\N	\N	2
1062	-65	小孩服饰	0	裤子	2018-12-29 15:32:56.441465+00	0	0	\N	2018-12-29 15:32:56.443745+00	\N	\N	2
1065	-30	生活日用	0	理发	2019-01-03 03:19:17.182469+00	0	0	\N	2019-01-03 03:19:17.185138+00	\N	\N	1
715	-214	生活日用	0	碗	2018-09-29 14:42:39.840786+00	0	0	\N	2018-11-16 05:47:15.866892+00	\N	\N	2
718	-112	生活日用	0	保洁	2018-09-29 14:43:36.820251+00	0	0	\N	2018-11-16 05:47:15.907351+00	\N	\N	2
723	-150	生活日用	0	电视支架	2018-09-29 14:47:46.319133+00	0	0	\N	2018-11-16 05:47:15.972594+00	\N	\N	2
726	5366	收入	0	工资	2018-09-29 14:49:34.97276+00	0	0	\N	2018-11-16 05:47:16.018244+00	\N	\N	2
729	-45	饮食	0	无印良品咖喱	2018-09-29 14:53:53.233403+00	0	0	\N	2018-11-16 05:47:16.056923+00	\N	\N	2
963	-5	交通出行	0	停车费	2018-12-07 13:50:07.277676+00	0	0	\N	2018-12-07 13:50:07.300366+00	\N	\N	1
731	-173	生活日用	0	板凳	2018-09-29 15:04:20.741833+00	0	0	\N	2018-11-16 05:47:16.083976+00	\N	\N	2
732	-50	生活日用	0	盆栽	2018-09-29 15:04:48.380637+00	0	0	\N	2018-11-16 05:47:16.095494+00	\N	\N	2
733	-15	饮食	0	葡萄	2018-10-06 11:31:53.320472+00	0	0	\N	2018-11-16 05:47:16.109493+00	\N	\N	1
734	-17	饮食	0	葡萄	2018-10-06 11:32:20.247606+00	0	0	\N	2018-11-16 05:47:16.120699+00	\N	\N	1
735	-80	生活日用	0	NITOR生活用品	2018-10-06 11:33:16.938521+00	0	0	\N	2018-11-16 05:47:16.132356+00	\N	\N	1
737	-26	饮食	0	水果	2018-10-06 11:34:02.920585+00	0	0	\N	2018-11-16 05:47:16.159891+00	\N	\N	1
739	-139	饮食	0	西贝莜面	2018-10-06 11:35:32.341604+00	0	0	\N	2018-11-16 05:47:16.185761+00	\N	\N	1
740	-44	饮食	0	三江超市	2018-10-06 11:35:54.133962+00	0	0	\N	2018-11-16 05:47:16.196975+00	\N	\N	1
741	-3	饮食	0	豆奶	2018-10-06 11:36:21.964655+00	0	0	\N	2018-11-16 05:47:16.209984+00	\N	\N	1
744	-34	生活日用	0	茶杯	2018-10-06 11:37:46.673462+00	0	0	\N	2018-11-16 05:47:16.263675+00	\N	\N	1
745	-172	饮食	0	捞王	2018-10-06 11:38:34.114938+00	0	0	\N	2018-11-16 05:47:16.274965+00	\N	\N	1
748	-942	生活日用	0	宜家	2018-10-06 11:39:24.791611+00	0	0	\N	2018-11-16 05:47:16.308166+00	\N	\N	1
750	-26	饮食	0	KFC	2018-10-06 11:45:36.409805+00	0	0	\N	2018-11-16 05:47:16.333619+00	\N	\N	2
751	-26	饮食	0	KFC	2018-10-06 11:45:55.47814+00	0	0	\N	2018-11-16 05:47:16.347695+00	\N	\N	2
752	-13	饮食	0	coco	2018-10-06 11:46:09.432062+00	0	0	\N	2018-11-16 05:47:16.362454+00	\N	\N	2
753	-385	生活日用	0	沃尔玛	2018-10-06 11:46:27.614162+00	0	0	\N	2018-11-16 05:47:16.37338+00	\N	\N	2
754	-16	饮食	0	煎饼	2018-10-28 10:44:01.979742+00	0	0	\N	2018-11-16 05:47:16.384621+00	\N	\N	1
755	-702	生活日用	0	碗，桌垫等	2018-10-28 10:45:02.551568+00	0	0	\N	2018-11-16 05:47:16.396021+00	\N	\N	1
756	-10	饮食	0	早餐	2018-10-28 10:45:42.795424+00	0	0	\N	2018-11-16 05:47:16.407072+00	\N	\N	1
757	-9	饮食	0	水果	2018-10-28 10:45:59.293902+00	0	0	\N	2018-11-16 05:47:16.418475+00	\N	\N	1
758	-40	饮食	0	老婆大人	2018-10-28 10:46:09.285264+00	0	0	\N	2018-11-16 05:47:16.432759+00	\N	\N	1
759	-109	服饰美容	0	hm	2018-10-28 10:46:40.478777+00	0	0	\N	2018-11-16 05:47:16.443577+00	\N	\N	1
761	-18	饮食	0	饮料	2018-10-28 10:48:24.485127+00	0	0	\N	2018-11-16 05:47:16.468347+00	\N	\N	1
749	12662	收入	0	八月工资	2018-08-20 11:40:46+00	0	0	\N	2018-11-23 09:04:54.748532+00	\N	\N	1
763	-260	饮食	0	外婆家	2018-10-28 10:49:34.189064+00	0	0	\N	2018-11-16 05:47:16.493622+00	\N	\N	1
765	-91	饮食	0	美团3次	2018-10-28 10:51:47.158209+00	0	0	\N	2018-11-16 05:47:16.522007+00	\N	\N	1
766	-233	服饰美容	0	in time365	2018-10-28 10:58:27.789815+00	0	0	\N	2018-11-16 05:47:16.53653+00	\N	\N	2
767	-462	服饰美容	0	衣服	2018-10-28 10:58:50.707349+00	0	0	\N	2018-11-16 05:47:16.548925+00	\N	\N	2
768	-199	服饰美容	0	优衣库	2018-10-28 10:59:03.071687+00	0	0	\N	2018-11-16 05:47:16.562119+00	\N	\N	2
769	-35	饮食	0	欧文西点	2018-10-28 10:59:20.970789+00	0	0	\N	2018-11-16 05:47:16.573309+00	\N	\N	2
928	-46	服饰美容	0	留夫鸭	2018-11-28 13:57:26.184976+00	0	0	\N	2018-11-28 13:57:26.186895+00	\N	\N	2
771	-14	生活日用	0	晾衣杆	2018-10-28 11:00:04.024749+00	0	0	\N	2018-11-16 05:47:16.596433+00	\N	\N	2
730	5366	收入	0	工资	2018-08-23 14:57:11+00	0	0	\N	2018-11-23 09:09:06.114373+00	\N	\N	2
727	5362	收入	0	工资	2018-06-23 14:49:58+00	0	0	\N	2018-11-23 09:17:52.744081+00	\N	\N	2
774	-16	生活日用	0	小夜灯	2018-10-28 11:01:01.097362+00	0	0	\N	2018-11-16 05:47:16.632955+00	\N	\N	2
762	-2114	生活日用	0	电信3年	2018-10-28 10:48:55+00	0	0	\N	2018-11-16 05:51:25.836781+00	\N	\N	1
746	-15	交通出行	0	停车费	2018-10-06 11:38:51+00	0	0	\N	2018-11-16 05:51:40.596414+00	\N	\N	1
484	-106	文教娱乐	0	鱼类用品	2018-06-07 12:58:20+00	0	0	\N	2018-11-16 05:56:34.816592+00	\N	\N	1
736	-59	人情往来	0	外婆毛巾袜	2018-10-06 11:33:48+00	0	0	\N	2018-11-16 06:39:49.40317+00	\N	\N	1
743	-340	小孩服饰	0	hm衣服	2018-10-06 11:37:17+00	0	0	\N	2018-11-16 07:01:10.228141+00	\N	\N	1
742	-336	小孩服饰	0	maxwin衣服	2018-10-06 11:36:57+00	0	0	\N	2018-11-16 07:01:16.532378+00	\N	\N	1
728	-388	小孩奶粉	0	奶粉	2018-09-29 14:53:30+00	0	0	\N	2018-11-16 07:01:21.61214+00	\N	\N	2
773	-31	服饰美容	0	妈咪包	2018-10-28 11:00:37+00	0	0	\N	2018-11-16 07:55:43.864931+00	\N	\N	2
772	-175	住房缴费	0	电费	2018-10-28 11:00:19+00	0	0	\N	2018-11-16 07:56:14.095689+00	\N	\N	2
770	-5	交通出行	0	停车费	2018-10-28 10:59:36+00	0	0	\N	2018-11-16 07:57:03.3724+00	\N	\N	2
760	-420	小孩奶粉	0	尿不湿x2，奶粉	2018-10-28 10:47:34+00	0	0	\N	2018-11-16 07:57:15.124251+00	\N	\N	1
722	-300	小孩生活用品	0	铁锅和奶锅	2018-09-29 14:47:31+00	0	0	\N	2018-11-16 07:57:23.66641+00	\N	\N	2
747	-647	饮食	0	麦德龙	2018-10-06 11:39:07+00	0	0	\N	2018-11-16 08:02:28.083788+00	\N	\N	1
738	-536	小孩生活用品	0	麦德龙	2018-10-06 11:34:58+00	0	0	\N	2018-11-16 08:02:50.378296+00	\N	\N	1
912	-140	其他消费	0	服务器一年	2018-11-23 09:24:44.717187+00	0	0	\N	2018-11-23 09:24:44.719164+00	\N	\N	1
916	-147	小孩玩具	0	滑梯	2018-11-23 09:28:52.647142+00	0	0	\N	2018-11-23 09:28:52.648712+00	\N	\N	1
932	-20	小孩服饰	0	袜子5双	2018-11-28 14:01:08.057899+00	0	0	\N	2018-11-28 14:01:08.05938+00	\N	\N	2
936	-195	服饰美容	0	棉衣	2018-11-28 14:02:24.924074+00	0	0	\N	2018-11-28 14:02:24.925665+00	\N	\N	2
940	-140	服饰美容	0	毛衣加裙子	2018-11-28 14:03:43.108731+00	0	0	\N	2018-11-28 14:03:43.110133+00	\N	\N	2
944	-499	服饰美容	0	小ck包	2018-11-28 14:05:04.263127+00	0	0	\N	2018-11-28 14:05:04.264528+00	\N	\N	2
948	-94	服饰美容	0	打底袜	2018-11-28 14:07:02.204165+00	0	0	\N	2018-11-28 14:07:02.205693+00	\N	\N	2
952	-628	生活日用	0	键盘架鼠标	2018-11-28 14:11:15.06189+00	0	0	\N	2018-11-28 14:11:15.063325+00	\N	\N	2
956	-598	生活日用	0	剃须刀	2018-11-28 14:12:44.201706+00	0	0	\N	2018-11-28 14:12:44.204663+00	\N	\N	2
960	-12	生活日用	0	毛巾架	2018-11-28 14:13:59.624645+00	0	0	\N	2018-11-28 14:13:59.627796+00	\N	\N	2
967	-102	生活日用	0	美购	2018-12-07 13:51:26.544618+00	0	0	\N	2018-12-07 13:51:26.547013+00	\N	\N	1
971	-58	生活日用	0	日用	2018-12-07 13:54:05.77163+00	0	0	\N	2018-12-07 13:54:05.774035+00	\N	\N	1
975	-80	住房缴费	0	房产证	2018-12-07 13:56:40.199565+00	0	0	\N	2018-12-07 13:56:40.202173+00	\N	\N	1
979	-30	服饰美容	0	围巾	2018-12-07 15:13:34.102808+00	0	0	\N	2018-12-07 15:13:34.105273+00	\N	\N	2
983	-87	住房缴费	0	电费爸家	2018-12-07 15:16:31.513253+00	0	0	\N	2018-12-07 15:16:31.51555+00	\N	\N	2
987	-18	生活日用	0	美购	2018-12-07 15:17:41.195305+00	0	0	\N	2018-12-07 15:17:41.197822+00	\N	\N	2
991	-94	服饰美容	0	三件秋衣	2018-12-07 15:19:12.587673+00	0	0	\N	2018-12-07 15:19:12.589919+00	\N	\N	2
995	-27	饮食	0	绿资	2018-12-07 15:20:28.769007+00	0	0	\N	2018-12-07 15:20:28.77128+00	\N	\N	2
776	-703	服饰美容	0	耐克鞋	2018-10-28 11:01:41.874321+00	0	0	\N	2018-11-16 05:47:16.659736+00	\N	\N	2
777	-248	生活日用	0	猪猪	2018-10-28 11:01:57.096648+00	0	0	\N	2018-11-16 05:47:16.672325+00	\N	\N	2
778	-38	生活日用	0	水果盘	2018-10-28 11:02:20.155016+00	0	0	\N	2018-11-16 05:47:16.686101+00	\N	\N	2
779	-63	生活日用	0	电表箱装饰	2018-10-28 11:02:40.374177+00	0	0	\N	2018-11-16 05:47:16.703145+00	\N	\N	2
780	-27	生活日用	0	硅藻泥垫	2018-10-28 11:03:26.622482+00	0	0	\N	2018-11-16 05:47:16.718862+00	\N	\N	2
781	-100	饮食	0	02	2018-10-28 11:03:42.230293+00	0	0	\N	2018-11-16 05:47:16.734708+00	\N	\N	2
782	-39	生活日用	0	密封胶	2018-10-28 11:04:21.324808+00	0	0	\N	2018-11-16 05:47:16.749079+00	\N	\N	2
785	-30	生活日用	0	洗脸盆	2018-10-28 11:05:15.176875+00	0	0	\N	2018-11-16 05:47:16.793754+00	\N	\N	2
786	-43	生活日用	0	垃圾桶	2018-10-28 11:05:26.277667+00	0	0	\N	2018-11-16 05:47:16.808819+00	\N	\N	2
787	-140	生活日用	0	垃圾桶麦桶桶	2018-10-28 11:05:59.473886+00	0	0	\N	2018-11-16 05:47:16.826804+00	\N	\N	2
788	-24	饮食	0	水果	2018-10-28 11:06:46.692497+00	0	0	\N	2018-11-16 05:47:16.847931+00	\N	\N	2
824	-50	小孩生活用品	0	婴儿保湿润肤乳	2018-10-28 11:28:27+00	0	0	\N	2018-11-16 07:28:54.466662+00	\N	\N	2
790	-103	生活日用	0	刀架	2018-10-28 11:07:50.6745+00	0	0	\N	2018-11-16 05:47:16.877524+00	\N	\N	2
791	-87	生活日用	0	黑色调味架	2018-10-28 11:08:13.371043+00	0	0	\N	2018-11-16 05:47:16.895645+00	\N	\N	2
792	-66	生活日用	0	餐巾纸盒	2018-10-28 11:08:35.756433+00	0	0	\N	2018-11-16 05:47:16.908037+00	\N	\N	2
783	-25	服饰美容	0	鞋套	2018-10-28 11:04:35+00	0	0	\N	2018-11-16 07:55:36.196051+00	\N	\N	2
793	-249	小孩生活用品	0	相框	2018-10-28 11:08:52+00	0	0	\N	2018-11-16 07:55:26.185861+00	\N	\N	2
795	-100	生活日用	0	4个油瓶	2018-10-28 11:09:51.286799+00	0	0	\N	2018-11-16 05:47:16.946366+00	\N	\N	2
796	-26	生活日用	0	垃圾袋	2018-10-28 11:10:02.082561+00	0	0	\N	2018-11-16 05:47:16.960262+00	\N	\N	2
797	-16	饮食	0	卤人甲	2018-10-28 11:10:25.665516+00	0	0	\N	2018-11-16 05:47:16.971663+00	\N	\N	2
798	-20	生活日用	0	钻头	2018-10-28 11:10:41.860811+00	0	0	\N	2018-11-16 05:47:16.983693+00	\N	\N	2
799	-198	生活日用	0	睡袋2件	2018-10-28 11:11:02.369244+00	0	0	\N	2018-11-16 05:47:16.999947+00	\N	\N	2
789	-20	小孩零食	0	零售米饼	2018-10-28 11:07:37+00	0	0	\N	2018-11-16 07:01:03.509134+00	\N	\N	2
801	-70	饮食	0	美购	2018-10-28 11:11:34.720873+00	0	0	\N	2018-11-16 05:47:17.031166+00	\N	\N	2
802	-179	服饰美容	0	戈美其	2018-10-28 11:11:58.300446+00	0	0	\N	2018-11-16 05:47:17.049255+00	\N	\N	2
794	-66	服饰美容	0	拖鞋	2018-10-28 11:09:34+00	0	0	\N	2018-11-16 07:55:16.874247+00	\N	\N	2
800	-400	小孩健康	0	社保	2018-10-28 11:11:17+00	0	0	\N	2018-11-16 07:00:56.735939+00	\N	\N	2
805	-66	生活日用	0	米桶杂物	2018-10-28 11:18:46.506599+00	0	0	\N	2018-11-16 05:47:17.091902+00	\N	\N	2
806	-30	生活日用	0	美购	2018-10-28 11:19:00.396588+00	0	0	\N	2018-11-16 05:47:17.104822+00	\N	\N	2
807	-79	生活日用	0	马桶疏通器	2018-10-28 11:20:23.916193+00	0	0	\N	2018-11-16 05:47:17.117104+00	\N	\N	2
808	-10	生活日用	0	三江	2018-10-28 11:20:40.828358+00	0	0	\N	2018-11-16 05:47:17.133235+00	\N	\N	2
804	-26	小孩服饰	0	背带	2018-10-28 11:18:32+00	0	0	\N	2018-11-16 07:00:48.58771+00	\N	\N	2
810	-25	生活日用	0	硅藻泥垫	2018-10-28 11:21:17.74903+00	0	0	\N	2018-11-16 05:47:17.165433+00	\N	\N	2
811	-79	服饰美容	0	睡衣	2018-10-28 11:21:30.298908+00	0	0	\N	2018-11-16 05:47:17.178575+00	\N	\N	2
812	-52	生活日用	0	鞋架	2018-10-28 11:21:48.697742+00	0	0	\N	2018-11-16 05:47:17.192136+00	\N	\N	2
813	-158	服饰美容	0	睡衣	2018-10-28 11:22:00.651007+00	0	0	\N	2018-11-16 05:47:17.212705+00	\N	\N	2
816	-27	饮食	0	重庆面馆	2018-10-28 11:23:28.553105+00	0	0	\N	2018-11-16 05:47:17.265102+00	\N	\N	2
817	-260	生活日用	0	眼镜	2018-10-28 11:23:49.866154+00	0	0	\N	2018-11-16 05:47:17.277955+00	\N	\N	2
818	-42	生活日用	0	美购	2018-10-28 11:24:02.560859+00	0	0	\N	2018-11-16 05:47:17.290284+00	\N	\N	2
819	-75	生活日用	0	钟	2018-10-28 11:25:29.198973+00	0	0	\N	2018-11-16 05:47:17.307166+00	\N	\N	2
820	-9	生活日用	0	泡面碗	2018-10-28 11:25:43.183836+00	0	0	\N	2018-11-16 05:47:17.317102+00	\N	\N	2
821	-116	生活日用	0	平底锅	2018-10-28 11:25:55.455612+00	0	0	\N	2018-11-16 05:47:17.327885+00	\N	\N	2
822	-31	生活日用	0	防烫夹和不8冰箱架	2018-10-28 11:26:56.681713+00	0	0	\N	2018-11-16 05:47:17.338875+00	\N	\N	2
823	-35	生活日用	0	牙刷杯架	2018-10-28 11:27:39.087376+00	0	0	\N	2018-11-16 05:47:17.355059+00	\N	\N	2
839	-369	文教娱乐	0	uno单片机	2018-11-11 07:35:50+00	0	0	\N	2018-11-16 07:31:54.762544+00	\N	\N	1
809	-341	小孩服饰	0	鞋子	2018-10-28 11:20:54+00	0	0	\N	2018-11-16 07:00:26.935476+00	\N	\N	2
826	-36	饮食	0	KFC	2018-10-28 11:30:03.436245+00	0	0	\N	2018-11-16 05:47:17.399544+00	\N	\N	2
827	-31	饮食	0	美团外卖	2018-10-28 11:30:15.574066+00	0	0	\N	2018-11-16 05:47:17.411587+00	\N	\N	2
828	-200	饮食	0	请客	2018-10-28 11:30:30.506795+00	0	0	\N	2018-11-16 05:47:17.424772+00	\N	\N	2
803	-20	饮食	0	餐饮	2018-10-28 11:12:14+00	0	0	\N	2018-11-16 07:55:07.886572+00	\N	\N	2
830	5439	收入	0	工资	2018-10-28 11:31:25.391557+00	0	0	\N	2018-11-16 05:47:17.454995+00	\N	\N	2
831	1600	收入	0	奶奶红包新房	2018-10-28 11:32:19.27426+00	0	0	\N	2018-11-16 05:47:17.469958+00	\N	\N	2
832	2000	收入	0	妈妈红包新房	2018-10-28 11:32:43.243589+00	0	0	\N	2018-11-16 05:47:17.481017+00	\N	\N	2
833	800	收入	0	江六嬷嬷红包新房	2018-10-28 11:33:33.219261+00	0	0	\N	2018-11-16 05:47:17.495044+00	\N	\N	2
834	-10	饮食	0	饼	2018-11-11 07:33:19.605083+00	0	0	\N	2018-11-16 05:47:17.506538+00	\N	\N	1
835	-8	饮食	0	饮料	2018-11-11 07:33:41.942247+00	0	0	\N	2018-11-16 05:47:17.517607+00	\N	\N	1
836	-17	饮食	0	三江超市	2018-11-11 07:34:01.027864+00	0	0	\N	2018-11-16 05:47:17.529156+00	\N	\N	1
837	-15	饮食	0	水果	2018-11-11 07:34:18.484848+00	0	0	\N	2018-11-16 05:47:17.542636+00	\N	\N	1
838	-599	服饰美容	0	hm外套	2018-11-11 07:34:59.609878+00	0	0	\N	2018-11-16 05:47:17.5608+00	\N	\N	1
829	-1500	交通出行	0	油卡	2018-10-28 11:30:50+00	0	0	\N	2018-11-16 07:54:52.503618+00	\N	\N	2
841	-265	饮食	0	外婆家	2018-11-11 07:39:05.090315+00	0	0	\N	2018-11-16 05:47:17.597323+00	\N	\N	1
843	-2199	生活日用	0	小米石头扫地机器人	2018-11-11 07:42:40.508004+00	0	0	\N	2018-11-16 05:47:17.620614+00	\N	\N	1
825	-344	小孩尿布	0	尿不湿零食	2018-10-28 11:28:49+00	0	0	\N	2018-11-16 06:59:59.012593+00	\N	\N	2
845	-158	生活日用	0	卷纸	2018-11-11 08:17:52.323287+00	0	0	\N	2018-11-16 05:47:17.648971+00	\N	\N	1
846	28640	收入	0	提成	2018-11-11 08:19:36.944542+00	0	0	\N	2018-11-16 05:47:17.660501+00	\N	\N	2
847	-112	生活日用	0	美购超市	2018-11-11 08:20:35.204362+00	0	0	\N	2018-11-16 05:47:17.673351+00	\N	\N	2
848	-6	饮食	0	零食	2018-11-11 08:21:00.215915+00	0	0	\N	2018-11-16 05:47:17.686092+00	\N	\N	2
849	-60	服饰美容	0	高腰裙	2018-11-11 08:21:19.526106+00	0	0	\N	2018-11-16 05:47:17.697163+00	\N	\N	2
850	-40	生活日用	0	苹果数据线	2018-11-11 08:21:36.474236+00	0	0	\N	2018-11-16 05:47:17.714495+00	\N	\N	2
844	-880	小孩奶粉	0	奶粉八合	2018-11-11 07:43:41+00	0	0	\N	2018-11-16 06:59:44.540543+00	\N	\N	1
851	-106	生活日用	0	家13.6爸91.98	2018-11-11 08:22:35.865774+00	0	0	\N	2018-11-16 05:47:17.726079+00	\N	\N	2
853	-26	生活日用	0	沥水篮	2018-11-11 08:23:31.12472+00	0	0	\N	2018-11-16 05:47:17.751256+00	\N	\N	2
855	-10	饮食	0	甘蔗	2018-11-11 08:24:01.537867+00	0	0	\N	2018-11-16 05:47:17.773138+00	\N	\N	2
856	-112	生活日用	0	爸家	2018-11-11 08:24:28.558185+00	0	0	\N	2018-11-16 05:47:17.786293+00	\N	\N	2
857	-215	服饰美容	0	毛衣	2018-11-11 08:24:54.954612+00	0	0	\N	2018-11-16 05:47:17.797454+00	\N	\N	2
859	-750	服饰美容	0	牛仔裤lee	2018-11-11 08:25:32.191249+00	0	0	\N	2018-11-16 05:47:17.840518+00	\N	\N	2
860	-930	服饰美容	0	大衣	2018-11-11 08:25:45.047199+00	0	0	\N	2018-11-16 05:47:17.862039+00	\N	\N	2
861	-99	服饰美容	0	鞋子	2018-11-11 08:25:59.693306+00	0	0	\N	2018-11-16 05:47:17.877369+00	\N	\N	2
862	-30	饮食	0	零食	2018-11-11 08:26:25.849624+00	0	0	\N	2018-11-16 05:47:17.895201+00	\N	\N	2
913	-90	饮食	0	超市	2018-11-23 09:25:01.873028+00	0	0	\N	2018-11-23 09:25:01.87466+00	\N	\N	1
917	13640	收入	0	工资	2018-11-23 09:32:42.532132+00	0	0	\N	2018-11-23 09:32:42.533578+00	\N	\N	1
929	-63	小孩其他	0	床护栏	2018-11-28 13:57:56.179419+00	0	0	\N	2018-11-28 13:57:56.180885+00	\N	\N	2
933	-42	小孩玩具	0	玩具发条	2018-11-28 14:01:26.959542+00	0	0	\N	2018-11-28 14:01:26.961413+00	\N	\N	2
937	-6	生活日用	0	晾衣绳	2018-11-28 14:02:39.205845+00	0	0	\N	2018-11-28 14:02:39.207374+00	\N	\N	2
941	-125	服饰美容	0	外套	2018-11-28 14:03:59.425474+00	0	0	\N	2018-11-28 14:03:59.427174+00	\N	\N	2
873	-152	生活日用	0	抽餐巾纸	2018-11-11 08:32:41.527072+00	0	0	\N	2018-11-16 05:47:18.042866+00	\N	\N	2
872	-187	小孩玩具	0	滑梯	2018-11-11 08:31:52+00	0	0	\N	2018-11-16 06:45:20.757792+00	\N	\N	2
945	-75	小孩服饰	0	内衣套装	2018-11-28 14:05:20.013375+00	0	0	\N	2018-11-28 14:05:20.014768+00	\N	\N	2
869	-227	小孩尿布	0	尿不湿	2018-11-11 08:30:50+00	0	0	\N	2018-11-16 06:45:41.703001+00	\N	\N	2
949	-50	生活日用	0	美购超市	2018-11-28 14:07:20.539738+00	0	0	\N	2018-11-28 14:07:20.541268+00	\N	\N	2
866	-87	小孩零食	0	嘟嘟零食	2018-11-11 08:29:50+00	0	0	\N	2018-11-16 06:59:13.690266+00	\N	\N	2
953	-718	生活日用	0	显示屏	2018-11-28 14:11:31.956987+00	0	0	\N	2018-11-28 14:11:31.958419+00	\N	\N	2
858	-231	小孩服饰	0	嘟嘟鞋	2018-11-11 08:25:13+00	0	0	\N	2018-11-16 06:59:36.145158+00	\N	\N	2
863	-99	小孩生活用品	0	湿巾	2018-11-11 08:26:50+00	0	0	\N	2018-11-16 07:28:48.574913+00	\N	\N	2
871	-150	小孩生活用品	0	奶嘴奶瓶	2018-11-11 08:31:40+00	0	0	\N	2018-11-16 07:32:01.927275+00	\N	\N	2
864	-113	小孩生活用品	0	奶瓶加奶嘴	2018-11-11 08:28:03+00	0	0	\N	2018-11-16 07:32:09.441052+00	\N	\N	2
854	-100	饮食	0	老婆大人	2018-11-11 08:23:47+00	0	0	\N	2018-11-16 07:54:23.986199+00	\N	\N	2
1044	-199	文教娱乐	0	英语听力教程	2018-12-26 10:28:58.819497+00	0	0	\N	2018-12-26 10:28:58.820842+00	\N	\N	1
852	-38	小孩玩具	0	熊公仔	2018-11-11 08:22:56+00	0	0	\N	2018-11-16 07:54:42.197559+00	\N	\N	2
870	-209	生活日用	0	10袋大米10斤装	2018-11-11 08:31:24+00	0	0	\N	2018-11-16 08:29:21.758852+00	\N	\N	2
867	-77	生活日用	0	两袋20斤米	2018-11-11 08:30:16+00	0	0	\N	2018-11-16 08:29:27.452075+00	\N	\N	2
865	-109	生活日用	0	四袋10斤大米	2018-11-11 08:29:36+00	0	0	\N	2018-11-16 08:29:33.615173+00	\N	\N	2
957	-11	生活日用	0	鞋架	2018-11-28 14:12:52.977922+00	0	0	\N	2018-11-28 14:12:52.979471+00	\N	\N	2
961	-65	生活日用	0	美团外卖	2018-11-28 14:15:23.845048+00	0	0	\N	2018-11-28 14:15:23.848012+00	\N	\N	2
964	-25	饮食	0	牛肉炒面	2018-12-07 13:50:19.233802+00	0	0	\N	2018-12-07 13:50:19.236097+00	\N	\N	1
968	-25	生活日用	0	超市	2018-12-07 13:51:48.354516+00	0	0	\N	2018-12-07 13:51:48.356782+00	\N	\N	1
972	-10	生活日用	0	转头	2018-12-07 13:55:18.803146+00	0	0	\N	2018-12-07 13:55:18.805596+00	\N	\N	1
980	-241	饮食	0	韩宫宴炭火烧烤	2018-12-07 15:14:25.872478+00	0	0	\N	2018-12-07 15:14:25.873827+00	\N	\N	2
984	-37	住房缴费	0	电费自己	2018-12-07 15:16:51.413196+00	0	0	\N	2018-12-07 15:16:51.415543+00	\N	\N	2
988	-20	小孩服饰	0	袜子	2018-12-07 15:18:04.003558+00	0	0	\N	2018-12-07 15:18:04.005829+00	\N	\N	2
992	-100	住房缴费	0	预存100	2018-12-07 15:19:36.516225+00	0	0	\N	2018-12-07 15:19:36.51753+00	\N	\N	2
996	-59	生活日用	0	美购	2018-12-07 15:20:41.338364+00	0	0	\N	2018-12-07 15:20:41.34061+00	\N	\N	2
999	-24	饮食	0	中午午饭	2018-12-07 15:22:27.964039+00	0	0	\N	2018-12-07 15:22:27.966518+00	\N	\N	2
1002	-12	饮食	0	超市	2018-12-17 01:24:41.815345+00	0	0	\N	2018-12-17 01:24:41.816801+00	\N	\N	1
1005	-12	交通出行	0	地铁	2018-12-17 01:25:37.138668+00	0	0	\N	2018-12-17 01:25:37.140031+00	\N	\N	1
1017	-160	服饰美容	0	过膝靴	2018-12-22 02:44:10.152591+00	0	0	\N	2018-12-22 02:44:10.155056+00	\N	\N	2
1020	-20	小孩文具	0	睡前故事	2018-12-22 02:45:14.234713+00	0	0	\N	2018-12-22 02:45:14.237325+00	\N	\N	2
1023	-159	服饰美容	0	鞋子	2018-12-22 02:46:15.926979+00	0	0	\N	2018-12-22 02:46:15.929396+00	\N	\N	2
1026	-13	小孩生活用品	0	手套	2018-12-22 02:47:12.454556+00	0	0	\N	2018-12-22 02:47:12.457339+00	\N	\N	2
1029	-229	服饰美容	0	外套	2018-12-22 02:48:04.057954+00	0	0	\N	2018-12-22 02:48:04.060502+00	\N	\N	2
1032	-9	生活日用	0	苹果膜	2018-12-22 02:49:01.700091+00	0	0	\N	2018-12-22 02:49:01.702797+00	\N	\N	2
1035	-186	小孩尿布	0	一包尿不湿一包拉拉裤	2018-12-22 02:50:23.756186+00	0	0	\N	2018-12-22 02:50:23.758664+00	\N	\N	2
1038	-68	饮食	0	橙子	2018-12-22 02:51:47.769616+00	0	0	\N	2018-12-22 02:51:47.772942+00	\N	\N	2
1041	-24	生活日用	0	三江购物	2018-12-23 11:23:01.88036+00	0	0	\N	2018-12-23 11:23:01.882963+00	\N	\N	2
1047	-40	生活日用	0	静音耳塞	2018-12-26 10:33:51.752662+00	0	0	\N	2018-12-26 10:33:51.755388+00	\N	\N	1
1050	-876	小孩奶粉	0	奶粉8盒	2018-12-26 10:46:52.831955+00	0	0	\N	2018-12-26 10:46:52.834895+00	\N	\N	1
1053	-400	小孩健康	0	医保	2018-12-26 10:50:56.958099+00	0	0	\N	2018-12-26 10:50:56.961291+00	\N	\N	2
1056	-200	交通出行	0	油费	2018-12-26 10:55:09.240784+00	0	0	\N	2018-12-26 10:55:09.243487+00	\N	\N	2
1060	-200	交通出行	0	建设银行etc	2018-12-29 15:32:12.327877+00	0	0	\N	2018-12-29 15:32:12.329369+00	\N	\N	2
1063	-134	饮食	0	晚饭	2018-12-29 15:34:06.489854+00	0	0	\N	2018-12-29 15:34:06.492199+00	\N	\N	2
1068	-350	生活日用	0	锅套餐	2019-01-04 11:46:35.002655+00	0	0	\N	2019-01-04 11:46:35.006149+00	\N	\N	2
1070	-60	服饰美容	0	给妈妈的裤子	2019-01-04 11:48:11.697988+00	0	0	\N	2019-01-04 11:48:11.699366+00	\N	\N	2
1072	-53	住房缴费	0	电费自己	2019-01-04 11:48:55.273933+00	0	0	\N	2019-01-04 11:48:55.276322+00	\N	\N	2
1074	-548	服饰美容	0	羽绒服和裤子	2019-01-04 11:49:49.281463+00	0	0	\N	2019-01-04 11:49:49.282802+00	\N	\N	2
1076	-22	饮食	0	寿司	2019-01-04 11:50:37.572854+00	0	0	\N	2019-01-04 11:50:37.575148+00	\N	\N	2
1078	-150	生活日用	0	手机屏幕更换	2019-01-04 11:51:28.356891+00	0	0	\N	2019-01-04 11:51:28.359319+00	\N	\N	2
1080	-438	饮食	0	午餐	2019-01-06 07:37:03.217492+00	0	0	\N	2019-01-06 07:37:03.221334+00	\N	\N	1
1082	-336	小孩服饰	0	羽绒服	2019-01-06 08:03:29.066705+00	0	0	\N	2019-01-06 08:03:29.068069+00	\N	\N	2
1084	-22	交通出行	0	打的	2019-01-06 08:03:57.277269+00	0	0	\N	2019-01-06 08:03:57.279737+00	\N	\N	2
1086	-169	生活日用	0	烘干机	2019-01-06 08:05:21.340785+00	0	0	\N	2019-01-06 08:05:21.343428+00	\N	\N	2
874	-2108	生活日用	0	榨汁机	2018-11-11 08:32:57.38183+00	0	0	\N	2018-11-16 05:47:18.066234+00	\N	\N	2
1061	-25	饮食	0	绿姿	2018-12-29 15:32:38.048764+00	0	0	\N	2018-12-29 15:32:38.051149+00	\N	\N	2
1064	-2000	其他消费	0	酒钱	2018-12-31 14:42:05.727787+00	0	0	\N	2018-12-31 14:42:05.730955+00	\N	\N	2
1067	-28	饮食	0	KFC	2019-01-03 03:20:58.735202+00	0	0	\N	2019-01-03 03:20:58.737797+00	\N	\N	1
878	-25	饮食	0	外卖	2018-11-11 08:34:38.933363+00	0	0	\N	2018-11-16 05:47:18.116592+00	\N	\N	2
1069	-17	小孩服饰	0	手套	2019-01-04 11:47:49.946221+00	0	0	\N	2019-01-04 11:47:49.949332+00	\N	\N	2
877	-50	文教娱乐	0	东钱湖玩	2018-11-11 08:34:25+00	0	0	\N	2018-11-16 05:49:53.031434+00	\N	\N	2
875	-2018	人情往来	0	红包小强婚礼	2018-11-11 08:33:23+00	0	0	\N	2018-11-16 05:50:06.535767+00	\N	\N	2
876	-500	住房缴费	0	物业费	2018-11-11 08:33:35+00	0	0	\N	2018-11-16 05:50:25.673246+00	\N	\N	2
1071	-154	住房缴费	0	电费父母	2019-01-04 11:48:39.080065+00	0	0	\N	2019-01-04 11:48:39.08135+00	\N	\N	2
914	-30	饮食	0	水果	2018-11-23 09:25:19.752135+00	0	0	\N	2018-11-23 09:25:19.753559+00	\N	\N	1
1073	-70	饮食	0	菠萝蜜	2019-01-04 11:49:07.949244+00	0	0	\N	2019-01-04 11:49:07.951833+00	\N	\N	2
930	-220	服饰美容	0	衣服墨景	2018-11-28 13:59:20.080156+00	0	0	\N	2018-11-28 13:59:20.081573+00	\N	\N	2
934	-27	饮食	0	板栗	2018-11-28 14:01:44.857374+00	0	0	\N	2018-11-28 14:01:44.860552+00	\N	\N	2
938	-26	生活日用	0	美购超市	2018-11-28 14:03:11.656869+00	0	0	\N	2018-11-28 14:03:11.658367+00	\N	\N	2
942	-233	饮食	0	粥聚餐	2018-11-28 14:04:30.884068+00	0	0	\N	2018-11-28 14:04:30.885707+00	\N	\N	2
946	-10	饮食	0	臭豆腐	2018-11-28 14:06:23.236022+00	0	0	\N	2018-11-28 14:06:23.23758+00	\N	\N	2
950	-15	饮食	0	甘蔗	2018-11-28 14:07:52.291988+00	0	0	\N	2018-11-28 14:07:52.293889+00	\N	\N	2
954	-143	小孩生活用品	0	肥皂果汁瓶等	2018-11-28 14:12:03.593388+00	0	0	\N	2018-11-28 14:12:03.594832+00	\N	\N	2
958	-782	交通出行	0	轮胎	2018-11-28 14:13:11.935212+00	0	0	\N	2018-11-28 14:13:11.936715+00	\N	\N	2
962	-245	生活日用	0	床垫	2018-11-28 14:15:38.809934+00	0	0	\N	2018-11-28 14:15:38.811369+00	\N	\N	2
965	-11	饮食	0	三江	2018-12-07 13:50:33.755799+00	0	0	\N	2018-12-07 13:50:33.758236+00	\N	\N	1
969	-10	其他消费	0	按摩	2018-12-07 13:52:16.892951+00	0	0	\N	2018-12-07 13:52:16.894296+00	\N	\N	1
973	-150	交通出行	0	四轮平衡	2018-12-07 13:55:56.665185+00	0	0	\N	2018-12-07 13:55:56.667687+00	\N	\N	1
977	-38	饮食	0	KFC	2018-12-07 13:59:56.524895+00	0	0	\N	2018-12-07 13:59:56.527396+00	\N	\N	1
981	-59	小孩生活用品	0	床套	2018-12-07 15:14:54.580121+00	0	0	\N	2018-12-07 15:14:54.582486+00	\N	\N	2
985	-45	小孩服饰	0	裤子	2018-12-07 15:17:06.188823+00	0	0	\N	2018-12-07 15:17:06.191066+00	\N	\N	2
989	-34	小孩服饰	0	口水巾	2018-12-07 15:18:16.258788+00	0	0	\N	2018-12-07 15:18:16.261053+00	\N	\N	2
993	-12	生活日用	0	永生花	2018-12-07 15:19:55.826011+00	0	0	\N	2018-12-07 15:19:55.828256+00	\N	\N	2
997	-99	小孩生活用品	0	睡袋	2018-12-07 15:20:53.194804+00	0	0	\N	2018-12-07 15:20:53.197049+00	\N	\N	2
1000	-200	交通出行	0	加油	2018-12-07 15:23:32.108984+00	0	0	\N	2018-12-07 15:23:32.110277+00	\N	\N	1
1003	-185	生活日用	0	华润万家	2018-12-17 01:25:07.271332+00	0	0	\N	2018-12-17 01:25:07.274008+00	\N	\N	1
1006	-259	饮食	0	零食	2018-12-17 01:26:39.129141+00	0	0	\N	2018-12-17 01:26:39.131566+00	\N	\N	1
1009	13640	收入	0	工资	2018-12-17 02:32:15.539481+00	0	0	\N	2018-12-17 02:32:15.541089+00	\N	\N	1
1018	-40	小孩生活用品	0	烘鞋器	2018-12-22 02:44:40.757822+00	0	0	\N	2018-12-22 02:44:40.760301+00	\N	\N	2
1021	-55	服饰美容	0	裤子	2018-12-22 02:45:32.37373+00	0	0	\N	2018-12-22 02:45:32.37524+00	\N	\N	2
1024	-24	小孩生活用品	0	奶粉盒	2018-12-22 02:46:39.12343+00	0	0	\N	2018-12-22 02:46:39.125987+00	\N	\N	2
1027	-7	生活日用	0	地漏过滤网	2018-12-22 02:47:33.737842+00	0	0	\N	2018-12-22 02:47:33.740316+00	\N	\N	2
1030	-30	服饰美容	0	内裤	2018-12-22 02:48:22.954751+00	0	0	\N	2018-12-22 02:48:22.9572+00	\N	\N	2
1033	-79	小孩玩具	0	摇摇马	2018-12-22 02:49:23.232326+00	0	0	\N	2018-12-22 02:49:23.233875+00	\N	\N	2
1036	-165	文教娱乐	0	腾讯视频VIP	2018-12-22 02:50:46.25077+00	0	0	\N	2018-12-22 02:50:46.253509+00	\N	\N	2
1039	-540	小孩健康	0	3瓶VD	2018-12-23 11:22:23.418597+00	0	0	\N	2018-12-23 11:22:23.420443+00	\N	\N	2
1042	-15	饮食	0	绿姿	2018-12-23 11:24:00.129677+00	0	0	\N	2018-12-23 11:24:00.131032+00	\N	\N	2
1045	-55	其他消费	0	圣诞礼物	2018-12-26 10:29:20.309162+00	0	0	\N	2018-12-26 10:29:20.311607+00	\N	\N	1
1048	-100	通讯物流	0	话费	2018-12-26 10:34:13.475672+00	0	0	\N	2018-12-26 10:34:13.478155+00	\N	\N	1
1051	-79	其他消费	0	亚马逊会员	2018-12-26 10:48:35.869463+00	0	0	\N	2018-12-26 10:48:35.871926+00	\N	\N	1
1054	-28	饮食	0	绿资	2018-12-26 10:51:19.210056+00	0	0	\N	2018-12-26 10:51:19.211505+00	\N	\N	2
1057	-90	生活日用	0	洗衣液	2018-12-26 10:55:20.632592+00	0	0	\N	2018-12-26 10:55:20.635139+00	\N	\N	2
1075	-109	小孩服饰	0	帽子和卫衣	2019-01-04 11:50:17.193679+00	0	0	\N	2019-01-04 11:50:17.195235+00	\N	\N	2
1077	-17	住房缴费	0	水费自己	2019-01-04 11:50:53.902175+00	0	0	\N	2019-01-04 11:50:53.904479+00	\N	\N	2
1079	-19	饮食	0	一鸣早餐	2019-01-06 07:36:45.952306+00	0	0	\N	2019-01-06 07:36:45.955023+00	\N	\N	1
1081	-10	其他消费	0	宁波银行卡注销	2019-01-06 07:38:18.473631+00	0	0	\N	2019-01-06 07:38:18.474956+00	\N	\N	1
1083	-50	饮食	0	蛋糕	2019-01-06 08:03:44.051609+00	0	0	\N	2019-01-06 08:03:44.052974+00	\N	\N	2
1085	-90	生活日用	0	电影大黄蜂	2019-01-06 08:04:20.013972+00	0	0	\N	2019-01-06 08:04:20.023102+00	\N	\N	2
1087	-23	通讯物流	0	出租车	2019-01-12 03:58:20.315624+00	0	0	\N	2019-01-12 03:58:20.31893+00	\N	\N	2
1089	-68	小孩健康	0	通鼻精油	2019-01-12 03:58:52.630972+00	0	0	\N	2019-01-12 03:58:52.632212+00	\N	\N	2
1090	-102	住房缴费	0	水费	2019-01-12 03:59:04.536554+00	0	0	\N	2019-01-12 03:59:04.537959+00	\N	\N	2
1091	-28	小孩服饰	0	防水罩衣	2019-01-12 03:59:26.939697+00	0	0	\N	2019-01-12 03:59:26.940958+00	\N	\N	2
1092	-91	饮食	0	美购	2019-01-12 03:59:40.611702+00	0	0	\N	2019-01-12 03:59:40.612967+00	\N	\N	2
1093	-1045	服饰美容	0	衣服	2019-01-12 04:00:26.915755+00	0	0	\N	2019-01-12 04:00:26.91804+00	\N	\N	2
1094	-63	饮食	0	披萨	2019-01-12 04:00:55.561395+00	0	0	\N	2019-01-12 04:00:55.562679+00	\N	\N	2
1095	-52	饮食	0	爆米花可乐	2019-01-12 04:01:09.21409+00	0	0	\N	2019-01-12 04:01:09.21537+00	\N	\N	2
1096	-1500	交通出行	0	加油卡	2019-01-12 04:01:34.582958+00	0	0	\N	2019-01-12 04:01:34.584283+00	\N	\N	2
1097	14142	收入	0	工资	2019-01-15 08:10:50.458465+00	0	0	\N	2019-01-15 08:10:50.460305+00	\N	\N	1
1098	-27	饮食	0	一鸣早餐	2019-01-15 08:13:19.143599+00	0	0	\N	2019-01-15 08:13:19.144878+00	\N	\N	1
1099	-18	生活日用	0	剃须刀充电器	2019-01-15 08:13:49.719782+00	0	0	\N	2019-01-15 08:13:49.72106+00	\N	\N	1
1100	-126	服饰美容	0	衣服	2019-01-15 11:42:28.246633+00	0	0	\N	2019-01-15 11:42:28.249513+00	\N	\N	2
1101	-826	服饰美容	0	maxwin	2019-01-15 11:42:54.333715+00	0	0	\N	2019-01-15 11:42:54.334968+00	\N	\N	2
1102	-30	饮食	0	砂糖桔	2019-01-15 11:43:30.318816+00	0	0	\N	2019-01-15 11:43:30.320176+00	\N	\N	2
1103	-385	服饰美容	0	德玛纳羽绒服	2019-01-15 11:44:19.387947+00	0	0	\N	2019-01-15 11:44:19.389366+00	\N	\N	2
1104	-100	饮食	0	零食	2019-01-15 11:45:51.897067+00	0	0	\N	2019-01-15 11:45:51.898332+00	\N	\N	2
1105	-45	饮食	0	零食	2019-01-16 11:50:24.533724+00	0	0	\N	2019-01-16 11:50:24.535229+00	\N	\N	1
1106	-100	通讯物流	0	话费	2019-01-16 11:50:36.422279+00	0	0	\N	2019-01-16 11:50:36.423541+00	\N	\N	1
1107	-12	饮食	0	粥	2019-01-18 06:36:49.387595+00	0	0	\N	2019-01-18 06:36:49.390702+00	\N	\N	1
1108	-10	饮食	0	一鸣早餐	2019-01-18 06:38:03.819781+00	0	0	\N	2019-01-18 06:38:03.822253+00	\N	\N	1
1109	-10	饮食	0	桂圆	2019-01-19 00:54:15.068207+00	0	0	\N	2019-01-19 00:54:15.069878+00	\N	\N	1
1110	-25	饮食	0	美团	2019-01-19 10:25:47.091092+00	0	0	\N	2019-01-19 10:25:47.093589+00	\N	\N	2
1111	-30	饮食	0	美团	2019-01-19 10:25:57.100542+00	0	0	\N	2019-01-19 10:25:57.102942+00	\N	\N	2
1112	-18	饮食	0	一鸣早餐	2019-01-22 01:10:20.931107+00	0	0	\N	2019-01-22 01:10:20.932732+00	\N	\N	1
1113	-199	饮食	0	香辣居	2019-01-22 01:10:45.545977+00	0	0	\N	2019-01-22 01:10:45.547281+00	\N	\N	1
1114	-54	饮食	0	零食	2019-01-22 01:10:53.90553+00	0	0	\N	2019-01-22 01:10:53.907917+00	\N	\N	1
1115	-16	饮食	0	一鸣早餐	2019-01-22 01:11:13.954558+00	0	0	\N	2019-01-22 01:11:13.955854+00	\N	\N	1
1116	-81	服饰美容	0	羽绒服妈妈	2019-01-27 00:34:35.330914+00	0	0	\N	2019-01-27 00:34:35.332392+00	\N	\N	2
1117	-38	生活日用	0	数据线	2019-01-27 00:34:49.285049+00	0	0	\N	2019-01-27 00:34:49.286374+00	\N	\N	2
1118	-43	小孩其他	0	理发	2019-01-27 00:35:57.580795+00	0	0	\N	2019-01-27 00:35:57.582054+00	\N	\N	2
1119	-30	小孩生活用品	0	雨伞	2019-01-27 00:36:13.646985+00	0	0	\N	2019-01-27 00:36:13.648483+00	\N	\N	2
1120	-54	生活日用	0	美购	2019-01-27 00:36:27.270523+00	0	0	\N	2019-01-27 00:36:27.271804+00	\N	\N	2
1121	-22	饮食	0	吐司	2019-01-27 00:36:45.060309+00	0	0	\N	2019-01-27 00:36:45.061545+00	\N	\N	2
1122	-77	服饰美容	0	马威	2019-01-27 00:37:01.884462+00	0	0	\N	2019-01-27 00:37:01.885876+00	\N	\N	2
1123	-108	小孩尿布	0	尿布	2019-01-27 00:37:58.694199+00	0	0	\N	2019-01-27 00:37:58.695516+00	\N	\N	2
1124	-24	小孩生活用品	0	牙刷	2019-01-27 00:38:16.725154+00	0	0	\N	2019-01-27 00:38:16.726464+00	\N	\N	2
1125	1500	收入	0	工龄奖	2019-01-27 00:38:49.576143+00	0	0	\N	2019-01-27 00:38:49.577403+00	\N	\N	2
1126	6108	收入	0	工资	2019-01-27 00:39:20.05784+00	0	0	\N	2019-01-27 00:39:20.059185+00	\N	\N	2
1127	-106	饮食	0	丁丁麻辣烫	2019-01-31 02:37:46.264705+00	0	0	\N	2019-01-31 02:37:46.266171+00	\N	\N	1
1128	-38	交通出行	0	滴滴	2019-01-31 02:38:05.755573+00	0	0	\N	2019-01-31 02:38:05.756843+00	\N	\N	1
1129	-11	饮食	0	O2	2019-01-31 02:38:22.244353+00	0	0	\N	2019-01-31 02:38:22.245615+00	\N	\N	1
1130	-27	饮食	0	老婆大人	2019-01-31 02:38:34.680994+00	0	0	\N	2019-01-31 02:38:34.68546+00	\N	\N	1
1131	-10	饮食	0	一鸣早餐	2019-01-31 02:38:54.173359+00	0	0	\N	2019-01-31 02:38:54.17486+00	\N	\N	1
1132	-22	文教娱乐	0	电影票	2019-01-31 02:42:10.571435+00	0	0	\N	2019-01-31 02:42:10.574015+00	\N	\N	1
1133	34547	收入	0	奖金	2019-01-31 02:43:29.778598+00	0	0	\N	2019-01-31 02:43:29.77994+00	\N	\N	1
1134	-56	饮食	0	午餐	2019-01-31 04:14:42.009591+00	0	0	\N	2019-01-31 04:14:42.010858+00	\N	\N	2
1135	-119	小孩生活用品	0	围栏	2019-01-31 04:15:23.307095+00	0	0	\N	2019-01-31 04:15:23.308358+00	\N	\N	2
1136	-153	饮食	0	湘味人家	2019-01-31 04:15:51.920722+00	0	0	\N	2019-01-31 04:15:51.922042+00	\N	\N	2
1137	-18	生活日用	0	天然气	2019-01-31 04:16:28.509117+00	0	0	\N	2019-01-31 04:16:28.510394+00	\N	\N	2
1138	-8	交通出行	0	停车费	2019-01-31 04:16:41.649199+00	0	0	\N	2019-01-31 04:16:41.650561+00	\N	\N	2
1139	-13	饮食	0	coco	2019-01-31 04:16:51.974644+00	0	0	\N	2019-01-31 04:16:51.9759+00	\N	\N	2
1140	-40	饮食	0	三江	2019-01-31 04:17:02.466508+00	0	0	\N	2019-01-31 04:17:02.467784+00	\N	\N	2
1141	-22	文教娱乐	0	电影票	2019-01-31 04:17:40.611358+00	0	0	\N	2019-01-31 04:17:40.612718+00	\N	\N	2
1142	-130	服饰美容	0	皮带钱包	2019-01-31 04:18:31.371465+00	0	0	\N	2019-01-31 04:18:31.373677+00	\N	\N	2
1143	-80	住房缴费	0	工本费	2019-01-31 04:18:59.534994+00	0	0	\N	2019-01-31 04:18:59.536536+00	\N	\N	2
1144	-998	服饰美容	0	三双nike鞋	2019-01-31 04:19:58.767117+00	0	0	\N	2019-01-31 04:19:58.76838+00	\N	\N	2
1145	-361	小孩服饰	0	衣服裤子	2019-01-31 14:24:55.249003+00	0	0	\N	2019-01-31 14:24:55.250651+00	\N	\N	2
1146	-10	饮食	0	coco	2019-02-12 01:08:45.467417+00	0	0	\N	2019-02-12 01:08:45.469138+00	\N	\N	1
1147	-144	文教娱乐	0	泡澡按摩	2019-02-12 01:09:23.03433+00	0	0	\N	2019-02-12 01:09:23.035689+00	\N	\N	1
1148	-117	饮食	0	烧烤	2019-02-12 01:09:41.069795+00	0	0	\N	2019-02-12 01:09:41.071294+00	\N	\N	1
1149	-18	饮食	0	KFC	2019-02-12 01:09:56.463947+00	0	0	\N	2019-02-12 01:09:56.465324+00	\N	\N	1
1150	-15	饮食	0	O2	2019-02-12 01:10:13.901305+00	0	0	\N	2019-02-12 01:10:13.902734+00	\N	\N	1
1151	-45	生活日用	0	烟花	2019-02-12 01:11:36.71908+00	0	0	\N	2019-02-12 01:11:36.720445+00	\N	\N	1
1152	-209	生活日用	0	花呗	2019-02-12 01:12:08.485877+00	0	0	\N	2019-02-12 01:12:08.487325+00	\N	\N	1
1153	-77	小孩玩具	0	玩具	2019-02-12 01:12:44.33567+00	0	0	\N	2019-02-12 01:12:44.337168+00	\N	\N	1
1154	-37	饮食	0	汉堡王	2019-02-12 01:13:02.705194+00	0	0	\N	2019-02-12 01:13:02.706557+00	\N	\N	1
1155	-7	生活日用	0	超市	2019-02-12 01:16:40.358773+00	0	0	\N	2019-02-12 01:16:40.360285+00	\N	\N	2
1156	-290	人情往来	0	水果	2019-02-12 01:17:34.758617+00	0	0	\N	2019-02-12 01:17:34.759969+00	\N	\N	2
1157	-290	人情往来	0	水果	2019-02-12 01:17:35.050985+00	0	0	\N	2019-02-12 01:17:35.052722+00	\N	\N	2
1158	-52	饮食	0	美购	2019-02-12 01:18:01.715779+00	0	0	\N	2019-02-12 01:18:01.717179+00	\N	\N	2
1159	-163	人情往来	0	酱油	2019-02-12 01:18:30.624258+00	0	0	\N	2019-02-12 01:18:30.629221+00	\N	\N	2
1160	-175	生活日用	0	乐购	2019-02-12 01:18:56.554084+00	0	0	\N	2019-02-12 01:18:56.555535+00	\N	\N	2
1161	-265	小孩尿布	0	尿不湿3包	2019-02-12 01:21:16.082704+00	0	0	\N	2019-02-12 01:21:16.08429+00	\N	\N	2
1162	-318	文教娱乐	0	电影票	2019-02-12 01:21:55.42718+00	0	0	\N	2019-02-12 01:21:55.428554+00	\N	\N	2
1163	-1000	人情往来	0	外婆	2019-02-12 01:22:08.963676+00	0	0	\N	2019-02-12 01:22:08.965103+00	\N	\N	2
1164	-600	人情往来	0	宁波嬷嬷	2019-02-12 01:22:22.990414+00	0	0	\N	2019-02-12 01:22:22.991789+00	\N	\N	2
1165	14142	收入	0	工资	2019-02-15 07:30:49.213216+00	0	0	\N	2019-02-15 07:30:49.214966+00	\N	\N	1
1166	-20	饮食	0	栗子	2019-02-15 07:31:24.448261+00	0	0	\N	2019-02-15 07:31:24.449757+00	\N	\N	1
1167	-38	生活日用	0	海绵洗碗	2019-02-22 12:19:38.40857+00	0	0	\N	2019-02-22 12:19:38.410203+00	\N	\N	2
1168	-22	生活日用	0	胶水	2019-02-22 12:19:52.289172+00	0	0	\N	2019-02-22 12:19:52.290565+00	\N	\N	2
1170	-65	饮食	0	绿姿	2019-02-22 12:20:42.538782+00	0	0	\N	2019-02-22 12:20:42.540269+00	\N	\N	2
1171	-54	饮食	0	美购	2019-02-22 12:20:54.613904+00	0	0	\N	2019-02-22 12:20:54.615383+00	\N	\N	2
1172	-17	饮食	0	三江	2019-02-22 12:21:11.149555+00	0	0	\N	2019-02-22 12:21:11.150912+00	\N	\N	2
1173	-26	饮食	0	美购	2019-02-22 12:21:31.957294+00	0	0	\N	2019-02-22 12:21:31.958673+00	\N	\N	2
1174	-156	小孩玩具	0	厨房玩具	2019-02-22 12:22:41.110327+00	0	0	\N	2019-02-22 12:22:41.111696+00	\N	\N	2
1175	-500	人情往来	0	建辉儿子	2019-02-22 12:23:24.907658+00	0	0	\N	2019-02-22 12:23:24.90916+00	\N	\N	2
1176	-500	人情往来	0	聪聪	2019-02-22 12:23:49.939558+00	0	0	\N	2019-02-22 12:23:49.940925+00	\N	\N	2
1177	-100	通讯物流	0	话费	2019-02-28 09:14:25.752092+00	0	0	\N	2019-02-28 09:14:25.753906+00	\N	\N	1
1178	-32	饮食	0	茶香香	2019-02-28 09:14:54.694478+00	0	0	\N	2019-02-28 09:14:54.695863+00	\N	\N	1
1179	-12	饮食	0	饮料	2019-02-28 09:15:25.774956+00	0	0	\N	2019-02-28 09:15:25.776318+00	\N	\N	1
1180	-35	生活日用	0	抹布	2019-02-28 14:19:15.150639+00	0	0	\N	2019-02-28 14:19:15.152106+00	\N	\N	2
1181	-53	生活日用	0	钟	2019-02-28 14:19:29.221043+00	0	0	\N	2019-02-28 14:19:29.222446+00	\N	\N	2
1182	-9	饮食	0	水果	2019-02-28 14:19:47.927135+00	0	0	\N	2019-02-28 14:19:47.928532+00	\N	\N	2
1183	-20	服饰美容	0	袜子	2019-02-28 14:19:59.239864+00	0	0	\N	2019-02-28 14:19:59.241349+00	\N	\N	2
1184	-320	文教娱乐	0	黄贤森林公园	2019-02-28 14:20:46.347493+00	0	0	\N	2019-02-28 14:20:46.348889+00	\N	\N	2
1185	-2300	人情往来	0	新家请客	2019-02-28 14:26:12.830813+00	0	0	\N	2019-02-28 14:26:12.83228+00	\N	\N	2
1186	-10	住房缴费	0	水费新家	2019-03-08 12:45:42.423534+00	0	0	\N	2019-03-08 12:45:42.427434+00	\N	\N	2
1187	-854	饮食	0	海底捞	2019-03-08 12:45:52.925379+00	0	0	\N	2019-03-08 12:45:52.926858+00	\N	\N	2
1188	-67	住房缴费	0	新家电费	2019-03-08 12:46:08.640219+00	0	0	\N	2019-03-08 12:46:08.643182+00	\N	\N	2
1189	-206	住房缴费	0	电费爸	2019-03-08 12:46:35.461905+00	0	0	\N	2019-03-08 12:46:35.464556+00	\N	\N	2
1190	-150	饮食	0	老宁波	2019-03-08 12:47:27.538031+00	0	0	\N	2019-03-08 12:47:27.540507+00	\N	\N	2
1191	-35	小孩生活用品	0	门栏	2019-03-08 12:47:42.457831+00	0	0	\N	2019-03-08 12:47:42.460298+00	\N	\N	2
1192	-5	生活日用	0	雨刮器	2019-03-08 12:47:54.968574+00	0	0	\N	2019-03-08 12:47:54.971305+00	\N	\N	2
1193	-89	生活日用	0	保暖壶	2019-03-08 12:48:16.588021+00	0	0	\N	2019-03-08 12:48:16.590467+00	\N	\N	2
1194	-7	生活日用	0	收纳盒	2019-03-08 12:48:31.012076+00	0	0	\N	2019-03-08 12:48:31.014959+00	\N	\N	2
1195	-29	饮食	0	水果	2019-03-08 12:48:41.915092+00	0	0	\N	2019-03-08 12:48:41.917533+00	\N	\N	2
1196	-89	住房缴费	0	水费爸	2019-03-08 12:48:56.541908+00	0	0	\N	2019-03-08 12:48:56.544767+00	\N	\N	2
1197	-524	交通出行	0	机油	2019-03-08 12:52:35.049243+00	0	0	\N	2019-03-08 12:52:35.050558+00	\N	\N	2
1198	-50	生活日用	0	电影绿皮书	2019-03-08 12:53:31.472268+00	0	0	\N	2019-03-08 12:53:31.4751+00	\N	\N	2
1199	-32	饮食	0	肯德基	2019-03-08 12:53:50.435167+00	0	0	\N	2019-03-08 12:53:50.437754+00	\N	\N	2
1200	-38	饮食	0	大饼	2019-03-08 12:54:08.106621+00	0	0	\N	2019-03-08 12:54:08.111111+00	\N	\N	2
1201	-259	生活日用	0	磁力铁贴	2019-03-08 12:54:58.743196+00	0	0	\N	2019-03-08 12:54:58.744585+00	\N	\N	2
1202	-89	生活日用	0	烧水壶	2019-03-08 12:55:12.910734+00	0	0	\N	2019-03-08 12:55:12.912103+00	\N	\N	2
1203	-159	文教娱乐	0	京东plus	2019-03-08 12:55:45.832805+00	0	0	\N	2019-03-08 12:55:45.834203+00	\N	\N	2
1204	-158	饮食	0	零食	2019-03-09 05:29:58.674789+00	0	0	\N	2019-03-09 05:29:58.67659+00	\N	\N	1
1205	-20	饮食	0	一鸣	2019-03-09 05:30:29.234572+00	0	0	\N	2019-03-09 05:30:29.236082+00	\N	\N	1
1206	-15	饮食	0	老婆大人	2019-03-09 05:30:43.998072+00	0	0	\N	2019-03-09 05:30:43.999538+00	\N	\N	1
1207	-25	饮食	0	水果	2019-03-09 05:31:04.458873+00	0	0	\N	2019-03-09 05:31:04.460287+00	\N	\N	1
1208	-95	饮食	0	无邪	2019-03-09 05:31:32.464471+00	0	0	\N	2019-03-09 05:31:32.466007+00	\N	\N	1
1209	-5	小孩尿布	0	游泳裤	2019-03-09 05:32:09.41704+00	0	0	\N	2019-03-09 05:32:09.418562+00	\N	\N	1
1210	-48	小孩其他	0	理发	2019-03-09 05:32:32.22292+00	0	0	\N	2019-03-09 05:32:32.224476+00	\N	\N	1
1211	-26	饮食	0	草莓	2019-03-09 05:32:47.960109+00	0	0	\N	2019-03-09 05:32:47.961722+00	\N	\N	1
1212	-100	生活日用	0	超市	2019-03-09 05:34:03.090991+00	0	0	\N	2019-03-09 05:34:03.092418+00	\N	\N	1
1213	-20	饮食	0	小吃	2019-03-15 04:54:40.83488+00	0	0	\N	2019-03-15 04:54:40.837184+00	\N	\N	1
1214	-6	饮食	0	早餐	2019-03-15 04:54:54.780636+00	0	0	\N	2019-03-15 04:54:54.782719+00	\N	\N	1
1215	-6	饮食	0	早餐	2019-03-15 04:55:03.876785+00	0	0	\N	2019-03-15 04:55:03.878673+00	\N	\N	1
1216	-5	饮食	0	早餐	2019-03-15 04:55:17.885313+00	0	0	\N	2019-03-15 04:55:17.887264+00	\N	\N	1
1218	-79	生活日用	0	亚马逊会员	2019-03-15 04:57:00.878921+00	0	0	\N	2019-03-15 04:57:00.880925+00	\N	\N	1
1219	14142	收入	0	工资	2019-03-15 08:15:35.245119+00	0	0	\N	2019-03-15 08:15:35.247151+00	\N	\N	1
1220	-63	生活日用	0	数据线	2019-03-16 23:51:51.946646+00	0	0	\N	2019-03-16 23:51:51.949533+00	\N	\N	2
1221	-280	生活日用	0	耳温枪	2019-03-16 23:52:35.501916+00	0	0	\N	2019-03-16 23:52:35.504152+00	\N	\N	2
1222	-31	饮食	0	早餐	2019-03-16 23:52:53.750484+00	0	0	\N	2019-03-16 23:52:53.753971+00	\N	\N	2
1223	-24	饮食	0	美购物	2019-03-16 23:53:14.268107+00	0	0	\N	2019-03-16 23:53:14.270328+00	\N	\N	2
1224	-380	通讯物流	0	手机话费	2019-03-16 23:53:57.556711+00	0	0	\N	2019-03-16 23:53:57.558649+00	\N	\N	2
1225	-56	生活日用	0	垃圾袋	2019-03-16 23:56:37.912822+00	0	0	\N	2019-03-16 23:56:37.914905+00	\N	\N	2
1226	-89	小孩生活用品	0	bbox水杯	2019-03-16 23:57:01.106023+00	0	0	\N	2019-03-16 23:57:01.107895+00	\N	\N	2
1227	-9	生活日用	0	本子	2019-03-16 23:57:10.817308+00	0	0	\N	2019-03-16 23:57:10.819311+00	\N	\N	2
1228	-22	饮食	0	水果	2019-03-16 23:57:20.323731+00	0	0	\N	2019-03-16 23:57:20.325721+00	\N	\N	2
1229	-2000	交通出行	0	油卡	2019-03-16 23:57:46.698414+00	0	0	\N	2019-03-16 23:57:46.700564+00	\N	\N	2
1230	-99	生活日用	0	烧水壶	2019-03-16 23:58:39.223635+00	0	0	\N	2019-03-16 23:58:39.22571+00	\N	\N	2
1231	-31	小孩生活用品	0	退热贴	2019-03-16 23:58:56.00156+00	0	0	\N	2019-03-16 23:58:56.003727+00	\N	\N	2
1232	-13	饮食	0	菠萝	2019-03-16 23:59:10.974271+00	0	0	\N	2019-03-16 23:59:10.976295+00	\N	\N	2
1233	-85	生活日用	0	两袋大米	2019-03-16 23:59:35.684846+00	0	0	\N	2019-03-16 23:59:35.686838+00	\N	\N	2
1234	-23	生活日用	0	垃圾袋	2019-03-16 23:59:49.614605+00	0	0	\N	2019-03-16 23:59:49.616651+00	\N	\N	2
1235	-92	小孩生活用品	0	利其儿	2019-03-17 00:00:12.876533+00	0	0	\N	2019-03-17 00:00:12.878502+00	\N	\N	2
1236	-233	小孩生活用品	0	水杯	2019-03-17 00:00:37.079777+00	0	0	\N	2019-03-17 00:00:37.081779+00	\N	\N	2
1237	-34	饮食	0	肯德基	2019-03-17 00:01:41.295347+00	0	0	\N	2019-03-17 00:01:41.297468+00	\N	\N	2
1238	-27	饮食	0	美团	2019-03-17 00:01:57.240865+00	0	0	\N	2019-03-17 00:01:57.243026+00	\N	\N	2
1239	-9	饮食	0	早餐	2019-03-20 02:31:33.475277+00	0	0	\N	2019-03-20 02:31:33.477349+00	\N	\N	1
1240	-2	饮食	0	矿泉水	2019-03-20 02:32:13.497559+00	0	0	\N	2019-03-20 02:32:13.499513+00	\N	\N	1
1241	-23	饮食	0	一鸣早餐	2019-03-20 02:32:39.024707+00	0	0	\N	2019-03-20 02:32:39.02682+00	\N	\N	1
1242	-13	生活日用	0	TCL遥控器	2019-03-20 02:33:32.205741+00	0	0	\N	2019-03-20 02:33:32.207311+00	\N	\N	1
1243	-60	交通出行	0	台湾2寸照x2	2019-03-20 02:34:06.897434+00	0	0	\N	2019-03-20 02:34:06.89942+00	\N	\N	1
1245	-15	饮食	0	一鸣早餐	2019-03-20 02:34:39.347277+00	0	0	\N	2019-03-20 02:34:39.363215+00	\N	\N	1
1246	-12	饮食	0	儿童面	2019-03-20 02:34:54.903646+00	0	0	\N	2019-03-20 02:34:54.905668+00	\N	\N	1
1247	-23	其他消费	0	止泻药	2019-03-20 02:35:20.374468+00	0	0	\N	2019-03-20 02:35:20.376539+00	\N	\N	1
1248	-11	饮食	0	一鸣早餐	2019-03-20 02:35:32.827171+00	0	0	\N	2019-03-20 02:35:32.828839+00	\N	\N	1
1249	-440	饮食	0	铁板烧	2019-03-20 02:35:53.038405+00	0	0	\N	2019-03-20 02:35:53.040625+00	\N	\N	2
1250	-1908	生活日用	0	宜家床	2019-03-20 02:36:21.205328+00	0	0	\N	2019-03-20 02:36:21.207621+00	\N	\N	2
1251	-2688	生活日用	0	床垫	2019-03-20 02:36:47.336808+00	0	0	\N	2019-03-20 02:36:47.338791+00	\N	\N	2
1252	-40	交通出行	0	金卡证明+快递费	2019-03-31 11:03:27.30745+00	0	0	\N	2019-03-31 11:03:27.309168+00	\N	\N	2
1253	-296	交通出行	0	入台证	2019-03-31 11:05:09.338296+00	0	0	\N	2019-03-31 11:05:09.339697+00	\N	\N	2
1254	-800	交通出行	0	动物园年卡x2	2019-03-31 11:06:09.039901+00	0	0	\N	2019-03-31 11:06:09.041278+00	\N	\N	2
1255	-3244	交通出行	0	台湾机票x2	2019-03-31 11:06:35.083318+00	0	0	\N	2019-03-31 11:06:35.084683+00	\N	\N	2
1256	-282	小孩生活用品	0	虎牌水杯	2019-03-31 11:07:35.3661+00	0	0	\N	2019-03-31 11:07:35.367668+00	\N	\N	2
1257	-179	生活日用	0	路由器	2019-03-31 11:08:36.271254+00	0	0	\N	2019-03-31 11:08:36.272633+00	\N	\N	1
1258	-10	饮食	0	便利店	2019-03-31 11:09:10.871801+00	0	0	\N	2019-03-31 11:09:10.873339+00	\N	\N	1
1259	-11	饮食	0	早餐	2019-03-31 11:09:26.522833+00	0	0	\N	2019-03-31 11:09:26.52413+00	\N	\N	1
1260	-16	饮食	0	一鸣早餐	2019-03-31 11:09:41.202702+00	0	0	\N	2019-03-31 11:09:41.203974+00	\N	\N	1
1261	-11	饮食	0	早餐	2019-03-31 11:09:56.800302+00	0	0	\N	2019-03-31 11:09:56.801766+00	\N	\N	1
1262	-16	饮食	0	早餐	2019-03-31 11:10:19.517941+00	0	0	\N	2019-03-31 11:10:19.520231+00	\N	\N	1
1263	-138	饮食	0	美团	2019-03-31 11:11:57.730356+00	0	0	\N	2019-03-31 11:11:57.731964+00	\N	\N	1
1264	-25	饮食	0	烧饼	2019-03-31 11:12:22.942382+00	0	0	\N	2019-03-31 11:12:22.943676+00	\N	\N	1
1265	-10	交通出行	0	停车费	2019-03-31 11:12:36.248937+00	0	0	\N	2019-03-31 11:12:36.250201+00	\N	\N	1
1266	-24	饮食	0	绿姿	2019-03-31 11:14:32.118884+00	0	0	\N	2019-03-31 11:14:32.120214+00	\N	\N	2
1267	-4	饮食	0	零食	2019-03-31 11:14:54.5196+00	0	0	\N	2019-03-31 11:14:54.521002+00	\N	\N	2
1268	-100	饮食	0	O2	2019-03-31 11:15:06.947522+00	0	0	\N	2019-03-31 11:15:06.948784+00	\N	\N	2
1269	-33	饮食	0	美购	2019-03-31 11:15:15.548283+00	0	0	\N	2019-03-31 11:15:15.549545+00	\N	\N	2
1270	-41	住房缴费	0	天然气	2019-03-31 11:15:33.543634+00	0	0	\N	2019-03-31 11:15:33.544921+00	\N	\N	2
1271	-23	生活日用	0	美购	2019-03-31 11:15:43.796213+00	0	0	\N	2019-03-31 11:15:43.797472+00	\N	\N	2
1272	-11	饮食	0	水果	2019-03-31 11:15:55.524232+00	0	0	\N	2019-03-31 11:15:55.525501+00	\N	\N	2
1273	-3	饮食	0	烧饼	2019-03-31 11:16:07.654801+00	0	0	\N	2019-03-31 11:16:07.656078+00	\N	\N	2
1274	-65	生活日用	0	美购	2019-03-31 11:16:15.816868+00	0	0	\N	2019-03-31 11:16:15.819374+00	\N	\N	2
1275	-21	小孩生活用品	0	隔汗巾	2019-03-31 11:16:31.475917+00	0	0	\N	2019-03-31 11:16:31.477196+00	\N	\N	2
1276	-148	生活日用	0	双肩包	2019-03-31 11:16:43.664597+00	0	0	\N	2019-03-31 11:16:43.665857+00	\N	\N	2
1277	-12	小孩服饰	0	袜子	2019-03-31 11:17:04.609657+00	0	0	\N	2019-03-31 11:17:04.610971+00	\N	\N	2
1278	-100	饮食	0	老婆大人	2019-03-31 11:17:15.123442+00	0	0	\N	2019-03-31 11:17:15.124785+00	\N	\N	2
1279	-41	饮食	0	美购	2019-03-31 11:17:25.647142+00	0	0	\N	2019-03-31 11:17:25.648489+00	\N	\N	2
1280	-18	小孩生活用品	0	口水巾	2019-03-31 11:17:48.643678+00	0	0	\N	2019-03-31 11:17:48.646743+00	\N	\N	2
1281	-9	生活日用	0	笔	2019-03-31 11:17:58.622744+00	0	0	\N	2019-03-31 11:17:58.624107+00	\N	\N	2
1282	-121	饮食	0	水果	2019-03-31 11:18:14.262994+00	0	0	\N	2019-03-31 11:18:14.264293+00	\N	\N	2
1283	-15	交通出行	0	车载垃圾桶	2019-03-31 11:18:29.878197+00	0	0	\N	2019-03-31 11:18:29.879474+00	\N	\N	2
1284	-40	交通出行	0	植物园门票x2	2019-03-31 11:19:07.902552+00	0	0	\N	2019-03-31 11:19:07.903908+00	\N	\N	2
1285	-5	交通出行	0	停车费	2019-03-31 11:19:19.696537+00	0	0	\N	2019-03-31 11:19:19.697902+00	\N	\N	2
1286	8549	收入	0	工资	2019-03-31 11:20:12.5419+00	0	0	\N	2019-03-31 11:20:12.543188+00	\N	\N	2
1287	-6	饮食	0	早餐	2019-04-10 11:22:41.987321+00	0	0	\N	2019-04-10 11:22:41.98894+00	\N	\N	1
1288	-5	饮食	0	早餐	2019-04-10 11:22:58.747952+00	0	0	\N	2019-04-10 11:22:58.749453+00	\N	\N	1
1289	-5	饮食	0	早餐	2019-04-10 11:23:14.343819+00	0	0	\N	2019-04-10 11:23:14.346425+00	\N	\N	1
1290	-10	饮食	0	一鸣早餐	2019-04-10 11:23:36.212086+00	0	0	\N	2019-04-10 11:23:36.214371+00	\N	\N	1
1291	-270	生活日用	0	榨汁机滤网+齿轮+架子	2019-04-10 11:24:16.246634+00	0	0	\N	2019-04-10 11:24:16.24802+00	\N	\N	1
1292	-10	饮食	0	零食	2019-04-10 11:24:37.508702+00	0	0	\N	2019-04-10 11:24:37.510126+00	\N	\N	1
1293	-6	饮食	0	早餐	2019-04-10 11:25:01.980165+00	0	0	\N	2019-04-10 11:25:01.981431+00	\N	\N	1
1294	-10	饮食	0	一鸣早餐	2019-04-10 11:25:12.278238+00	0	0	\N	2019-04-10 11:25:12.279606+00	\N	\N	1
1295	-39	饮食	0	零食	2019-04-10 11:25:29.391743+00	0	0	\N	2019-04-10 11:25:29.393262+00	\N	\N	1
1296	-634	交通出行	0	台北住宿x2	2019-04-10 11:30:04.336225+00	0	0	\N	2019-04-10 11:30:04.337798+00	\N	\N	2
1297	-529	交通出行	0	花莲住宿x2	2019-04-10 11:30:32.726192+00	0	0	\N	2019-04-10 11:30:32.727528+00	\N	\N	2
1298	-1288	交通出行	0	垦丁住宿x3	2019-04-10 11:31:08.138548+00	0	0	\N	2019-04-10 11:31:08.140026+00	\N	\N	2
1299	-24	饮食	0	美团	2019-04-10 11:31:43.643245+00	0	0	\N	2019-04-10 11:31:43.644824+00	\N	\N	2
1300	1500	收入	0	工龄奖	2019-04-10 11:31:59.615555+00	0	0	\N	2019-04-10 11:31:59.61682+00	\N	\N	2
1301	-35	饮食	0	美团	2019-04-10 11:32:20.893617+00	0	0	\N	2019-04-10 11:32:20.894948+00	\N	\N	2
1302	-101	生活日用	0	京东	2019-04-10 11:32:45.011693+00	0	0	\N	2019-04-10 11:32:45.013005+00	\N	\N	2
1303	-20	饮食	0	水果	2019-04-10 11:33:45.0745+00	0	0	\N	2019-04-10 11:33:45.075807+00	\N	\N	2
1304	-14	小孩服饰	0	袜子	2019-04-10 11:34:00.428089+00	0	0	\N	2019-04-10 11:34:00.429641+00	\N	\N	2
1305	-138	住房缴费	0	家电费	2019-04-10 11:34:16.701986+00	0	0	\N	2019-04-10 11:34:16.703249+00	\N	\N	2
1306	-98	住房缴费	0	爸电费	2019-04-10 11:34:29.831056+00	0	0	\N	2019-04-10 11:34:29.832578+00	\N	\N	2
1307	-32	饮食	0	水果	2019-04-10 11:34:43.658287+00	0	0	\N	2019-04-10 11:34:43.659663+00	\N	\N	2
1308	-75	生活日用	0	咸菜桶	2019-04-10 11:35:10.784282+00	0	0	\N	2019-04-10 11:35:10.785535+00	\N	\N	2
1309	-5	服饰美容	0	袜子	2019-04-10 11:35:29.63207+00	0	0	\N	2019-04-10 11:35:29.633339+00	\N	\N	2
1310	-579	生活日用	0	煤气灶	2019-04-10 11:36:11.094374+00	0	0	\N	2019-04-10 11:36:11.095626+00	\N	\N	2
1311	-289	生活日用	0	奶煤气灶	2019-04-10 11:36:26.930231+00	0	0	\N	2019-04-10 11:36:26.931691+00	\N	\N	2
1312	-599	生活日用	0	厨师机	2019-04-10 11:36:49.326912+00	0	0	\N	2019-04-10 11:36:49.328181+00	\N	\N	2
1313	14142	收入	0	工资	2019-04-15 06:48:25.931551+00	0	0	\N	2019-04-15 06:48:25.933025+00	\N	\N	1
1314	-5	饮食	0	早餐	2019-04-15 06:48:56.809092+00	0	0	\N	2019-04-15 06:48:56.810338+00	\N	\N	1
1315	-99	服饰美容	0	maxwin	2019-04-15 06:49:49.94284+00	0	0	\N	2019-04-15 06:49:49.944281+00	\N	\N	1
1316	-20	交通出行	0	停车费	2019-04-15 06:50:08.504877+00	0	0	\N	2019-04-15 06:50:08.506123+00	\N	\N	1
1317	-200	生活日用	0	iPhone屏幕	2019-04-15 06:50:24.478914+00	0	0	\N	2019-04-15 06:50:24.480164+00	\N	\N	1
1318	-54	饮食	0	超市	2019-04-15 06:50:36.837514+00	0	0	\N	2019-04-15 06:50:36.83878+00	\N	\N	1
1319	-5	饮食	0	零食	2019-04-15 06:50:52.557154+00	0	0	\N	2019-04-15 06:50:52.558444+00	\N	\N	1
1320	-19	饮食	0	绿姿	2019-04-21 09:55:17.380702+00	0	0	\N	2019-04-21 09:55:17.382291+00	\N	\N	2
1321	-314	服饰美容	0	衣服	2019-04-21 09:55:39.821953+00	0	0	\N	2019-04-21 09:55:39.82322+00	\N	\N	2
1322	-204	小孩服饰	0	衣服	2019-04-21 09:55:55.582743+00	0	0	\N	2019-04-21 09:55:55.584117+00	\N	\N	2
1323	-9	饮食	0	早餐	2019-04-21 09:56:06.14131+00	0	0	\N	2019-04-21 09:56:06.142639+00	\N	\N	2
1324	-42	生活日用	0	美购	2019-04-21 09:56:17.118989+00	0	0	\N	2019-04-21 09:56:17.120259+00	\N	\N	2
1325	-3	饮食	0	大饼	2019-04-21 09:56:26.412454+00	0	0	\N	2019-04-21 09:56:26.413723+00	\N	\N	2
1326	-6	饮食	0	乐购	2019-04-21 09:57:00.069949+00	0	0	\N	2019-04-21 09:57:00.071208+00	\N	\N	2
1327	-12	生活日用	0	裁纸机	2019-04-21 09:57:27.631462+00	0	0	\N	2019-04-21 09:57:27.632908+00	\N	\N	2
1328	-3	饮食	0	大饼	2019-04-21 09:57:40.776429+00	0	0	\N	2019-04-21 09:57:40.778032+00	\N	\N	2
1329	-25	文教娱乐	0	菜谱	2019-04-21 09:57:56.400708+00	0	0	\N	2019-04-21 09:57:56.401974+00	\N	\N	2
1330	-207	生活日用	0	四件套	2019-04-21 09:58:08.937857+00	0	0	\N	2019-04-21 09:58:08.939174+00	\N	\N	2
1331	-23	住房缴费	0	揉面垫	2019-04-21 09:58:31.268162+00	0	0	\N	2019-04-21 09:58:31.269505+00	\N	\N	2
1332	-20	生活日用	0	美购	2019-04-21 09:58:42.233559+00	0	0	\N	2019-04-21 09:58:42.234865+00	\N	\N	2
1333	-46	饮食	0	美购	2019-04-21 09:58:54.679217+00	0	0	\N	2019-04-21 09:58:54.68062+00	\N	\N	2
1334	-49	生活日用	0	洗漱包	2019-04-21 09:59:13.745049+00	0	0	\N	2019-04-21 09:59:13.746479+00	\N	\N	2
1335	-30	健康保险	0	止疼药	2019-04-21 09:59:34.885628+00	0	0	\N	2019-04-21 09:59:34.887253+00	\N	\N	2
1336	-9	饮食	0	锅盔	2019-04-21 09:59:44.138236+00	0	0	\N	2019-04-21 09:59:44.139527+00	\N	\N	2
1337	-6	饮食	0	凉皮	2019-04-21 10:00:59.763961+00	0	0	\N	2019-04-21 10:00:59.765389+00	\N	\N	2
1338	-223	饮食	0	午饭	2019-04-21 10:01:14.13926+00	0	0	\N	2019-04-21 10:01:14.140516+00	\N	\N	2
1339	-11	生活日用	0	餐巾纸	2019-04-21 10:03:00.382599+00	0	0	\N	2019-04-21 10:03:00.383858+00	\N	\N	2
1340	-480	生活日用	0	面条机	2019-04-21 10:03:28.784766+00	0	0	\N	2019-04-21 10:03:28.786189+00	\N	\N	2
1341	-22	生活日用	0	保鲜袋	2019-04-21 10:05:18.01633+00	0	0	\N	2019-04-21 10:05:18.017802+00	\N	\N	2
1342	-83	生活日用	0	餐巾纸	2019-04-21 10:05:51.183341+00	0	0	\N	2019-04-21 10:05:51.184807+00	\N	\N	2
1343	-20	饮食	0	卤人甲	2019-04-29 04:36:44.151687+00	0	0	\N	2019-04-29 04:36:44.15364+00	\N	\N	1
1344	-10	饮食	0	绿姿	2019-04-29 04:36:57.900327+00	0	0	\N	2019-04-29 04:36:57.901619+00	\N	\N	1
1345	-140	饮食	0	乐购	2019-04-29 04:37:18.641796+00	0	0	\N	2019-04-29 04:37:18.643232+00	\N	\N	1
1346	-6	饮食	0	早餐	2019-04-29 04:38:07.418004+00	0	0	\N	2019-04-29 04:38:07.420501+00	\N	\N	1
1347	-22	饮食	0	三天早餐	2019-04-29 04:38:35.215635+00	0	0	\N	2019-04-29 04:38:35.21692+00	\N	\N	1
1348	-11	饮食	0	两天早餐	2019-04-29 04:38:57.017564+00	0	0	\N	2019-04-29 04:38:57.018849+00	\N	\N	1
1349	-15	饮食	0	零食	2019-04-29 04:40:35.833162+00	0	0	\N	2019-04-29 04:40:35.834504+00	\N	\N	1
1351	-250	交通出行	0	花莲太鲁阁一日游x2	2019-04-29 04:42:50.040796+00	0	0	\N	2019-04-29 04:42:50.042061+00	\N	\N	2
1352	-128	交通出行	0	垦丁到高雄左营高铁站x2	2019-04-29 04:43:54.941175+00	0	0	\N	2019-04-29 04:43:54.942515+00	\N	\N	2
1353	-376	交通出行	0	花莲垦丁纵谷线一日游x2	2019-04-29 04:44:58.656029+00	0	0	\N	2019-04-29 04:44:58.657911+00	\N	\N	2
1354	-69	小孩服饰	0	背心	2019-04-29 14:55:58.14066+00	0	0	\N	2019-04-29 14:55:58.141949+00	\N	\N	2
1355	-80	生活日用	0	电风扇	2019-04-29 14:56:13.970054+00	0	0	\N	2019-04-29 14:56:13.971393+00	\N	\N	2
1356	-15	生活日用	0	分装瓶	2019-04-29 14:56:46.377325+00	0	0	\N	2019-04-29 14:56:46.378627+00	\N	\N	2
1357	-30	生活日用	0	好易购	2019-04-29 14:58:05.830167+00	0	0	\N	2019-04-29 14:58:05.831449+00	\N	\N	2
1358	-25	小孩服饰	0	拖鞋	2019-04-29 14:58:18.860137+00	0	0	\N	2019-04-29 14:58:18.861421+00	\N	\N	2
1359	-3650	健康保险	0	车险	2019-04-29 14:58:48.105502+00	0	0	\N	2019-04-29 14:58:48.106961+00	\N	\N	2
1360	-150	生活日用	0	美购	2019-04-29 14:59:20.538904+00	0	0	\N	2019-04-29 14:59:20.540234+00	\N	\N	2
1361	-5	饮食	0	饼	2019-04-29 14:59:32.87961+00	0	0	\N	2019-04-29 14:59:32.881014+00	\N	\N	2
1362	-40	小孩服饰	0	睡袋	2019-04-29 14:59:43.499136+00	0	0	\N	2019-04-29 14:59:43.500858+00	\N	\N	2
1363	-19	饮食	0	不二烫捞	2019-04-29 15:00:03.565063+00	0	0	\N	2019-04-29 15:00:03.566431+00	\N	\N	2
1364	-75	饮食	0	周黑鸭	2019-04-29 15:00:15.159534+00	0	0	\N	2019-04-29 15:00:15.160819+00	\N	\N	2
1365	-270	服饰美容	0	服饰	2019-04-29 15:00:27.216079+00	0	0	\N	2019-04-29 15:00:27.217585+00	\N	\N	2
1366	-15	饮食	0	桑椹	2019-04-29 15:00:44.062143+00	0	0	\N	2019-04-29 15:00:44.063686+00	\N	\N	2
1367	-66	小孩生活用品	0	澡桶	2019-04-29 15:01:04.84741+00	0	0	\N	2019-04-29 15:01:04.848752+00	\N	\N	2
1368	-54	小孩尿布	0	尿布	2019-04-29 15:01:15.119033+00	0	0	\N	2019-04-29 15:01:15.120419+00	\N	\N	2
1369	-3	饮食	0	大饼	2019-04-29 15:01:25.758237+00	0	0	\N	2019-04-29 15:01:25.760033+00	\N	\N	2
1370	-40	饮食	0	桑椹	2019-04-29 15:01:40.561646+00	0	0	\N	2019-04-29 15:01:40.563139+00	\N	\N	2
1371	-300	文教娱乐	0	公司聚餐	2019-04-29 15:02:04.689551+00	0	0	\N	2019-04-29 15:02:04.690831+00	\N	\N	2
1372	-269	生活日用	0	行李箱	2019-04-29 15:02:49.360033+00	0	0	\N	2019-04-29 15:02:49.361309+00	\N	\N	2
1373	-45	生活日用	0	防晒霜	2019-04-29 15:03:00.986169+00	0	0	\N	2019-04-29 15:03:00.98767+00	\N	\N	2
1374	-240	服饰美容	0	防晒霜	2019-04-29 15:03:22.709436+00	0	0	\N	2019-04-29 15:03:22.710769+00	\N	\N	2
1375	-450	小孩尿布	0	尿布	2019-04-29 15:03:54.239125+00	0	0	\N	2019-04-29 15:03:54.240484+00	\N	\N	2
1376	8866	收入	0	工资	2019-04-29 15:06:31.331389+00	0	0	\N	2019-04-29 15:06:31.332841+00	\N	\N	2
1377	-589	交通出行	0	高雄到台北高铁x2	2019-04-29 15:18:02.627126+00	0	0	\N	2019-04-29 15:18:02.628792+00	\N	\N	2
1378	-195	交通出行	0	台北到花莲火车x2	2019-04-29 15:18:34.895979+00	0	0	\N	2019-04-29 15:18:34.897708+00	\N	\N	2
1379	-218	交通出行	0	台北101门票x2	2019-04-30 03:36:03.433146+00	0	0	\N	2019-04-30 03:36:03.434639+00	\N	\N	2
1380	-148	交通出行	0	台北故宫门票x2	2019-04-30 03:37:08.824641+00	0	0	\N	2019-04-30 03:37:08.825986+00	\N	\N	2
1381	-11	饮食	0	一鸣早餐	2019-04-30 03:37:26.946489+00	0	0	\N	2019-04-30 03:37:26.94784+00	\N	\N	1
1382	-16	生活日用	0	ghelper一个月会员	2019-04-30 03:40:14.313231+00	0	0	\N	2019-04-30 03:40:14.314509+00	\N	\N	1
1383	-540	服饰美容	0	台湾行日药本铺	2019-05-04 15:27:30.524853+00	0	0	\N	2019-05-04 15:27:30.526339+00	\N	\N	2
1384	-412	服饰美容	0	台湾行hm	2019-05-04 15:27:54.091615+00	0	0	\N	2019-05-04 15:27:54.092872+00	\N	\N	2
1385	-415	小孩服饰	0	台湾行两双鞋	2019-05-04 15:28:27.658155+00	0	0	\N	2019-05-04 15:28:27.659473+00	\N	\N	2
1386	-633	服饰美容	0	台湾行耐克鞋	2019-05-04 15:28:41.236411+00	0	0	\N	2019-05-04 15:28:41.23791+00	\N	\N	2
1388	-482	小孩服饰	0	台湾行衣服	2019-05-04 15:30:07.901079+00	0	0	\N	2019-05-04 15:30:07.902331+00	\N	\N	2
1389	-274	交通出行	0	台湾行洗脚x2	2019-05-04 15:30:32.375483+00	0	0	\N	2019-05-04 15:30:32.376748+00	\N	\N	2
1390	-911	服饰美容	0	台湾行康是美	2019-05-04 15:31:42.431365+00	0	0	\N	2019-05-04 15:31:42.432699+00	\N	\N	2
1391	-2197	交通出行	0	台湾行吃喝玩乐	2019-05-04 15:32:48.065148+00	0	0	\N	2019-05-04 15:32:48.066475+00	\N	\N	2
1393	-246	生活日用	0	台湾行神经痛药	2019-05-08 08:08:41.503163+00	0	0	\N	2019-05-08 08:08:41.504489+00	\N	\N	2
1394	-2400	小孩奶粉	0	台湾行羊奶粉x12	2019-05-08 08:09:06.163739+00	0	0	\N	2019-05-08 08:09:06.165013+00	\N	\N	2
1395	-441	生活日用	0	台湾行吃喝住行	2019-05-08 08:10:23.874217+00	0	0	\N	2019-05-08 08:10:23.875501+00	\N	\N	2
1396	-1099	生活日用	0	台湾行吃喝住行	2019-05-08 08:11:28.175158+00	0	0	\N	2019-05-08 08:11:28.176519+00	\N	\N	2
1397	-143	饮食	0	台湾行吃喝	2019-05-08 08:12:47.64401+00	0	0	\N	2019-05-08 08:12:47.645278+00	\N	\N	2
1398	-1464	服饰美容	0	台湾行护肤品	2019-05-08 08:13:29.585799+00	0	0	\N	2019-05-08 08:13:29.587295+00	\N	\N	2
1399	-50	饮食	0	台湾行吃住	2019-05-08 08:14:24.255055+00	0	0	\N	2019-05-08 08:14:24.256313+00	\N	\N	2
1400	-254	饮食	0	台湾行海鲜	2019-05-08 08:15:01.293315+00	0	0	\N	2019-05-08 08:15:01.294581+00	\N	\N	2
1402	-328	饮食	0	台湾行凤梨酥	2019-05-08 08:16:20.583076+00	0	0	\N	2019-05-08 08:16:20.584336+00	\N	\N	2
1403	-1712	饮食	0	台湾行中华烟x4，金门高粱酒x4	2019-05-08 08:17:14.289643+00	0	0	\N	2019-05-08 08:17:14.290908+00	\N	\N	2
1404	-362	饮食	0	台湾行雪茄x10	2019-05-08 08:17:34.228178+00	0	0	\N	2019-05-08 08:17:34.229467+00	\N	\N	2
1405	-370	饮食	0	台湾行微xxx凤梨酥	2019-05-08 08:18:39.034946+00	0	0	\N	2019-05-08 08:18:39.037574+00	\N	\N	2
1406	-170	生活日用	0	手机摄像头维修	2019-05-16 06:45:24.617111+00	0	0	\N	2019-05-16 06:45:24.618632+00	\N	\N	1
1407	-27	饮食	0	超市	2019-05-16 06:45:44.691986+00	0	0	\N	2019-05-16 06:45:44.693368+00	\N	\N	1
1408	-6	饮食	0	早餐	2019-05-16 06:46:01.018756+00	0	0	\N	2019-05-16 06:46:01.020144+00	\N	\N	1
1409	-11	饮食	0	早餐	2019-05-16 06:46:09.835499+00	0	0	\N	2019-05-16 06:46:09.836837+00	\N	\N	1
1410	-30	生活日用	0	博朗剃须刀充电器	2019-05-16 06:46:28.356035+00	0	0	\N	2019-05-16 06:46:28.357388+00	\N	\N	1
1411	-10	通讯物流	0	停车费	2019-05-16 06:47:39.967158+00	0	0	\N	2019-05-16 06:47:39.968457+00	\N	\N	1
1412	14918	收入	0	工资	2019-05-16 06:55:20.378183+00	0	0	\N	2019-05-16 06:55:20.379521+00	\N	\N	1
1413	-76	住房缴费	0	家电费	2019-05-24 15:31:47.535299+00	0	0	\N	2019-05-24 15:31:47.537766+00	\N	\N	2
1414	-69	住房缴费	0	爸妈家电费	2019-05-24 15:32:10.913001+00	0	0	\N	2019-05-24 15:32:10.915352+00	\N	\N	2
1415	-23	住房缴费	0	水费	2019-05-24 15:32:40.34503+00	0	0	\N	2019-05-24 15:32:40.346913+00	\N	\N	2
1416	-50	生活日用	0	车载灭火器2个	2019-05-24 15:33:14.889685+00	0	0	\N	2019-05-24 15:33:14.891686+00	\N	\N	2
1417	-102	住房缴费	0	东兴水费	2019-05-24 15:33:44.533774+00	0	0	\N	2019-05-24 15:33:44.535744+00	\N	\N	2
1418	-36	小孩玩具	0	钓鱼玩具	2019-05-24 15:34:04.686589+00	0	0	\N	2019-05-24 15:34:04.688587+00	\N	\N	2
1419	-37	饮食	0	肯德基	2019-05-24 15:34:26.203205+00	0	0	\N	2019-05-24 15:34:26.205181+00	\N	\N	2
1420	-120	饮食	0	私家小厨	2019-05-24 15:35:12.726696+00	0	0	\N	2019-05-24 15:35:12.729347+00	\N	\N	2
1421	-35	生活日用	0	美购	2019-05-24 15:35:50.119401+00	0	0	\N	2019-05-24 15:35:50.121334+00	\N	\N	2
1422	-49	生活日用	0	冰丝袖	2019-05-24 15:36:12.406985+00	0	0	\N	2019-05-24 15:36:12.409721+00	\N	\N	2
1423	-128	小孩服饰	0	背包	2019-05-24 15:36:36.818068+00	0	0	\N	2019-05-24 15:36:36.824863+00	\N	\N	2
1424	-67	小孩生活用品	0	洗衣液	2019-05-24 15:37:14.789532+00	0	0	\N	2019-05-24 15:37:14.791482+00	\N	\N	2
1426	-37	生活日用	0	美购	2019-05-24 15:38:26.263426+00	0	0	\N	2019-05-24 15:38:26.270106+00	\N	\N	2
1427	-256	小孩服饰	0	鞋子阿迪达斯	2019-05-24 15:38:53.804269+00	0	0	\N	2019-05-24 15:38:53.806075+00	\N	\N	2
1428	-40	小孩生活用品	0	睡衣	2019-05-24 15:39:11.909539+00	0	0	\N	2019-05-24 15:39:11.911366+00	\N	\N	2
1429	-33	生活日用	0	手机壳	2019-05-24 15:39:43.43634+00	0	0	\N	2019-05-24 15:39:43.438345+00	\N	\N	2
1430	-33	生活日用	0	手机壳	2019-05-24 15:39:44.894008+00	0	0	\N	2019-05-24 15:39:44.895948+00	\N	\N	2
1431	-236	小孩尿布	0	尿布3包	2019-05-24 15:42:39.086035+00	0	0	\N	2019-05-24 15:42:39.088194+00	\N	\N	2
1432	-48	小孩玩具	0	电池	2019-05-26 03:31:36.438039+00	0	0	\N	2019-05-26 03:31:36.440428+00	\N	\N	2
1433	-130	服饰美容	0	鞋子	2019-05-26 03:32:07.415661+00	0	0	\N	2019-05-26 03:32:07.418147+00	\N	\N	2
1434	-60	服饰美容	0	运动套装	2019-05-26 03:32:28.158983+00	0	0	\N	2019-05-26 03:32:28.161383+00	\N	\N	2
1435	-170	生活日用	0	冰藤席	2019-05-26 03:32:54.111088+00	0	0	\N	2019-05-26 03:32:54.113066+00	\N	\N	2
1436	-30	服饰美容	0	小背包	2019-05-26 03:33:04.934693+00	0	0	\N	2019-05-26 03:33:04.936616+00	\N	\N	2
1437	-5133	生活日用	0	三星手机	2019-05-26 03:33:26.696326+00	0	0	\N	2019-05-26 03:33:26.698614+00	\N	\N	2
1438	-33	生活日用	0	手机壳	2019-05-26 03:33:36.772155+00	0	0	\N	2019-05-26 03:33:36.774267+00	\N	\N	2
1439	-22	生活日用	0	工具	2019-05-28 02:11:21.742579+00	0	0	\N	2019-05-28 02:11:21.745571+00	\N	\N	1
1440	-89	小孩玩具	0	画板	2019-05-28 02:11:44.020867+00	0	0	\N	2019-05-28 02:11:44.02333+00	\N	\N	1
1441	-200	服饰美容	0	理发充值	2019-05-28 02:12:14.499585+00	0	0	\N	2019-05-28 02:12:14.502529+00	\N	\N	1
1442	-100	饮食	0	水果零食	2019-05-28 02:12:38.985613+00	0	0	\N	2019-05-28 02:12:38.987652+00	\N	\N	1
1443	-11	饮食	0	一鸣早餐	2019-05-28 02:12:54.262534+00	0	0	\N	2019-05-28 02:12:54.26499+00	\N	\N	1
1444	-80	文教娱乐	0	DOTA2特权码	2019-05-28 02:13:17.779619+00	0	0	\N	2019-05-28 02:13:17.781559+00	\N	\N	1
1445	-15	生活日用	0	生活用品	2019-05-28 02:14:08.93446+00	0	0	\N	2019-05-28 02:14:08.936969+00	\N	\N	1
1446	-50	生活日用	0	说明书打印	2019-05-28 02:14:47.300546+00	0	0	\N	2019-05-28 02:14:47.302249+00	\N	\N	1
1447	-100	通讯物流	0	话费	2019-05-28 02:15:17.568073+00	0	0	\N	2019-05-28 02:15:17.569988+00	\N	\N	1
1448	-38	饮食	0	欧文	2019-05-28 02:15:41.529211+00	0	0	\N	2019-05-28 02:15:41.53153+00	\N	\N	1
1449	-32	饮食	0	山竹	2019-05-28 02:16:01.060185+00	0	0	\N	2019-05-28 02:16:01.061865+00	\N	\N	1
1450	-65	饮食	0	老婆大人	2019-05-28 02:16:23.049717+00	0	0	\N	2019-05-28 02:16:23.051679+00	\N	\N	1
1451	-30	生活日用	0	美购超市	2019-05-28 02:16:44.068771+00	0	0	\N	2019-05-28 02:16:44.071408+00	\N	\N	1
1452	-160	生活日用	0	VPN	2019-05-28 02:17:02.597144+00	0	0	\N	2019-05-28 02:17:02.599281+00	\N	\N	1
1453	-4198	文教娱乐	0	DOTA2 ti9门票x2	2019-05-28 02:17:59.167624+00	0	0	\N	2019-05-28 02:17:59.169268+00	\N	\N	1
1454	-5	饮食	0	早餐	2019-05-28 02:18:18.75867+00	0	0	\N	2019-05-28 02:18:18.760587+00	\N	\N	1
1455	-669	文教娱乐	0	三星buds无线耳机	2019-05-28 02:18:57.747671+00	0	0	\N	2019-05-28 02:18:57.75+00	\N	\N	1
1457	-2828	健康保险	0	人保车险3268-440	2019-05-28 06:21:24.979565+00	0	0	\N	2019-05-28 06:21:24.981466+00	\N	\N	1
1458	-58	饮食	0	蛋糕	2019-05-28 15:21:29.340864+00	0	0	\N	2019-05-28 15:21:29.343448+00	\N	\N	2
1459	-203	小孩生活用品	0	奶瓶洗衣液	2019-05-30 08:37:48.007972+00	0	0	\N	2019-05-30 08:37:48.010264+00	\N	\N	2
1460	-25	生活日用	0	手机壳	2019-05-30 08:38:15.381488+00	0	0	\N	2019-05-30 08:38:15.383474+00	\N	\N	2
1461	-37	生活日用	0	华润万家	2019-05-31 13:01:38.282397+00	0	0	\N	2019-05-31 13:01:38.285631+00	\N	\N	2
1462	-90	饮食	0	荔枝	2019-06-01 06:16:46.856579+00	0	0	\N	2019-06-01 06:16:46.858757+00	\N	\N	2
1463	-121	小孩生活用品	0	小宝熊水壶	2019-06-01 06:17:14.792865+00	0	0	\N	2019-06-01 06:17:14.795349+00	\N	\N	2
1464	-10	生活日用	0	餐巾纸	2019-06-01 06:17:30.461258+00	0	0	\N	2019-06-01 06:17:30.463323+00	\N	\N	2
1465	-1000	人情往来	0	海口小南	2019-06-04 15:20:24.637213+00	0	0	\N	2019-06-04 15:20:24.640183+00	\N	\N	2
1466	-30	小孩服饰	0	美妆蛋3个	2019-06-04 15:21:49.525435+00	0	0	\N	2019-06-04 15:21:49.526844+00	\N	\N	2
1467	-26	饮食	0	荔枝	2019-06-04 15:22:10.179069+00	0	0	\N	2019-06-04 15:22:10.180334+00	\N	\N	2
1468	-46	住房缴费	0	水费家	2019-06-04 15:22:38.022164+00	0	0	\N	2019-06-04 15:22:38.023535+00	\N	\N	2
1469	-66	人情往来	0	水费父母家	2019-06-04 15:23:04.156541+00	0	0	\N	2019-06-04 15:23:04.15802+00	\N	\N	2
1470	-16	小孩服饰	0	袜子	2019-06-04 15:23:21.48411+00	0	0	\N	2019-06-04 15:23:21.485363+00	\N	\N	2
1471	-60	饮食	0	美购	2019-06-04 15:23:41.802018+00	0	0	\N	2019-06-04 15:23:41.810701+00	\N	\N	2
1472	-40	生活日用	0	美缝剂	2019-06-04 15:24:11.489596+00	0	0	\N	2019-06-04 15:24:11.490922+00	\N	\N	2
1473	-59	小孩服饰	0	防晒衣	2019-06-04 15:24:36.383951+00	0	0	\N	2019-06-04 15:24:36.38531+00	\N	\N	2
1474	-68	小孩服饰	0	雨衣	2019-06-04 15:25:02.907736+00	0	0	\N	2019-06-04 15:25:02.909121+00	\N	\N	2
1475	-170	生活日用	0	1水宝宝防晒喷雾 洗面奶 眉笔	2019-06-04 15:26:07.513699+00	0	0	\N	2019-06-04 15:26:07.514967+00	\N	\N	2
1476	-1000	交通出行	0	油卡	2019-06-04 15:27:20.377003+00	0	0	\N	2019-06-04 15:27:20.378398+00	\N	\N	2
1477	-58	生活日用	0	车载风扇	2019-06-05 08:24:09.250749+00	0	0	\N	2019-06-05 08:24:09.252242+00	\N	\N	2
1478	-28	小孩服饰	0	防蚊裤	2019-06-05 08:24:23.422449+00	0	0	\N	2019-06-05 08:24:23.423802+00	\N	\N	2
1479	50000	收入	0	18年提成	2019-06-05 13:00:23.628356+00	0	0	\N	2019-06-05 13:00:23.629778+00	\N	\N	2
1480	8866	收入	0	五月工资	2019-06-05 13:03:54.090056+00	0	0	\N	2019-06-05 13:03:54.091335+00	\N	\N	2
1481	5438	收入	0	18年11月工资	2019-06-05 13:13:37.997801+00	0	0	\N	2019-06-05 13:13:37.999179+00	\N	\N	2
1482	6108	收入	0	18年12月工资	2019-06-05 13:14:18.989785+00	0	0	\N	2019-06-05 13:14:18.991154+00	\N	\N	2
1483	8545	收入	0	二月工资	2019-06-05 13:16:54.918987+00	0	0	\N	2019-06-05 13:16:54.920325+00	\N	\N	2
1484	-28	生活日用	0	手机膜	2019-06-09 14:36:09.769876+00	0	0	\N	2019-06-09 14:36:09.771387+00	\N	\N	2
1485	-158	饮食	0	鲍鱼先生	2019-06-09 14:36:36.168395+00	0	0	\N	2019-06-09 14:36:36.169682+00	\N	\N	2
1486	-32	饮食	0	鸭蛋	2019-06-09 14:37:42.957086+00	0	0	\N	2019-06-09 14:37:42.958841+00	\N	\N	2
1487	-126	服饰美容	0	连衣裙	2019-06-09 14:38:34.844775+00	0	0	\N	2019-06-09 14:38:34.84605+00	\N	\N	2
1488	-20	服饰美容	0	袜子	2019-06-09 14:38:59.480133+00	0	0	\N	2019-06-09 14:38:59.481413+00	\N	\N	2
1489	-24	生活日用	0	门帘	2019-06-09 14:39:08.891039+00	0	0	\N	2019-06-09 14:39:08.892321+00	\N	\N	2
1490	-871	饮食	0	老北京菜	2019-06-09 14:39:37.002704+00	0	0	\N	2019-06-09 14:39:37.003995+00	\N	\N	2
1492	-20	交通出行	0	停车费	2019-06-09 14:40:53.240179+00	0	0	\N	2019-06-09 14:40:53.241676+00	\N	\N	2
1493	-19	小孩健康	0	日常检查	2019-06-13 04:06:52.500623+00	0	0	\N	2019-06-13 04:06:52.502071+00	\N	\N	2
1494	-60	服饰美容	0	手镯	2019-06-13 04:07:09.356525+00	0	0	\N	2019-06-13 04:07:09.358305+00	\N	\N	2
1495	-10	小孩生活用品	0	浴巾	2019-06-13 04:07:33.170687+00	0	0	\N	2019-06-13 04:07:33.172053+00	\N	\N	2
1496	-7	饮食	0	奶茶	2019-06-13 04:07:41.769122+00	0	0	\N	2019-06-13 04:07:41.770487+00	\N	\N	2
1497	-14	服饰美容	0	拖鞋	2019-06-13 04:08:02.187161+00	0	0	\N	2019-06-13 04:08:02.188555+00	\N	\N	2
1498	-110	饮食	0	三只松鼠零食	2019-06-13 04:08:35.48117+00	0	0	\N	2019-06-13 04:08:35.482549+00	\N	\N	2
1499	-140	饮食	0	2袋10kg大米，2袋5kg大米	2019-06-13 04:09:19.29221+00	0	0	\N	2019-06-13 04:09:19.294497+00	\N	\N	2
1500	-52	小孩服饰	0	防蚊裤2条	2019-06-21 15:18:50.770669+00	0	0	\N	2019-06-21 15:18:50.772461+00	\N	\N	2
1501	-84	人情往来	0	澳贝玩具弯弯	2019-06-21 15:19:28.435052+00	0	0	\N	2019-06-21 15:19:28.437388+00	\N	\N	2
1502	-12	饮食	0	早餐	2019-06-21 15:20:09.816463+00	0	0	\N	2019-06-21 15:20:09.81779+00	\N	\N	2
1503	-36	饮食	0	野米	2019-06-21 15:20:30.519385+00	0	0	\N	2019-06-21 15:20:30.520701+00	\N	\N	2
1504	-15	生活日用	0	美购	2019-06-21 15:20:56.259407+00	0	0	\N	2019-06-21 15:20:56.260674+00	\N	\N	2
1505	-25	饮食	0	零食	2019-06-21 15:21:14.836909+00	0	0	\N	2019-06-21 15:21:14.838415+00	\N	\N	2
1506	-6	饮食	0	大饼2个	2019-06-21 15:21:41.113572+00	0	0	\N	2019-06-21 15:21:41.114868+00	\N	\N	2
1507	-99	服饰美容	0	睡衣2件	2019-06-21 15:22:03.834094+00	0	0	\N	2019-06-21 15:22:03.835369+00	\N	\N	2
1508	-22	服饰美容	0	丝网6双	2019-06-21 15:22:23.014527+00	0	0	\N	2019-06-21 15:22:23.015871+00	\N	\N	2
1509	-68	服饰美容	0	冰丝裤2双	2019-06-21 15:23:01.430656+00	0	0	\N	2019-06-21 15:23:01.431927+00	\N	\N	2
1510	-27	小孩服饰	0	防蚊裤	2019-06-21 15:23:25.102114+00	0	0	\N	2019-06-21 15:23:25.103516+00	\N	\N	2
1511	-28	饮食	0	美购	2019-06-21 15:23:45.118825+00	0	0	\N	2019-06-21 15:23:45.120169+00	\N	\N	2
1512	-485	人情往来	0	猫咪Hape	2019-06-21 15:24:28.361385+00	0	0	\N	2019-06-21 15:24:28.362645+00	\N	\N	2
1513	-485	小孩文具	0	Hape玩具	2019-06-21 15:24:48.625048+00	0	0	\N	2019-06-21 15:24:48.626307+00	\N	\N	2
1514	-183	生活日用	0	大米和油	2019-06-21 15:25:44.522213+00	0	0	\N	2019-06-21 15:25:44.523795+00	\N	\N	2
1515	-330	小孩尿布	0	4包尿布	2019-06-21 15:26:32.073624+00	0	0	\N	2019-06-21 15:26:32.075013+00	\N	\N	2
1516	-170	生活日用	0	餐巾纸	2019-06-21 15:26:59.260994+00	0	0	\N	2019-06-21 15:26:59.262259+00	\N	\N	2
1517	-147	生活日用	0	油	2019-06-21 15:27:47.095664+00	0	0	\N	2019-06-21 15:27:47.096926+00	\N	\N	2
1518	-68	生活日用	0	食用油	2019-06-21 15:28:02.968875+00	0	0	\N	2019-06-21 15:28:02.970277+00	\N	\N	2
1519	-35	饮食	0	外卖	2019-06-21 15:29:58.930612+00	0	0	\N	2019-06-21 15:29:58.931975+00	\N	\N	2
1520	-60	饮食	0	零食	2019-06-21 15:31:34.361449+00	0	0	\N	2019-06-21 15:31:34.362763+00	\N	\N	2
1521	-33	饮食	0	水果	2019-06-25 23:17:41.213723+00	0	0	\N	2019-06-25 23:17:41.21519+00	\N	\N	2
1522	-20	生活日用	0	瓶子	2019-06-25 23:19:23.314949+00	0	0	\N	2019-06-25 23:19:23.316251+00	\N	\N	2
1523	8868	收入	0	6月工资	2019-06-25 23:23:12.699632+00	0	0	\N	2019-06-25 23:23:12.700894+00	\N	\N	2
1524	45677	收入	0	19年1-3月提成	2019-06-25 23:25:18.404718+00	0	0	\N	2019-06-25 23:25:18.406024+00	\N	\N	2
1525	25448	收入	0	18年提成	2019-06-26 13:44:24.923027+00	0	0	\N	2019-06-26 13:44:24.924406+00	\N	\N	2
\.


--
-- Name: iaer_iaer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('iaer_iaer_id_seq', 1525, true);


--
-- Data for Name: iaer_redenvelope; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY iaer_redenvelope (id, money, money_type, money_from, remark, created, user_id) FROM stdin;
74	1000	0	五姐	过年红包	2019-01-24 23:21:21.487438+00	4
75	500	0	六姐	新年红包	2019-01-25 16:36:41.11265+00	4
76	500	0	奶奶	新年红包	2019-02-05 01:06:36.753478+00	4
77	500	0	建华哥哥	新年红包	2019-02-05 01:06:49.789244+00	4
78	1000	0	江陆嬷嬷	新年红包	2019-02-05 10:51:01.154147+00	4
79	500	0	二伯伯	新年红包	2019-02-05 10:51:49.150897+00	4
80	800	0	舅舅	新年红包	2019-02-05 10:52:11.377241+00	4
81	600	0	外婆	新年红包	2019-02-05 10:52:29.019126+00	4
82	1200	0	丈母娘	新年红包	2019-02-10 00:45:48.015676+00	4
84	200	0	咸祥嬷嬷	新年红包	2019-02-10 00:46:58.643864+00	4
85	200	0	塘溪舅舅	新年红包	2019-02-10 00:47:21.09625+00	4
86	5000	0	爸爸	新年红包	2019-02-11 02:45:43.13215+00	4
87	5000	0	妈妈	新年红包	2019-02-11 02:45:55.330394+00	4
88	500	0	建辉哥	新年红包	2019-02-13 01:47:50.78305+00	4
89	1000	0	丈母娘	两岁生日红包	2019-06-09 13:22:46.629047+00	4
90	2800	0	妈妈	两岁生日红包	2019-06-09 13:23:01.246619+00	4
1	880	0	磊艳姐	出生红包	2017-06-18 12:23:48.382078+00	4
2	188	0	小强	出生红包	2017-06-18 12:24:04.21992+00	4
3	1000	0	宁波嬷嬷	出生红包	2017-06-18 12:24:32.295148+00	4
4	800	0	咸祥嬷嬷	出生红包	2017-06-18 12:27:53.33798+00	4
5	600	0	咸祥哥哥	出生红包	2017-06-18 12:28:40.339832+00	4
6	2000	0	大姐姐	出生红包	2017-06-18 12:29:12.58767+00	4
7	10000	0	丈母娘	出生红包	2017-06-18 12:29:42.928428+00	4
8	1500	0	丈母娘	催生红包	2017-06-18 12:30:00.026331+00	4
9	1200	0	江陆嬷嬷	出生红包	2017-06-18 12:30:46.200995+00	4
10	800	0	江陆大哥哥	出生红包	2017-06-18 12:31:04.54314+00	4
11	800	0	江陆小哥哥	出生红包	2017-06-18 12:31:22.459012+00	4
12	600	0	大伯伯	出生红包	2017-06-18 12:31:43.151531+00	4
13	1000	0	二伯伯	出生红包	2017-06-18 12:32:04.609331+00	4
14	1000	0	三姐姐	出生红包	2017-06-18 12:32:27.740332+00	4
15	600	0	舅舅	出生红包	2017-06-18 12:32:39.499006+00	4
16	1200	0	外婆	出生红包	2017-06-18 12:32:55.949876+00	4
17	1600	0	阿姨	出生红包	2017-06-18 12:33:08.480811+00	4
18	1600	0	管江阿姨	出生红包	2017-06-19 07:48:12.146769+00	4
19	1000	0	上海嬷嬷	出生红包	2017-06-19 07:56:08.231509+00	4
20	13000	0	妈妈	出生红包	2017-06-19 07:56:24.576739+00	4
21	1200	0	奶奶	出生红包	2017-06-20 01:23:52.182672+00	4
22	1200	0	沙村嬷嬷	出生红包	2017-06-21 00:08:29.253738+00	4
23	1200	0	沙村大阿姆	出生红包	2017-06-21 00:08:55.263453+00	4
24	1200	0	沙村小阿姆	出生红包	2017-06-21 00:09:14.296094+00	4
25	5600	0	红霞	出生红包	2017-06-22 05:57:16.857961+00	4
26	3600	0	五姐	出生红包	2017-06-22 05:58:18.451322+00	4
27	1200	0	六姐	出生红包	2017-06-22 05:58:51.728138+00	4
28	1600	0	二姐	出生红包	2017-06-22 05:59:31.027873+00	4
29	1000	0	建华哥哥	出生红包	2017-06-25 01:46:07.657558+00	4
30	600	0	小龙	出生红包	2017-07-01 11:09:59.361237+00	4
31	1200	0	塘溪舅舅	出生红包	2017-07-01 11:10:21.219857+00	4
32	1000	0	建辉哥	出生红包	2017-07-09 08:10:01.194495+00	4
33	300	0	沙村小阿姆	见面红包	2017-08-05 01:34:24.315802+00	4
34	2800	0	丈母娘	见面红包	2017-08-05 01:34:45.029717+00	4
35	1600	0	奶奶	见面红包	2017-08-05 01:35:04.622308+00	4
36	2000	0	老婆老板	出生红包	2017-08-05 01:38:17.605805+00	4
37	508	0	外婆	见面红包	2017-10-19 13:17:47.148152+00	4
38	300	0	沙村嬷嬷	见面红包	2017-10-19 13:18:07.891939+00	4
39	660	0	五姐	满月红包	2017-10-19 13:18:55.11675+00	4
40	800	0	二姐姐	新年红包	2018-02-09 10:50:23.14149+00	4
41	600	0	宁波嬷嬷	新年红包	2018-02-09 10:50:49.837051+00	4
42	1000	0	五姐	过年红包	2018-02-11 10:12:06.021698+00	4
43	800	0	六姐	新年红包	2018-02-13 14:23:40.739161+00	4
44	500	0	奶奶	新年红包	2018-02-15 05:45:20.683989+00	4
45	600	0	建华哥	新年红包	2018-02-15 10:53:50.311889+00	4
46	600	0	外婆	新年红包	2018-02-16 11:30:41.023052+00	4
47	800	0	舅舅	新年红包	2018-02-16 11:30:51.972515+00	4
48	1000	0	江陆嬷嬷	新年红包	2018-02-16 11:31:07.942173+00	4
49	500	0	二伯伯	新年红包	2018-02-16 11:31:20.766115+00	4
50	10000	0	妈妈	新年红包	2018-02-16 11:35:07.004468+00	4
51	500	0	沙村大阿姆	新年红包	2018-02-18 09:09:41.916614+00	4
52	300	0	沙村小阿姆	新年红包	2018-02-18 09:09:56.393998+00	4
53	800	0	阿姨	新年红包	2018-02-18 09:17:46.756471+00	4
54	800	0	舅舅	新年红包	2018-02-18 09:17:58.245673+00	4
55	600	0	外婆	新年红包	2018-02-18 09:18:08.994977+00	4
56	300	0	沙村嬷嬷	新年红包	2018-02-18 10:16:12.372293+00	4
57	300	0	塘溪舅舅	新年红包	2018-02-18 10:16:32.901781+00	4
58	300	0	咸祥嬷嬷	新年红包	2018-02-18 10:16:59.123331+00	4
59	200	0	塘溪阿姨	过年红包	2018-02-27 02:26:13.506074+00	4
60	600	0	建辉哥	过年红包	2018-02-27 02:26:31.816098+00	4
61	600	0	大姐姐	新年红包	2018-03-08 13:26:07.828657+00	4
62	600	0	上海哥哥	见面红包	2018-04-14 10:52:54.355358+00	4
63	600	0	上海嬷嬷	见面红包	2018-04-14 10:53:07.463848+00	4
64	600	0	上海伯伯	见面红包	2018-04-14 10:53:23.962255+00	4
65	1600	0	丈母娘	生日红包	2018-06-23 02:52:26.944656+00	4
66	600	0	江陆嬷嬷	生日红包	2018-06-23 02:52:48.676356+00	4
\.


--
-- Name: iaer_redenvelope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('iaer_redenvelope_id_seq', 93, true);


--
-- Data for Name: iaer_setting; Type: TABLE DATA; Schema: public; Owner: pi
--

COPY iaer_setting (id, home_show_current, home_show_this_month, home_show_this_year, created, modified, user_id, monthly_fund, yearly_fund) FROM stdin;
1	t	t	t	2018-12-20	2019-06-06	1	1000	20000
2	t	t	t	2018-12-21	2019-06-26	2	5000	80000
\.


--
-- Name: iaer_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pi
--

SELECT pg_catalog.setval('iaer_setting_id_seq', 2, true);


--
-- Data for Name: iaer_user; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY iaer_user (id, is_master_user, phone, gender, profile, user_type, region, locale, whats_up, zone, birthday, hobbies, highlighted, created, modified, is_email_activate, is_phone_activate, auth_user_id, fund_id) FROM stdin;
1	t	\N	2	\N	0	\N	\N	\N	\N	\N			\N	2018-11-14 06:24:03.170677+00	f	f	1	1
2	f	\N	2	\N	0	\N	\N	\N	\N	\N			\N	2018-11-21 08:23:40.702175+00	f	f	2	1
4	f	\N	2	\N	0	\N	\N	\N	\N	\N			\N	2018-11-21 08:23:55.212553+00	f	f	3	1
\.


--
-- Name: iaer_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('iaer_user_id_seq', 4, true);


--
-- Data for Name: iaer_user_slave_user; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY iaer_user_slave_user (id, from_user_id, to_user_id) FROM stdin;
1	1	2
2	2	1
\.


--
-- Name: iaer_user_slave_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('iaer_user_slave_user_id_seq', 2, true);


--
-- Data for Name: iaer_verify; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY iaer_verify (id, email_verify_code, phone_verify_code, created, user_id) FROM stdin;
\.


--
-- Name: iaer_verify_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('iaer_verify_id_seq', 1, false);


--
-- Data for Name: photo_gallery; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY photo_gallery (id, title, date_format, description) FROM stdin;
\.


--
-- Name: photo_gallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('photo_gallery_id_seq', 1, false);


--
-- Data for Name: photo_photo; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY photo_photo (id, exif_image_width, exif_image_height, exif_make, exif_model, exif_lens_make, exif_lens_model, exif_version, exif_subject_location, exif_datetime, exif_datetime_original, exif_datetime_digitized, name, labels, sub_dir, duration, sha1sum, category, version, description, pub_date, modify_date, user_id, size) FROM stdin;
\.


--
-- Data for Name: photo_photo_galleries; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY photo_photo_galleries (id, photo_id, gallery_id) FROM stdin;
\.


--
-- Name: photo_photo_galleries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('photo_photo_galleries_id_seq', 1, false);


--
-- Name: photo_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('photo_photo_id_seq', 1, false);


--
-- Data for Name: photo_user; Type: TABLE DATA; Schema: public; Owner: ben
--

COPY photo_user (id, phone, gender, profile, user_type, region, locale, whats_up, zone, birthday, hobbies, highlighted, created, modified, is_email_activate, is_phone_activate, auth_user_id, date_format) FROM stdin;
\.


--
-- Name: photo_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ben
--

SELECT pg_catalog.setval('photo_user_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: iaer_category iaer_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_category
    ADD CONSTRAINT iaer_category_pkey PRIMARY KEY (id);


--
-- Name: iaer_fund iaer_fund_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_fund
    ADD CONSTRAINT iaer_fund_pkey PRIMARY KEY (id);


--
-- Name: iaer_iaer iaer_iaer_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_iaer
    ADD CONSTRAINT iaer_iaer_pkey PRIMARY KEY (id);


--
-- Name: iaer_redenvelope iaer_redenvelope_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_redenvelope
    ADD CONSTRAINT iaer_redenvelope_pkey PRIMARY KEY (id);


--
-- Name: iaer_setting iaer_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: pi
--

ALTER TABLE ONLY iaer_setting
    ADD CONSTRAINT iaer_setting_pkey PRIMARY KEY (id);


--
-- Name: iaer_user iaer_user_auth_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user
    ADD CONSTRAINT iaer_user_auth_user_id_key UNIQUE (auth_user_id);


--
-- Name: iaer_user iaer_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user
    ADD CONSTRAINT iaer_user_pkey PRIMARY KEY (id);


--
-- Name: iaer_user_slave_user iaer_user_slave_user_from_user_id_to_user_id_95cb6a3f_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user_slave_user
    ADD CONSTRAINT iaer_user_slave_user_from_user_id_to_user_id_95cb6a3f_uniq UNIQUE (from_user_id, to_user_id);


--
-- Name: iaer_user_slave_user iaer_user_slave_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user_slave_user
    ADD CONSTRAINT iaer_user_slave_user_pkey PRIMARY KEY (id);


--
-- Name: iaer_verify iaer_verify_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_verify
    ADD CONSTRAINT iaer_verify_pkey PRIMARY KEY (id);


--
-- Name: photo_gallery photo_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_gallery
    ADD CONSTRAINT photo_gallery_pkey PRIMARY KEY (id);


--
-- Name: photo_gallery photo_gallery_title_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_gallery
    ADD CONSTRAINT photo_gallery_title_key UNIQUE (title);


--
-- Name: photo_photo_galleries photo_photo_galleries_photo_id_gallery_id_cc4ff3c9_uniq; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_photo_galleries
    ADD CONSTRAINT photo_photo_galleries_photo_id_gallery_id_cc4ff3c9_uniq UNIQUE (photo_id, gallery_id);


--
-- Name: photo_photo_galleries photo_photo_galleries_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_photo_galleries
    ADD CONSTRAINT photo_photo_galleries_pkey PRIMARY KEY (id);


--
-- Name: photo_photo photo_photo_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_photo
    ADD CONSTRAINT photo_photo_pkey PRIMARY KEY (id);


--
-- Name: photo_user photo_user_auth_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_user
    ADD CONSTRAINT photo_user_auth_user_id_key UNIQUE (auth_user_id);


--
-- Name: photo_user photo_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_user
    ADD CONSTRAINT photo_user_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: iaer_iaer_user_id_34b16ab7; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_iaer_user_id_34b16ab7 ON iaer_iaer USING btree (user_id);


--
-- Name: iaer_redenvelope_user_id_b82cd003; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_redenvelope_user_id_b82cd003 ON iaer_redenvelope USING btree (user_id);


--
-- Name: iaer_setting_user_id_834c05b8; Type: INDEX; Schema: public; Owner: pi
--

CREATE INDEX iaer_setting_user_id_834c05b8 ON iaer_setting USING btree (user_id);


--
-- Name: iaer_user_fund_id_01436f37; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_user_fund_id_01436f37 ON iaer_user USING btree (fund_id);


--
-- Name: iaer_user_slave_user_from_user_id_3c8b4f58; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_user_slave_user_from_user_id_3c8b4f58 ON iaer_user_slave_user USING btree (from_user_id);


--
-- Name: iaer_user_slave_user_to_user_id_2d7de6ec; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_user_slave_user_to_user_id_2d7de6ec ON iaer_user_slave_user USING btree (to_user_id);


--
-- Name: iaer_verify_user_id_32584bb1; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX iaer_verify_user_id_32584bb1 ON iaer_verify USING btree (user_id);


--
-- Name: photo_gallery_title_465b621f_like; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX photo_gallery_title_465b621f_like ON photo_gallery USING btree (title varchar_pattern_ops);


--
-- Name: photo_photo_galleries_gallery_id_f4d7d2ac; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX photo_photo_galleries_gallery_id_f4d7d2ac ON photo_photo_galleries USING btree (gallery_id);


--
-- Name: photo_photo_galleries_photo_id_9007e15a; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX photo_photo_galleries_photo_id_9007e15a ON photo_photo_galleries USING btree (photo_id);


--
-- Name: photo_photo_user_id_b6d9e71a; Type: INDEX; Schema: public; Owner: ben
--

CREATE INDEX photo_photo_user_id_b6d9e71a ON photo_photo USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_iaer iaer_iaer_user_id_34b16ab7_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_iaer
    ADD CONSTRAINT iaer_iaer_user_id_34b16ab7_fk_iaer_user_id FOREIGN KEY (user_id) REFERENCES iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_redenvelope iaer_redenvelope_user_id_b82cd003_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_redenvelope
    ADD CONSTRAINT iaer_redenvelope_user_id_b82cd003_fk_iaer_user_id FOREIGN KEY (user_id) REFERENCES iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_setting iaer_setting_user_id_834c05b8_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pi
--

ALTER TABLE ONLY iaer_setting
    ADD CONSTRAINT iaer_setting_user_id_834c05b8_fk_iaer_user_id FOREIGN KEY (user_id) REFERENCES iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_user iaer_user_auth_user_id_6f2857f7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user
    ADD CONSTRAINT iaer_user_auth_user_id_6f2857f7_fk_auth_user_id FOREIGN KEY (auth_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_user iaer_user_fund_id_01436f37_fk_iaer_fund_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user
    ADD CONSTRAINT iaer_user_fund_id_01436f37_fk_iaer_fund_id FOREIGN KEY (fund_id) REFERENCES iaer_fund(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_user_slave_user iaer_user_slave_user_from_user_id_3c8b4f58_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user_slave_user
    ADD CONSTRAINT iaer_user_slave_user_from_user_id_3c8b4f58_fk_iaer_user_id FOREIGN KEY (from_user_id) REFERENCES iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_user_slave_user iaer_user_slave_user_to_user_id_2d7de6ec_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_user_slave_user
    ADD CONSTRAINT iaer_user_slave_user_to_user_id_2d7de6ec_fk_iaer_user_id FOREIGN KEY (to_user_id) REFERENCES iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: iaer_verify iaer_verify_user_id_32584bb1_fk_iaer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY iaer_verify
    ADD CONSTRAINT iaer_verify_user_id_32584bb1_fk_iaer_user_id FOREIGN KEY (user_id) REFERENCES iaer_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_photo_galleries photo_photo_galleries_gallery_id_f4d7d2ac_fk_photo_gallery_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_photo_galleries
    ADD CONSTRAINT photo_photo_galleries_gallery_id_f4d7d2ac_fk_photo_gallery_id FOREIGN KEY (gallery_id) REFERENCES photo_gallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_photo_galleries photo_photo_galleries_photo_id_9007e15a_fk_photo_photo_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_photo_galleries
    ADD CONSTRAINT photo_photo_galleries_photo_id_9007e15a_fk_photo_photo_id FOREIGN KEY (photo_id) REFERENCES photo_photo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_photo photo_photo_user_id_b6d9e71a_fk_photo_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_photo
    ADD CONSTRAINT photo_photo_user_id_b6d9e71a_fk_photo_user_id FOREIGN KEY (user_id) REFERENCES photo_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo_user photo_user_auth_user_id_37b66bb2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ben
--

ALTER TABLE ONLY photo_user
    ADD CONSTRAINT photo_user_auth_user_id_37b66bb2_fk_auth_user_id FOREIGN KEY (auth_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


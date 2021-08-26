--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: stallmonitor_stallinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE stallmonitor_stallinfo (
    id integer NOT NULL,
    name character varying NOT NULL,
    stallinfo text,
    stallposterfile character varying,
    font_type character varying,
    font_colour character varying,
    stallbackgroundfile character varying,
    operatinghours json
);


ALTER TABLE stallmonitor_stallinfo OWNER TO postgres;

--
-- Name: stallinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE stallmonitor_stallinfo ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME stallinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stallmonitor_stallmenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE stallmonitor_stallmenu (
    id integer NOT NULL,
    stallmenu json NOT NULL,
    starttime time without time zone NOT NULL,
    endtime time without time zone NOT NULL,
    key integer NOT NULL,
    secondsperperson integer NOT NULL,
    openingdays json,
    menuname character varying
);


ALTER TABLE stallmonitor_stallmenu OWNER TO postgres;

--
-- Name: stallmonitor_stallmenu_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE stallmonitor_stallmenu ALTER COLUMN key ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME stallmonitor_stallmenu_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-09-18 15:29:28.337456+08
2	auth	0001_initial	2019-09-18 15:29:28.596573+08
3	admin	0001_initial	2019-09-18 15:29:28.874902+08
4	admin	0002_logentry_remove_auto_add	2019-09-18 15:29:28.958056+08
5	admin	0003_logentry_add_action_flag_choices	2019-09-18 15:29:28.967058+08
6	contenttypes	0002_remove_content_type_name	2019-09-18 15:29:29.002141+08
7	auth	0002_alter_permission_name_max_length	2019-09-18 15:29:29.00713+08
8	auth	0003_alter_user_email_max_length	2019-09-18 15:29:29.017133+08
9	auth	0004_alter_user_username_opts	2019-09-18 15:29:29.025134+08
10	auth	0005_alter_user_last_login_null	2019-09-18 15:29:29.034136+08
11	auth	0006_require_contenttypes_0002	2019-09-18 15:29:29.035522+08
12	auth	0007_alter_validators_add_error_messages	2019-09-18 15:29:29.044007+08
13	auth	0008_alter_user_username_max_length	2019-09-18 15:29:29.104743+08
14	auth	0009_alter_user_last_name_max_length	2019-09-18 15:29:29.113735+08
15	auth	0010_alter_group_name_max_length	2019-09-18 15:29:29.121747+08
16	auth	0011_update_proxy_permissions	2019-09-18 15:29:29.130739+08
17	sessions	0001_initial	2019-09-18 15:29:29.143742+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: stallmonitor_stallinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stallmonitor_stallinfo (id, name, stallinfo, stallposterfile, font_type, font_colour, stallbackgroundfile, operatinghours) FROM stdin;
4	Test case 1 (with broken font)	testentry	teststore_promotional.jpg	brokenfont	brokencolour	testimage.jpg	{\r\n\t"weekdays":"11:00h to 15:00h",\r\n\t"saturdays": "07:00h to 11:00h"\r\n}
9	Test case 2 (different days,different menu)	A Malay Store with different menus for different days	\N	\N	\N	\N	\N
7	McDonalds	Fast Food	macdonalds_promotion.jpg	\N	\N	macdonalds_background.jpg	{\r\n\t"Weekdays":"07:00h to 00:00h",\r\n\t"Saturdays":"07:00h to 00:00h",\r\n\t"Sundays": "10:00h to 22:00h"\r\n}
5	Hainanese Chicken Rice	\N	\N	\N	\N	\N	{\r\n\t"Weekdays":"07:00h to 21:00h",\r\n\t"Saturdays":"07:00h to 15:00h"\r\n}
6	Soup Delight	\N	\N	\N	\N	\N	{\r\n\t"Weekdays":"07:00h to 21:00h",\r\n\t"Saturdays":"07:00h to 15:00h"\r\n}
3	Mini Wok	\N	\N	\N	\N	\N	{\r\n\t"Weekdays":"07:00h to 21:00h",\r\n\t"Saturdays":"07:00h to 15:00h"\r\n}
1	Noodle Soup		\N	\N	blue	noodle_background.jpg	{\r\n\t"Weekdays":"07:00h to 21:00h",\r\n\t"Saturdays":"07:00h to 15:00h"\r\n}
2	Western Food	\N	\N	\N	\N	\N	{\r\n\t"Weekdays":"07:00h to 21:00h",\r\n\t"Saturdays":"07:00h to 15:00h"\r\n}
10	Test case 3 (Broken colour/ different font type)	\N	\N	Arial 20 italic	brokencolour	\N	\N
8	Test case 4(No Menu)	\N	\N	\N	\N	\N	{\r\n\t"Weekdays":"07:00h to 21:00h",\r\n\t"Saturdays":"07:00h to 15:00h"\r\n}
\.


--
-- Data for Name: stallmonitor_stallmenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stallmonitor_stallmenu (id, stallmenu, starttime, endtime, key, secondsperperson, openingdays, menuname) FROM stdin;
7	{\r\n\t"Scrambled Egg Burger with Sausage Extra Value Meal(Hashbrown)":"6.4",\r\n\t"Scrambled Egg Burger with Chicken Bacon Extra Value Meal(Hashbrown)":"6.4",\r\n\t"Breakfast Wrap Chicken Ham Extra Value Meal (Hashbrown)":"6.7",\r\n\t"Breakfast Wrap Sausage Extra Value Meal(Hashbrown)":"6.9",\r\n\t"Breakfast Deluxe Extra Value Meal (Hashbrown)":"9.1",\r\n\t"Big Breakfast Extra Value Meal (Hashbrown)":"7.6",\r\n\t"Hotcakes with Sausage Extra Value Meal (Hashbrown)":"7.4",\r\n\t"Filet-O-Fish Extra Value Meal (Hashbrown)":"6.55",\r\n\t"Egg McMuffin Extra Value Meal (Hashbrown)":"5.9",\r\n\t"Sausage McMuffin Extra Value Meal (Hashbrown)":"5.4",\r\n\t"Chicken Muffin Extra Value Meal (Hashbrown)":"5.6"\r\n\t\r\n}	04:00:00	11:00:00	6	30	{\r\n\t"days":[0,1,2,3,4,5,6]\r\n}	breakfast
4	{\r\n\t"test food 1":"5",\r\n\t"test 2":"3.0",\r\n\t"te 3":"2.55"\r\n}	08:00:00	17:00:00	3	60	\N	\N
9	{\r\n\t"Mee Batawi":"5",\r\n\t"Mee Sian":"3.0"\r\n}	08:00:00	17:00:00	10	60	{\r\n\t"days":[1,3]\r\n}	\N
9	{\r\n\t"Mee Rubus":"5",\r\n\t"Nasi Lamak":"3.0"\r\n}	08:00:00	17:00:00	9	60	{\r\n\t"days":[0,2,4]\r\n}	\N
3	{\r\n\t"Sambal Chicken Fried Rice":"3.8",\r\n\t"Fried Rice with Prawn":"3.8",\r\n\t"Fried Rice with Fillet":"3.8",\r\n\t"Ginger and Onion Pok Rice":"4.5",\r\n\t"KungBao Chicken rice":"4.2",\r\n\t"Black Pepper Chicken Rice":"4.2",\r\n\t"Pan Fried Chicken Rice":"4.2",\r\n\t"Sweet & Sour Fish Fillet Rice":"4.2",\r\n\t"Mixed Veg Toufu":"4",\r\n\t"Fried Beef Hor Fun":"4.8",\r\n\t"Seafood Ee Mee":"3.8",\r\n\t"Seafood Beehoon":"3.8",\r\n\t"Ginger & Onion Beef Rice":"4.5",\r\n\t"Seafood Hokkien Mee":"3.8"\r\n}	08:00:00	17:00:00	8	60	\N	\N
1	{\r\n\t"Ban Mian/Mee Hoon Kway":"3",\r\n\t"U Mian":"3",\r\n\t"Mee Sua":"3",\r\n\t"Yi Mian/Koka Mian":"3",\r\n\t"Thin Bee Hoon":"3",\r\n\t"Sichuan Veg Ban Mian":"3.5",\r\n\t"Dumpling Ban Mian":"3.5",\r\n\t"Tom Yam Ban Mian":"3.8",\r\n\t"Spicey & Sour Noodle":"3.5",\r\n\t"Zha-Jiang Mian":"3.5",\r\n\t"Sliced Fish Ban Mian":"3.8",\r\n\t"Sliced Fish Bee Hoon":"3.8",\r\n\t"Fried Fish Bee Hoon":"3.8",\r\n\t"Fried Fish Soup":"3.8",\r\n\t"Sliced Fish Soup":"3.8",\r\n\t"Seafood Soup":"3.8",\r\n\t"Fish Porridge":"3.8",\r\n\t"Fried Dumpling (6pcs)":"3.3",\r\n\t"Steamed Dumpling (6pcs)":"3.3",\r\n\t"Rice":"0.5",\r\n\t"Take-away Add":"0.2"\r\n}	08:00:00	17:00:00	1	60	\N	\N
5	{\r\n\t"Steamed/Roasted Chicken Rice Set":"4.5",\r\n\t"Steamed Chicken Rice":"3",\r\n\t"Roasted Chicken Rice":"3",\r\n\t"Lemon Chicken Rice":"3",\r\n\t"Curry Chicken Noodle":"3",\r\n\t"Chicken Hor Fun":"3",\r\n\t"Roasted Chicken Noodle":"3",\r\n\t"Soya Sauce Veg":"2",\r\n\t"Bean Sprout":"2",\r\n\t"Thai Style Beancurd":"2",\r\n\t"Chicken Organ":"0.6",\r\n\t"Chicken Drumstick&Rice":"3.5",\r\n\t"Chicken Wing":"1.6",\r\n\t"Braised Egg":"0.6",\r\n\t"Dry Beancurd":"0.5"\r\n}	08:00:00	17:00:00	4	60	\N	\N
6	{\r\n\t"Pho Beef Kway Teow Soup":"5",\r\n\t"Spicy Beef Noodle":"4.8",\r\n\t"Grilled Meat Noodle":"4.8",\r\n\t"Chicken Kway Teow Soup":"4.8",\r\n\t"Grilled Chicken Rice":"4.8",\r\n\t"Grilled Pork Rice":"4.8",\r\n\t"Meat Roll":"4.8",\r\n\t"Add beef":"2",\r\n\t"Add Chicken":"1",\r\n\t"Add Meat Roll":"1.5",\r\n\t"Add Noodle":"0.6",\r\n\t"Add Egg/Vege/Rice":"0.6"\r\n}	08:00:00	17:00:00	5	60	\N	\N
2	{\r\n\t"Chargrill Chicken Set":"4.8",\r\n\t"Black Pepper Chicken Set":"4.8",\r\n\t"Jumbo Chicken Set":"4.8",\r\n\t"Grill Fish with Italian Herb Set":"4.8",\r\n\t"Fried Bread Crumbs Fish Set":"4.8",\r\n\t"Grill Salmon Fish Set":"6.5",\r\n\t"Grill Pork Chop Set":"5.8",\r\n\t"Grill Sirloin Steak Set":"6.0",\r\n\t"Chicken Spaghetti with Cream Sauce":"4.2",\r\n\t"Chcken Bolognese":"4.2",\r\n\t"Chicken Aglio Olio":"4.2",\r\n\t"Garlic Bread":"1.5",\r\n\t"Mashed Potato":"1.2",\r\n\t"Potato Salad":"2.2",\r\n\t"Cheese Fried":"3.2"\r\n\t\r\n}	08:00:00	17:00:00	2	60	\N	\N
7	{\r\n\t"Grilled Chicken Sandwich Extra Value Meal (M Fries)":"8.4",\r\n\t"Crispy Fish Sandwich Extra Value Meal (M Fries)":"8.4",\r\n\t"Classic Angus Cheese Extra Value Meal (M Fries)":"11.5",\r\n\t"The Original Angus Extra Value Meal (M Fries)":"8.75",\r\n\t"Buttermilk Crispy Chicken Extra Value Meal (M Fries)":"9.65",\r\n\t"McSpicy Extra Value Meal (M Fries)":"7.9",\r\n\t"McChicken Extra Value Meal (M Fries)":"5.95",\r\n\t"Grilled Chicken McWrap Extra Value Meal (M Fries)":"8.25",\r\n\t"McWings 4pc Extra Value Meal (M Fries)":"6.95",\r\n\t"Chicken McNuggets (6pc) Extra Value Meal (M Fries)":"6.85",\r\n\t"Filet-O-Fish Extra Value Meal (M Fries)":"6.55",\r\n\t"Big Mac Extra Value Meal (M Fries)":"8.65",\r\n\t"Double Cheeseburger Extra Value Meal (M Fries)":"6.95",\r\n\t"Cheeseburger":"3.2",\r\n\t"Hamburger":"2.6",\r\n\t"Cheeseburger Happy Meal":"5.2",\r\n\t"Chicken McNuggets 4pc Happy Meal":"5.2"\r\n\t\r\n}	11:00:00	04:00:00	7	60	{\r\n\t"days":[0,1,2,3,4,5,6]\r\n}	regular
10	{\r\n\t"test food 1":"5",\r\n\t"test 2":"3.0",\r\n\t"te 3":"2.55"\r\n}	08:00:00	17:00:00	11	60	\N	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 24, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 6, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 17, true);


--
-- Name: stallinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stallinfo_id_seq', 10, true);


--
-- Name: stallmonitor_stallmenu_key_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stallmonitor_stallmenu_key_seq', 11, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


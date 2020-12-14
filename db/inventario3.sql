--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 10.12

-- Started on 2020-08-17 08:53:49

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

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 213 (class 1259 OID 910667)
-- Name: almacen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacen (
    id_almacen integer NOT NULL,
    nombre_almacen character varying NOT NULL
);


ALTER TABLE public.almacen OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 910665)
-- Name: almacen_id_almacen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.almacen_id_almacen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.almacen_id_almacen_seq OWNER TO postgres;

--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 212
-- Name: almacen_id_almacen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.almacen_id_almacen_seq OWNED BY public.almacen.id_almacen;


--
-- TOC entry 223 (class 1259 OID 910719)
-- Name: autorizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autorizacion (
    id_autorizacion integer NOT NULL,
    id_user integer NOT NULL,
    fecha_hora_aprobacion time without time zone NOT NULL,
    detalle character varying NOT NULL,
    fecha_orden_salida time without time zone NOT NULL
);


ALTER TABLE public.autorizacion OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 910717)
-- Name: autorizacion_id_autorizacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autorizacion_id_autorizacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autorizacion_id_autorizacion_seq OWNER TO postgres;

--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 222
-- Name: autorizacion_id_autorizacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autorizacion_id_autorizacion_seq OWNED BY public.autorizacion.id_autorizacion;


--
-- TOC entry 205 (class 1259 OID 910623)
-- Name: bienes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bienes (
    id_bienes integer NOT NULL,
    id_modelo integer NOT NULL,
    id_tipo_bien integer NOT NULL,
    descripcion character varying NOT NULL,
    numero_bien character varying NOT NULL,
    serial character varying NOT NULL,
    cantidad character varying NOT NULL
);


ALTER TABLE public.bienes OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 910621)
-- Name: bienes_id_bienes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bienes_id_bienes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bienes_id_bienes_seq OWNER TO postgres;

--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 204
-- Name: bienes_id_bienes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bienes_id_bienes_seq OWNED BY public.bienes.id_bienes;


--
-- TOC entry 200 (class 1259 OID 910594)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id_marca integer NOT NULL,
    nombre_marca character varying NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 910645)
-- Name: marco_normativo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marco_normativo (
    id_marco_normativo integer NOT NULL,
    descripcion character varying NOT NULL,
    estado character varying NOT NULL
);


ALTER TABLE public.marco_normativo OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 910643)
-- Name: marco_normativo_id_marco_normativo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marco_normativo_id_marco_normativo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marco_normativo_id_marco_normativo_seq OWNER TO postgres;

--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 208
-- Name: marco_normativo_id_marco_normativo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marco_normativo_id_marco_normativo_seq OWNED BY public.marco_normativo.id_marco_normativo;


--
-- TOC entry 202 (class 1259 OID 910604)
-- Name: modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelo (
    id_modelo integer NOT NULL,
    id_marca integer NOT NULL,
    nombre_modelo character varying NOT NULL
);


ALTER TABLE public.modelo OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 910602)
-- Name: modelo_id_modelo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modelo_id_modelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modelo_id_modelo_seq OWNER TO postgres;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 201
-- Name: modelo_id_modelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modelo_id_modelo_seq OWNED BY public.modelo.id_modelo;


--
-- TOC entry 227 (class 1259 OID 910741)
-- Name: orden_detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_detalle (
    id_orden_detalle integer NOT NULL,
    id_orden_salida character varying NOT NULL,
    id_bienes integer NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.orden_detalle OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 910739)
-- Name: orden_detalle_id_orden_salida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_detalle_id_orden_salida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_detalle_id_orden_salida_seq OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 226
-- Name: orden_detalle_id_orden_salida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orden_detalle_id_orden_salida_seq OWNED BY public.orden_detalle.id_orden_detalle;


--
-- TOC entry 207 (class 1259 OID 910634)
-- Name: orden_devolucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_devolucion (
    id_orden_devolucion integer NOT NULL,
    nota character varying NOT NULL,
    fecha_hora_entrega character varying NOT NULL
);


ALTER TABLE public.orden_devolucion OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 910632)
-- Name: orden_devolucion_id_orden_devolucion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_devolucion_id_orden_devolucion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_devolucion_id_orden_devolucion_seq OWNER TO postgres;

--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 206
-- Name: orden_devolucion_id_orden_devolucion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orden_devolucion_id_orden_devolucion_seq OWNED BY public.orden_devolucion.id_orden_devolucion;


--
-- TOC entry 225 (class 1259 OID 910730)
-- Name: orden_salida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_salida (
    id_orden_salida character varying NOT NULL,
    id_user integer NOT NULL,
    id_autorizacion integer NOT NULL,
    id_orden_devolucion integer NOT NULL,
    id_marco_normativo integer NOT NULL,
    id_tipo_orden integer NOT NULL,
    id_almacen integer NOT NULL,
    id_usado integer NOT NULL,
    id_tipo integer NOT NULL,
    nombre_responsable character varying NOT NULL,
    cedula_responsable integer NOT NULL,
    gerencia_responsable character varying NOT NULL,
    destino character varying NOT NULL,
    fecha_hora_salida time without time zone NOT NULL,
    fecha_hora_entrada time without time zone NOT NULL,
    estado boolean NOT NULL,
    ticket integer NOT NULL
);


ALTER TABLE public.orden_salida OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 910728)
-- Name: orden_salida_id_orden_salida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_salida_id_orden_salida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orden_salida_id_orden_salida_seq OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 224
-- Name: orden_salida_id_orden_salida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orden_salida_id_orden_salida_seq OWNED BY public.orden_salida.id_orden_salida;


--
-- TOC entry 219 (class 1259 OID 910700)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    id_user integer NOT NULL,
    correo_electronico character varying(48) NOT NULL,
    cedula character varying(15) NOT NULL,
    primer_nombre character varying(20) NOT NULL,
    primer_apellido character varying(20) NOT NULL,
    segundo_apellido character varying(20) NOT NULL,
    segundo_nombre character varying(20) NOT NULL
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 910698)
-- Name: persona_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_id_user_seq OWNER TO postgres;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 218
-- Name: persona_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_id_user_seq OWNED BY public.persona.id_user;


--
-- TOC entry 197 (class 1259 OID 910574)
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id_planes integer NOT NULL,
    nombre_planes character varying NOT NULL
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 910572)
-- Name: planes_id_planes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_planes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planes_id_planes_seq OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 196
-- Name: planes_id_planes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_planes_seq OWNED BY public.planes.id_planes;


--
-- TOC entry 231 (class 1259 OID 910760)
-- Name: planes_telefono; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes_telefono (
    id_telefono_planes integer NOT NULL,
    id_telefono integer NOT NULL,
    id_planes integer NOT NULL
);


ALTER TABLE public.planes_telefono OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 910758)
-- Name: planes_telefono_id_telefono_planes_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_telefono_id_telefono_planes_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planes_telefono_id_telefono_planes_seq OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 230
-- Name: planes_telefono_id_telefono_planes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_telefono_id_telefono_planes_seq OWNED BY public.planes_telefono.id_telefono_planes;


--
-- TOC entry 221 (class 1259 OID 910708)
-- Name: solicitud_bien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitud_bien (
    id_solicitud_bien integer NOT NULL,
    id_user integer NOT NULL,
    id_tipo_bien integer NOT NULL,
    id_almacen integer NOT NULL,
    id_bienes integer NOT NULL,
    nombre_bien character varying NOT NULL
);


ALTER TABLE public.solicitud_bien OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 910706)
-- Name: solicitud_bien_id_solicitud_bien_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solicitud_bien_id_solicitud_bien_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitud_bien_id_solicitud_bien_seq OWNER TO postgres;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 220
-- Name: solicitud_bien_id_solicitud_bien_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solicitud_bien_id_solicitud_bien_seq OWNED BY public.solicitud_bien.id_solicitud_bien;


--
-- TOC entry 199 (class 1259 OID 910585)
-- Name: tarifas_adicionales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarifas_adicionales (
    id_tarifas_adicionales integer NOT NULL,
    nombre_traifas_adicionales character varying NOT NULL,
    estado_tarifas boolean NOT NULL
);


ALTER TABLE public.tarifas_adicionales OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 910583)
-- Name: tarifas_adicionales_id_tarifas_adicionales_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarifas_adicionales_id_tarifas_adicionales_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarifas_adicionales_id_tarifas_adicionales_seq OWNER TO postgres;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 198
-- Name: tarifas_adicionales_id_tarifas_adicionales_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarifas_adicionales_id_tarifas_adicionales_seq OWNED BY public.tarifas_adicionales.id_tarifas_adicionales;


--
-- TOC entry 229 (class 1259 OID 910752)
-- Name: telefono; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telefono (
    id_telefono integer NOT NULL,
    id_orden_detalle integer NOT NULL,
    id_tarifas_adicionales integer NOT NULL,
    numero_telefonico numeric(11,0) NOT NULL
);


ALTER TABLE public.telefono OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 910750)
-- Name: telefono_id_telefono_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.telefono_id_telefono_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telefono_id_telefono_seq OWNER TO postgres;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 228
-- Name: telefono_id_telefono_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.telefono_id_telefono_seq OWNED BY public.telefono.id_telefono;


--
-- TOC entry 217 (class 1259 OID 910689)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo (
    id_tipo integer NOT NULL,
    nombre_tipo character varying NOT NULL
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 910613)
-- Name: tipo_bien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_bien (
    id_tipo_bien integer NOT NULL,
    nombre_tipo_bien character varying NOT NULL
);


ALTER TABLE public.tipo_bien OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 910687)
-- Name: tipo_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_id_tipo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_id_tipo_seq OWNER TO postgres;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_id_tipo_seq OWNED BY public.tipo.id_tipo;


--
-- TOC entry 215 (class 1259 OID 910678)
-- Name: tipo_orden; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_orden (
    id_tipo_orden integer NOT NULL,
    nombre_tipo_orden character varying NOT NULL
);


ALTER TABLE public.tipo_orden OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 910676)
-- Name: tipo_orden_id_tipo_orden_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_orden_id_tipo_orden_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_orden_id_tipo_orden_seq OWNER TO postgres;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 214
-- Name: tipo_orden_id_tipo_orden_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_orden_id_tipo_orden_seq OWNED BY public.tipo_orden.id_tipo_orden;


--
-- TOC entry 211 (class 1259 OID 910656)
-- Name: usado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usado (
    id_usado integer NOT NULL,
    nombre_usado character varying NOT NULL
);


ALTER TABLE public.usado OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 910654)
-- Name: usado_id_usado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usado_id_usado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usado_id_usado_seq OWNER TO postgres;

CREATE TABLE public.usuario
(
    id integer NOT NULL,
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    email character varying(80) COLLATE pg_catalog."default" NOT NULL,
    password character varying(250) COLLATE pg_catalog."default" NOT NULL,
    authkey character varying(250) COLLATE pg_catalog."default" NOT NULL,
    accesstoken character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT usuario_pkey PRIMARY KEY (id)
)

ALTER TABLE public.usuario OWNER TO postgres;


CREATE SEQUENCE public.tipo_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 210
-- Name: usado_id_usado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usado_id_usado_seq OWNED BY public.usado.id_usado;


--
-- TOC entry 2797 (class 2604 OID 910670)
-- Name: almacen id_almacen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacen ALTER COLUMN id_almacen SET DEFAULT nextval('public.almacen_id_almacen_seq'::regclass);


--
-- TOC entry 2802 (class 2604 OID 910722)
-- Name: autorizacion id_autorizacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorizacion ALTER COLUMN id_autorizacion SET DEFAULT nextval('public.autorizacion_id_autorizacion_seq'::regclass);


--
-- TOC entry 2793 (class 2604 OID 910626)
-- Name: bienes id_bienes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bienes ALTER COLUMN id_bienes SET DEFAULT nextval('public.bienes_id_bienes_seq'::regclass);


--
-- TOC entry 2795 (class 2604 OID 910648)
-- Name: marco_normativo id_marco_normativo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marco_normativo ALTER COLUMN id_marco_normativo SET DEFAULT nextval('public.marco_normativo_id_marco_normativo_seq'::regclass);


--
-- TOC entry 2792 (class 2604 OID 910607)
-- Name: modelo id_modelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo ALTER COLUMN id_modelo SET DEFAULT nextval('public.modelo_id_modelo_seq'::regclass);


--
-- TOC entry 2804 (class 2604 OID 910744)
-- Name: orden_detalle id_orden_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_detalle ALTER COLUMN id_orden_detalle SET DEFAULT nextval('public.orden_detalle_id_orden_salida_seq'::regclass);


--
-- TOC entry 2794 (class 2604 OID 910637)
-- Name: orden_devolucion id_orden_devolucion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_devolucion ALTER COLUMN id_orden_devolucion SET DEFAULT nextval('public.orden_devolucion_id_orden_devolucion_seq'::regclass);


--
-- TOC entry 2803 (class 2604 OID 910733)
-- Name: orden_salida id_orden_salida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida ALTER COLUMN id_orden_salida SET DEFAULT nextval('public.orden_salida_id_orden_salida_seq'::regclass);


--
-- TOC entry 2800 (class 2604 OID 910703)
-- Name: persona id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona ALTER COLUMN id_user SET DEFAULT nextval('public.persona_id_user_seq'::regclass);


--
-- TOC entry 2790 (class 2604 OID 910577)
-- Name: planes id_planes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id_planes SET DEFAULT nextval('public.planes_id_planes_seq'::regclass);


--
-- TOC entry 2806 (class 2604 OID 910763)
-- Name: planes_telefono id_telefono_planes; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes_telefono ALTER COLUMN id_telefono_planes SET DEFAULT nextval('public.planes_telefono_id_telefono_planes_seq'::regclass);


--
-- TOC entry 2801 (class 2604 OID 910711)
-- Name: solicitud_bien id_solicitud_bien; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitud_bien ALTER COLUMN id_solicitud_bien SET DEFAULT nextval('public.solicitud_bien_id_solicitud_bien_seq'::regclass);


--
-- TOC entry 2791 (class 2604 OID 910588)
-- Name: tarifas_adicionales id_tarifas_adicionales; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifas_adicionales ALTER COLUMN id_tarifas_adicionales SET DEFAULT nextval('public.tarifas_adicionales_id_tarifas_adicionales_seq'::regclass);


--
-- TOC entry 2805 (class 2604 OID 910755)
-- Name: telefono id_telefono; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefono ALTER COLUMN id_telefono SET DEFAULT nextval('public.telefono_id_telefono_seq'::regclass);


--
-- TOC entry 2799 (class 2604 OID 910692)
-- Name: tipo id_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo ALTER COLUMN id_tipo SET DEFAULT nextval('public.tipo_id_tipo_seq'::regclass);


--
-- TOC entry 2798 (class 2604 OID 910681)
-- Name: tipo_orden id_tipo_orden; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_orden ALTER COLUMN id_tipo_orden SET DEFAULT nextval('public.tipo_orden_id_tipo_orden_seq'::regclass);


--
-- TOC entry 2796 (class 2604 OID 910659)
-- Name: usado id_usado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usado ALTER COLUMN id_usado SET DEFAULT nextval('public.usado_id_usado_seq'::regclass);


--
-- TOC entry 3005 (class 0 OID 910667)
-- Dependencies: 213
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.almacen (id_almacen, nombre_almacen) FROM stdin;



--
-- TOC entry 3015 (class 0 OID 910719)
-- Dependencies: 223
-- Data for Name: autorizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autorizacion (id_autorizacion, id_user, fecha_hora_aprobacion, detalle, fecha_orden_salida) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 910623)
-- Dependencies: 205
-- Data for Name: bienes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bienes (id_bienes, id_modelo, id_tipo_bien, descripcion, numero_bien, serial, cantidad) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 910594)
-- Dependencies: 200
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marca (id_marca, nombre_marca) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 910645)
-- Dependencies: 209
-- Data for Name: marco_normativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marco_normativo (id_marco_normativo, descripcion, estado) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 910604)
-- Dependencies: 202
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modelo (id_modelo, id_marca, nombre_modelo) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 910741)
-- Dependencies: 227
-- Data for Name: orden_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orden_detalle (id_orden_detalle, id_orden_salida, id_bienes, cantidad) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 910634)
-- Dependencies: 207
-- Data for Name: orden_devolucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orden_devolucion (id_orden_devolucion, nota, fecha_hora_entrega) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 910730)
-- Dependencies: 225
-- Data for Name: orden_salida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orden_salida (id_orden_salida, id_user, id_autorizacion, id_orden_devolucion, id_marco_normativo, id_tipo_orden, id_almacen, id_usado, id_tipo, nombre_responsable, cedula_responsable, gerencia_responsable, destino, fecha_hora_salida, fecha_hora_entrada, estado, ticket) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 910700)
-- Dependencies: 219
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (id_user, correo_electronico, cedula, primer_nombre, primer_apellido, segundo_apellido, segundo_nombre) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 910574)
-- Dependencies: 197
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id_planes, nombre_planes) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 910760)
-- Dependencies: 231
-- Data for Name: planes_telefono; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes_telefono (id_telefono_planes, id_telefono, id_planes) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 910708)
-- Dependencies: 221
-- Data for Name: solicitud_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solicitud_bien (id_solicitud_bien, id_user, id_tipo_bien, id_almacen, id_bienes, nombre_bien) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 910585)
-- Dependencies: 199
-- Data for Name: tarifas_adicionales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarifas_adicionales (id_tarifas_adicionales, nombre_traifas_adicionales, estado_tarifas) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 910752)
-- Dependencies: 229
-- Data for Name: telefono; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telefono (id_telefono, id_orden_detalle, id_tarifas_adicionales, numero_telefonico) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 910689)
-- Dependencies: 217
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo (id_tipo, nombre_tipo) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 910613)
-- Dependencies: 203
-- Data for Name: tipo_bien; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_bien (id_tipo_bien, nombre_tipo_bien) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 910678)
-- Dependencies: 215
-- Data for Name: tipo_orden; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_orden (id_tipo_orden, nombre_tipo_orden) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 910656)
-- Dependencies: 211
-- Data for Name: usado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usado (id_usado, nombre_usado) FROM stdin;
\.


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 212
-- Name: almacen_id_almacen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.almacen_id_almacen_seq', 1, false);


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 222
-- Name: autorizacion_id_autorizacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autorizacion_id_autorizacion_seq', 1, false);


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 204
-- Name: bienes_id_bienes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bienes_id_bienes_seq', 1, false);


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 208
-- Name: marco_normativo_id_marco_normativo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marco_normativo_id_marco_normativo_seq', 1, false);


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 201
-- Name: modelo_id_modelo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modelo_id_modelo_seq', 1, false);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 226
-- Name: orden_detalle_id_orden_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orden_detalle_id_orden_salida_seq', 1, false);


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 206
-- Name: orden_devolucion_id_orden_devolucion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orden_devolucion_id_orden_devolucion_seq', 1, false);


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 224
-- Name: orden_salida_id_orden_salida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orden_salida_id_orden_salida_seq', 1, false);


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 218
-- Name: persona_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_id_user_seq', 1, true);


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 196
-- Name: planes_id_planes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_planes_seq', 1, false);


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 230
-- Name: planes_telefono_id_telefono_planes_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_telefono_id_telefono_planes_seq', 1, false);


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 220
-- Name: solicitud_bien_id_solicitud_bien_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solicitud_bien_id_solicitud_bien_seq', 1, false);


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 198
-- Name: tarifas_adicionales_id_tarifas_adicionales_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarifas_adicionales_id_tarifas_adicionales_seq', 1, false);


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 228
-- Name: telefono_id_telefono_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.telefono_id_telefono_seq', 1, false);


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_id_tipo_seq', 1, false);


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 214
-- Name: tipo_orden_id_tipo_orden_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_orden_id_tipo_orden_seq', 1, false);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 210
-- Name: usado_id_usado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usado_id_usado_seq', 1, false);


--
-- TOC entry 2826 (class 2606 OID 910675)
-- Name: almacen almacen_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacen
    ADD CONSTRAINT almacen_pk PRIMARY KEY (id_almacen);


--
-- TOC entry 2836 (class 2606 OID 910727)
-- Name: autorizacion autorizacion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorizacion
    ADD CONSTRAINT autorizacion_pk PRIMARY KEY (id_autorizacion);


--
-- TOC entry 2818 (class 2606 OID 910631)
-- Name: bienes bienes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bienes
    ADD CONSTRAINT bienes_pk PRIMARY KEY (id_bienes);


--
-- TOC entry 2812 (class 2606 OID 910601)
-- Name: marca marca_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pk PRIMARY KEY (id_marca);


--
-- TOC entry 2822 (class 2606 OID 910653)
-- Name: marco_normativo marco_normativo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marco_normativo
    ADD CONSTRAINT marco_normativo_pk PRIMARY KEY (id_marco_normativo);


--
-- TOC entry 2814 (class 2606 OID 910612)
-- Name: modelo modelo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pk PRIMARY KEY (id_modelo);


--
-- TOC entry 2840 (class 2606 OID 910749)
-- Name: orden_detalle orden_detalle_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_detalle
    ADD CONSTRAINT orden_detalle_pk PRIMARY KEY (id_orden_detalle);


--
-- TOC entry 2820 (class 2606 OID 910642)
-- Name: orden_devolucion orden_devolucion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_devolucion
    ADD CONSTRAINT orden_devolucion_pk PRIMARY KEY (id_orden_devolucion);


--
-- TOC entry 2838 (class 2606 OID 910738)
-- Name: orden_salida orden_salida_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida
    ADD CONSTRAINT orden_salida_pk PRIMARY KEY (id_orden_salida);


--
-- TOC entry 2832 (class 2606 OID 910705)
-- Name: persona persona_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pk PRIMARY KEY (id_user);


--
-- TOC entry 2808 (class 2606 OID 910582)
-- Name: planes planes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pk PRIMARY KEY (id_planes);


--
-- TOC entry 2844 (class 2606 OID 910765)
-- Name: planes_telefono planes_telefono_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes_telefono
    ADD CONSTRAINT planes_telefono_pk PRIMARY KEY (id_telefono_planes);


--
-- TOC entry 2834 (class 2606 OID 910716)
-- Name: solicitud_bien solicitud_bien_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitud_bien
    ADD CONSTRAINT solicitud_bien_pk PRIMARY KEY (id_solicitud_bien);


--
-- TOC entry 2810 (class 2606 OID 910593)
-- Name: tarifas_adicionales tarifas_adicionales_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarifas_adicionales
    ADD CONSTRAINT tarifas_adicionales_pk PRIMARY KEY (id_tarifas_adicionales);


--
-- TOC entry 2842 (class 2606 OID 910757)
-- Name: telefono telefono_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefono
    ADD CONSTRAINT telefono_pk PRIMARY KEY (id_telefono);


--
-- TOC entry 2816 (class 2606 OID 910620)
-- Name: tipo_bien tipo_bien_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_bien
    ADD CONSTRAINT tipo_bien_pk PRIMARY KEY (id_tipo_bien);


--
-- TOC entry 2828 (class 2606 OID 910686)
-- Name: tipo_orden tipo_orden_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_orden
    ADD CONSTRAINT tipo_orden_pk PRIMARY KEY (id_tipo_orden);


--
-- TOC entry 2830 (class 2606 OID 910697)
-- Name: tipo tipo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pk PRIMARY KEY (id_tipo);


--
-- TOC entry 2824 (class 2606 OID 910664)
-- Name: usado usado_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usado
    ADD CONSTRAINT usado_pk PRIMARY KEY (id_usado);


--
-- TOC entry 2856 (class 2606 OID 910821)
-- Name: orden_salida almacen_orden_salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida
    ADD CONSTRAINT almacen_orden_salida_fk FOREIGN KEY (id_almacen) REFERENCES public.almacen(id_almacen) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE;


--
-- TOC entry 2850 (class 2606 OID 910826)
-- Name: solicitud_bien almacen_solicitud_bien_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitud_bien
    ADD CONSTRAINT almacen_solicitud_bien_fk FOREIGN KEY (id_almacen) REFERENCES public.almacen(id_almacen);


--
-- TOC entry 2860 (class 2606 OID 910856)
-- Name: orden_salida autorizacion_orden_salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida
    ADD CONSTRAINT autorizacion_orden_salida_fk FOREIGN KEY (id_autorizacion) REFERENCES public.autorizacion(id_autorizacion) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2861 (class 2606 OID 910796)
-- Name: orden_detalle bienes_orden_detalle_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_detalle
    ADD CONSTRAINT bienes_orden_detalle_fk FOREIGN KEY (id_bienes) REFERENCES public.bienes(id_bienes) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2849 (class 2606 OID 910801)
-- Name: solicitud_bien bienes_solicitud_bien_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitud_bien
    ADD CONSTRAINT bienes_solicitud_bien_fk FOREIGN KEY (id_bienes) REFERENCES public.bienes(id_bienes);


--
-- TOC entry 2845 (class 2606 OID 910776)
-- Name: modelo marca_modelo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT marca_modelo_fk FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2854 (class 2606 OID 910811)
-- Name: orden_salida marco_normativo_orden_salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida
    ADD CONSTRAINT marco_normativo_orden_salida_fk FOREIGN KEY (id_marco_normativo) REFERENCES public.marco_normativo(id_marco_normativo) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2846 (class 2606 OID 910781)
-- Name: bienes modelo_bienes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bienes
    ADD CONSTRAINT modelo_bienes_fk FOREIGN KEY (id_modelo) REFERENCES public.modelo(id_modelo) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2864 (class 2606 OID 910866)
-- Name: telefono orden_detalle_telefono_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefono
    ADD CONSTRAINT orden_detalle_telefono_fk FOREIGN KEY (id_orden_detalle) REFERENCES public.orden_detalle(id_orden_detalle) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2853 (class 2606 OID 910806)
-- Name: orden_salida orden_devolucion_orden_salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida
    ADD CONSTRAINT orden_devolucion_orden_salida_fk FOREIGN KEY (id_orden_devolucion) REFERENCES public.orden_devolucion(id_orden_devolucion) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2862 (class 2606 OID 910861)
-- Name: orden_detalle orden_salida_orden_detalle_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_detalle
    ADD CONSTRAINT orden_salida_orden_detalle_fk FOREIGN KEY (id_orden_salida) REFERENCES public.orden_salida(id_orden_salida) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2865 (class 2606 OID 910766)
-- Name: planes_telefono planes_planes_telefono_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes_telefono
    ADD CONSTRAINT planes_planes_telefono_fk FOREIGN KEY (id_planes) REFERENCES public.planes(id_planes) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2863 (class 2606 OID 910771)
-- Name: telefono tarifas_adicionales_telefono_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telefono
    ADD CONSTRAINT tarifas_adicionales_telefono_fk FOREIGN KEY (id_tarifas_adicionales) REFERENCES public.tarifas_adicionales(id_tarifas_adicionales) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2866 (class 2606 OID 910871)
-- Name: planes_telefono telefono_planes_telefono_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes_telefono
    ADD CONSTRAINT telefono_planes_telefono_fk FOREIGN KEY (id_telefono) REFERENCES public.telefono(id_telefono) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2847 (class 2606 OID 910786)
-- Name: bienes tipo_bien_bienes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bienes
    ADD CONSTRAINT tipo_bien_bienes_fk FOREIGN KEY (id_tipo_bien) REFERENCES public.tipo_bien(id_tipo_bien) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2848 (class 2606 OID 910791)
-- Name: solicitud_bien tipo_bien_solicitud_bien_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitud_bien
    ADD CONSTRAINT tipo_bien_solicitud_bien_fk FOREIGN KEY (id_tipo_bien) REFERENCES public.tipo_bien(id_tipo_bien);


--
-- TOC entry 2857 (class 2606 OID 910831)
-- Name: orden_salida tipo_orden_orden_salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida
    ADD CONSTRAINT tipo_orden_orden_salida_fk FOREIGN KEY (id_tipo_orden) REFERENCES public.tipo_orden(id_tipo_orden) ON UPDATE CASCADE ON DELETE RESTRICT DEFERRABLE;


--
-- TOC entry 2858 (class 2606 OID 910836)
-- Name: orden_salida tipo_orden_salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida
    ADD CONSTRAINT tipo_orden_salida_fk FOREIGN KEY (id_tipo) REFERENCES public.tipo(id_tipo);


--
-- TOC entry 2855 (class 2606 OID 910816)
-- Name: orden_salida usado_orden_salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida
    ADD CONSTRAINT usado_orden_salida_fk FOREIGN KEY (id_usado) REFERENCES public.usado(id_usado) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2852 (class 2606 OID 910846)
-- Name: autorizacion usuario_autorizacion_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorizacion
    ADD CONSTRAINT usuario_autorizacion_fk FOREIGN KEY (id_user) REFERENCES public.persona(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2859 (class 2606 OID 910841)
-- Name: orden_salida usuario_orden_salida_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_salida
    ADD CONSTRAINT usuario_orden_salida_fk FOREIGN KEY (id_user) REFERENCES public.persona(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2851 (class 2606 OID 910851)
-- Name: solicitud_bien usuario_solicitud_bien_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitud_bien
    ADD CONSTRAINT usuario_solicitud_bien_fk FOREIGN KEY (id_user) REFERENCES public.persona(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2020-08-17 08:53:54

--
-- PostgreSQL database dump complete
--


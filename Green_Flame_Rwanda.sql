--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-26 18:32:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 25253)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    region character varying(50),
    customer_type character varying(30),
    phone character varying(20)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25252)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 25296)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    name character varying(100) NOT NULL,
    role character varying(50) NOT NULL,
    salary numeric(10,2) NOT NULL,
    phone character varying(20)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25295)
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_employee_id_seq OWNER TO postgres;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 225
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- TOC entry 224 (class 1259 OID 25283)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date date,
    delivery_date date,
    status character varying(20),
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'delivered'::character varying, 'cancelled'::character varying])::text[])))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25282)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 234 (class 1259 OID 25345)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    order_id integer,
    amount numeric(10,2),
    method character varying(20),
    payment_date date,
    CONSTRAINT payments_method_check CHECK (((method)::text = ANY ((ARRAY['cash'::character varying, 'MoMo'::character varying, 'bank'::character varying])::text[])))
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25344)
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_payment_id_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 233
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments.payment_id;


--
-- TOC entry 232 (class 1259 OID 25323)
-- Name: production; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production (
    production_id integer NOT NULL,
    date date,
    material_id integer,
    product_id integer,
    quantity_produced numeric(10,2),
    employee_id integer
);


ALTER TABLE public.production OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25322)
-- Name: production_production_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.production_production_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.production_production_id_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 231
-- Name: production_production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_production_id_seq OWNED BY public.production.production_id;


--
-- TOC entry 220 (class 1259 OID 25259)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(100) NOT NULL,
    pack_size character varying(20),
    category character varying(50),
    price_rwf numeric(10,2)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25258)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 230 (class 1259 OID 25311)
-- Name: raw_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raw_materials (
    material_id integer NOT NULL,
    supplier_id integer,
    material_name character varying(100),
    quantity_supplied numeric(10,2),
    date_supplied date
);


ALTER TABLE public.raw_materials OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25310)
-- Name: raw_materials_material_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raw_materials_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.raw_materials_material_id_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 229
-- Name: raw_materials_material_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raw_materials_material_id_seq OWNED BY public.raw_materials.material_id;


--
-- TOC entry 228 (class 1259 OID 25304)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplier_id integer NOT NULL,
    name character varying(100),
    contact character varying(50),
    location character varying(100)
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25303)
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 227
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_supplier_id_seq OWNED BY public.suppliers.supplier_id;


--
-- TOC entry 222 (class 1259 OID 25266)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    transaction_id integer NOT NULL,
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    sale_date date NOT NULL,
    quantity integer NOT NULL,
    total_amount numeric(12,2) NOT NULL,
    payment_method character varying(20)
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25265)
-- Name: transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_transaction_id_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 221
-- Name: transactions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_transaction_id_seq OWNED BY public.transactions.transaction_id;


--
-- TOC entry 4785 (class 2604 OID 25299)
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- TOC entry 4784 (class 2604 OID 25286)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 25348)
-- Name: payments payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 25326)
-- Name: production production_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production ALTER COLUMN production_id SET DEFAULT nextval('public.production_production_id_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 25262)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4787 (class 2604 OID 25314)
-- Name: raw_materials material_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_materials ALTER COLUMN material_id SET DEFAULT nextval('public.raw_materials_material_id_seq'::regclass);


--
-- TOC entry 4786 (class 2604 OID 25307)
-- Name: suppliers supplier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('public.suppliers_supplier_id_seq'::regclass);


--
-- TOC entry 4783 (class 2604 OID 25269)
-- Name: transactions transaction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.transactions_transaction_id_seq'::regclass);


--
-- TOC entry 4964 (class 0 OID 25253)
-- Dependencies: 218
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, name, region, customer_type, phone) FROM stdin;
1	Jeanette Uwimana	Kigali	household	+250788123456
2	Resto Chez Pierre	Butare	restaurant	+250788654321
3	Hope for All	Rubavu	NGO	+250789112233
4	Eric Niyonzima	Musanze	household	+250788998877
5	Green Bites Caf‚	Kigali	restaurant	+250787665544
\.


--
-- TOC entry 4972 (class 0 OID 25296)
-- Dependencies: 226
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, name, role, salary, phone) FROM stdin;
1	Alice Mukamana	production	250000.00	+250788111222
2	Jean Bosco	sales	180000.00	+250788333444
3	Claudine Uwase	delivery	200000.00	+250789555666
4	Eric Mugisha	production	270000.00	+250788777888
5	Diane Ishimwe	sales	190000.00	+250787999000
\.


--
-- TOC entry 4970 (class 0 OID 25283)
-- Dependencies: 224
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, order_date, delivery_date, status) FROM stdin;
1	1	2024-01-10	2024-01-12	delivered
2	2	2024-01-15	2024-01-20	pending
3	3	2024-02-01	2024-02-05	cancelled
4	4	2024-03-10	2024-03-12	delivered
5	1	2024-03-15	2024-03-18	pending
\.


--
-- TOC entry 4980 (class 0 OID 25345)
-- Dependencies: 234
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_id, order_id, amount, method, payment_date) FROM stdin;
1	1	2400.00	MoMo	2024-01-12
2	2	11000.00	cash	2024-01-20
3	3	4000.00	bank	2024-02-05
4	4	7000.00	cash	2024-03-12
5	5	2200.00	MoMo	2024-03-18
\.


--
-- TOC entry 4978 (class 0 OID 25323)
-- Dependencies: 232
-- Data for Name: production; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production (production_id, date, material_id, product_id, quantity_produced, employee_id) FROM stdin;
1	2024-01-12	1	1	100.00	1
2	2024-01-16	2	2	200.00	4
3	2024-02-06	3	3	50.00	1
4	2024-02-21	4	4	80.00	3
5	2024-03-02	5	5	120.00	1
\.


--
-- TOC entry 4966 (class 0 OID 25259)
-- Dependencies: 220
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, name, pack_size, category, price_rwf) FROM stdin;
1	EcoBriq 5kg	5kg	household	1200.00
2	EcoBriq 10kg	10kg	household	2200.00
3	EcoBriq Charcoal Block	20kg	commercial	4000.00
4	EcoBriq Premium Logs	15kg	restaurant	3500.00
5	EcoBriq Mini Pack	2kg	household	600.00
\.


--
-- TOC entry 4976 (class 0 OID 25311)
-- Dependencies: 230
-- Data for Name: raw_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raw_materials (material_id, supplier_id, material_name, quantity_supplied, date_supplied) FROM stdin;
1	1	Sawdust	500.00	2024-01-10
2	2	Coffee Husk	300.00	2024-01-15
3	3	Rice Husk	450.00	2024-02-05
4	4	Peanut Shells	250.00	2024-02-20
5	5	Maize Cobs	600.00	2024-03-01
\.


--
-- TOC entry 4974 (class 0 OID 25304)
-- Dependencies: 228
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplier_id, name, contact, location) FROM stdin;
1	Charcoal Masters Ltd	+250788111333	Nyabugogo, Kigali
2	GreenFuel Co.	+250789222444	Gisenyi, Rubavu
3	EcoSource Rwanda	+250788555666	Huye, Butare
4	Sustainable Heat Ltd	+250787777888	Muhanga Town
5	BioEnergy Partners	+250789999000	Rwamagana District
\.


--
-- TOC entry 4968 (class 0 OID 25266)
-- Dependencies: 222
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (transaction_id, customer_id, product_id, sale_date, quantity, total_amount, payment_method) FROM stdin;
1	1	1	2024-01-15	2	2400.00	MoMo
2	2	2	2024-01-17	5	11000.00	Cash
3	3	3	2024-02-05	1	4000.00	Bank
4	1	2	2024-02-20	1	2200.00	MoMo
5	4	4	2024-03-10	2	7000.00	Cash
\.


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 217
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 5, true);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 225
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 5, true);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 5, true);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 233
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 5, true);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 231
-- Name: production_production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_production_id_seq', 5, true);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 5, true);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 229
-- Name: raw_materials_material_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raw_materials_material_id_seq', 5, true);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 227
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_supplier_id_seq', 5, true);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 221
-- Name: transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 5, true);


--
-- TOC entry 4793 (class 2606 OID 25257)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4801 (class 2606 OID 25301)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 4799 (class 2606 OID 25289)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4809 (class 2606 OID 25351)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 4807 (class 2606 OID 25328)
-- Name: production production_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_pkey PRIMARY KEY (production_id);


--
-- TOC entry 4795 (class 2606 OID 25264)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4805 (class 2606 OID 25316)
-- Name: raw_materials raw_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_materials
    ADD CONSTRAINT raw_materials_pkey PRIMARY KEY (material_id);


--
-- TOC entry 4803 (class 2606 OID 25309)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 4797 (class 2606 OID 25271)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 4810 (class 2606 OID 25272)
-- Name: transactions fk_trans_cust; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_trans_cust FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4811 (class 2606 OID 25277)
-- Name: transactions fk_trans_prod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_trans_prod FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4812 (class 2606 OID 25290)
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4817 (class 2606 OID 25352)
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- TOC entry 4814 (class 2606 OID 25339)
-- Name: production production_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 4815 (class 2606 OID 25329)
-- Name: production production_material_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_material_id_fkey FOREIGN KEY (material_id) REFERENCES public.raw_materials(material_id);


--
-- TOC entry 4816 (class 2606 OID 25334)
-- Name: production production_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4813 (class 2606 OID 25317)
-- Name: raw_materials raw_materials_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raw_materials
    ADD CONSTRAINT raw_materials_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);





-- Completed on 2025-09-26 18:32:15

--
-- PostgreSQL database dump complete
--
--NOW WE ARE GOING INTO WINDOW FUNCTIONS IMPLEMENTATION
--1. Ranking Functions — Top N Customers by Revenue
-- Rank customers by total revenue using different ranking functions
--This query ranks customers based on their total revenue. ROW_NUMBER() gives a unique position, RANK() allows gaps, DENSE_RANK() avoids gaps, and PERCENT_RANK() shows relative standing. Useful for identifying top spenders and their distribution.

SELECT customer_id, 
       SUM(total_amount) AS total_revenue,
       ROW_NUMBER() OVER (ORDER BY SUM(total_amount) DESC) AS row_num,
       RANK() OVER (ORDER BY SUM(total_amount) DESC) AS rank,
       DENSE_RANK() OVER (ORDER BY SUM(total_amount) DESC) AS dense_rank,
       PERCENT_RANK() OVER (ORDER BY SUM(total_amount) DESC) AS percent_rank
FROM transactions
GROUP BY customer_id;

--2.Aggregate Functions with Frames — Running Totals & Trends
--This query shows how each customer's spending evolves over time. ROWS counts exact rows, while RANGE includes all rows with equal values. Great for tracking trends and smoothing out fluctuations.
-- Calculate running total and average revenue using ROWS and RANGE
SELECT customer_id, sale_date, total_amount,
       SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total_rows,
       AVG(total_amount) OVER (PARTITION BY customer_id ORDER BY sale_date RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg_range
FROM transactions;

--3. Navigation Functions — Period-to-Period Analysis
--This query compares each transaction to the previous one for the same customer. LAG() and LEAD() help track changes, and the growth_percent column shows how spending increased or decreased. Ideal for behavioral analysis.
-- Compare each transaction to the previous one for the same customer
SELECT customer_id, sale_date, total_amount,
       LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY sale_date) AS previous_amount,
       LEAD(total_amount) OVER (PARTITION BY customer_id ORDER BY sale_date) AS next_amount,
       ROUND((total_amount - LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY sale_date)) * 100.0 / NULLIF(LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY sale_date), 0), 2) AS growth_percent
FROM transactions;



--4. Distribution Functions — Customer Segmentation
-- Segment customers into quartiles based on total revenue
--This query divides customers into four revenue-based segments using NTILE(4) and shows their percentile rank with CUME_DIST(). Useful for targeting top-tier customers or designing loyalty programs.
SELECT customer_id, 
       SUM(total_amount) AS total_revenue,
       NTILE(4) OVER (ORDER BY SUM(total_amount) DESC) AS revenue_quartile,
       CUME_DIST() OVER (ORDER BY SUM(total_amount) DESC) AS cumulative_distribution
FROM transactions
GROUP BY customer_id;




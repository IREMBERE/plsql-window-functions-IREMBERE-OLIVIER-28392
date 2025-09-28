# plsql-window-functions-IREMBERE-OLIVIER-28392
PL/SQL Window Functions project — Green Flame Rwanda (eco briquettes);

Author:IREMBERE Olivier; 

ID:28392;

Date:28/09/2025;

# Business Context
Project Green Flame Rwanda 
it is small enterprise producing eco-friendly briquettes from agricultural waste.
Which can be set  in deepartment of  Sales  and Analytics which includes operations and marketing.
Then also based in Industry of  clean energy and  household fuel retail.

# Data Challenge 
We have transactional sales data where customers will be buying briquette packs of various sizes, with production logs of daily production from different raw materials, and supplier deliveries. The business needs analytic queries to identify bestselling products by region/quarter, measure month-to-month revenue trends, segment customers for targeted marketing, and compute moving averages to forecast demand.

# Expected Outcome
Actionable decisions:
(a) Which products to promote per region and quarter; 

(b) which customers to target with loyalty campaigns (top quartile);

(c) a forecast baseline for monthly production planning (3-month moving average), and (d) insights into month-over-month growth to track business health.

# Objectives
I.Convert agricultural waste into marketable charcoal briquettes;

ii.Reduce household cooking costs by at least 20%;

iii.Create employment for youth and women in rural and urban areas;

iv.Contribute to Rwanda’s vision of being a green, sustainable nation.

# Target Market
Households (especially in Kigali, Huye, Musanze);

Restaurants & hotels (big charcoal consumers);

institutions (schools, prisons, hospitals);

NGOs/government programs promoting green energy.

# Unique Value Proposition
Cheaper than traditional charcoal;

Burns longer, produces less smoke;

Eco-friendly (made from waste, not trees);

Supports Rwanda’s climate goals.

# Implementation Plan
Phase 1: Research & Setup (Month 1–2);

identify key agricultural waste sources;

Partner with local farmers & cooperatives;

Acquire briquette-making machine (manual or motorized).

Phase 2: Production (Month 3–6)
Collect, dry, and carbonize waste;

Crush, mix with binder (e.g., cassava flour or starch), mold into briquettes;

Dry & package briquettes;

Phase 3: Marketing & Distribution (Month 6 onwards)
Branding: “Green Flame – Cook Cheaper, Live Cleaner.”;

Sell in markets, supermarkets, and through mobile vendors;

Partner with NGOs and local leaders for promotion;

# Estimated Budget (Startup Small Scale Pilot)
Briquette machine: from $800 to $1,500 (manual/motorized);

Drying racks & carbonizing drum: $400;

Packaging & branding: $300;

Raw materials (agri waste and cheap or free from farmers);

Labor (5 to 10 people): $600 per month;

Marketing: $300;

Total (pilot phase): ≈ $3,000 to $5,000.

# Revenue Model
Price per 1kg briquette pack: from 7$ to 1$ (competitive with charcoal);

Monthly sales potential: 1,000 households x 20kg per month = 20,000kg;

Revenue = 14,000,000 RWF ($11,000) per month if scaled.

# Expected Impact
Reduce deforestation by lowering tree cutting for charcoal;

Provide cheaper fuel to households;

Create direct jobs for youth & women in production/distribution;

Turn waste into profit, keeping communities cleaner.

# Database Schema
Tables
1.customers

customer_id (PK)

name

region;

2.products
product_id (PK)
name
category;

3.transactions
transaction_id (PK)

customer_id (FK → customers.customer_id)

product_id (FK → products.product_id)

sale_date

amount;

4.orders
order_id (PK)

customer_id (FK → customers.customer_id)

order_date

delivery_date

status (pending, delivered, cancelled);

5.employees
employee_id (PK)

name

role (production, sales, delivery)

salary

phone;

6.suppliers
supplier_id (PK)

name

contact

location;

7.raw_materials
material_id (PK)

supplier_id (FK → suppliers.supplier_id)

material_name (banana peel, coffee husk, etc.)

quantity_supplied

date_supplied;

8.production
production_id (PK)

date

material_id (FK → raw_materials.material_id)

product_id (FK → products.product_id)

quantity_produced

employee_id (FK → employees.employee_id);

9.payments
payment_id (PK)

order_id (FK → orders.order_id)

amount

method (cash, MoMo, bank)

payment_date;

# Entity-Relationship (ER) Relationships
One customer can place many orders;

Each order can include many products (via transactions or order_details);

One supplier provides many raw materials;

Raw materials are used in production to create products;

Employees are responsible for production tasks;

Each order has one or more payments.

![ER Diagram](https://raw.githubusercontent.com/IREMBERE/plsql-window-functions-IREMBERE-OLIVIER-28392/main/ER%20Diagram%20of%20project%20green_flame_rwanda%20-%20public.png)

# References 
Rwanda Green Fund (FONERWA). https://greenfund.rw;

Rwanda Environment Management Authority (REMA), Green Growth and Climate Resilience Strategy. https://www.rema.gov.rw;

Green Gicumbi Project. https://en.wikipedia.org/wiki/Green_Gicumbi;

Green Climate Fund – Rwanda. https://www.greenclimate.fund/countries/rwanda;

Government of Rwanda, Resilience and Sustainability Trust initiative. https://www.gov.rw;

Green Rwanda Organization. https://www.facebook.com/greenrwandaorganization;

The Green Protector – Ineza Umuhoza Grace. https://en.wikipedia.org/wiki/Ineza_Umuhoza_Grace;

Democratic Green Party of Rwanda. https://en.wikipedia.org/wiki/Democratic_Green_Party_of_Rwanda;

Kwibuka Flame of Hope – UN tribute. https://www.un.org/en/unis-nairobi/press-release-permanent-tribute-1994-genocide-against-tutsi-rwanda-installed-united;

Kigali Green Complex. https://en.wikipedia.org/wiki/Kigali_Green_Complex.

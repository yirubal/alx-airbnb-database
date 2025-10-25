# Airbnb Clone Database Schema

## 📘 Objective
This directory contains SQL scripts to create the **Airbnb clone** database schema, defining all entities, constraints, and relationships.

---

## 🧱 Files
- **schema.sql** — Contains all `CREATE TABLE` statements for the project.
- **README.md** — Documentation for schema structure and setup instructions.

---

## 🗂️ Entities Included
1. **users** — Stores user information (guests, hosts, admins)
2. **properties** — Details about listed properties
3. **bookings** — Reservation information linking users and properties
4. **payments** — Payment transactions for bookings
5. **reviews** — User reviews on properties
6. **messages** — Communication between users

---

## ⚙️ Relationships
- One **user** (host) → many **properties**
- One **user** (guest) → many **bookings**
- One **property** → many **bookings**
- One **booking** → one **payment**
- One **property** → many **reviews**
- One **user** → many **messages** (as sender or recipient)

---

## 🚀 How to Run
To execute the schema on PostgreSQL:

```bash
psql -U postgres -d airbnb_clone -f schema.sql

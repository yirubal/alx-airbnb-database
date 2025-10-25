
# **Database Normalization – Airbnb Clone**

## **Objective**

The objective of this task is to ensure that the Airbnb clone database schema follows **Third Normal Form (3NF)** by eliminating redundancy and ensuring data integrity.

---

## **1. Understanding Normalization**

**Database normalization** is the process of structuring a relational database to reduce data redundancy and improve data integrity.
It involves dividing large tables into smaller, well-structured tables and defining relationships among them.

---

## **2. Normalization Steps**

### **First Normal Form (1NF)**

* Each table has a **primary key** that uniquely identifies each record.
* Each field contains **atomic (indivisible)** values.
* No repeating groups or arrays exist in any table.

✅ **Applied in our design:**

* Every table (User, Property, Booking, Payment, Review, Message) has a primary key.
* All attributes store single values (no multiple emails, locations, or ratings per row).

---

### **Second Normal Form (2NF)**

* The database is already in 1NF.
* All **non-key attributes** are fully dependent on the **entire primary key** (not a part of it).
* This mainly applies to tables with **composite keys** — in our schema, all tables use **single-column primary keys**, so partial dependency does not occur.

✅ **Applied in our design:**

* Each table’s attributes depend on a single, non-composite primary key (e.g., `user_id`, `property_id`, `booking_id`).

---

### **Third Normal Form (3NF)**

* The database is in 2NF.
* There are **no transitive dependencies** — i.e., non-key attributes do not depend on other non-key attributes.

✅ **Applied in our design:**

* In the `User` table, attributes like `first_name`, `last_name`, `email`, and `role` depend only on `user_id`.
* In `Property`, all attributes depend only on `property_id` — not on the host’s attributes.
* In `Booking`, `total_price` depends on `booking_id`, not directly on `Property` or `User`.
* In `Payment`, details depend only on `payment_id`, and each is linked to exactly one booking.
* In `Review` and `Message`, each attribute depends solely on their respective primary keys.

---

## **3. Resulting Schema in 3NF**

All six tables — **User**, **Property**, **Booking**, **Payment**, **Review**, and **Message** — are now in **Third Normal Form (3NF)** because:

1. Each table has a primary key.
2. All attributes store atomic values.
3. There are no partial or transitive dependencies.
4. Foreign keys are used properly to maintain relationships between entities.

---

## **4. Benefits of Normalization**

* Eliminates redundant data
* Improves consistency and data integrity
* Simplifies maintenance and updates
* Makes the database more scalable and efficient

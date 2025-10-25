# **Entity-Relationship Diagram (ERD) – Airbnb Clone Database**
---

## **Entities and Attributes**

### **1. User**

* **user_id** (PK, UUID, Indexed)
* first_name (VARCHAR, NOT NULL)
* last_name (VARCHAR, NOT NULL)
* email (VARCHAR, UNIQUE, NOT NULL)
* password_hash (VARCHAR, NOT NULL)
* phone_number (VARCHAR, NULL)
* role (ENUM: guest, host, admin, NOT NULL)
* created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### **2. Property**

* **property_id** (PK, UUID, Indexed)
* host_id (FK → User.user_id)
* name (VARCHAR, NOT NULL)
* description (TEXT, NOT NULL)
* location (VARCHAR, NOT NULL)
* price_per_night (DECIMAL, NOT NULL)
* created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
* updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

---

### **3. Booking**

* **booking_id** (PK, UUID, Indexed)
* property_id (FK → Property.property_id)
* user_id (FK → User.user_id)
* start_date (DATE, NOT NULL)
* end_date (DATE, NOT NULL)
* total_price (DECIMAL, NOT NULL)
* status (ENUM: pending, confirmed, canceled, NOT NULL)
* created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### **4. Payment**

* **payment_id** (PK, UUID, Indexed)
* booking_id (FK → Booking.booking_id)
* amount (DECIMAL, NOT NULL)
* payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
* payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

---

### **5. Review**

* **review_id** (PK, UUID, Indexed)
* property_id (FK → Property.property_id)
* user_id (FK → User.user_id)
* rating (INTEGER, CHECK 1 ≤ rating ≤ 5, NOT NULL)
* comment (TEXT, NOT NULL)
* created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

### **6. Message**

* **message_id** (PK, UUID, Indexed)
* sender_id (FK → User.user_id)
* recipient_id (FK → User.user_id)
* message_body (TEXT, NOT NULL)
* sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## **Relationships**

| Relationship       | Type                       | Description                                 |
| ------------------ | -------------------------- | ------------------------------------------- |
| User → Property    | **1:N**                    | A host (User) can own multiple properties.  |
| User → Booking     | **1:N**                    | A guest (User) can make many bookings.      |
| Property → Booking | **1:N**                    | A property can be booked multiple times.    |
| Booking → Payment  | **1:1**                    | Each booking has one corresponding payment. |
| Property → Review  | **1:N**                    | A property can have multiple reviews.       |
| User → Review      | **1:N**                    | A user can write multiple reviews.          |
| User → Message     | **1:N (self-referencing)** | A user can send/receive many messages.      |

---

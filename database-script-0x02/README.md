# Airbnb Clone - Database Seeding Script

## 📘 Objective
This script populates the **Airbnb clone database** with realistic sample data for testing and development purposes.

---

## 🧱 Files
- **seed.sql** — SQL script that inserts sample records into all main tables.
- **README.md** — Documentation and usage instructions.

---

## 🗂️ Entities Populated
1. **users** — Includes guests, hosts, and an admin account.  
2. **properties** — Each property belongs to a host.  
3. **bookings** — Created by guests and linked to properties.  
4. **payments** — Linked to confirmed bookings.  
5. **reviews** — Posted by users after a stay.  
6. **messages** — Simulates conversation between a guest and host.

---

## 🚀 How to Run
To execute the script on PostgreSQL:

```bash
psql -U postgres -d airbnb_clone -f seed.sql

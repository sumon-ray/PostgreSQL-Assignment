# 🎯 PostgreSQL সম্পর্কিত ১০টি প্রশ্নের উত্তর

## 1️⃣ PostgreSQL কী?  
PostgreSQL হলো একটি ওপেন-সোর্স রিলেশনাল ডাটাবেজ ম্যানেজমেন্ট সিস্টেম (RDBMS), যা SQL ব্যবহার করে ডাটা সংরক্ষণ ও পরিচালনা করে। এটি ACID (Atomicity, Consistency, Isolation, Durability) প্রিন্সিপলের উপর ভিত্তি করে কাজ করে এবং অত্যন্ত স্কেলেবল ও এক্সটেনসিবল।

---

## 2️⃣ PostgreSQL-এ ডাটাবেজ স্কিমার উদ্দেশ্য কী?  
ডাটাবেজ স্কিমা হলো একটি **লজিক্যাল স্ট্রাকচার**, যা ডাটাবেজের টেবিল, ভিউ, ইনডেক্স, ফাংশন এবং অন্যান্য অবজেক্টগুলোর সংগঠিত কাঠামো নির্ধারণ করে। এটি একই ডাটাবেজের মধ্যে **ভিন্ন ভিন্ন ইউজার বা অ্যাপ্লিকেশনের জন্য আলাদা স্ট্রাকচার** তৈরি করতে সাহায্য করে।

---

## 3️⃣ PostgreSQL-এ Primary Key এবং Foreign Key কী?  
✅ **Primary Key**:  
একটি ইউনিক কলাম বা কলামের সেট, যা প্রতিটি সারিকে (row) আলাদাভাবে শনাক্ত করে। এটি **NULL মান গ্রহণ করতে পারে না**।  

✅ **Foreign Key**:  
একটি কলাম, যা অন্য একটি টেবিলের **Primary Key-এর রেফারেন্স** হিসেবে কাজ করে এবং দুইটি টেবিলের মধ্যে সম্পর্ক স্থাপন করে।

উদাহরণ:
```sql
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE
);

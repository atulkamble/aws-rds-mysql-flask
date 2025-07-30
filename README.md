# 🐍 AWS RDS MySQL Flask Project

This project demonstrates a simple Flask application connected to an AWS RDS MySQL database using SQLAlchemy.

---

## 📦 Clone the Repository

```bash
git clone https://github.com/atulkamble/aws-rds-mysql-flask
cd aws-rds-mysql-flask
````

---

## 🧪 Setup Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate
```

---

## 📥 Install Dependencies

Install from `requirements.txt` (recommended):

```bash
pip install -r requirements.txt
```

Or install manually:

```bash
pip install Flask Flask-SQLAlchemy mysql-connector-python python-dotenv
```

---

## ⚙️ Configure Environment

Create a `.env` file in the root directory with the following contents:

```ini
DB_HOST=your-rds-endpoint.rds.amazonaws.com
DB_USER=your-db-username
DB_PASSWORD=your-db-password
DB_NAME=your-database-name
```

---

## 🚀 Run the Application

```bash
python3 run.py
```

Then open your browser and go to:

```
http://127.0.0.1:5000
```

---

## 📁 Project Structure

```
aws-rds-mysql-flask/
├── app/
│   ├── __init__.py
│   ├── models.py
│   └── routes.py
├── templates/
│   └── index.html
├── run.py
├── requirements.txt
└── README.md
```

---

## 🛠️ Features

* Flask Web App
* SQLAlchemy ORM
* MySQL backend hosted on AWS RDS
* Dynamic user listing from database

---

## 🧼 License

MIT License - [Atul Kamble](https://github.com/atulkamble)
---

Based on your Flask app structure, the database model you’ve defined (User) maps to a MySQL table. Here are the equivalent MySQL commands that would be executed when db.create_all() runs:

⸻

✅ SQL Commands for Table Creation
```
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

⸻

✅ SQL Commands for Inserting Default Data

This mirrors what your run.py script does if the table is empty:
```
INSERT INTO user (name) VALUES ('Atul');
INSERT INTO user (name) VALUES ('Alice');
```

⸻

✅ Optional: Database and User Creation (if not already done)

If you’re setting this up on a fresh RDS MySQL instance, here’s how to prepare the environment manually:
```
-- Create database
CREATE DATABASE flaskdb;

-- Create user
CREATE USER 'flaskuser'@'%' IDENTIFIED BY 'flaskpassword';

-- Grant privileges
GRANT ALL PRIVILEGES ON flaskdb.* TO 'flaskuser'@'%';

-- Apply changes
FLUSH PRIVILEGES;

Update .env accordingly:

DB_USER=flaskuser
DB_PASSWORD=flaskpassword
DB_HOST=<your-rds-endpoint>
DB_PORT=3306
DB_NAME=flaskdb
```



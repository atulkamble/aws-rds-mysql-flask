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

```

---

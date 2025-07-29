Here's the **complete, updated Flask app code** with **AWS RDS MySQL database connectivity**, **SQLAlchemy ORM**, and HTML output — all structured cleanly for your GitHub repository `flask-mysql-rds-app`.

---

## ✅ Project Directory Structure

```
flask-mysql-rds-app/
├── app/
│   ├── __init__.py
│   ├── models.py
│   └── routes.py
├── templates/
│   └── index.html
├── .env
├── run.py
├── requirements.txt
└── README.md
```

---

## 🔧 1. `requirements.txt`

```txt
Flask
mysql-connector-python
Flask-SQLAlchemy
python-dotenv
```

---

## 📁 2. `app/__init__.py`

```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os
from dotenv import load_dotenv

load_dotenv()  # Load .env file

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = (
    f"mysql+mysqlconnector://{os.getenv('DB_USER')}:"
    f"{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:"
    f"{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

from app import routes
```

---

## 📁 3. `app/models.py`

```python
from app import db

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
```

---

## 📁 4. `app/routes.py`

```python
from flask import render_template
from app import app, db
from app.models import User

@app.route('/')
def index():
    users = User.query.all()
    return render_template('index.html', users=users)
```

---

## 📁 5. `templates/index.html`

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User List</title>
</head>
<body>
    <h1>Connected to AWS RDS 🎯</h1>
    <h2>List of Users:</h2>
    <ul>
        {% for user in users %}
            <li>{{ user.name }}</li>
        {% else %}
            <li>No users found in database.</li>
        {% endfor %}
    </ul>
</body>
</html>
```

---

## 📄 6. `.env`

```env
DB_HOST=mydb.xxxxxxxxxxxx.us-east-1.rds.amazonaws.com
DB_PORT=3306
DB_NAME=mydatabase
DB_USER=admin
DB_PASSWORD=admin12345
```

> Replace `DB_HOST` with your actual RDS endpoint.

---

## 🚀 7. `run.py`

```python
from app import app, db
from app.models import User

if __name__ == "__main__":
    with app.app_context():
        db.create_all()
        if not User.query.first():
            db.session.add(User(name="Atul"))
            db.session.add(User(name="Alice"))
            db.session.commit()
    app.run(host='0.0.0.0', port=5000, debug=True)
```

---

## 📘 8. `README.md` (Sample)

````markdown
# Flask + AWS RDS MySQL App

This is a simple Flask application connected to a MySQL RDS database on AWS.

## Features
- AWS RDS MySQL backend
- SQLAlchemy ORM
- .env support for secrets
- Jinja2 HTML rendering

## Prerequisites
- Python 3.7+
- AWS RDS MySQL instance
- Inbound port 3306 open from your IP or EC2

## Setup

```bash
git clone https://github.com/yourusername/flask-mysql-rds-app.git
cd flask-mysql-rds-app
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env  # Or manually create .env
python run.py
````

Then open your browser at: `http://localhost:5000` or EC2 public IP.

````

---

## ✅ Test the App

- Run:
  ```bash
  python run.py
````

* Visit `http://localhost:5000` (or `http://<your-ec2-ip>:5000`)
* You’ll see:

  ```
  Connected to AWS RDS 🎯
  List of Users:
  - Atul
  - Alice
  ```

---


Here’s a complete **MySQL AWS RDS project** that includes:

* RDS MySQL database provisioning using Terraform (optional)
* Python Flask-based web page connected to RDS
* Full connectivity setup (Security Group, IAM if needed)
* Deployment instructions (manual or EC2-based)
* GitHub-ready code structure

---

## ✅ Project Overview

### **Goal**:

Deploy a Python Flask web application that connects to an AWS RDS MySQL instance and displays data on a webpage.

---

## 🔧 Technologies Used

* **AWS RDS (MySQL)**
* **Python Flask**
* **SQLAlchemy** (ORM)
* **Terraform** (optional infra provisioning)
* **EC2 / Localhost** deployment
* **HTML (Jinja template)**

---

## 📁 Project Structure

```
mysql-rds-flask-app/
├── app/
│   ├── __init__.py
│   ├── models.py
│   └── routes.py
├── templates/
│   └── index.html
├── run.py
├── requirements.txt
├── .env
├── terraform/         # Optional infra setup
│   ├── main.tf
│   └── variables.tf
└── README.md
```

---

## 🛠 Step 1: Provision AWS RDS MySQL (Terraform or Console)

### Option A: Manual via AWS Console

1. Go to **RDS → Create Database**
2. Choose **MySQL**, free tier
3. Configure:

   * DB Identifier: `mydb`
   * Username: `admin`
   * Password: `admin12345`
4. VPC → Public access → Yes
5. Security Group: Open port `3306` to your IP

### Option B: Terraform

```hcl
# terraform/main.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "mysql_rds" {
  identifier         = "mydb"
  allocated_storage  = 20
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = "db.t3.micro"
  name               = "mydatabase"
  username           = "admin"
  password           = "admin12345"
  publicly_accessible = true
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

resource "aws_security_group" "rds_sg" {
  name        = "allow-mysql"
  description = "Allow MySQL inbound traffic"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

---

## 🖥 Step 2: Flask Web App

### `requirements.txt`

```
Flask
mysql-connector-python
SQLAlchemy
python-dotenv
```

### `.env`

```
DB_HOST=your-rds-endpoint.amazonaws.com
DB_PORT=3306
DB_NAME=mydatabase
DB_USER=admin
DB_PASSWORD=admin12345
```

### `app/__init__.py`

```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+mysqlconnector://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

from app import routes
```

### `app/models.py`

```python
from app import db

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
```

### `app/routes.py`

```python
from flask import render_template
from app import app, db
from app.models import User

@app.route('/')
def index():
    users = User.query.all()
    return render_template('index.html', users=users)
```

### `templates/index.html`

```html
<!DOCTYPE html>
<html>
<head>
    <title>MySQL RDS Demo</title>
</head>
<body>
    <h1>User List</h1>
    <ul>
        {% for user in users %}
            <li>{{ user.name }}</li>
        {% endfor %}
    </ul>
</body>
</html>
```

### `run.py`

```python
from app import app, db
from app.models import User

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
        if not User.query.first():
            db.session.add(User(name="Atul"))
            db.session.add(User(name="Alice"))
            db.session.commit()
    app.run(debug=True, host='0.0.0.0', port=5000)
```

---

## 🚀 Deployment Options

### Option 1: Local Machine

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python run.py
```

### Option 2: Deploy to EC2

* Use Amazon Linux/Ubuntu
* Install Python3, pip, Git
* Clone repo and run with `python run.py`
* Ensure EC2 Security Group allows port `5000` and access to RDS port `3306`

---

## ✅ Test It

1. Open browser: `http://<EC2_PUBLIC_IP>:5000/`
2. Should display: `User List: Atul, Alice`

---

## 📝 README Summary (for GitHub)

````md
# Flask + AWS RDS MySQL Demo

This is a Flask-based web app connected to an AWS RDS MySQL instance.

## Features
- Flask app with SQLAlchemy ORM
- AWS RDS MySQL database connectivity
- Terraform (optional) for provisioning
- Easy deploy on EC2 or local

## Setup

```bash
git clone ...
cd mysql-rds-flask-app
cp .env.example .env
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python run.py
````
Absolutely. Here's a complete guide covering:

---

## ✅ 1. **Create MySQL RDS Database on AWS**

You can create the RDS MySQL instance either **manually using AWS Console** or **via Terraform**.

---

### 🔹 A. **Manual RDS MySQL Setup (via AWS Console)**

#### **Step-by-step:**

1. **Go to AWS Console** → RDS → "Create Database"
2. **Choose Database Creation Method**:
   → Select: **Standard Create**
3. **Engine options**:
   → Choose: **MySQL**
   → Version: **8.0.x**
4. **Templates**:
   → Choose: **Free Tier**
5. **Settings**:

   * DB instance identifier: `mydb`
   * Master username: `admin`
   * Master password: `admin12345`
6. **Instance Configuration**:

   * DB instance class: `db.t3.micro`
   * Storage: `20 GB`
7. **Connectivity**:

   * VPC: Default or custom
   * **Public access: Yes** ✅
   * **VPC security group: Create new**

     * Name: `rds-allow-mysql`
     * Rule: Allow inbound port **3306** from **your IP**
8. **Database settings**:

   * DB name: `mydatabase`
   * Enable auto minor version upgrade: Yes
9. **Create Database**

#### 🟢 Wait until status changes to: `Available`

---

### 🔹 B. **Security Group Rule (Connectivity)**

#### **Open Port 3306** to allow inbound MySQL traffic:

* Go to **EC2 → Security Groups** → Find the SG attached to RDS
* Add Inbound Rule:

  ```
  Type: MySQL/Aurora
  Protocol: TCP
  Port: 3306
  Source: Your IP (e.g., 203.0.113.24/32)
  ```

> You can temporarily use `0.0.0.0/0` for testing but it is insecure for production.

---

## ✅ 2. **Configure Python App to Connect to RDS**

### 🔹 Sample `.env` File

```env
DB_HOST=mydb.xxxxxx.us-east-1.rds.amazonaws.com
DB_PORT=3306
DB_NAME=mydatabase
DB_USER=admin
DB_PASSWORD=admin12345
```

You’ll get the **RDS endpoint** from the AWS RDS Dashboard → your DB → copy **Endpoint** value.

---

### 🔹 Database URI Format for SQLAlchemy

```python
SQLALCHEMY_DATABASE_URI = f"mysql+mysqlconnector://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
```

> Ensure that `mysql-connector-python` is installed in your app.

---

## ✅ 3. **Verify DB Connection (Manual Test)**

### Option A: Using EC2 (Linux-based)

```bash
sudo yum install mysql -y   # or apt install on Ubuntu
mysql -h mydb.xxxxxx.rds.amazonaws.com -u admin -p
```

Then enter password: `admin12345`

You should get a MySQL prompt.

---

## ✅ 4. **Initialize Database in Flask**

In your Python app:

```bash
python
>>> from app import db
>>> db.create_all()
>>> from app.models import User
>>> db.session.add(User(name="Test User"))
>>> db.session.commit()
```

---

## 🧪 Final Check

1. Visit `http://<your-ec2-ip>:5000`
2. You should see the data fetched from the **AWS RDS MySQL database**.

---

## 🚀 What’s Next?

Would you like:

* A GitHub repo setup with this project?
* Docker support added for containerized deployment?
* CI/CD pipeline (e.g., GitHub Actions) for automatic deployment?

Let me know and I’ll expand it accordingly.

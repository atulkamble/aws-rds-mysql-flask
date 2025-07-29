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

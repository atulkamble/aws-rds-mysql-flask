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

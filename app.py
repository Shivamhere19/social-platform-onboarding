from datetime import datetime
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/review", methods=["POST"])
def review():

    data = {
        "name": request.form.get("name"),
        "email": request.form.get("email"),
        "phone": request.form.get("phone"),
        "college": request.form.get("college"),
        "branch": request.form.get("branch"),
        "semester": request.form.get("semester"),
        "skills": request.form.get("skills"),
        "bio": request.form.get("bio")
    }

    return render_template(
    "review.html",
    data=data,
    current_time=datetime.now().strftime("%d-%m-%Y %H:%M")
)

if __name__ == "__main__":
    app.run(debug=True)
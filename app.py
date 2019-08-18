from os import environ

from flask import Flask, render_template, flash, request
from requests import post

app = Flask(__name__)
app.secret_key = "youdontknowhowmuchidofdsfn'tlikethat?^^&$#)(@SJF:S"

"""
Holy reviewer, that you're on chair, please forgive sinner that wrote this code. 
Code was written on fast hand with.
Hallowed be the code that works without any tests.
Commit.
"""


def check_file():
    if 'exe' not in request.files:
        flash('Wrong Request')
        return False

    if request.form.get('modName') not in ('fafbeta', 'fafdevelop'):
        flash('Wrong Request')
        return False
    return True


def upload():
    url = "{}/exe/upload".format(environ.get("API_URL", "http://localhost:8010"))
    fp = request.files['exe']
    result = post(
        url=url,
        files={"file": (fp.filename, fp.read(), fp.content_type, fp.headers)},
        data={
            "modName": request.form["modName"],
            "apiKey": environ.get("API_KEY", "banana"),
        },
        verify=False
    )
    if not result.ok:
        flash("Result is not ok")
        error = result.json().get("errors", [{}])[0].get("title", "uknown error")
        flash(error)


@app.route('/', methods=["GET", "POST"])
def hello_world():
    if request.files and request.form and check_file():
        upload()
    return render_template("index.html")


if __name__ == '__main__':
    app.run(
        debug=environ.get("DEBUG", True),
        host="0.0.0.0",
        port=environ.get("PORT", 13667),
    )

from flask import Flask, request
from waitress import serve
import requests
application = Flask(__name__)


@application.route('/')
def dashboard():
    result = requests.get('http://0.0.0.0:5001/hardware/').json()
    hardware = [
        '{} - {}: {}'.format(r['provider'], r['name'], r['availability'])
        for r in result
    ]

    return '<br>'.join(hardware)


if __name__ == "__main__":
    serve(application)

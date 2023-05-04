import calendar
import time
from flask import Flask, jsonify, request
from datetime import datetime


now = datetime.now()
# creating a Flask app
app = Flask(__name__)


@app.route('/', methods = ['GET'])
def home():
    if(request.method == 'GET'):

        data = "Automate all the things!!"
        current_GMT = time.gmtime()
        ts = calendar.timegm(current_GMT)
        return jsonify({'message': data, 'timestamp': ts})

# driver function
if __name__ == '__main__':

    app.run(host="0.0.0.0", port=8000, debug=True)
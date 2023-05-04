
from flask import Flask, jsonify, request
from datetime import datetime

now = datetime.now()
# creating a Flask app
app = Flask(__name__)


@app.route('/', methods = ['GET'])
def home():
    if(request.method == 'GET'):

        data = "Automate all the things!!"
        date_time = now.strftime("%m/%d/%Y, %H:%M:%S")
        return jsonify({'message': data, 'timestamp': date_time})

# driver function
if __name__ == '__main__':

    app.run(host="0.0.0.0", port=8000, debug=True)
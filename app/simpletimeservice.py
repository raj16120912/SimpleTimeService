#!/bin/python3
from flask import Flask, request, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def home():
    # Get current timestamp
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # Get visitor's IP address
    if request.headers.getlist("X-Forwarded-For"):
        ip_address = request.headers.getlist("X-Forwarded-For")[0]
    else:
        ip_address = request.remote_addr

    # Return response in Json format
    return jsonify({
        'timestamp': timestamp,
        'ip_address': ip_address
    })
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
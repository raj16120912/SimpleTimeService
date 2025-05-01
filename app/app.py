from flask import Flask, request, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route("/", methods=["GET"])
def home():
    visitor_ip = request.headers.get('X-Forwarded-For', request.remote_addr)
    timestamp = datetime.utcnow().isoformat() + "Z"
    return jsonify({
        "ip": visitor_ip,
        "timestamp": timestamp
    })

# For AWS Lambda
def handler(event, context):
    from aws_lambda_wsgi import response
    return response(app, event, context)
from flask import Flask, jsonify, request
from datetime import datetime
from mangum import Mangum

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "ip": request.headers.get("X-Forwarded-For", request.remote_addr)
    })

handler = Mangum(app)
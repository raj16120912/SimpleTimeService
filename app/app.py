import json
from datetime import datetime

def handler(event, context):
    # REST API Gateway puts source IP here
    ip = event.get("requestContext", {}).get("identity", {}).get("sourceIp", "unknown")

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "timestamp": datetime.utcnow().isoformat() + "Z",
            "ip": ip
        })
    }
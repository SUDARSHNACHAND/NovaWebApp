from flask import Flask, render_template, jsonify, request
from prometheus_flask_exporter import PrometheusMetrics

# Create Flask application
app = Flask(__name__)

# Enable Prometheus metrics
metrics = PrometheusMetrics(app)

# Application information metric
metrics.info(
    "novawebapp",
    "NovaWebApp Flask application",
    version="1.0.0"
)


# Home page
@app.route("/")
def home():
    return render_template("index.html")


# API endpoint
@app.route("/api/contact", methods=["POST"])
def contact():

    # Receive JSON data from JavaScript
    data = request.get_json() or {}

    # Get name
    name = data.get("name", "").strip()

    # Validate name
    if not name:
        return jsonify({
            "success": False,
            "message": "Please enter your name."
        }), 400

    # Send response
    return jsonify({
        "success": True,
        "message": f"Hello {name}! Your message reached Python Flask."
    })


# Start Flask server
if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5000,
        debug=False
    )

    
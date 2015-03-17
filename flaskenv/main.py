from flask import Flask
import json
import os

app = Flask(__name__)

@app.route('/')
def environ():
    return json.dumps(dict(os.environ))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)

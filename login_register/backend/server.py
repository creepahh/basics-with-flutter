# backend/server.py

from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# Example in-memory user storage (replace with database in real app)
users = []

@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    if not email or not password:
        return jsonify({'message': 'Missing email or password'}), 400

    # Check if user already exists
    for user in users:
        if user['email'] == email:
            return jsonify({'message': 'User already exists'}), 409

    # Create new user
    new_user = {'email': email, 'password': password}
    users.append(new_user)

    return jsonify({'message': 'User registered successfully'}), 201

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    if not email or not password:
        return jsonify({'message': 'Missing email or password'}), 400

    # Check if user exists and credentials match
    for user in users:
        if user['email'] == email and user['password'] == password:
            return jsonify({'message': 'Login successful'}), 200

    return jsonify({'message': 'Invalid credentials'}), 401

if __name__ == '__main__':
    app.run(debug=True)

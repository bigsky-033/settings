# Test Application

A simple Node.js Express server to test that the development environment is working correctly.

## Setup

1. Inside the container, navigate to this directory:

```bash
cd /home/bigsky033/workspace/test-app
```

2. Install dependencies:

```bash
npm install
```

3. Start the development server:

```bash
npm run dev
```

4. Open your browser on the host machine and visit:
   - http://localhost:8080
   - http://localhost:8080/api/test
   - http://localhost:8080/health

## What to Expect

- The main page should display a welcome message with some multilingual text
- The API endpoint should return JSON data about the environment
- The health check should display "OK"

If all of these work, your development environment is set up correctly!

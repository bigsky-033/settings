# Test Application

A simple Node.js Express server to test that the development environment is working correctly.

## Setup

1. Copy the test application files to your project root:

```bash
# If setting up a new project
cp -r /path/to/settings/devenv/webdev/test-app/* /path/to/your/project/
```

2. Inside the container, navigate to your app directory:

```bash
cd /home/bigsky033/app
```

3. Install dependencies:

```bash
npm install
```

4. Start the development server:

```bash
npm run dev
```

5. Open your browser on the host machine and visit:
   - http://localhost:8080
   - http://localhost:8080/api/test
   - http://localhost:8080/health

## What to Expect

- The main page should display a welcome message with some multilingual text
- The API endpoint should return JSON data about the environment
- The health check should display "OK"

If all of these work, your development environment is set up correctly!

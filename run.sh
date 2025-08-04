#!/bin/bash
set -e

# Default to challenge1 if no argument is provided
CHALLENGE=${1:-challenge1}

# Find the correct path for the given challenge
if [ -d "challenges/easy/$CHALLENGE" ]; then
    CHALLENGE_PATH="challenges/easy/$CHALLENGE"
elif [ -d "challenges/medium/$CHALLENGE" ]; then
    CHALLENGE_PATH="challenges/medium/$CHALLENGE"
elif [ -d "challenges/hard/$CHALLENGE" ]; then
    CHALLENGE_PATH="challenges/hard/$CHALLENGE"
else
    echo "Error: Challenge directory for '$CHALLENGE' not found." >&2
    exit 1
fi

# Get the application object and file path
APP_OBJECT="${CHALLENGE_PATH}/server_sse.py"

# Start uvicorn with the correct host and port
exec python "$APP_OBJECT"
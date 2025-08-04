# Damn Vulnerable Model Context Protocol (DVMCP)

A deliberately vulnerable implementation of the Model Context Protocol (MCP) for educational purposes.

## Overview

The Damn Vulnerable Model Context Protocol (DVMCP) is an educational project designed to demonstrate security vulnerabilities in MCP implementations. It contains 10 challenges of increasing difficulty that showcase different types of vulnerabilities and attack vectors.

This project is intended for security researchers, developers, and AI safety professionals to learn about potential security issues in MCP implementations and how to mitigate them.

## What is MCP?

The [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) is a standardized protocol that allows applications to provide context for Large Language Models (LLMs) in a structured way. It separates the concerns of providing context from the actual LLM interaction, enabling applications to expose resources, tools, and prompts to LLMs.

## Recommended MCP Clients

CLINE - VSCode Extension
refer this https://docs.cline.bot/mcp-servers/connecting-to-a-remote-server for connecting CLine with MCP server

## getting started 

```
once you have cloned the repository, run the following commands:

docker build -t dvmcp .
docker run -p 8001-8010:8001-8010 dvmcp
```

## Local Development

For local development, you can run the challenges without Docker.

1.  **Create a virtual environment:**
    ```bash
    python -m venv venv
    source venv/bin/activate
    ```

2.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

3.  **Run a specific challenge:**
    ```bash
    ./run.sh <challenge_name>
    ```
    For example, to run `challenge1`:
    ```bash
    ./run.sh challenge1
    ```

## Google Cloud Run Deployment

This project can be deployed to Google Cloud Run, with each challenge running as a separate service. This allows for a scalable and managed deployment.

### Architecture

The deployment strategy uses a single, generic Docker image for all challenges. The specific challenge to run is determined at runtime by passing an argument to the container. Each of the 10 challenges is deployed as a separate Cloud Run service, each with its own unique URL.

### Prerequisites

- A Google Cloud Platform project must be created.
- The Cloud Build, Cloud Run, and Container Registry APIs must be enabled in the GCP project.
- The `gcloud` command-line tool must be installed and authenticated with permissions to the project.

### Deployment Steps

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/ksprashu/damn-vulnerable-mcp-server.git
    cd damn-vulnerable-mcp-server
    ```

2.  **Set your GCP project ID:**
    ```bash
    gcloud config set project [YOUR_PROJECT_ID]
    ```

3.  **Run the deployment script:**
    ```bash
    chmod +x cloud_run_deploy.sh
    ./cloud_run_deploy.sh
    ```

The script will first build the Docker image using Google Cloud Build and then deploy all 10 challenge services to Cloud Run.

### Service URLs

Once deployed, the services will be available at the following URLs (replace `[PROJECT_ID]` and `[REGION]` with your actual project ID and region):

- `dvmcp-challenge1-prompt-injection`: `https://dvmcp-challenge1-prompt-injection-....run.app`
- `dvmcp-challenge2-tool-poisoning`: `https://dvmcp-challenge2-tool-poisoning-....run.app`
- `dvmcp-challenge3-excessive-permissions`: `https://dvmcp-challenge3-excessive-permissions-....run.app`
- `dvmcp-challenge4-rug-pull-attack`: `https://dvmcp-challenge4-rug-pull-attack-....run.app`
- `dvmcp-challenge5-tool-shadowing`: `https://dvmcp-challenge5-tool-shadowing-....run.app`
- `dvmcp-challenge6-indirect-prompt-injection`: `https://dvmcp-challenge6-indirect-prompt-injection-....run.app`
- `dvmcp-challenge7-token-theft`: `https://dvmcp-challenge7-token-theft-....run.app`
- `dvmcp-challenge8-malicious-code-execution`: `https://dvmcp-challenge8-malicious-code-execution-....run.app`
- `dvmcp-challenge9-remote-access-control`: `https://dvmcp-challenge9-remote-access-control-....run.app`
- `dvmcp-challenge10-multi-vector-attack`: `https://dvmcp-challenge10-multi-vector-attack-....run.app`

You can get the exact URLs by running `gcloud run services list --platform managed`.

## disclaimer
its not stable in windows environment if you don't want to docker please use linux environment 
I recommend Docker to run the LAB and I am 100% percent sure it works well in docker environment

## Security Risks

While MCP provides many benefits, it also introduces new security considerations. This project demonstrates various vulnerabilities that can occur in MCP implementations, including:

1. **Prompt Injection**: Manipulating LLM behavior through malicious inputs
2. **Tool Poisoning**: Hiding malicious instructions in tool descriptions
3. **Excessive Permissions**: Exploiting overly permissive tool access
4. **Rug Pull Attacks**: Exploiting tool definition mutations
5. **Tool Shadowing**: Overriding legitimate tools with malicious ones
6. **Indirect Prompt Injection**: Injecting instructions through data sources
7. **Token Theft**: Exploiting insecure token storage
8. **Malicious Code Execution**: Executing arbitrary code through vulnerable tools
9. **Remote Access Control**: Gaining unauthorized system access
10. **Multi-Vector Attacks**: Combining multiple vulnerabilities

## Project Structure

```
damn-vulnerable-mcs/
├── README.md                 # Project overview
├── pyproject.toml            # Project dependencies and metadata
├── requirements.txt          # Python dependencies
├── Dockerfile                # Dockerfile for building the application
├── supervisord.conf          # Supervisor configuration for managing services
├── cloud_run_deploy.sh       # Deployment script for Google Cloud Run
├── run.sh                    # Script to run the application locally
├── challenges/               # Challenge implementations
│   ├── easy/                 # Easy difficulty challenges (1-3)
│   │   ├── challenge1/       # Basic Prompt Injection
│   │   ├── challenge2/       # Tool Poisoning
│   │   └── challenge3/       # Excessive Permission Scope
│   ├── medium/               # Medium difficulty challenges (4-7)
│   │   ├── challenge4/       # Rug Pull Attack
│   │   ├── challenge5/       # Tool Shadowing
│   │   ├── challenge6/       # Indirect Prompt Injection
│   │   └── challenge7/       # Token Theft
│   └── hard/                 # Hard difficulty challenges (8-10)
│       ├── challenge8/       # Malicious Code Execution
│       ├── challenge9/       # Remote Access Control
│       └── challenge10/      # Multi-Vector Attack
├── docs/                     # Documentation
│   ├── setup.md              # Setup instructions
│   ├── challenges.md         # Challenge descriptions
│   └── mcp_overview.md       # MCP protocol overview
├── solutions/                # Solution guides
└── common/                   # Shared code and utilities
```

## Getting Started

See the [Setup Guide](docs/setup.md) for detailed instructions on how to install and run the challenges.

## Challenges

The project includes 10 challenges across three difficulty levels:

### Easy Challenges

1. **Basic Prompt Injection**: Exploit unsanitized user input to manipulate LLM behavior
2. **Tool Poisoning**: Exploit hidden instructions in tool descriptions
3. **Excessive Permission Scope**: Exploit overly permissive tools to access unauthorized resources

### Medium Challenges

4. **Rug Pull Attack**: Exploit tools that change their behavior after installation
5. **Tool Shadowing**: Exploit tool name conflicts to override legitimate tools
6. **Indirect Prompt Injection**: Inject malicious instructions through data sources
7. **Token Theft**: Extract authentication tokens from insecure storage

### Hard Challenges

8. **Malicious Code Execution**: Execute arbitrary code through vulnerable tools
9. **Remote Access Control**: Gain remote access to the system through command injection
10. **Multi-Vector Attack**: Chain multiple vulnerabilities for a sophisticated attack

See the [Challenges Guide](docs/challenges.md) for detailed descriptions of each challenge.

## Solutions

Solution guides are provided for educational purposes. It's recommended to attempt the challenges on your own before consulting the solutions.

See the [Solutions Guide](solutions/README.md) for detailed solutions to each challenge.

## Note on `server.py` and `server_sse.py`

In each challenge directory, you will find two server files: `server.py` and `server_sse.py`.

-   `server.py`: This is the original implementation of the challenge server. It is not fully functional and does not support Server-Sent Events (SSE).
-   `server_sse.py`: This is the updated and fully functional version of the challenge server. It includes support for SSE, which is required for the challenges to work correctly.

When running the challenges, make sure you are using the `server_sse.py` files. The provided `run.sh` and `supervisord.conf` files are already configured to use the correct `server_sse.py` files.

## Disclaimer

This project is for educational purposes only. The vulnerabilities demonstrated in this project should never be implemented in production systems. Always follow security best practices when implementing MCP servers.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

This project is created by Harish Santhanalakshmi Ganesan using cursor IDE and Manus AI.

- Modification for Google Cloud Run done by Prashanth Subrahmanyam using Gemini CLI.



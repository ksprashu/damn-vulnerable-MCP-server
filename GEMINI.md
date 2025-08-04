# GEMINI.MD: AI Collaboration Guide

This document provides essential context for AI models interacting with this project. Adhering to these guidelines will ensure consistency and maintain code quality.

## 1. Project Overview & Purpose

* **Primary Goal:** This project is a deliberately vulnerable implementation of the Model Context Protocol (MCP) for educational purposes. It is designed to demonstrate security vulnerabilities in MCP implementations through 10 challenges of increasing difficulty.
* **Business Domain:** AI Security, Education, and Developer Tooling.

## 2. Core Technologies & Stack

* **Languages:** Python 3.11
* **Frameworks & Runtimes:** FastAPI, Uvicorn
* **Databases:** None explicitly defined. Some challenges may use file-based storage.
* **Key Libraries/Dependencies:** `fastapi`, `uvicorn`, `httpx`, `mcp`
* **Package Manager(s):** `pip` and `poetry`

## 3. Architectural Patterns

* **Overall Architecture:** The project follows a monolithic architecture. Each of the 10 challenges runs as a separate, independent server process. When run in a Docker container, these processes are managed by `supervisord`.
* **Directory Structure Philosophy:**
    * `/challenges`: Contains the individual challenge implementations, categorized by difficulty (easy, medium, hard).
    * `/common`: Contains shared code and utilities used by the challenges.
    * `/docs`: Contains project documentation.
    * `/solutions`: Contains solution guides for the challenges.
    * `/tests`: Contains tests for the project.

## 4. Coding Conventions & Style Guide

* **Formatting:** The code uses 4-space indentation and generally follows the PEP 8 style guide.
* **Naming Conventions:**
    * `variables`, `functions`: snake_case (`my_variable`)
    * `classes`: PascalCase (`MyClass`)
    * `files`: snake_case (`my_file.py`)
* **API Design:** The project implements the Model Context Protocol (MCP). It uses standard HTTP methods (GET, POST) and JSON for request/response bodies.
* **Error Handling:** Error handling is done through custom error messages in JSON format.

## 5. Key Files & Entrypoints

* **Main Entrypoint(s):** The main entrypoint for each challenge is the `server_sse.py` file within each challenge's directory. The `run.sh` script is used to start a specific challenge.
* **Configuration:** 
    * `supervisord.conf`: Configures the challenge servers when running in Docker.
    * `cloudbuild.yaml`: Defines the CI/CD configuration for Google Cloud Build.
* **CI/CD Pipeline:** The `cloudbuild.yaml` file defines the continuous integration pipeline for building the Docker image and deploying the challenges to Google Cloud Run.

## 6. Development & Testing Workflow

* **Local Development Environment:** The project can be run locally using Docker or a Python virtual environment. The `README.md` provides instructions for both setups.
* **Testing:** Tests are run using `pytest`. The test suite can be executed by running the `test` script defined in `pyproject.toml`. Tests are located in the `/tests` directory.
* **CI/CD Process:** The CI/CD process is defined in `cloudbuild.yaml`. It is triggered by a push to the repository and performs the following steps:
    1. Builds the Docker image.
    2. Pushes the image to Google Container Registry.
    3. Deploys each challenge as a separate service to Google Cloud Run.

## 7. Specific Instructions for AI Collaboration

* **Contribution Guidelines:** There are no explicit contribution guidelines in the repository. It is recommended to follow the existing coding style and to add tests for any new features.
* **Infrastructure (IaC):** The `cloudbuild.yaml` file defines the infrastructure for deploying the challenges to Google Cloud Run. Any changes to this file will affect the deployment process and should be reviewed carefully.
* **Security:** This project is deliberately vulnerable for educational purposes. However, any new code should follow security best practices. Do not hardcode secrets or keys.
* **Dependencies:** New dependencies should be added to both the `requirements.txt` and `pyproject.toml` files to ensure consistency between the Docker and local development environments.
* **Commit Messages:** The commit history shows a mix of commit message styles. It is recommended to follow the Conventional Commits specification (e.g., `feat:`, `fix:`, `docs:`) for any new commits.

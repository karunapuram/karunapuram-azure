# Repository Structure

## Files and Their Purpose

- **Dockerfile is in README PART 1**: Contains instructions to build the Docker image with security best practices.
- **main.tf**: Terraform script for setting up Azure resources, including a resource group, storage account, service plan, and function app.
- **azure-pipelines.yml**: GitHub Actions workflow for CI/CD pipeline, including steps for building, testing, security scanning, and deploying the application.
- **function/__init__.py**: Python function code for the Azure Function App.
- **function/function.json**: Configuration file for the Azure Function App.
- **function/requirements.txt**: List of Python dependencies.
- **function/test_function.py**: Test cases for the Python function.
- **function/function.zip**: Zipped package of the function app for deployment.

## Flow of the CI/CD Pipeline

1. **Code Checkout**: The workflow starts by checking out the code from the repository.
2. **Setup Python**: Python environment is set up using the specified version.
3. **Install Dependencies**: Python dependencies are installed from `requirements.txt`.
4. **Lint Code**: The code is linted using `flake8` to ensure code quality.
5. **Run Tests**: Test cases are executed using `pytest`.
6. **Security Scan**: Code is scanned for security issues using `bandit`.
7. **Terraform Initialization and Deployment**: Terraform is used to set up the necessary Azure infrastructure.
8. **Deploy Function App**: The Azure Function App is deployed using the Azure CLI.

## Getting Started

### Prerequisites

- Docker
- Kubernetes
- Terraform
- Azure CLI
- Python

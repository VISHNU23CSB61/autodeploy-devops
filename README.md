
# 🚀 AutoDeploy — Automated Cloud Deployment Pipeline

An end-to-end Cloud & DevOps project that automates application testing, Docker image creation, publishing, and deployment to AWS EC2 using GitHub Actions and AWS Systems Manager.

## 📌 Project Overview

AutoDeploy demonstrates how a simple Node.js application can be containerized and deployed to the cloud through a CI/CD pipeline. Whenever code is pushed to the `main` branch, GitHub Actions runs the pipeline to test the application, build and publish the Docker image, and deploy the latest image to an EC2 instance.

The project also uses Amazon CloudWatch to monitor EC2 CPU utilization and trigger an alarm when CPU usage exceeds a configured threshold.

## 🏗️ Architecture

```text
Developer
    |
    | git push
    v
GitHub Repository
    |
    v
GitHub Actions CI/CD
    |
    +--> Install dependencies & run tests
    |
    +--> Build Docker image
    |
    +--> Push image to GitHub Container Registry
    |
    +--> Authenticate to AWS using OIDC
    |
    v
AWS Systems Manager
    |
    v
Amazon EC2
    |
    v
Docker Container
    |
    v
Node.js Web Application

Amazon CloudWatch
    |
    +--> EC2 CPU utilization monitoring
    |
    +--> High CPU alarm
```

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Node.js | Application runtime |
| Docker | Application containerization |
| Docker Compose | Container configuration validation |
| Git & GitHub | Source code management |
| GitHub Actions | CI/CD automation |
| GitHub Container Registry (GHCR) | Docker image storage |
| AWS EC2 | Cloud application hosting |
| AWS Systems Manager (SSM) | Remote deployment execution |
| AWS IAM & OIDC | Secure GitHub Actions authentication |
| Amazon CloudWatch | Metrics and CPU alarm |
| Terraform | Infrastructure-as-code work in progress |

## ⚙️ CI/CD Workflow

The GitHub Actions workflow performs the following steps:

1. Checks out the repository.
2. Sets up Node.js.
3. Installs application dependencies using `npm ci`.
4. Runs the application's automated tests.
5. Authenticates with GitHub Container Registry.
6. Builds the Docker image.
7. Publishes the image to GHCR.
8. Assumes the AWS IAM deployment role using GitHub OIDC.
9. Sends a deployment command through AWS Systems Manager.
10. Pulls the latest image onto EC2 and recreates the application container.

## ☁️ AWS Infrastructure

### Amazon EC2
Hosts the Dockerized Node.js application.

### AWS Systems Manager
Executes deployment commands on the EC2 instance without requiring SSH private keys in GitHub Actions.

### AWS IAM and OIDC
Allows GitHub Actions to obtain temporary AWS credentials through an IAM role.

### Amazon CloudWatch
Monitors the EC2 `CPUUtilization` metric and evaluates the `AutoDeploy-High-CPU` alarm.

The alarm is configured to trigger when average CPU utilization exceeds 80% for two consecutive five-minute periods.

## 🐳 Run the Application Locally

### Prerequisites

- Node.js and npm
- Docker Desktop
- Git

### 1. Clone the repository

```bash
git clone https://github.com/VISHNU23CSB61/autodeploy-devops.git
cd autodeploy-devops
```

### 2. Install dependencies

```bash
cd app
npm install
```

### 3. Run tests

```bash
npm test
```

### 4. Run with Docker

Return to the repository root:

```bash
cd ..
docker build -t autodeploy-app .
docker run --rm -p 3000:3000 autodeploy-app
```

Open `http://localhost:3000` in your browser.

> Ensure the application's configured port matches the Docker port mapping.

## 🔐 Security Practices

- Use GitHub OIDC instead of long-lived AWS access keys for CI/CD authentication.
- Restrict the IAM trust policy to the intended repository and branch.
- Grant only the AWS permissions required for deployment.
- Avoid committing credentials, private keys, or secret environment files.
- Review security group rules and restrict inbound traffic to the required ports.
- Keep deployment logs free of sensitive information.

## 📊 Monitoring and Validation

- Check GitHub Actions logs for build, test, and deployment results.
- Verify the application responds over HTTP.
- Check the EC2 instance's status in the AWS console.
- Review CPU metrics and alarm state in CloudWatch.
- Check AWS billing and stop resources when they are not needed.

## 🎯 Project Objectives

- Automate application deployment using CI/CD.
- Understand Docker image building and distribution.
- Deploy a containerized application to AWS EC2.
- Use OIDC-based authentication between GitHub Actions and AWS.
- Execute remote deployments through AWS Systems Manager.
- Monitor cloud infrastructure with Amazon CloudWatch.

## 🚧 Future Enhancements

- Complete Terraform-based infrastructure provisioning and state management.
- Add application health checks and deployment verification.
- Configure CloudWatch notifications through Amazon SNS.
- Add container vulnerability scanning.
- Implement deployment rollback and version tagging.
- Add HTTPS using a domain and TLS certificate.

## 👨‍💻 Author

**Vishnu S**

Cloud & DevOps | AWS | Docker | GitHub Actions | CI/CD

GitHub: [VISHNU23CSB61](https://github.com/VISHNU23CSB61)

---

⭐ If you find this project useful, feel free to explore the repository and its workflow.
# 🚀 Dynamic DevSecOps Pipeline (End-to-End Automation)

## 📌 Overview

This project implements a **fully automated, dynamic DevSecOps pipeline** that provisions infrastructure, builds and deploys applications, and integrates **end-to-end security scanning (SAST, SCA, Container, DAST)**.

The pipeline is designed to work with **any GitHub repository** (with a Docker Compose setup) by simply providing input variables such as:

- 🔗 GitHub Repository URL  
- 🌿 Branch Name  
- 🌐 Application Port  

Once triggered, the pipeline automatically:

1. ⚙️ Provisions infrastructure using Terraform  
2. 🐳 Builds & pushes Docker image to AWS ECR  
3. 🔍 Performs code quality & security analysis (SonarCloud)  
4. 🛡️ Runs vulnerability scans (Trivy, OWASP Dependency Check)  
5. 🌍 Deploys the application on EC2  
6. 🚨 Performs DAST testing using OWASP ZAP  
7. 📊 Generates and stores all reports as GitHub Artifacts  
8. ♻️ Supports complete infrastructure teardown (Destroy phase)  

---

## 🎯 Key Highlights

- 🔄 **Dynamic Input-Based Execution** (Reusable for any project)
- ☁️ **Infrastructure as Code (Terraform)**  
- 🔐 **End-to-End DevSecOps Integration**
- 📦 **Containerized Deployment (Docker + Docker Compose)**  
- 📊 **Automated Security Reports (HTML format)**  
- 🚀 **Fully Automated CI/CD Pipeline**
- 🧹 **One-Click Destroy for Resource Cleanup**

---

## 🧠 Use Case

This pipeline is ideal for:

- DevSecOps Engineers  
- Cloud Engineers  
- Security-focused CI/CD implementations  
- Automated secure application deployments  

It eliminates manual effort and ensures **secure, consistent, and repeatable deployments**.

---

## 🛠️ Tech Stack

- **Cloud:** AWS (EC2, VPC, ECR)
- **IaC:** Terraform  
- **CI/CD:** GitHub Actions  
- **Containerization:** Docker, Docker Compose  
- **Code Quality:** SonarCloud  
- **Security Tools:**
  - Trivy (Container Scanning)
  - OWASP Dependency Check (SCA)
  - OWASP ZAP (DAST)
- **Languages:** YAML, Bash  

---

## 📁 Project Structure (High-Level)
```text
.
├── terraform/ # Infrastructure provisioning
├── .github/workflows/ # CI/CD pipeline
├── scripts/ # Automation scripts (if any)
├── docker-compose.yml # App deployment config (user provided)
└── README.md
```

---

## 🔥 What Makes This Project Unique?

Unlike traditional pipelines, this system:

- Accepts **runtime inputs** and works dynamically  
- Combines **Infra + Security + Deployment in one flow**  
- Generates **auditable security reports automatically**  
- Supports **full lifecycle (Provision → Scan → Deploy → Destroy)**  

---

## 🏗️ Architecture Flow

### 🔄 End-to-End Pipeline Architecture

User Input (GitHub URL, Branch, Port)
                │
                ▼
        GitHub Actions Trigger
                │
                ▼
        Terraform Provisioning
     (EC2 + VPC + ECR Creation)
                │
                ▼
        Docker Build & Tag Image
                │
                ▼
        Push Image to AWS ECR
                │
                ▼
        SonarCloud Scan (SAST)
                │
                ▼
  ┌──────────────────────────────────┐
  │ Security Scanning Phase          │
  │                                  │
  │  🔹 Trivy (Container Scan)       │
  │  🔹 OWASP Dependency Check (SCA) │
  │  🔹 OWASP ZAP (DAST)             │
  └──────────────────────────────────┘
                │
                ▼
     Deploy App using Docker Compose
                │
                ▼
     Run ZAP Scan on Live Application
                │
                ▼
     Generate HTML Reports
                │
                ▼
     Upload Reports to GitHub Artifacts
                │
                ▼
     Optional Destroy (Cleanup Infra)

---

## ⚙️ Workflow Structure (Step-by-Step)

### 1️⃣ User Input Stage
- User provides:
  - GitHub Repository URL  
  - Branch Name  
  - Application Port  

- Pipeline dynamically adapts to any project with a `docker-compose.yml`.

---

### 2️⃣ Infrastructure Provisioning (Terraform)

- Creates:
  - 🖥️ EC2 Instance  
  - 🌐 VPC & Networking  
  - 📦 AWS ECR Repository  

- Ensures isolated and scalable environment.

---

### 3️⃣ Build & Push Docker Image

- Reads project from GitHub  
- Builds Docker image  
- Tags and pushes image to **AWS ECR**

---

### 4️⃣ Static Code Analysis (SAST - SonarCloud)

- Scans source code for:
  - Bugs 🐞  
  - Vulnerabilities 🔐  
  - Code smells 🧹  

- Generates report → converted into **HTML**  
- Stored in GitHub Artifacts  

---

### 5️⃣ Container Security Scan (Trivy)

- Pulls image from **ECR**  
- Scans for:
  - OS vulnerabilities  
  - Library vulnerabilities  

- Generates **HTML vulnerability report**

---

### 6️⃣ Software Composition Analysis (OWASP Dependency Check)

- Uses **NVD API Key**
- Steps:
  - Installs dependencies  
  - Scans project libraries  

- Detects:
  - Known vulnerable packages  

- Outputs detailed **HTML report**

---

### 7️⃣ Deployment Phase

- Runs:
  ```bash
  docker-compose up -d

  ## ⚡ Setup & Execution Guide

Follow these steps to run the **Dynamic DevSecOps Pipeline** successfully.

---

## 📋 Prerequisites

Make sure you have:

- ✅ AWS Account  
- ✅ GitHub Account  
- ✅ Docker & Docker Compose installed  
- ✅ Terraform installed  
- ✅ SonarCloud Account  
- ✅ NVD API Key (for Dependency Check)

---

## 🔐 Required Secrets (GitHub)

Go to your repository → **Settings → Secrets → Actions** and add:

---

## 📥 User Inputs (Pipeline Variables)

The pipeline works dynamically based on inputs:

| Variable        | Description                          |
|----------------|--------------------------------------|
| REPO_URL       | GitHub repository link               |
| BRANCH         | Branch name                          |
| APP_PORT       | Port where app will run              |

---

## 🚀 Running the Pipeline

### Step 1️⃣: Fork / Clone Repository
git clone <your-repo-url>
cd <repo-name>

---

### Step 2️⃣: Trigger GitHub Actions

1. Go to **GitHub → Actions**
2. Select workflow  
3. Click **Run Workflow**  
4. Provide inputs:
   - REPO_URL  
   - BRANCH  
   - APP_PORT  

---

### Step 3️⃣: Pipeline Execution Flow

Once triggered, the pipeline will:

- Provision infrastructure using Terraform  
- Build Docker image  
- Push image to AWS ECR  
- Run SonarCloud scan  
- Perform:
  - Trivy Scan  
  - OWASP Dependency Check  
- Deploy application on EC2  
- Run OWASP ZAP scan  
- Generate all reports  

---

## 📊 Accessing Reports

After execution:

1. Go to **GitHub Actions → Workflow Run**
2. Scroll down to **Artifacts**
3. Download reports:

- 📄 SonarCloud Report  
- 📄 Trivy Report  
- 📄 Dependency Check Report  
- 📄 ZAP Report  

---

## 🌍 Access Deployed Application

Once deployment is complete:
check: http://<EC2-Public-IP>:<APP_PORT>

---

## 🧹 Destroy Infrastructure

To clean up resources:

1. Run workflow again  
2. Select **Destroy Option**  

This will:

- Terminate EC2  
- Delete VPC  
- Remove ECR  

---

## ⚠️ Important Notes

- Ensure your project contains a valid `docker-compose.yml`  
- Security scans may take time ⏳  
- NVD API has rate limits — avoid excessive runs  
- Keep AWS credentials secure 🔐  

---

## ✅ Expected Outcome

After successful execution:

- Application deployed on AWS EC2 🌍  
- Docker image stored in ECR 📦  
- Security reports generated 📊  
- Fully automated DevSecOps lifecycle completed 🚀  

---

## 🔐 Security Implementation (DevSecOps Deep Dive)

This pipeline integrates **security at every stage of the CI/CD lifecycle**, ensuring that vulnerabilities are detected early and continuously.

---

## 🧩 Security Layers Overview

| Stage            | Tool Used                     | Type  | Purpose                          |
|------------------|------------------------------|-------|----------------------------------|
| Code Analysis    | SonarCloud                   | SAST  | Analyze source code              |
| Dependencies     | OWASP Dependency Check       | SCA   | Detect vulnerable libraries      |
| Container Image  | Trivy                        | Image Scan | Scan Docker image          |
| Runtime App      | OWASP ZAP                    | DAST  | Test running application         |

---

## 🔍 1. SonarCloud (SAST - Static Application Security Testing)

### 📌 Purpose
Analyzes **source code without executing it**.

### 🔎 Detects
- Bugs 🐞  
- Code smells 🧹  
- Security vulnerabilities 🔐  
- Maintainability issues  

### ⚙️ How It Works in Pipeline
- Triggered after build stage  
- Uses `SONAR_TOKEN` and project key  
- Scans entire codebase  

### 📊 Output
- Quality Gate Status  
- Vulnerability Report (converted to HTML)  
- Stored in GitHub Artifacts  

---

## 📦 2. Trivy (Container Vulnerability Scanner)

### 📌 Purpose
Scans Docker images for known vulnerabilities.

### 🔎 Detects
- OS package vulnerabilities  
- Language-specific dependencies  
- Misconfigurations  

### ⚙️ Pipeline Flow
- Pulls image from AWS ECR  
- Runs scan on built image  

### 📊 Output
- CVE-based vulnerability report  
- Severity levels:
  - LOW  
  - MEDIUM  
  - HIGH  
  - CRITICAL  

- HTML report stored in artifacts  

---

## 📚 3. OWASP Dependency Check (SCA)

### 📌 Purpose
Identifies vulnerable **third-party libraries** used in the project.

### 🔎 Detects
- Known CVEs in dependencies  
- Outdated or insecure packages  

### ⚙️ Pipeline Flow
- Uses **NVD API Key**  
- Downloads vulnerability database  
- Scans project dependencies  

### 📊 Output
- Detailed HTML report  
- Includes:
  - CVE ID  
  - Severity  
  - Affected library  
  - Recommended fix  

---

## 🌐 4. OWASP ZAP (DAST - Dynamic Application Security Testing)

### 📌 Purpose
Tests the **running application** for vulnerabilities.

### 🔎 Detects
- SQL Injection  
- XSS (Cross-Site Scripting)  
- Broken Authentication  
- Security misconfigurations  

### ⚙️ Pipeline Flow
1. Application deployed on EC2  
2. ZAP targets live URL  
3. Performs:
   - Passive Scan  
   - Active Scan  

### 📊 Output
- HTML report with:
  - Risk levels  
  - Attack vectors  
  - Affected endpoints  

---

## 🔄 Security Flow Integration

Security is not a single step — it's embedded across the pipeline:
Code → SAST → Build → Image Scan → Deploy → DAST → Report

---

## 🛡️ Why This Approach is Strong

- ✅ **Shift Left Security** (early detection)  
- ✅ **Multiple Layers of Protection**  
- ✅ **Automated Reporting**  
- ✅ **Covers Code → Dependency → Container → Runtime**  

---

## ⚠️ Limitations & Considerations

- SonarCloud depends on proper rule configuration  
- NVD API rate limits can slow Dependency Check  
- ZAP scans may increase pipeline execution time  
- False positives may require manual validation  

---

## 🚀 Security Outcome

By the end of the pipeline:

- Code is validated ✅  
- Dependencies are secured ✅  
- Container image is scanned ✅  
- Live application is tested ✅  

➡️ Result: **Production-ready, security-tested deployment**

---

## 📸 Outputs & Reports

This section demonstrates the **actual results generated by the pipeline**, including security reports and deployment proof.

---

## 📊 Generated Reports

The pipeline automatically generates the following reports in **HTML format**:

| Tool                     | Report Type              | Description                          |
|--------------------------|--------------------------|--------------------------------------|
| SonarCloud               | SAST Report              | Code quality & vulnerabilities       |
| Trivy                    | Container Scan Report    | Image vulnerabilities                |
| OWASP Dependency Check   | SCA Report               | Dependency vulnerabilities           |
| OWASP ZAP                | DAST Report              | Runtime security issues              |

---

## 📁 Accessing Reports

All reports are available as **GitHub Artifacts**:

1. Go to **GitHub Actions**
2. Open latest workflow run  
3. Scroll to **Artifacts section**
4. Download reports  

---

## 🖼️ Sample Screenshots (Add Yours)

> ⚠️ Replace the placeholders below with your actual screenshots

---

### 🔍 SonarCloud Report
![Sonar Report](./screenshots/sonar-report.png)
---

### 🛡️ Trivy Scan Report
![Trivy Report](./screenshots/trivy-report.png)
---

### 📚 Dependency Check Report
![Dependency Report](./screenshots/dependency-report.png)
---

### 🌐 ZAP DAST Report
![ZAP Report](./screenshots/zap-report.png)
---

### 🚀 Deployed Application
![Deployed App](./screenshots/deployed-app.png)

---

## 🎯 Key Achievements

- ✅ Fully automated DevSecOps pipeline  
- ✅ Integrated 4 major security tools  
- ✅ Dynamic project execution using runtime inputs  
- ✅ Automated report generation (HTML)  
- ✅ End-to-end lifecycle: Provision → Scan → Deploy → Destroy  

---

## 💼 Resume / Interview Points

Use these directly in your resume or interviews:

### 🔹 Short Version (1–2 lines)

- Built a **dynamic end-to-end DevSecOps pipeline** integrating Terraform, Docker, and multiple security tools (SAST, SCA, DAST) with automated reporting.

---

### 🔹 Medium Version (3–4 lines)

- Designed and implemented a **dynamic DevSecOps CI/CD pipeline** using GitHub Actions and Terraform.  
- Automated infrastructure provisioning (EC2, VPC, ECR) and container deployment.  
- Integrated security tools like **SonarCloud, Trivy, OWASP Dependency Check, and ZAP**.  
- Generated and managed security reports as GitHub artifacts.

---

### 🔹 Strong Interview Version

- Engineered a **scalable DevSecOps pipeline** that dynamically accepts repository inputs and automates infrastructure provisioning, containerization, deployment, and multi-layer security scanning.  
- Implemented **SAST, SCA, container scanning, and DAST** in a unified workflow.  
- Optimized pipeline for **full lifecycle management**, including automated teardown for cost efficiency.

---

## 🚀 Real Impact

This project demonstrates:

- 🔐 Strong understanding of DevSecOps principles  
- ☁️ Hands-on cloud infrastructure automation  
- ⚙️ CI/CD pipeline design expertise  
- 🛡️ Practical security implementation  

---
## 🤝 Contributing

Contributions are welcome! 🚀  

If you'd like to improve this project:

1. Fork the repository  
2. Create a new branch  
3. Make your changes
4. Commit your work
5. Push to your branch
6. Open a Pull Request

## 💡 Future Enhancements

This project can be extended further with:

- 🔄 Kubernetes (EKS) deployment instead of EC2  
- 📦 Helm charts integration  
- 🔐 Secrets management using AWS Secrets Manager  
- 📊 Dashboard for security reports visualization  
- 🚀 Slack / Email notifications for pipeline status  
- 🧠 AI-based vulnerability prioritization  
- 🔍 Integration with monitoring tools (Prometheus, Grafana)  

---

## ⚠️ Known Limitations

- Pipeline execution time is relatively high due to multiple scans  
- NVD API rate limiting may affect Dependency Check performance  
- Requires proper Docker Compose configuration in user project  
- Security tools may produce false positives  

---

## 📜 License

This project is licensed under the **MIT License**.

You are free to:

- ✔️ Use  
- ✔️ Modify  
- ✔️ Distribute  

With proper attribution.

---

## 🙌 Acknowledgements

- DevSecOps community  
- Open-source security tools (OWASP, Trivy)  
- GitHub Actions ecosystem  
- Terraform & AWS documentation  

---

## 📬 Contact

If you have any questions or suggestions:

- 📧 Reach out via GitHub Issues  
- 🤝 Open for collaboration  

---

## ⭐ Support

If you found this project useful:

👉 Give it a ⭐ on GitHub  

It helps others discover it and motivates further development.

---

## 🚀 Final Note

This project is a step towards building **secure, automated, and scalable deployment systems**.

> “Security is not a step, it's a continuous process integrated into DevOps.”

---

## 🎉 DONE

Now your README is:

- ✅ Structured  
- ✅ Recruiter-friendly  
- ✅ Interview-ready  
- ✅ Professional level  

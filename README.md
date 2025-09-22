# 🚀 Assignment – Automate EC2 Deployment with Terraform

This project demonstrates **Infrastructure as Code (IaC)** using **Terraform** to automate the deployment of an AWS EC2 instance, configure it, deploy an application, and enforce best practices for DevOps.

---

## 📌 Assignment Requirements

1. **Sign up for AWS Free Tier**  
   Use your own AWS Free Tier account for this project..

2. **Spin up an EC2 instance**  
   - Instance type is configurable (`t3.micro` by default).  
   - Region and instance type are parameterized in `variables.tf`.

3. **Install dependencies**  
   - Installs **Java 21** on the EC2 instance using provisioning scripts.

4. **Clone repo & deploy app from GitHub**  
   - Application repo: [test-repo-for-devops](https://github.com/Trainings-TechEazy/test-repo-for-devops)  
   - The instance clones the repo, builds it with Maven, and runs the application.

   mvn clean package
   java -jar target/techeazy-devops-0.0.1-SNAPSHOT.jar

5.  ***Tested with:**
openjdk version "21.0.2" 2024-01-16

6. **Verify application**

Once deployed, the application will be accessible on port 80.

Terraform outputs the public IP address of the instance.

You can test the app by visiting: public ip




-----


## 📂 Project Structure

```bash
tech_eazy_devops_nanii5656-nani/
├── terraform/
│   ├── main.tf              # Main Terraform configuration
│   ├── variables.tf         # Input variables (region, instance type, etc.)
│   ├── outputs.tf           # Output values (e.g., public IP)
│   ├── user_data.tpl        # Cloud-init script to install Java, clone repo, run app
│   ├── dev_config.tfvars    # Config for Dev stage
│   ├── prod_config.tfvars   # Config for Prod stage
│   ├── scripts/             # Helper scripts (shutdown, etc.)
│   └── .terraform.lock.hcl
├── .gitignore               # Ignore Terraform state & cache files
└── README.md                # Project documentation


---

  **Prerequisites:**

Terraform (v1.0+)
AWS CLI configured with your credentials:
aws configure
Maven (on the instance via provisioning)
GitHub repo access: test-repo-for-devops


----


🚀 Usage:

Initialize Terraform   :  terraform init
Validate configuration :  terraform validate
Plan deployment        :  terraform plan -var-file="dev_config.tfvars"
Apply configuration    :  terraform apply -var-file="dev_config.tfvars" -auto-approve

Access application
. After apply, Terraform will output the public IP of the EC2 instance.
. Open http://<public-ip> in a browser (port 80).

Destroy resources     :  terraform destroy -var-file="dev_config.tfvars" -auto-approve


---

**Screenshots**

<img width="938" height="449" alt="Screenshot 2025-09-22 133206" src="https://github.com/user-attachments/assets/d51a3281-2924-45a1-b644-fe12a3b88279" />



<img width="1919" height="1004" alt="output" src="https://github.com/user-attachments/assets/e81ebf2e-d8ea-4501-a98b-45891325956c" />

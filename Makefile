.PHONY: fmt-check init plan apply

fmt-check:
	cd terraform && \
	if ! terraform fmt -check; then \
	  echo "Terraform format check failed. Run 'terraform fmt' to fix the format."; \
	  exit 1; \
	fi

init:
	cd terraform && \
	terraform init -backend-config=$(ENV_DIR)/backend.conf -migrate-state -force-copy

plan:
	cd terraform && \
	terraform plan -var-file=$(ENV_DIR)/variables.tfvars

apply:
	cd terraform && \
	terraform apply -auto-approve -var-file=$(ENV_DIR)/variables.tfvars

remove-tf-tmp:
	cd terraform && \
	rm -rf .terraform terraform.tfstate.d/ .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup

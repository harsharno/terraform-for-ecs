apply:
	terraform apply -auto-approve
destroy:
	terraform destroy -auto-approve
fmt:
	terraform fmt
validate:
	terraform validate
init:
	terraform init
plan:
	terraform plan
start:
	chmod +x alpha.sh
	chmod +x beta.sh
	sh ./alpha.sh
recreate:
	terraform destroy -auto-approve
	terraform apply -auto-approve
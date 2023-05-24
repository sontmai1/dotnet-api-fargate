init:
	terraform init 

plan:
	terraform plan 

apply:
	terraform apply -auto-approve 

test:
	curl http://${ALB_URL}/WeatherForecast

kill:
	terraform destroy -auto-approve
#	aws ecr list-images --repository-name ${REPO_NAME} --query 'imageIds[*].imageDigest' --output text | while read imageId; do aws ecr batch-delete-image --repository-name ${REPO_NAME} --image-ids imageDigest=$$imageId; done
#	aws ecr delete-repository --repository-name ${REPO_NAME}
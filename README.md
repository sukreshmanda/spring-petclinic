## Build docker image
1. Get pet-clinic-repository-url from the output of  ```terraform apply```
2. ```aws ecr get-login-password --region <REGION> | docker login --username AWS --password-stdin <PET-CLINIC-REPOSITORY-URL>```
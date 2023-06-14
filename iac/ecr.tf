resource "aws_ecr_repository" "pet-clinic-repository" {
  name = "pet-clinic"
}

output "pet-clinic-repository-url" {
  value = aws_ecr_repository.pet-clinic-repository.repository_url
}

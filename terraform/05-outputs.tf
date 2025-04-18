#Output
output "aws_apigateway_url" {
  description = "Invoke Lambda function with this URL"
  value       = aws_apigatewayv2_api.simple-api.api_endpoint
}
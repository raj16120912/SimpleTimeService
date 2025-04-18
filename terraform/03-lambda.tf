#Security Group
resource "aws_security_group" "lambda_sg" {
  name   = "lambda-sg"
  vpc_id = aws_vpc.simplevpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#IAM Role
resource "aws_iam_role" "access_for_lambda" {
  name = "access-for-lambda"

  assume_role_policy = jsondecode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })

}

resource "aws_iam_policy_attachment" "lambda_access" {
  name       = "lambda-access"
  roles      = [aws_iam_role.access_for_lambda.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

#Lambda Function
resource "aws_lambda_function" "container_lambda" {
  function_name = "simple-container-lambda"
  package_type  = "Image"
  image_uri     = var.image_uri
  role          = aws_iam_role.access_for_lambda.arn
  timeout       = 10
  memory_size   = 128

  vpc_config {
    subnet_ids         = [aws_subnet.private_1.id, aws_subnet.private_2.id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }
}

#Lambda permission for API Gateway
resource "aws_lambda_permission" "simple-apigw" {
  statement_id  = "AllowAPIGWInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.container_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.simple-api.execution_arn}/*/*"
}
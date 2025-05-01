# Use AWS Lambda Python base image
FROM public.ecr.aws/lambda/python:3.11

# Set working directory
WORKDIR /var/task

# Install dependencies into the Lambda runtime path
COPY requirements.txt .
RUN pip install -r requirements.txt --target .

# Copy application code
COPY app.py .

# Create user manually without useradd
# UID 1001, GID 1001 are arbitrary non-root values
RUN mkdir -p /home/rajp && \
    echo 'rajp:x:1001:1001::/home/rajp:/bin/bash' >> /etc/passwd && \
    echo 'rajp:x:1001:' >> /etc/group && \
    chown -R 1001:1001 /home/rajp && \
    chown -R 1001:1001 /var/task

# Switch to non-root user
USER 1001

#EXPOSE Port
EXPOSE 5000

# Set the handler for Lambda
CMD ["app.handler"]
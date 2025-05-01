FROM public.ecr.aws/lambda/python:3.9

# Install useradd from shadow-utils
RUN yum install -y shadow-utils && \
    useradd --create-home rajp

# Set working directory
WORKDIR /home/rajp

# Copy your app
COPY app.py requirements.txt ./

# Install Python deps
RUN pip install --no-cache-dir -r requirements.txt -t .

# Set ownership
RUN chown -R rajp /home/rajp

# Switch to the non-root user
USER rajp

# Set Lambda handler
CMD ["app.handler"]

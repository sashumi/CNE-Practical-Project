# Use Python Image
FROM python:3.8
# Copy contents into image
COPY . .
# Run pip dependencies
RUN python3 -m pip install -r requirements.txt
# Expose the correct port
EXPOSE 5001
# Create an entrypoint
ENTRYPOINT ["python3", "app.py"]
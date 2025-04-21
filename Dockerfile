FROM python:3.12.10-alpine3.21
COPY . /APPLICATION
WORKDIR /APPLICATION
RUN pip3 install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["python3","app.py"]
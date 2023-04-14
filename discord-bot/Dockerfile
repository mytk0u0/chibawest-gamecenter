FROM python:3.10.6-buster

ENV APP_HOME /app
WORKDIR ${APP_HOME}

RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.4.2
ENV PATH "/root/.local/bin:${PATH}"
RUN poetry config virtualenvs.create false

COPY . ./
RUN poetry install --no-interaction --only main

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]

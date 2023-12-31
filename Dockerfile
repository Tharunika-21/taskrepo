FROM python:3.10-alpine3.15

RUN pip install --upgrade pip

RUN adduser -D tharuni
USER tharuni
WORKDIR /home/tharuni

ENV PATH="/home/tharuni/.local/bin:${PATH}"

COPY --chown=tharuni:tharuni requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

COPY --chown=tharuni:tharuni . .

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]

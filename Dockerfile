FROM python:3.10-slim-bookworm

# Standard updates
RUN apt update && apt upgrade -y
RUN apt install git -y

# Move to the working directory first
WORKDIR /TheMovieProviderBot

# Copy everything from your local folder into the container
# This includes bot.py, info.py, and all subfolders
COPY . .

# Install requirements
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

# Ensure start.sh is executable (if you decide to use it)
RUN chmod +x start.sh

# The correct way to start a python bot
CMD ["python3", "bot.py"]

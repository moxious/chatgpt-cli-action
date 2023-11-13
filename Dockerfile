FROM ubuntu:latest
RUN apt update && apt install -y \
  curl \
  gpg
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg;
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null;
RUN apt update && apt install -y gh python3 python3-pip jq
RUN pip3 install -U pip
COPY entrypoint.sh /entrypoint.sh
RUN pip3 install git+https://github.com/moxious/chatgpt-cli
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

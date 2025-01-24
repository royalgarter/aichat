FROM ubuntu:24.10

RUN mkdir -p /app /root/.config/aichat/

WORKDIR /app

ADD https://github.com/sigoden/aichat/releases/download/v0.27.0-rc2/aichat-v0.27.0-rc2-x86_64-unknown-linux-musl.tar.gz ./
RUN tar -xzf aichat-v0.27.0-rc2-x86_64-unknown-linux-musl.tar.gz \
 && rm aichat-v0.27.0-rc2-x86_64-unknown-linux-musl.tar.gz \
 && chmod +x aichat \
 && mv ./aichat /usr/local/bin/ \
 && ls -lha \
 && touch /root/.config/aichat/config.yaml \
 && echo "done"

CMD aichat --serve

# docker rm -f aichat
# docker run -d --name "aichat" -v "$(pwd)/.mnt/config.yaml:/root/.config/aichat/config.yaml" aichat
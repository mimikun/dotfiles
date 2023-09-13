FROM ubuntu:latest

# Install deps
RUN apt-get update
RUN apt-get install -y \
        language-pack-ja sudo git curl wget build-essential unzip

# Install chezmoi
RUN curl -fsLS get.chezmoi.io | sh

# Install bitwarden cli
RUN curl -fsLS "https://vault.bitwarden.com/download/?app=cli&platform=linux" -o /tmp/bw.zip
RUN unzip /tmp/bw.zip
RUN cp bw /usr/local/bin/bw
RUN rm bw
RUN rm -rf /tmp/bw.zip

# Create a test user(non-root user)
RUN useradd -ms /bin/bash user && \
        echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
        chmod 0440 /etc/sudoers.d/user

USER user:user

# Set bashrc
RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

# Setup chezmoi
RUN chezmoi init --apply --one-shot https://github.com/mimikun/dotfiles.git
WORKDIR /home/user/.local/share/chezmoi
#COPY . .
# chezmoi re-init and setting chezmoi.toml from template
#RUN chezmoi init

# chezmoi apply
#RUN chezmoi apply

CMD ["bash"]

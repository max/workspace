# install hub
FROM ubuntu:18.10 as hub_builder
RUN apt-get update && apt-get install -y wget ca-certificates
RUN wget https://github.com/github/hub/releases/download/v2.11.1/hub-linux-amd64-2.11.1.tgz && \
  tar xf hub-linux-amd64-2.11.1.tgz && \
  chmod +x hub-linux-amd64-2.11.1/bin/hub && \
  mv hub-linux-amd64-2.11.1/bin/hub /usr/local/bin

# install vim plugins
FROM ubuntu:18.10 as vim_plugins_builder
RUN apt-get update && apt-get install -y git ca-certificates
RUN mkdir -p /root/.vim/pack/plugins/start && cd /root/.vim/pack/plugins/start && \
  git clone https://github.com/Raimondi/delimitMate && \
  git clone https://github.com/scrooloose/nerdtree && \
  git clone https://github.com/sheerun/vim-polyglot

# base OS
FROM ubuntu:18.10
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get upgrade -y && apt-get install -qq -y \
  ca-certificates \
  git \
  locales \
  software-properties-common \
  wget \
  zsh \
  --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:jonathonf/vim -y && apt-get update && apt-get install vim-gtk3 -y

ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
	locale-gen --purge $LANG && \
	dpkg-reconfigure --frontend=noninteractive locales && \
	update-locale LANG=$LANG LC_ALL=$LC_ALL LANGUAGE=$LANGUAGE

# hub
COPY --from=hub_builder /usr/local/bin/hub /usr/local/bin/

# vim plugins
COPY --from=vim_plugins_builder /root/.vim/pack root/.vim/pack

# zsh plugins
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

RUN chsh -s /usr/bin/zsh

WORKDIR /root
COPY entrypoint.sh /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]

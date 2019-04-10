# base OS
FROM ubuntu:18.10
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get upgrade -y && apt-get install -qq -y \
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

# vim plugins
RUN mkdir -p /root/.vim/pack/plugins/start && cd /root/.vim/pack/plugins/start && \
  git clone https://github.com/Raimondi/delimitMate && \
  git clone https://github.com/scrooloose/nerdtree

# zsh plugins
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

RUN chsh -s /usr/bin/zsh

WORKDIR /root
COPY entrypoint.sh /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]

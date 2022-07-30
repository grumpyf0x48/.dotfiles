FROM debian:buster-backports

ENV USER=dev

LABEL name="dotfiles"

RUN apt-get --quiet update && \
    apt-get --assume-yes install bash-completion curl git vim wget sudo && \
    useradd $USER --home /home/$USER --create-home --shell /bin/bash && \
    adduser $USER sudo && \
    sed --in-place "s/ALL$/NOPASSWD: ALL/" /etc/sudoers

COPY --chown=$USER --chmod=744 \.*_aliases .bashrc_* /home/$USER/

USER $USER
WORKDIR /home/$USER

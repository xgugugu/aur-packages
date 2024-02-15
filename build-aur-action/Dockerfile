FROM manjarolinux/base:latest
RUN pacman -Syyu --noconfirm archlinux-keyring manjaro-keyring base-devel git wget
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
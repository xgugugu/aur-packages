FROM manjarolinux/base:latest
RUN pacman -Syyu --noconfirm archlinux-keyring manjaro-keyring base-devel git
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
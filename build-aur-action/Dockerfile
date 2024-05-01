FROM manjarolinux/base:latest
RUN pacman -Syyu --noconfirm archlinux-keyring manjaro-keyring base-devel git wget cmake
RUN sed -i '/E_ROOT/d' /usr/bin/makepkg
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
FROM manjarolinux/base:latest
RUN echo -e '\n[xgugugu]\nSigLevel = Optional TrustAll\nServer = https://github.com/xgugugu/aur-packages/releases/download/$arch' >> /etc/pacman.conf
RUN pacman -Syyu --noconfirm archlinux-keyring manjaro-keyring base-devel git wget cmake libgee
RUN sed -i '/E_ROOT/d' /usr/bin/makepkg
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
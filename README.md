<h1 align="center">wingpanel-indicator-daynight</h1>

<p align="center">A wingpanel indicator to toggle 'prefer dark variant' option in elementary OS.</p>

<p align="center"><img src="https://raw.githubusercontent.com/maze-n/wingpanel-indicator-daynight/master/screenshots/screenshot-1.png" width="350">
</p>

## Install

Get the .deb file from <a href="https://github.com/maze-n/wingpanel-indicator-daynight/releases/download/v1.1/wingpanel-indicator-daynight_1.1-1_amd64.deb">here</a>.
Logout and then login after installation.

## Uninstall

```bash
sudo apt remove wingpanel-indicator-daynight
```

## Build & Run

```bash
# install elementary-sdk, meson and libwingpanel
sudo apt install elementary-sdk meson libwingpanel-2.0-dev
#install dependencies
sudo apt install libglib2.0-dev libgranite-dev libxml2-dev
# clone repository
git clone https://github.com/maze-n/wingpanel-indicator-daynight.git wingpanel-indicator-daynight
# cd to dir
cd wingpanel-indicator-daynight
# run meson
meson build --prefix=/usr
# cd to build, build and test
cd build
sudo ninja install
# restart switchboard to load your indicator
pkill wingpanel -9
```

## Destroy

```bash
cd build
sudo ninja uninstall
```

## Todo

- [ ] Add time based automatic mode switching

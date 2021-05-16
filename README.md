# minecraft.msfukui.page

msfukui.pgae's personal minecraft server environment.

(for amd64, arm64)

## Build

```
$ docker build -t ghcr.io/msfukui/minecraft.msfukui.page:latest .
[+] Building 40.0s (9/9) FINISHED
 => [internal] load build definition from Dockerfile                 0.0s
 => => transferring dockerfile: 1.25kB                               0.0s
 => [internal] load .dockerignore                                    0.0s
 => => transferring context: 2B                                      0.0s
 => [internal] load metadata for docker.io/library/openjdk:16-slim   1.9s
 => [1/5] FROM docker.io/library/openjdk:16-slim@sha256:********     0.0s
 ...
 => exporting to image                                               0.2s
 => => exporting layers                                              0.1s
 => => writing image sha256:********                                 0.0s
 => => naming to ghcr.io/msfukui/minecraft.msfukui.page:latest       0.0s
```

## Run

```
$ docker run --name minecraft.msfukui.page -p 19132:19132/udp -d ghcr.io/msfukui/minecraft.msfukui.page:latest java -Xmx2G -jar spigot.jar
********
$ docker ps
CONTAINER ID   IMAGE                                           COMMAND                  CREATED         STATUS         PORTS                                           NAMES
************   ghcr.io/msfukui/minecraft.msfukui.page:latest   "java -Xmx2G -jar sp…"   6 seconds ago   Up 4 seconds   0.0.0.0:19132->19132/udp, :::19132->19132/udp   minecraft.msfukui.page
$ docker exec -it minecraft.msfukui.page /bin/bash
root@********:/app/lib# tail logs/latest.log
[10:58:07] [Worker-Main-5/INFO]: Preparing spawn area: 99%
[10:58:07] [Server thread/INFO]: Time elapsed: 1507 ms
[10:58:07] [Server thread/INFO]: [floodgate-bukkit] Enabling floodgate-bukkit v1.0-SNAPSHOT
[10:58:07] [Server thread/INFO]: [Geyser-Spigot] Enabling Geyser-Spigot v1.2.1-SNAPSHOT
[10:58:08] [Server thread/INFO]: [Geyser-Spigot] Auto-loaded Floodgate key
[10:58:08] [Server thread/INFO]: [Geyser-Spigot] ******************************************
[10:58:08] [Server thread/INFO]: [Geyser-Spigot]
[10:58:08] [Server thread/WARN]: [Geyser-Spigot] en_ is not a valid Bedrock language.
[10:58:08] [Server thread/INFO]: [Geyser-Spigot] Loading Geyser version 1.2.1-SNAPSHOT (git-master-dfc24f1)
[10:58:08] [Server thread/INFO]: [Geyser-Spigot]
[10:58:08] [Server thread/INFO]: [Geyser-Spigot] ******************************************
[10:58:13] [Network Listener - #1/INFO]: [Geyser-Spigot] Started Geyser on 0.0.0.0:19132
[10:58:13] [Server thread/INFO]: [Geyser-Spigot] Done (4.687s)! Run /geyser help for help!
[10:58:13] [Server thread/INFO]: Server permissions file permissions.yml is empty, ignoring it
[10:58:13] [Server thread/INFO]: Done (37.476s)! For help, type "help"
```

## Stop

```
$ docker stop minecraft.msfukui.page
minecraft.msfukui.page
```

## Reference

* Official Minecraft Bedrock Dedicated Server on Raspberry Pi*

    https://jamesachambers.com/official-minecraft-bedrock-dedicated-server-on-raspberry-pi/

* 【マインクラフト】Java版と統合版がクロスプレイで遊べるサーバ環境をWindows10で作ってみた（Minecraft, NINTENDO SWITCH）

    https://dsstation.sakura.ne.jp/report/misc/minecraft_server_switch.html

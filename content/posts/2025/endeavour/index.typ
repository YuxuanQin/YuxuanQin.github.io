#import "/config.typ": template, tufted
#show: template.with(title: "重回 linux")
= 重回 linux
<重回-linux>
#strong[注意]：具体配置如下：

- 发行版：#link("https://endeavouros.com/")[endeavouros]（轻松安装版的
  arch）；
- 桌面环境：无（是的，linux 可以没有桌面环境，但是依然能用图形软件！）；
- 窗口管理器：#link("swaywm.org")[sway]（用的是 vim 键位）；
- 输入法：fcitx5；

== 我不会用 windwows……
<我不会用-windwows>
新电脑到了以后准备放下花拳绣腿，老老实实使用 windows
图得轻松，但是如下几点让我很不爽：

- 没有窗口管理器；
  - 注：实际上有（#link("https://lgug2z.github.io/komorebi/")[komorebi]），但是全局键变成了
    alt，而且性能也不如 sway 来得高
- 系统内大量广告；
- 终端：
  - 启动速度太慢；
  - 不支持 nerd font、图片预览等小功能，文件管理器 yazi 用得很难受；
  - wsl 用不熟；
- 文件资源管理器不能键盘操作；
- 不知道藏了多少我不需要的东西；
- 对 tex 支持可能不如纯 linux 好；

当然，windows 至少让我玩到了 Sheepy: A shrot adventure。

== 安装 endeavour OS
本次重装 linux 依然选择神中神的 endeavour OS。上官网逛了一圈，发现它的含金量还在上升🤣：社区支持的 #link("https://github.com/EndeavourOS-Community-Editions/sway")[Sway 版本]自动配置了 sway、waybar、剪切板（clipphist）、托盘图标。

=== 安装前
<安装前>
+ 进入#link("https://endeavouros.com/")[官网]，往下拖动，看到“Asia”字样后，选择镜像下载（吉大、清华均有镜像）；
+ 下载 ventoy，自不必多说；
+ 在 windows 内分盘，无须赋予盘符，即：选原有盘，右键压缩卷，得到新卷即可；
+ 确保安装了 ventoy 的 U 盘中有 endeavour OS 的 `.iso` 文件；
+ （通过各种手段）进入 BIOS，并：
  + 关闭 `Secure Boot`；
  + 关闭 `Fast Boot`；
  + 调整驱动顺序，确保 U 盘优先级高于 Windows；
+ 保存 BIOS 设置并退出，此时电脑应自动重启；

=== 安装中：
<安装中>
+ 选择第一个默认启动（当然英伟达显卡另谈）；
+ 联网；
+ 选择题：
  - 如果能访问 Github，一切按#link("https://github.com/EndeavourOS-Community-Editions/sway")[计划]进行；
  - 如果不能访问 Github：
    - 直接无桌面离线安装；
    - 进入 tty 后联网，克隆#link("https://codeberg.org/fup6m3vj0/endeavours-os-sway-edition")[我的备份仓库]后，进入此仓库文件夹内执行 `sway-install.sh`；

=== 安装后
<安装后>
+ 如果所有字体都变得很大，执行 `wlr-randr --output 显示器名字 --scale 缩放倍率` 可作相应调整，其中 `显示器名字` 可通过执行 `wlr-randr` 获取，一般输出内容第一行就是；
+ 如果时间不正常，执行 `timedatectl set-timezone Asia/Shanghai` 可调整至正常；
+ `wlsunset -T 温度` 可以用来配置护眼模式，我一般把温度设置为 `4500`；

== 设置
<设置>
+ 改镜像不题；
+ `pacman -Syyu` 不题；
+ 在 `/etc/pacman.conf` 内加入 `archlinuxcn` 链接，详见 #link("https://mirrors.tuna.tsinghua.edu.cn/help/archlinuxcn/")[tuna 指导]；

== 具体文件的配置（见#link("https://codeberg.org/fup6m3vj0/dotfiles")[仓库]）：
<具体文件的配置见仓库>
- 输入法：老大难问题😭
  + 执行 `pacman -S fcitx5 fcitx5-rime` 下载 rime 本体；
  + 执行 `yay -S rime-ice-git` 下载雾凇词库；
  + 执行 `fcitx5`，直接开始使用输入法；
  + 输入法的配置在 `~/.local/share/fcitx5/rime/default.custom.yaml`
    ```
    patch:
      # 仅使用「雾凇拼音」的默认配置，配置此行即可
      __include: rime_ice_suggestion:/
      # 以下根据自己所需自行定义，仅做参考。
      # 针对对应处方的定制条目，请使用 <recipe>.custom.yaml 中配置，例如 rime_ice.custom.yaml
      menu:  
        page_size: 9  # 九行候选栏
      ascii_composer:
        switch_key:
          Caps_Lock: noop  # 禁用 Caps Lock 切换英文模式
          Shift_L: commit_code  # 可选：保留 Shift 切换英文模式
          Shift_R: commit_code  # 可选：保留 Shift 切换英文模式
    ```
    修改完成后右键 fcitx5 图标重启即可；
  + 执行 `pacman -S fcitx5-qt fcitx5-configtool` 设置输入法；
== 小贴士（可能只适用于我个人）
<小贴士可能只适用于我个人>
- `proxychains` 可用来做终端代理，如使用 `nekoray`，则在
  `/etc/proxychains.conf` 最后加上 `socks5 127.0.0.1 2080` 即可；
- 若 `hmcl` 异常卡顿，可退出，并执行 `hmcl -Dprism.forceGPU=true`
  以强制启用 GPU；
- `~/.config/sway/config.d` 内的 `autostart_applications`
  是自启动软件配置，如果想开机自动启用中文输入法、缩放倍率以及护眼模式，可以在此文件最后加上：
  ```
  #---------------#
  # 输入法
  exec fcitx5
  
  # 缩放
  exec wlr-randr --output eDP-1 --scale 1.4
  
  # 护眼
  exec wlsunset -T 4500
  ```

== 最后的注记
<最后的注记>
还有许多东西没好好讲解，譬如 `yay` 和 `pacman`，当然 arch 本身的配置也确实非常丰富，不是一篇文章能讲完的，何况网上已经有那么多好文章。

下面极力推荐几篇文章，在我看来属于不得不品级别：

- #link("https://wiki.archlinuxcn.org/")[Arch Linux 中文维基]的第一节“关于发行版”的全部条目
- #link("https://arch.icekylin.online/")[Arch Linux 简明指南]的全部内容

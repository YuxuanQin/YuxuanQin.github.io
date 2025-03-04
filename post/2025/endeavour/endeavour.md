# 重回 linux

## 我不会用 windwows……
新电脑到了以后准备放下花拳绣腿，老老实实使用 windows 图得轻松，但是如下几点让我很不爽：
  - 没有窗口管理器；
    - 注：实际上有（[komorebi](https://lgug2z.github.io/komorebi/)），但是全局键变成了 alt，而且性能也不如 sway 来得高
  - 系统内大量广告；
  - 终端：
    - 启动速度太慢；
    - 不支持 nerd font、图片预览等小功能，文件管理器 yazi 用得很难受；
    - wsl 用不熟；
  - 文件资源管理器不能键盘操作；
  - 不知道藏了多少我不需要的东西；
  - 对 tex 支持可能不如纯 linux 好；

当然，windows 至少让我玩到了 Sheepy: A shrot adventure。

## 安装 endeavour OS
本次重装 linux 依然选择神中神的 endeavour OS。上官网逛了一圈，发现它的含金量还在上升🤣：
  - 社区支持的 [Sway 版本](https://github.com/EndeavourOS-Community-Editions/sway)自动配置了 sway、waybar、剪切板（clipphist）、托盘图标。

### 安装前
  1. 进入[官网](https://endeavouros.com/)，往下拖动，看到“Asia”字样后，选择镜像下载（吉大、清华均有镜像）；
  2. 下载 ventoy，自不必多说；
  3. 在 windows 内分盘，无须赋予盘符，即：选原有盘，右键压缩卷，得到新卷即可；
  4. 确保安装了 ventoy 的 U 盘中有 endeavour OS 的 `.iso` 文件；
  5. （通过各种手段）进入 BIOS，并：
    - 关闭 `Secure Boot`；
    - 关闭 `Fast Boot`；
    - 调整驱动顺序，确保 U 盘优先级高于 Windows；
  6. 保存 BIOS 设置并退出，此时电脑应自动重启；

### 安装中：
  1. 选择第一个默认启动（当然英伟达显卡另谈）；
  2. 联网；
  3. 选择题： 
     - 如果网络不正常（你懂我意思），一切按[计划](https://github.com/EndeavourOS-Community-Editions/sway)进行；
     - 如果网络正常：
       - 把官方仓库备份到其他地方，尝试用自己的仓库作为安装设置，安装，不行的话进入下一步；
       - 直接无桌面离线安装；
       - 进入 tty 后联网，克隆仓库后执行脚本；

### 安装后
  1. 如果所有软件都变得很大，执行 `wlr-randr --output 显示器名字 --scale 缩放倍率` 可作相应调整，其中 `显示器名字` 可通过执行 `wlr-randr` 获取，一般输出内容第一行就是；
  2. 如果时间不正常，执行 `timedatectl set-timezone Asia/Shanghai` 可调整至正常；

## 设置
  1. 改镜像不题；
  2. `pacman -Syyu` 不题；
  3. 在 `/etc/pacman.conf` 内加入 `archlinuxcn` 链接，详见 [tuna 指导](https://mirrors.tuna.tsinghua.edu.cn/help/archlinuxcn/)；
  4. 具体文件的配置（具体文件见[仓库](https://codeberg.org/fup6m3vj0/dotfiles)）：
    - 输入法：老大难问题😭
      1. 执行 `pacman -S fcitx5 fcitx5-rime` 下载 rime 本体；
      2. 执行 `yay -S rime-ice-git` 下载雾凇词库；
      3. 典中典的终端配置：
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
      4. 执行 `fcitx5`，直接开始使用输入法；
      5. 执行 `pacman -S fcitx5-qt fcitx5-configtool` 设置输入法；
    - sway：绷，

## 小贴士（可能只适用于我个人）
- `proxychains` 可用来做终端代理，如使用 `nekoray`，则在 `/etc/proxychains.conf` 最后加上 `socks5 127.0.0.1 2080` 即可；

---

不想写了，好累，看《金瓶梅》😡。
今晚能看完第五十五回！

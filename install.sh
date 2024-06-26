#!/bin/bash

# 定义颜色
GREEN='\033[0;32m'
NC='\033[0m' # 没有颜色

# 脚本信息
AUTHOR="卜星君"
VERSION="1.0"
BLOG="bt.buxingjun.top"
AUTHOR_JJ="nz.buxingjun.pp.ua:8008"

# 显示脚本信息
echo -e "${GREEN}脚本作者: $AUTHOR${NC}"
echo -e "${GREEN}版本号: $VERSION${NC}"
echo -e "${GREEN}作者博客: $BLOG${NC}"
echo -e "${GREEN}作者JJ: $AUTHOR_JJ${NC}"
echo

main_menu() {
    echo "请选择一个操作:"
    echo -e "${GREEN}1.${NC} 更新组件"
    echo -e "${GREEN}2.${NC} XUI及调优"
    echo -e "${GREEN}3.${NC} 面板管理"
    echo -e "${GREEN}4.${NC} 订阅管理系统"
    echo -e "${GREEN}5.${NC} 安装 Docker"
    echo -e "${GREEN}6.${NC} 科技lion面板"
    echo -e "${GREEN}7.${NC} 退出"

    read -p "输入你的选择 [1-7]: " choice

    case $choice in
        1)
            update_menu
            ;;
        2)
            xui_menu
            ;;
        3)
            panel_menu
            ;;
        4)
            echo "正在安装订阅管理系统..."
            curl -s https://raw.githubusercontent.com/gooaclok819/sublinkX/main/install.sh | sudo bash
            ;;
        5)
            echo "正在安装 Docker..."
            curl -fsSL https://get.docker.com | sh
            ;;
        6)
            echo "正在安装科技lion面板..."
            curl -sS -O https://raw.githubusercontent.com/kejilion/sh/main/kejilion.sh && chmod +x kejilion.sh && ./kejilion.sh
            ;;
        7)
            echo "退出"
            exit 0
            ;;
        *)
            echo "无效的选择，请输入 1 到 7."
            main_menu
            ;;
    esac
}

update_menu() {
    echo "请选择一个操作:"
    echo -e "${GREEN}1.${NC} 安装 sudo"
    echo -e "${GREEN}2.${NC} 安装 curl"
    echo -e "${GREEN}3.${NC} 更新系统"
    echo -e "${GREEN}4.${NC} 返回主菜单"

    read -p "输入你的选择 [1-4]: " update_choice

    case $update_choice in
        1)
            echo "正在安装 sudo..."
            sudo apt-get install sudo
            ;;
        2)
            echo "正在安装 curl..."
            sudo apt install curl
            ;;
        3)
            echo "正在更新系统..."
            sudo apt-get update -y
            ;;
        4)
            main_menu
            ;;
        *)
            echo "无效的选择，请输入 1 到 4."
            update_menu
            ;;
    esac
}

xui_menu() {
    echo "请选择一个操作:"
    echo -e "${GREEN}1.${NC} XUI安装"
    echo -e "${GREEN}2.${NC} Hy2协议安装"
    echo -e "${GREEN}3.${NC} 甬哥Singbox脚本安装"
    echo -e "${GREEN}4.${NC} Tcp窗口优化"
    echo -e "${GREEN}5.${NC} IPv4优先"
    echo -e "${GREEN}6.${NC} 流媒体解锁测试"
    echo -e "${GREEN}7.${NC} 三网回程测试"
    echo -e "${GREEN}8.${NC} 返回主菜单"

    read -p "输入你的选择 [1-8]: " xui_choice

    case $xui_choice in
        1)
            echo "正在安装XUI..."
            bash <(curl -Ls https://raw.githubusercontent.com/Misaka-blog/3x-ui/master/install.sh)
            ;;
        2)
            echo "正在安装Hy2协议..."
            wget -N --no-check-certificate https://raw.githubusercontent.com/Misaka-blog/hysteria-install/main/hy2/hysteria.sh && bash hysteria.sh
            ;;
        3)
            echo "正在安装甬哥Singbox脚本..."
            bash <(curl -Ls https://gitlab.com/rwkgyg/sing-box-yg/raw/main/sb.sh)
            ;;
        4)
            echo "正在进行Tcp窗口优化..."
            wget -N "http://sh.nekoneko.cloud/tools.sh" -O tools.sh && chmod +x tools.sh && ./tools.sh
            ;;
        5)
            echo "正在设置IPv4优先..."
            sed -Ei '/^[[:space:]]*#?[[:space:]]*precedence[[:space:]]+::ffff:0:0\/96[[:space:]]+100\b.*?$/ {s/.+100\b([[:space:]]*#.*)?$/precedence ::ffff:0:0\/96  100\1/; :a;n;b a}; /^[[:space:]]*precedence[[:space:]]+::ffff:0:0\/96[[:space:]]+[0-9]+.*$/ {s/^.*precedence.+::ffff:0:0\/96[^0-9]+([0-9]+).*$/precedence ::ffff:0:0\/96  100\t#原值为 \1/; :a;n;ba;}; $aprecedence ::ffff:0:0\/96  100' /etc/gai.conf
            ;;
        6)
            echo "正在进行流媒体解锁测试..."
            bash <(curl -L -s https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/check.sh)
            ;;
        7)
            echo "正在进行三网回程测试..."
            curl https://raw.githubusercontent.com/zhanghanyun/backtrace/main/install.sh -sSf | sh
            ;;
        8)
            main_menu
            ;;
        *)
            echo "无效的选择，请输入 1 到 8."
            xui_menu
            ;;
    esac
}

panel_menu() {
    echo "请选择一个操作:"
    echo -e "${GREEN}1.${NC} 宝塔面板国际版安装"
    echo -e "${GREEN}2.${NC} 极光面板安装"
    echo -e "${GREEN}3.${NC} 咸蛋面板安装"
    echo -e "${GREEN}4.${NC} 返回主菜单"

    read -p "输入你的选择 [1-4]: " panel_choice

    case $panel_choice in
        1)
            echo "正在安装宝塔面板国际版..."
            wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && bash install.sh aapanel
            ;;
        2)
            echo "正在安装极光面板..."
            bash <(curl -fsSL https://raw.githubusercontent.com/Aurora-Admin-Panel/deploy/main/install.sh)
            ;;
        3)
            echo "正在安装咸蛋面板..."
            bash <(wget --no-check-certificate -qO- 'https://sh.xdmb.xyz/xiandan/xd.sh')
            ;;
        4)
            main_menu
            ;;
        *)
            echo "无效的选择，请输入 1 到 4."
            panel_menu
            ;;
    esac
}

# 运行主菜单
main_menu

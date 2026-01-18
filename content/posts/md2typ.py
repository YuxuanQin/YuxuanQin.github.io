#!/usr/bin/env python3
import os
import sys
import subprocess
from pathlib import Path

def check_pandoc_installed():
    """检查系统是否安装 pandoc（适配 fish 环境）"""
    try:
        # 静默执行 pandoc --version，检查是否存在
        subprocess.run(
            ["pandoc", "--version"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=True
        )
        return True
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("❌ 错误：未检测到 pandoc，请先安装：")
        print("   sudo pacman -S pandoc")
        return False

def convert_md_to_typ(md_file: Path):
    """转换单个 .md 文件为 .typ，保留原目录结构"""
    # 构造输出文件路径（替换后缀，确保路径兼容 fish）
    typ_file = md_file.with_suffix(".typ")
    print(f"🔄 正在转换：{md_file}")
    
    try:
        # 执行 pandoc 转换命令，强制使用 UTF-8 编码（适配 Arch Linux）
        result = subprocess.run(
            [
                "pandoc",
                "-f", "markdown",
                "-t", "typst",
                str(md_file),
                "-o", str(typ_file)
            ],
            capture_output=True,
            text=True,
            encoding="utf-8"
        )
        
        if result.returncode == 0:
            print(f"✅ 转换成功：{typ_file}")
        else:
            print(f"❌ 转换失败：{md_file}")
            print(f"   错误信息：{result.stderr}")
    except Exception as e:
        print(f"❌ 转换异常：{md_file} - {str(e)}")
    print("-" * 60)

def main(target_dir: str):
    """递归遍历目录，处理所有 .md 文件"""
    # 检查 pandoc
    if not check_pandoc_installed():
        sys.exit(1)
    
    # 解析目标目录（绝对路径，避免 fish 相对路径问题）
    target_path = Path(target_dir).resolve()
    if not target_path.is_dir():
        print(f"❌ 错误：目录不存在 -> {target_path}")
        sys.exit(1)
    
    # 打印开始信息
    print(f"📂 开始递归遍历目录：{target_path}")
    print("=" * 60)
    
    # 递归查找所有 .md 文件（包括子目录）
    md_files = list(target_path.rglob("*.md"))
    if not md_files:
        print("ℹ️ 提示：未找到任何 .md 文件")
        sys.exit(0)
    
    print(f"ℹ️ 共找到 {len(md_files)} 个 .md 文件，开始转换...")
    print("-" * 60)
    
    # 批量转换
    for md_file in md_files:
        convert_md_to_typ(md_file)
    
    # 完成提示
    print("=" * 60)
    print("🎉 所有文件处理完成！")

if __name__ == "__main__":
    # 处理命令行参数：默认当前目录，支持指定目标目录
    if len(sys.argv) > 1:
        target_dir = sys.argv[1]
    else:
        target_dir = os.getcwd()  # 使用当前工作目录（适配 fish）
    
    main(target_dir)

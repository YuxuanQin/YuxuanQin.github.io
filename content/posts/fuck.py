#!/usr/bin/env python3
import os
import sys
import shutil
from pathlib import Path

# 定义要删除的目标字符串
TARGET_STR = ""

def confirm_operation(files: list[Path]) -> bool:
    """交互式确认是否执行删除操作"""
    if not files:
        return False
    
    print(f"⚠️  即将处理以下 {len(files)} 个包含 '{TARGET_STR}' 的文件：")
    print("-" * 60)
    for file in files:
        print(f"  {file}")
    print("-" * 60)
    
    # 交互式确认（兼容 Linux 终端）
    while True:
        choice = input("确认删除所有文件中的 '{}' 字符串？[y/N] ".format(TARGET_STR)).strip().lower()
        if choice in ["y", "yes"]:
            return True
        elif choice in ["n", "no", ""]:
            return False
        else:
            print("❌ 输入无效，请输入 y 或 N")

def remove_target_str(file_path: Path, backup: bool = True) -> bool:
    """删除单个文件中的目标字符串，可选创建备份"""
    try:
        # 1. 读取文件内容（UTF-8 编码，适配 Arch Linux）
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 2. 检查是否包含目标字符串
        if TARGET_STR not in content:
            print(f"ℹ️ 跳过 {file_path}：未找到 '{TARGET_STR}'")
            return True
        
        # 3. 创建备份（可选）
        if backup:
            backup_path = file_path.with_suffix(file_path.suffix + ".bak")
            shutil.copy2(file_path, backup_path)  # 保留文件元数据
        
        # 4. 删除目标字符串并写入文件
        new_content = content.replace(TARGET_STR, "")
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        # 5. 验证删除结果
        with open(file_path, 'r', encoding='utf-8') as f:
            final_content = f.read()
        
        if TARGET_STR not in final_content:
            print(f"✅ 处理完成：{file_path}（备份文件：{backup_path if backup else '无'}）")
            return True
        else:
            # 恢复备份
            if backup and backup_path.exists():
                shutil.copy2(backup_path, file_path)
            print(f"❌ 处理失败：{file_path}（已恢复备份）")
            return False
    
    except Exception as e:
        print(f"❌ 处理异常：{file_path} - {str(e)}")
        return False

def main():
    # 解析目标目录（默认当前目录）
    if len(sys.argv) > 1:
        target_dir = Path(sys.argv[1]).resolve()
    else:
        target_dir = Path(os.getcwd()).resolve()
    
    # 检查目录是否存在
    if not target_dir.is_dir():
        print(f"❌ 错误：目录不存在 -> {target_dir}")
        sys.exit(1)
    
    # 递归查找所有包含目标字符串的文件（排除备份文件）
    print(f"🔍 正在递归扫描 {target_dir} 中包含 '{TARGET_STR}' 的文件...")
    match_files = []
    for file in target_dir.rglob("*"):
        # 跳过目录、备份文件、二进制文件
        if file.is_file() and not file.name.endswith(".bak") and not file.name.endswith(".tmp"):
            try:
                with open(file, 'r', encoding='utf-8') as f:
                    if TARGET_STR in f.read():
                        match_files.append(file)
            except (UnicodeDecodeError, PermissionError):
                # 跳过二进制文件/无权限文件
                continue
    
    # 检查匹配结果
    if not match_files:
        print(f"ℹ️ 未找到任何包含 '{TARGET_STR}' 的文件")
        sys.exit(0)
    
    # 确认操作
    if not confirm_operation(match_files):
        print("🚫 操作已取消")
        sys.exit(0)
    
    # 批量处理文件
    print("\n🔄 开始删除字符串...")
    print("-" * 60)
    success_count = 0
    fail_count = 0
    skip_count = 0
    
    for file in match_files:
        result = remove_target_str(file)
        if result:
            if TARGET_STR not in open(file, 'r', encoding='utf-8').read():
                success_count += 1
            else:
                skip_count += 1
        else:
            fail_count += 1
    
    # 输出统计
    print("-" * 60)
    print(f"📊 任务完成：")
    print(f"   ✅ 成功删除字符串：{success_count} 个文件")
    print(f"   ℹ️ 跳过（无目标字符串）：{skip_count} 个文件")
    print(f"   ❌ 处理失败：{fail_count} 个文件")
    print(f"💡 注：备份文件后缀为 .bak，可手动删除")

if __name__ == "__main__":
    main()

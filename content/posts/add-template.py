#!/usr/bin/env python3
import os
import sys
from pathlib import Path

# 定义要添加的头部内容（严格匹配你要求的格式）
HEADER_CONTENT = """#import "/config.typ": template, tufted
#show: template
"""

def add_header_to_typ_file(file_path: Path):
    """为单个 .typ 文件添加指定头部，避免重复添加"""
    try:
        # 读取文件内容（UTF-8 编码，适配 Arch Linux/fish）
        with open(file_path, 'r', encoding='utf-8') as f:
            original_content = f.read()
        
        # 检查是否已存在相同头部（避免重复添加）
        header_stripped = HEADER_CONTENT.strip()
        if original_content.strip().startswith(header_stripped):
            return "skip"  # 返回标识：跳过
        
        # 拼接新内容（头部 + 原内容）
        new_content = HEADER_CONTENT + original_content
        
        # 先写入临时文件，再替换原文件（原子操作，防止文件损坏）
        temp_file = file_path.with_suffix('.typ.tmp')
        with open(temp_file, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        # 替换原文件
        temp_file.replace(file_path)
        
        return "success"  # 返回标识：成功
    
    except Exception as e:
        print(f"❌ 处理失败：{file_path} - {str(e)}")
        # 清理临时文件（如果生成了）
        if 'temp_file' in locals() and temp_file.exists():
            temp_file.unlink()
        return "fail"  # 返回标识：失败

def main():
    # 目标目录：默认当前目录，也可通过命令行参数指定
    if len(sys.argv) > 1:
        target_dir = Path(sys.argv[1]).resolve()
    else:
        target_dir = Path(os.getcwd()).resolve()
    
    # 检查目录是否存在
    if not target_dir.is_dir():
        print(f"❌ 错误：目录不存在 -> {target_dir}")
        sys.exit(1)
    
    # 递归查找所有 .typ 文件（当前目录 + 所有子目录）
    typ_files = list(target_dir.rglob("*.typ"))
    
    if not typ_files:
        print(f"ℹ️ 在 {target_dir} 及其子目录下未找到任何 .typ 文件")
        sys.exit(0)
    
    # 输出任务信息
    print(f"📂 处理根目录：{target_dir}")
    print(f"🔍 递归找到 {len(typ_files)} 个 .typ 文件")
    print("-" * 60)
    
    # 初始化统计
    success_count = 0
    skip_count = 0
    fail_count = 0
    
    # 批量处理所有文件
    for typ_file in typ_files:
        result = add_header_to_typ_file(typ_file)
        # 根据返回值更新统计
        if result == "success":
            print(f"✅ 处理完成：{typ_file}")
            success_count += 1
        elif result == "skip":
            print(f"ℹ️ 跳过 {typ_file}：已包含目标头部")
            skip_count += 1
        elif result == "fail":
            fail_count += 1

    # 输出最终总结
    print("-" * 60)
    print(f"📊 任务完成：")
    print(f"   ✅ 成功添加头部：{success_count} 个")
    print(f"   ℹ️ 跳过（已存在）：{skip_count} 个")
    print(f"   ❌ 处理失败：{fail_count} 个")

if __name__ == "__main__":
    main()

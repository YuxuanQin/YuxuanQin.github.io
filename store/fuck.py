#!/usr/bin/env python3

import os
import subprocess
import sys
from pathlib import Path

def convert_md_to_html(md_file_path: Path):
    """Convert a single .md file to index.html using pandoc."""
    output_html = md_file_path.parent / "index.html"
    cmd = [
        "pandoc",
        "-s",
        "--css=/styles/styles.css",
        "--shift-heading-level-by=-1",
        str(md_file_path),
        "-o",
        str(output_html),
        "--mathml"
    ]
    try:
        subprocess.run(cmd, check=True)
        print(f"✅ Converted: {md_file_path} → {output_html}")
    except subprocess.CalledProcessError as e:
        print(f"❌ Failed to convert {md_file_path}: {e}", file=sys.stderr)
    except FileNotFoundError:
        print("❌ Error: 'pandoc' command not found. Please install pandoc.", file=sys.stderr)
        sys.exit(1)

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 convert_md.py <directory>", file=sys.stderr)
        sys.exit(1)

    root_dir = Path(sys.argv[1])

    if not root_dir.is_dir():
        print(f"Error: '{root_dir}' is not a valid directory.", file=sys.stderr)
        sys.exit(1)

    # Recursively find all .md files
    md_files = list(root_dir.rglob("*.md"))

    if not md_files:
        print("No .md files found.")
        return

    print(f"Found {len(md_files)} .md file(s). Converting...\n")

    for md_file in md_files:
        convert_md_to_html(md_file)

if __name__ == "__main__":
    main()

# 使用 fd 递归查找所有 .md 文件
MD_FILES := $(shell fd -t f -e md)

# 默认目标：强制重新生成所有 index.html
all: $(MD_FILES)
	@echo "所有 .md 文件已重新生成 index.html"

# 规则：每个 .md 文件生成所在目录的 index.html
%.md:
	pandoc -s --css="/styles/styles.css" "$<" -o "$(dir $@)index.html" --mathml

# 清除所有生成的 index.html
clean:
	fd -t f -g '**/index.html' -x rm -f {}

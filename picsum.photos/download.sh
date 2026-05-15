
#!/bin/zsh

for i in {1..3}; do
    MAX_NUM=$(ls image*.jpg 2>/dev/null | sed -E 's/image([0-9]+)\.jpg/\1/' | sort -n | tail -1)

    if [ -z "$MAX_NUM" ]; then
        NEXT_NUM=1
    else
        NEXT_NUM=$((MAX_NUM + 1))
    fi

    export IMAGE_FILE="image${NEXT_NUM}.jpg"

    # 4. 下載圖片 (設定為 1024x1024 尺寸，大約為 1MB 左右的 JPG)
    curl -L "https://picsum.photos/1024/1024" -o "$IMAGE_FILE"

    echo "$IMAGE_FILE downloaded ok"
done


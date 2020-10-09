# 繰り返し FOR文
for i in 0 .. 4
    p i
end

# break 繰り返し終了
for i in 0 .. 4
    if i == 3
        break
    end
    p i
end

# next ある条件の時だけスキップ
for i in 0 .. 4
    if i == 3
        next
    end
    p i
end

# for文 ネスト
for i in 0 ..2
    for j in 0 ..2
        p i.to_s + "" + j.to_s
    end
end

# 配列 繰り返し
arr = [2,4,6,8,10]
sum = 0
for i in arr
    p sum += i
end


# 確認問題
for i in 1 .. 10
    if i == 3
        next
    end
    if i == 7
        break
    end
    p  i
end
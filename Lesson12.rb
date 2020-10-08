# メソッド
def say_hello
    p "Hello World"
end

say_hello
say_hello
say_hello

def say_hello(greeting)
    p greeting
end

say_hello("Good Morning")
say_hello("Good Evening")

def add(num01, num02)
    return num01 + num02
end

add_result =  add(6,2)
p add_result

def cal_ave(num03,num04,num05)
    return (num03 + num04 + num05) / 3
end

p cal_ave(9,4,2)

def cal_ave2(nums)
    s = 0
    nums.each{|i| s += i}
    return hoge = s / nums.length
end

result = cal_ave2([9,4,2])
p result
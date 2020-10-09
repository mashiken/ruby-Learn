# if
age = 22

if age >= 20
    p "adult"
end

# if else
age = 18
if age >= 20
    p "adult"   
else
    p "child" 
end

# if elsif
age = 0

if age >= 20
    p "adult"
elsif age == 0
    p "baby"
else
    p "child"
end

# 確認問題
age = 34

if age >= 10 && age < 20
    p "10代"
elsif age >= 20 && age < 30
    p "20代"
elsif age >= 30 && age < 40
    p "30代"
else
    p "それ以外"
end

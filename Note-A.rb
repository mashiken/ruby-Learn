# 変数・定数

# 変数・定数の種別 (最初の1文字で以下に決まる)
# ローカル変数・インスタンス変数・クラス変数・グローバル変数・定数

# ローカル変数
2.times {
    p defined?(v)
    v = 1
    p v
}
# vがローカル変数
# ローカル変数の宣言は( 小文字で始まる識別子 )への最初の代入 → この場合は1
# スコープは宣言文も含めた以下から ｝まで → p defibed?(v) はスコープに入らない為nil
1.times {
    v = 1 if false
    p defined?(v)
    p v
}
# v = 1 if falseに注目
# 後置ifの影響でvには直接代入されていない
# ただ宣言としては有効な為、[defiend? メソッド]は正常に反応する

# インスタンス変数
@foobar
# 特徴「＠」で始まる
# 特定のオブジェクトに所属している（クラスのinitializeメソッドの中、やインスタンスメソッドの中）
# クラス・サブクラスのメソッドから参照する事が出来る
# 初期化されていない状態で、変数を参照しようとしても出来ない nil

# クラス変数
class Foobar
    @@foo = 1
    def bar
        p @@foo
    end
end

# 特徴「＠＠」で始まる
# クラス定義の中で定義される
# クラスの内なら参照/代入が可能 
class Bar < Foobar
     @@foo += 1          # => 2
end
class Baz < Foobar
     @@foo += 1         # => 3
end

hoge = Bar.new
hoge.bar
# 継承されたクラスなら参照する事が出来る

# モジュールで定義されたクラス変数は、そのモジュールを
# インクルードすれば参照可能

module Foo
    p @@AA = 1
end
class Bar
    include Foo
    p @@AA += 1
end
class Baz
    include Foo
    p @@AA +=1
end
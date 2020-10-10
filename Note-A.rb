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

# クラス変数のスコープ
class Hoge
    @@a = :a
    class << Foo
        p @@a
    end

    def Hoge.a1
        p @@a
    end
end

Hoge.a1
# その場所を囲む最も内側のclass式またはmodule式のボディをスコープとして持つ

# グローバル変数
$foobar
# プログラムのどこからでも参照可能

# 定数
# アルファベット大文字から始まる
# 一度定義された定数に再び代入を行おうとするとエラー
# 定義されていない定数にアクセスすると例外（NameError）
# クラスの外で定義された定数はオブジェクトとなる
class BB
    FOO = 'FOO'
end
# クラス Foo の定数 FOO を定義(Foo::FOO)
class CC < BB
    BAR = 'BAR'
    # 親クラスの定数は直接参照できる
    p FOO

    class Baz
        # ネストしたクラスはクラスの継承関係上は無関係であるがネス
        # トの外側の定数も直接参照できる
        p BAR
        p CC::FOO
    end
end

# クラス・モジュールで定義された定数を外側から参照する
# 為には::演算子
module M 
    I = 35
    class C
    end
end
p M::I
p M::C
p ::M

M::NewConst = 888

# 定数参照の優先順位
# 親クラス・ネストの外側クラスで同名定数が定義されている
# ネスト外側を先に参照
# 親クラス側を参照したい時は::演算子
class Hogehoge
    CONST = 'OYA'
end
class Hobahoba
    CONST = 'NEST'
    p CONST
    class Baba < Hogehoge
       p  Hogehoge::CONST
    end
end

class Hogehogehoge
    CONST = 'OYA'
end
class Hobahobahoba < Hogehogehoge
    p CONST
    CONST = 'Bar'
    p CONST
    p Hogehogehoge::CONST
end
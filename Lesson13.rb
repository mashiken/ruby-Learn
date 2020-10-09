class Student
    def avg(math, english)
        p (math + english) / 2
    end
end
# クラスを使用する為、オブジェクトを作成
a001 = Student.new
a001.avg(30,40)

# インスタンス変数 / クラスが持つ事が出来るデータ
class Student
    def initialize(name)
        @name = name
    end
    def avg(math, english)
        return @name,(math + english) / 2
    end
end

a002 = Student.new("sato")
p a002.avg(60,40)

# attr_accessorでインスタンスの外から参照可能
class Student
    def initialize(name)
        @name = name
    end
    def avg(math, english)
        return (math + english) / 2
    end

    attr_accessor :name
end

a003 = Student.new("suzuki")
p a003.name, a003.avg(60,40)
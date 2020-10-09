class Student
    def initialize(name)
        @name = name
    end
    def cal_avg(data)
        sum = 0
        for score in data do
            sum += score
        end
        avg = sum / data.length
        return avg
    end
    def jedge(avg)
        result = ""
        if 60 <= avg
            result = "passed"
        else
            result = "failed"
        end
        return result
    end
    attr_accessor :name
end

a001 = Student.new("mako")
avg = a001.cal_avg([60,70,30,40,20])
result = a001.jedge(avg)
p a001.name
p avg
p result
require 'CSV'

class PersonParser

  def initialize(filename)
    @filename = filename
  end

  def people
    data = CSV.read(@filename, headers:true) #We get the .csv file and tell ruby that the first line are the headers of each column

    n = 0 #With this 'While' we get the first 10 elements of the file
    while n < 10
      p data[n]
      n += 1
    end
  end

  def edit    #We get the .csv file and change an specific element and save it into a new .csv file
   data = CSV.read(@filename, headers:true)
   data[5]["first_name"] = "Maria"
    CSV.open('people_edit.csv', "wb") do |csv|
      data.each do |row|
        csv << row
      end
    end
  end
end

parser = PersonParser.new("people.csv")
people = parser.edit
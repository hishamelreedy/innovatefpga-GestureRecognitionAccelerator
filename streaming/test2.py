# opening the file in read mode
my_file = open("pic.txt", "r")
  
# reading the file
data = my_file.read()
  
# replacing end of line('/n') with ' ' and
# splitting the text it further when '.' is seen.
data_into_list = data.split("\n")
  
# printing the data
print(data_into_list[0])
my_file.close()
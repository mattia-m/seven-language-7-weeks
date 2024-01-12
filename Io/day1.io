# let's start with some Io easy exercises

"Hello, World!" println
#the following row print 1 only, because 1 is added to the println result
1+1 println
#this prints 2
(1+1) println

#Io is not a strongly typed language, and 0 or the empty string are true, nil is false instead

#Every obj is a clone of Object or a clone of something cloned from Object, and it has the slot of the parent
 
ProgrammingLanguage := Object clone  
ProgrammingLanguage name := "Io"
ProgrammingLanguage getSlot("name") println


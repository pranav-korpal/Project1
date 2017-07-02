

#read.table("url",header=TRUE,skip),skip the extra three lines of info


# Q2 reading xml file into
library("XML")
xmlpath<-"C:/Users/Acer/Desktop/books.xml"
xmlfile<-xmlTreeParse(xmlpath)
xmltop<-xmlRoot(xmlfile)
bookcat <- xmlSApply(xmltop, function(x) xmlSApply(x, xmlValue)) 
bookcat_df <- data.frame(t(bookcat),row.names=NULL)


View(bookcat_df)

#Q1
multmerge = function(mypath){
  filenames=list.files(path=mypath, full.names=TRUE)
  datalist = lapply(filenames, function(x){read.table(file=x,header=T,sep=",")})
  Reduce(function(x,y) {rbind(x,y)}, datalist)
}


mult=multmerge("C:/Users/Acer/Desktop/iris")


require(RJSONIO)
jsonfile<-fromJSON("C:/Users/Acer/Desktop/iris/iris.json")
jsonfile<-lapply(jsonfile,function(x){
  x[sapply(x,is.null)]<-NA
  unlist(x)
})

d<-do.call("rbind",jsonfile)

#operations on iris data
#select operation
iris%>%select(Sepal.Length,Sepal.Width)
#selects out the desired columns of the dataframe

#select with match operation
#matches the columns of a dataframe with a values

iris%>%select(Sepal.Length,Sepal.Width)%>%match(6.3,iris$Sepal.Length
                                          )


#filters out the desird
iris%>%select(Sepal.Length,Sepal.Width)%>%filter(Sepal.Length>6.0)

#performing a groupby and summarize operation on iris
iris%>%select(Species,Sepal.Length)%>%group_by(Species)%>%summarise(max(Sepal.Length))






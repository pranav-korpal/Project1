

#read.table("url",header=TRUE,skip),skip the extra three lines of info


# reading xml file into
xmlpath<-"C:/Users/Acer/Desktop/books.xml"
xmlfile<-xmlTreeParse(xmlpath)
xmltop<-xmlRoot(xmlfile)
bookcat <- xmlSApply(xmltop, function(x) xmlSApply(x, xmlValue)) 
bookcat_df <- data.frame(t(bookcat),row.names=NULL)




multmerge = function(mypath){
  filenames=list.files(path=mypath, full.names=TRUE)
  datalist = lapply(filenames, function(x){read.table(file=x,header=T,sep=",")})
  Reduce(function(x,y) {rbind(x,y)}, datalist)
}


mult=multmerge("C:/Users/Acer/Desktop/iris")

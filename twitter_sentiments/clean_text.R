# Word Cloud Utility Functions

################
# Remove junk from text.

clean.text <- function(some_txt)
{

some_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", some_txt)
some_txt = gsub("@\\w+", "", some_txt)
some_txt = gsub("[[:punct:]]", "", some_txt)
some_txt = gsub("[[:digit:]]", "", some_txt)
some_txt = gsub("http\\w+", "", some_txt)
some_txt = gsub("[ t]{2,}", "", some_txt)
some_txt = gsub("^\\s+|\\s+$", "", some_txt)
some_txt = gsub("amp", "", some_txt)

# define "tolower error handling" function
try.tolower = function(x)
{
y = NA
try_error = tryCatch(tolower(x), error=function(e) e)
if (!inherits(try_error, "error"))
y = tolower(x)
return(y)
}
 
some_txt = sapply(some_txt, try.tolower)
some_txt = some_txt[some_txt != ""]
names(some_txt) = NULL
return(some_txt)
}


################
# Call to DataBox to apply sentiment analysis service to supplied text..
 
getSentiment <- function (text, key){
 
text <- URLencode(text);
 
#save all the spaces, then get rid of the weird characters that break the API, then convert back the URL-encoded spaces.
text <- str_replace_all(text, "%20", " ");
text <- str_replace_all(text, "%\\d\\d", "");
text <- str_replace_all(text, " ", "%20");
 
if (str_length(text) > 360){
text <- substr(text, 0, 359);
}

#-----------------------
 
data <- getURL(paste("http://api.datumbox.com/1.0/TwitterSentimentAnalysis.json?api_key=", key, "&text=",text, sep=""))
 
js <- fromJSON(data, asText=TRUE);
 
# get mood probability
sentiment = js$output$result
 
#-----------------------
return(list(sentiment=sentiment))
}
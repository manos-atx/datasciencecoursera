
library(httr)
library(httpuv)
library(jsonlite)

oauth_endpoints("github")

myapp <- oauth_app(appname = "coursera_johns_hopkins",
                   key = "84960343d022ad0a9197",
                   secret = "aff5c5c1cb28a2344ee117ecf855b16c38624e37")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)

req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

stop_for_status(req)

json1 <- content(req)

gitDF <- jsonlite::fromJSON(jsonlite::toJSON(json1))

gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"]

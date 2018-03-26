library(rvest) #開啟rvest套件

r_text = read_html("http://kgieworld.moneydj.com/ZXQW/zc/zce/zce_4137.djhtm")
r_text = html_nodes(r_text, "table #oMainTable") %>% html_table()

r_text = r_text[[1]]
r_text <- r_text[-c(1, 2), ]
colnames(r_text) = r_text[1, ]
r_text = r_text[-1, ] 
rownames(r_text) = r_text[ ,1]
r_text = r_text[ ,-1]

# r_text = html_nodes(r_text, "table #oMainTable tr:not(#oScrollFoot)")

# t3n0_rev = html_nodes(r_text, ".t3n0_rev") %>% html_text() %>% iconv("UTF-8")
# t3n1_rev = html_nodes(r_text, ".t3n1_rev") %>% html_text() %>% iconv("UTF-8")
# t3n0 = html_nodes(r_text, ".t3n0") %>% html_text() %>% iconv("UTF-8")
# t3n1 = html_nodes(r_text, ".t3n1") %>% html_text() %>% iconv("UTF-8")

# t3n0_rev = iconv(html_text(t3n0_rev), "UTF-8")
# t3n1_rev = iconv(html_text(t3n1_rev), "UTF-8")
# t3n0 = iconv(html_text(t3n0), "UTF-8")
# t3n1 = iconv(html_text(t3n1), "UTF-8")
# 
# #先安裝magrittr套件
# install.packages('magrittr')
# library(magrittr)
# #爬棒球新聞標題-程式碼精簡版
# title=read_html("http://sports.ltn.com.tw/baseball/") %>% 
#   html_nodes(".boxTitle .listA .list_title") %>% 
#   html_text() %>% iconv("UTF-8")

rm(list=ls())

r_text = read_html("http://kgieworld.moneydj.com/ZXQW/zc/zcv/zcv_4137_E_1.djhtm")
r_text = html_nodes(r_text, ".t3n0_top .t01") %>% html_table()

r_text = r_text[[1]]
r_text <- r_text[-c(1,23), ]
colnames(r_text) = r_text[1, ]
r_text = r_text[-1, ] 

r_url = read_html("http://kgieworld.moneydj.com/ZXQW/zc/zcv/zcv_4137_E_1.djhtm")
r_url = html_nodes(r_url, ".t3n0_top .t01 a")
r_url = html_attr(r_url,"href")
url_vector = c()
for(i in r_url[1:20])
  url_vector = c(url_vector,paste("http://kgieworld.moneydj.com", i,sep=""))

r_text$url = url_vector
rownames(r_text) <- NULL
View(r_text)

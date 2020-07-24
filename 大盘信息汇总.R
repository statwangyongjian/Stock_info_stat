####################################################################################################################
####################################################################################################################
############本代码基于东方财富PC端界面导出的数据进行分析，目的是高效地抓取大盘相关信息，形成初步的分析##############
############                             关于具体的操作方法，请参考readme.docx                        ##############
############                                  编写者：王永建 20200717                                 ##############
####################################################################################################################
####################################################################################################################
####################################################################################################################
########在这里输入你存储数据的路径################
path = "C:/Users/王永建/Desktop/大盘信息抓取"  
##################################################
########在这里输入你希望输出前几位的股票##########
n = 5                   ##########
##################################################
########在引号里输入你希望查看的板块名称##########
bankuai1 = "券商信托"          ##########
##################################################
#-------------------------------------------------------------------------------------------------------------------
install.packages(dplyr)
library(dplyr)
options(digits=4)
#===================================================================================================================
setwd(path)                                    #设定工作路径
time = Sys.time()
write.table(paste("截至",time,",市场上的主要信息摘录如下:",sep = ""),file = paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F)
paste("截至",time,",市场上的主要信息摘录如下",sep = "")
#--------------------------------------------------------------------------------------------------------------------
###############################   在这里输入希望输出前几位的信息 ####################################################
#####################################################################################################################
#####################################################################################################################

#大盘重要指数
data = file(paste(path,"/重要指数.txt",sep = ""))      #重复定义data是要固定write的结果
content = readLines(data)
write.table(sub("万亿","万亿\t",content[1:length(content)]),paste(path,"/重要指数.txt",sep = ""),quote=F,row.names = F,col.names = F)#万亿后面没有分隔符
data = file(paste(path,"/重要指数.txt",sep = ""))   
content = readLines(data)
write.table(gsub(" ","",content[1:length(content)]),paste(path,"/重要指数.txt",sep = ""),quote=F,row.names = F,col.names = F) #去掉股票名字空格

zs = read.table(paste(path,"/重要指数.txt",sep = ""),header = T)

#szzs上证指数
szzs.kaipan = zs[zs$名称 == "上证指数", ][,10]
szzs.zuoshou = zs[zs$名称 == "上证指数", ][,11]
gaodikai = "高开"
if(szzs.zuoshou>szzs.kaipan){gaodikai = "低开"} 
szzs.shouyu = zs[zs$名称 == "上证指数", ][,4]
dir1 = "上涨"
if(szzs.shouyu<szzs.zuoshou){dir1 = "下跌"}
szzs.dianshu = zs[zs$名称 == "上证指数", ][,6]
szzs.zhangfu = paste(zs[zs$名称 == "上证指数", ][,5],"%",sep="")
szzs.zuigao = zs[zs$名称 == "上证指数", ][,8]
szzs.zuidi = zs[zs$名称 == "上证指数", ][,9]

#szcz 深证成指
szcz.kaipan = zs[zs$名称 == "深证成指", ][,10]
szcz.zuoshou = zs[zs$名称 == "深证成指", ][,11]
gaodikai = "高开"
if(szcz.zuoshou>szcz.kaipan){gaodikai = "低开"} 
szcz.shouyu = zs[zs$名称 == "深证成指", ][,4]
dir2 = "上涨"
if(szcz.shouyu<szcz.zuoshou){dir2 = "下跌"}
szcz.dianshu = zs[zs$名称 == "深证成指", ][,6]
szcz.zhangfu = paste(zs[zs$名称 == "深证成指", ][,5],"%",sep="")
szcz.zuigao = zs[zs$名称 == "深证成指", ][,8]
szcz.zuidi = zs[zs$名称 == "深证成指", ][,9]
zs

#hs300 沪深300
hs300.kaipan = zs[zs$名称 == "沪深300", ][,10]
hs300.zuoshou = zs[zs$名称 == "沪深300", ][,11]
gaodikai = "高开"
if(hs300.zuoshou>hs300.kaipan){gaodikai = "低开"} 
hs300.shouyu = zs[zs$名称 == "沪深300", ][,4]
dir3 = "上涨"
if(hs300.shouyu<hs300.zuoshou){dir3 = "下跌"}
hs300.dianshu = zs[zs$名称 == "沪深300", ][,6]
hs300.zhangfu = paste(zs[zs$名称 == "沪深300", ][,5],"%",sep="")
hs300.zuigao = zs[zs$名称 == "沪深300", ][,8]
hs300.zuidi = zs[zs$名称 == "沪深300", ][,9]

#cybz 创业板指
cybz.kaipan = zs[zs$名称 == "创业板指", ][,10]
cybz.zuoshou = zs[zs$名称 == "创业板指", ][,11]
gaodikai = "高开"
if(cybz.zuoshou>cybz.kaipan){gaodikai = "低开"} 
cybz.shouyu = zs[zs$名称 == "创业板指", ][,4]
dir4 = "上涨"
if(cybz.shouyu<cybz.zuoshou){dir4 = "下跌"}
cybz.dianshu = zs[zs$名称 == "创业板指", ][,6]
cybz.zhangfu = paste(zs[zs$名称 == "创业板指", ][,5],"%",sep="")
cybz.zuigao = zs[zs$名称 == "创业板指", ][,8]
cybz.zuidi = zs[zs$名称 == "创业板指", ][,9]

#zxbz 中小板指
zxbz.kaipan = zs[zs$名称 == "中小板指", ][,10]
zxbz.zuoshou = zs[zs$名称 == "中小板指", ][,11]
gaodikai = "高开"
if(zxbz.zuoshou>zxbz.kaipan){gaodikai = "低开"} 
zxbz.shouyu = zs[zs$名称 == "中小板指", ][,4]
dir5 = "上涨"
if(zxbz.shouyu<zxbz.zuoshou){dir5 = "下跌"}
zxbz.dianshu = zs[zs$名称 == "中小板指", ][,6]
zxbz.zhangfu = paste(zs[zs$名称 == "中小板指", ][,5],"%",sep="")
zxbz.zuigao = zs[zs$名称 == "中小板指", ][,8]
zxbz.zuidi = zs[zs$名称 == "中小板指", ][,9]

szzs.dianshu = gsub("-","",szzs.dianshu)
szcz.dianshu = gsub("-","",szcz.dianshu)
hs300.dianshu = gsub("-","",hs300.dianshu)
cybz.dianshu = gsub("-","",cybz.dianshu)
zxbz.dianshu = gsub("-","",zxbz.dianshu)

zs
cybz.zhangfu

write.table(paste("    当日开盘以来，","上证指数",gaodikai,"，报",szzs.kaipan,"点，盘中最高到达",
                  szzs.zuigao,"点，最低到达",szzs.zuidi,"点，今收较昨收",dir1,szzs.dianshu,"点，收于",szzs.shouyu,"点，全天涨幅",szzs.zhangfu,"；深证指数",gaodikai,"，报",szcz.kaipan,"点，盘中最高到达",
                  szcz.zuigao,"点，最低到达",szcz.zuidi,"点，今收较昨收",dir2,szcz.dianshu,"点，收于",szcz.shouyu,"点，全天涨幅",szcz.zhangfu,"；沪深300",gaodikai,"，报",hs300.kaipan,"点，盘中最高到达",
                  hs300.zuigao,"点，最低到达",hs300.zuidi,"点，今收较昨收",dir3,hs300.dianshu,"点，收于",hs300.shouyu,"点，全天涨幅",hs300.zhangfu,"；中小板指",gaodikai,"，报",zxbz.kaipan,"点，盘中最高到达",
                  zxbz.zuigao,"点，最低到达",zxbz.zuidi,"点，今收较昨收",dir5,zxbz.dianshu,"点，收于",zxbz.shouyu,"点，全天涨幅",zxbz.zhangfu,"；创业板指",gaodikai,"，报",cybz.kaipan,"点，盘中最高到达",
                  cybz.zuigao,"点，最低到达",cybz.zuidi,"点，今收较昨收",dir4,cybz.dianshu,"点，收于",cybz.shouyu,"点，全天涨幅",cybz.zhangfu,
                  sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)
#-------------------------------------------------------------------------------------------------------------------
#板块分析
#行业板块方面：
#获得了板块的面板数据
data = file(paste(path,"/行业板块.txt",sep = ""))      #重复定义data是要固定write的结果
content = readLines(data)
write.table(sub("万亿","万亿\t",content[1:length(content)]),paste(path,"/行业板块.txt",sep = ""),quote=F,row.names = F,col.names = F)#万亿后面没有分隔符
data = file(paste(path,"/行业板块.txt",sep = ""))   
content = readLines(data)
write.table(gsub(" ","",content[1:length(content)]),paste(path,"/行业板块.txt",sep = ""),quote=F,row.names = F,col.names = F) #去掉股票名字空格，影响读入

bk = read.table(paste(path,"/行业板块.txt",sep = ""),header = T)
ck = bk  # ck is the data to use later
bk
#当日板块涨跌情况(多少个上涨，多少个下跌)
up = arrange(ck,desc(as.numeric(ck[,3]))) 
up_num = nrow(up[up$涨幅>=0,])                                      #上涨的板块数量
rate = round(up_num/nrow(ck)*100,2)
up_ratio = paste(rate,"%",sep="")                                   #涨板块占总数比率
up_names= as.character(up[1:n,2])                                   #前n名的板块名称
up_extent = paste(as.character(up[1:n,3]),"%",sep="")               #前n名的涨幅
ups = ""
for(i in 1:(n-1)){
  ups = paste(ups,up_names[i],"(",up_extent[i],")、",sep="")
}
ups= paste(ups,up_names[n],"(",up_extent[n],")",sep="")
ups


down = arrange(ck,ck[,3]) 
down_num = nrow(down[down$涨幅<0,])                                 #下跌的板块数量
rate = round(down_num/nrow(ck)*100,2)
down_ratio = paste(rate,"%",sep="")                                 #跌板块占总数比率
down_names= as.character(down[1:n,2])                               #跌幅最大n名的板块名称
down_extent = paste(as.character(down[1:n,3]),"%",sep="")           #底部n名的下跌幅度
downs = ""
for(i in 1:(n-1)){
  downs = paste(downs,down_names[i],"(",down_extent[i],")、",sep="")
}
downs= paste(downs,down_names[n],"(",down_extent[n],")",sep="")
downs


up3 = arrange(ck,desc(as.numeric(ck[,4])) )
up3_num = nrow(up3[up3[,4]>=0,])                                    #3日内上涨的板块数量
rate = round(up3_num/nrow(ck)*100,2)
up3_ratio = paste(rate,"%",sep="")                                  #3day涨板块占总数比率
up3_names= as.character(up3[1:n,2])                                 #前n名的板块名称
up3_extent = paste(as.character(up3[1:n,4]),"%",sep="")             #前n名的涨幅
up3s = ""
for(i in 1:(n-1)){
  up3s = paste(up3s,up3_names[i],"(",up3_extent[i],")、",sep="")
}
up3s= paste(up3s,up3_names[n],"(",up3_extent[n],")",sep="")
up3s


down3 = arrange(ck,ck[,4]) 
down3_num = nrow(down3[down3[,4]<0,])                               #3日内下跌的板块数量
rate = round(down3_num/nrow(ck)*100,2)
down3_ratio = paste(rate,"%",sep="")                                #3day跌板块占总数比率
down3_names= as.character(down3[1:n,2])                             #跌幅最大n名的板块名称
down3_extent = paste(as.character(down3[1:n,4]),"%",sep="")         #底部n名的下跌幅度
down3s = ""
for(i in 1:(n-1)){
  down3s = paste(down3s,down3_names[i],"(",down3_extent[i],")、",sep="")
}
down3s= paste(down3s,down3_names[n],"(",down3_extent[n],")",sep="")
down3s


#成交量(第18列，列名称V18)
#这一步有少量报错是因为有的使用万计数，有的是用亿计数，在处理的时候会有区别
for (i in 1:nrow(ck)){
  ck[i,18]  =  gsub("万","*10000",as.character(ck[i,11]))
  numbers = as.numeric(unlist(strsplit(ck[i,18],split = "*",fixed = T)))      ##不用fixed的话就把3000也拆开成3，0，0，0了
  options(scipen=200)   #200位数字之内不使用科学计数法
  ck[i,18]=prod(numbers)}
for(s in 1:nrow(ck)){
  if(is.na(ck[s,18])){
    ck[s,18]  =  gsub("亿","*100000000",as.character(ck[s,11]))
    numbers = as.numeric(unlist(strsplit(ck[s,18],split = "*",fixed = T)))
    options(scipen=200)   #200位数字之内不使用科学计数法
    ck[s,18]=prod(numbers)}}

deal = arrange(ck,desc(V18)) 
deal_names= as.character(deal[1:n,2])                                              #成交量前n名的板块名称
deal_num = paste(as.character(as.numeric(deal[1:n,18])/10000),"万手",sep="")       #成交量前几名的手数


#当日换手率最高的五个板块
change = arrange(ck,desc(as.numeric(ck[,9])))#昨日连板等指标的存在，多考虑三个
change_names= as.character(change[1:(n+3),2])                                      #换手率前n名的板块名称
change_extent = paste(as.character(change[1:n,9]),"%",sep="")                      #前n名的换手率
changes = ""
for(i in 1:(n-1)){
  changes = paste(changes,change_names[i],"(",change_extent[i],")、",sep="")
}
changes= paste(changes,change_names[n],"(",change_extent[n],")",sep="")
changes


change3 = arrange(ck,desc(as.numeric(ck[,10])) )
change3_names= as.character(change3[1:(n+3),2])                                    #3days换手率前n名的板块名称
change3_extent = paste(as.character(change3[1:n,10]),"%",sep="")                   #3days换手率前n名的换手率
change3_names
change3s = ""
for(i in 1:(n-1)){
  change3s = paste(change3s,change3_names[i],"(",change3_extent[i],")、",sep="")
}
change3s= paste(change3s,change3_names[n],"(",change3_extent[n],")",sep="")
change3s



dechange = arrange(ck,as.numeric(ck[,9])) #昨日连板等指标的存在，多考虑三个
dechange_names= as.character(dechange[1:n,2])                                      #换手率后n名的板块名称
dechange_extent = paste(as.character(dechange[1:n,9]),"%",sep="")                  #后n名的换手率
dechanges = ""
for(i in 1:(n-1)){
  dechanges = paste(dechanges,dechange_names[i],"(",dechange_extent[i],")、",sep="")
}
dechanges= paste(dechanges,dechange_names[n],"(",dechange_extent[n],")",sep="")
dechanges
dechanges

dechange3 = arrange(ck,as.numeric(ck[,10]) )
dechange3_names= as.character(dechange3[1:n,2])                                    #3days换手率后n名的板块名称
dechange3_extent = paste(as.character(dechange3[1:n,10]),"%",sep="")               #3days换手率后n名的换手率
dechange3_names
dechange3s = ""
for(i in 1:(n-1)){
  dechange3s = paste(dechange3s,dechange3_names[i],"(",dechange3_extent[i],")、",sep="")
}
dechange3s= paste(dechange3s,dechange3_names[n],"(",dechange3_extent[n],")",sep="")
dechange3s

#成交金额
for (i in 1:nrow(ck)){
  ck[i,19]  =  gsub("万","*10000",as.character(ck[i,12]))
  numbers = as.numeric(unlist(strsplit(ck[i,19],split = "*",fixed = T)))      ##不用fixed的话就把3000也拆开成3，0，0，0了
  options(scipen=200)   #200位数字之内不使用科学计数法
  ck[i,19]=prod(numbers)}
for(s in 1:nrow(ck)){
  if(is.na(ck[s,19])){
    ck[s,19]  =  gsub("亿","*100000000",as.character(ck[s,12]))
    numbers = as.numeric(unlist(strsplit(ck[s,19],split = "*",fixed = T)))
    options(scipen=200)   #200位数字之内不使用科学计数法
    ck[s,19]=prod(numbers)}}

amount = arrange(ck,desc(as.numeric(ck[,19])))                          #按照成交金额降序排列
amount_names= as.character(amount[1:n,2])                               #前n名的板块名称
amount_extent = paste(as.character(as.numeric(amount[1:n,19])/10^8),"亿元",sep="") #前n名的成交金额
amounts = ""
for(i in 1:(n-1)){
  amounts = paste(amounts,amount_names[i],"(",amount_extent[i],")、",sep="")
}
amounts= paste(amounts,amount_names[n],"(",amount_extent[n],")",sep="")
amounts

#每股平均收益
per = arrange(ck,desc(as.numeric(ck[,15])) )
per_names= as.character(per[1:n,2])                                     #平均收益最高n名的板块名称
per_extent = paste(as.character(per[1:n,15]),"元",sep="")               #前n名的平均收益
pers = ""
for(i in 1:(n-1)){
  pers = paste(pers,per_names[i],"(",per_extent[i],")、",sep="")
}
pers= paste(pers,per_names[n],"(",per_extent[n],")",sep="")
pers


#市盈率
pe = arrange(ck,desc(as.numeric(ck[,17])) )
pe_names= as.character(pe[1:n,2])                                       #市盈率最高前n名的板块名称
pe_extent = paste(as.character(pe[1:n,17]),"%",sep="")                  #市盈率前n名的涨幅
pes = ""
for(i in 1:(n-1)){
  pes = paste(pes,pe_names[i],"(",pe_extent[i],")、",sep="")
}
pes= paste(pes,pe_names[n],"(",pe_extent[n],")",sep="")
pes

pe2 = arrange(ck,as.numeric(ck[,17]))
pe2_names= as.character(pe2[1:n,2])                                       #市盈率最低前n名的板块名称
pe2_extent = paste(as.character(pe2[1:n,17]),"%",sep="")                  #市盈率前n名的涨幅
pe2s = ""
for(i in 1:(n-1)){
  pe2s = paste(pe2s,pe2_names[i],"(",pe2_extent[i],")、",sep="")
}
pe2s= paste(pe2s,pe2_names[n],"(",pe2_extent[n],")",sep="")
pe2s

write.table(paste("    
                  行业板块方面，","当日上涨板块数量为",up_num,"个，占比",up_ratio,"，涨幅前",n,"名的板块是",ups,
                  "；当日下跌板块数量为",down_num,"个，占比",down_ratio,"，跌幅最大的",n,"个板块是",downs,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    当日换手率最高的",n,"个板块是",changes,"，最低的是",dechanges,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    市盈率最高的",n,"个板块是",pes,"，最低的是",pe2s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    平均收益最高的",n,"个板块是",pers,"，最低的是",pers,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    当日成交量最大的",n,"个板块是",deals,"，成交金额最高的板块是",amounts,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    过去3个交易日内，上涨板块数量为",up3_num,"个，占比",up3_ratio,"，涨幅前",n,"名的板块是",up3s,
                  "；下跌板块数量为",down3_num,"个，占比",down3_ratio,"，跌幅最大的",n,"个板块是",down3s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    3日内换手率最高的",n,"个板块是",change3s,"，最低的是",dechange3s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

#-------------------------------------------------------------------------------------------------------------------
#概念板块方面：
#获得了板块的面板数据
data = file(paste(path,"/概念板块.txt",sep = ""))      #重复定义data是要固定write的结果
content = readLines(data)
write.table(sub("万亿","万亿\t",content[1:length(content)]),paste(path,"/概念板块.txt",sep = ""),quote=F,row.names = F,col.names = F)#万亿后面没有分隔符
data = file(paste(path,"/概念板块.txt",sep = ""))   
content = readLines(data)
write.table(gsub(" ","",content[1:length(content)]),paste(path,"/概念板块.txt",sep = ""),quote=F,row.names = F,col.names = F) #去掉股票名字空格，影响读入

bk = read.table(paste(path,"/概念板块.txt",sep = ""),header = T)
ck = bk  # ck is the data to use later
bk
#当日板块涨跌情况(多少个上涨，多少个下跌)
up = arrange(ck,desc(as.numeric(ck[,3])))
up_num = nrow(up[up$涨幅>=0,])                                      #上涨的板块数量
rate = round(up_num/nrow(ck)*100,2)
up_ratio = paste(rate,"%",sep="")                                   #涨板块占总数比率
up_names= as.character(up[1:n,2])                                   #前n名的板块名称
up_extent = paste(as.character(up[1:n,3]),"%",sep="")               #前n名的涨幅
ups = ""
for(i in 1:(n-1)){
  ups = paste(ups,up_names[i],"(",up_extent[i],")、",sep="")
}
ups= paste(ups,up_names[n],"(",up_extent[n],")",sep="")
ups


down = arrange(ck,as.numeric(ck[,3]) )
down_num = nrow(down[down$涨幅<0,])                                 #下跌的板块数量
rate = round(down_num/nrow(ck)*100,2)
down_ratio = paste(rate,"%",sep="")                                 #跌板块占总数比率
down_names= as.character(down[1:n,2])                               #跌幅最大n名的板块名称
down_extent = paste(as.character(down[1:n,3]),"%",sep="")           #底部n名的下跌幅度
downs = ""
for(i in 1:(n-1)){
  downs = paste(downs,down_names[i],"(",down_extent[i],")、",sep="")
}
downs= paste(downs,down_names[n],"(",down_extent[n],")",sep="")
downs


up3 = arrange(ck,desc(as.numeric(ck[,4])) )
up3_num = nrow(up3[up3[,4]>=0,])                                    #3日内上涨的板块数量
rate = round(up3_num/nrow(ck)*100,2)
up3_ratio = paste(rate,"%",sep="")                                  #3day涨板块占总数比率
up3_names= as.character(up3[1:n,2])                                 #前n名的板块名称
up3_extent = paste(as.character(up3[1:n,4]),"%",sep="")             #前n名的涨幅
up3s = ""
for(i in 1:(n-1)){
  up3s = paste(up3s,up3_names[i],"(",up3_extent[i],")、",sep="")
}
up3s= paste(up3s,up3_names[n],"(",up3_extent[n],")",sep="")
up3s


down3 = arrange(ck,as.numeric(ck[,4]) )
down3_num = nrow(down3[down3[,4]<0,])                               #3日内下跌的板块数量
rate = round(down3_num/nrow(ck)*100,2)
down3_ratio = paste(rate,"%",sep="")                                #3day跌板块占总数比率
down3_names= as.character(down3[1:n,2])                             #跌幅最大n名的板块名称
down3_extent = paste(as.character(down3[1:n,4]),"%",sep="")         #底部n名的下跌幅度
down3s = ""
for(i in 1:(n-1)){
  down3s = paste(down3s,down3_names[i],"(",down3_extent[i],")、",sep="")
}
down3s= paste(down3s,down3_names[n],"(",down3_extent[n],")",sep="")
down3s


#成交量(第18列，列名称V18)
#这一步有少量报错是因为有的使用万计数，有的是用亿计数，在处理的时候会有区别
for (i in 1:nrow(ck)){
  ck[i,18]  =  gsub("万","*10000",as.character(ck[i,11]))
  numbers = as.numeric(unlist(strsplit(ck[i,18],split = "*",fixed = T)))      ##不用fixed的话就把3000也拆开成3，0，0，0了
  options(scipen=200)   #200位数字之内不使用科学计数法
  ck[i,18]=prod(numbers)}
for(s in 1:nrow(ck)){
  if(is.na(ck[s,18])){
    ck[s,18]  =  gsub("亿","*100000000",as.character(ck[s,11]))
    numbers = as.numeric(unlist(strsplit(ck[s,18],split = "*",fixed = T)))
    options(scipen=200)   #200位数字之内不使用科学计数法
    ck[s,18]=prod(numbers)}}

deal = arrange(ck,desc(V18)) 
deal_names= as.character(deal[1:n,2])                                              #成交量前n名的板块名称
deal_num = paste(as.character(as.numeric(deal[1:n,18])/10000),"万手",sep="")       #成交量前几名的手数


#当日换手率最高的五个板块
change = arrange(ck,desc(as.numeric(ck[,9])) )#昨日连板等指标的存在，多考虑三个
change_names= as.character(change[1:(n+3),2])                                      #换手率前n名的板块名称
change_extent = paste(as.character(change[1:n,9]),"%",sep="")                      #前n名的换手率
changes = ""
for(i in 1:(n-1)){
  changes = paste(changes,change_names[i],"(",change_extent[i],")、",sep="")
}
changes= paste(changes,change_names[n],"(",change_extent[n],")",sep="")
changes


change3 = arrange(ck,desc(as.numeric(ck[,10])) )
change3_names= as.character(change3[1:(n+3),2])                                    #3days换手率前n名的板块名称
change3_extent = paste(as.character(change3[1:n,10]),"%",sep="")                   #3days换手率前n名的换手率
change3_names
change3s = ""
for(i in 1:(n-1)){
  change3s = paste(change3s,change3_names[i],"(",change3_extent[i],")、",sep="")
}
change3s= paste(change3s,change3_names[n],"(",change3_extent[n],")",sep="")
change3s



dechange = arrange(ck,as.numeric(ck[,9]) )#昨日连板等指标的存在，多考虑三个
dechange_names= as.character(dechange[1:n,2])                                      #换手率后n名的板块名称
dechange_extent = paste(as.character(dechange[1:n,9]),"%",sep="")                  #后n名的换手率
dechanges = ""
for(i in 1:(n-1)){
  dechanges = paste(dechanges,dechange_names[i],"(",dechange_extent[i],")、",sep="")
}
dechanges= paste(dechanges,dechange_names[n],"(",dechange_extent[n],")",sep="")
dechanges
dechanges

dechange3 = arrange(ck,as.numeric(ck[,10]) )
dechange3_names= as.character(dechange3[1:n,2])                                    #3days换手率后n名的板块名称
dechange3_extent = paste(as.character(dechange3[1:n,10]),"%",sep="")               #3days换手率后n名的换手率
dechange3_names
dechange3s = ""
for(i in 1:(n-1)){
  dechange3s = paste(dechange3s,dechange3_names[i],"(",dechange3_extent[i],")、",sep="")
}
dechange3s= paste(dechange3s,dechange3_names[n],"(",dechange3_extent[n],")",sep="")
dechange3s

#成交金额
for (i in 1:nrow(ck)){
  ck[i,19]  =  gsub("万","*10000",as.character(ck[i,12]))
  numbers = as.numeric(unlist(strsplit(ck[i,19],split = "*",fixed = T)))      ##不用fixed的话就把3000也拆开成3，0，0，0了
  options(scipen=200)   #200位数字之内不使用科学计数法
  ck[i,19]=prod(numbers)}
for(s in 1:nrow(ck)){
  if(is.na(ck[s,19])){
    ck[s,19]  =  gsub("亿","*100000000",as.character(ck[s,12]))
    numbers = as.numeric(unlist(strsplit(ck[s,19],split = "*",fixed = T)))
    options(scipen=200)   #200位数字之内不使用科学计数法
    ck[s,19]=prod(numbers)}}

amount = arrange(ck,desc(as.numeric(ck[,19])))                          #按照成交金额降序排列
amount_names= as.character(amount[1:n,2])                               #前n名的板块名称
amount_extent = paste(as.character(as.numeric(amount[1:n,19])/10^8),"亿元",sep="") #前n名的成交金额
amounts = ""
for(i in 1:(n-1)){
  amounts = paste(amounts,amount_names[i],"(",amount_extent[i],")、",sep="")
}
amounts= paste(amounts,amount_names[n],"(",amount_extent[n],")",sep="")
amounts

#每股平均收益
per = arrange(ck,desc(as.numeric(ck[,15])) )
per_names= as.character(per[1:n,2])                                     #平均收益最高n名的板块名称
per_extent = paste(as.character(per[1:n,15]),"元",sep="")               #前n名的平均收益
pers = ""
for(i in 1:(n-1)){
  pers = paste(pers,per_names[i],"(",per_extent[i],")、",sep="")
}
pers= paste(pers,per_names[n],"(",per_extent[n],")",sep="")
pers


#市盈率
pe = arrange(ck,desc(as.numeric(ck[,17]))) 
pe_names= as.character(pe[1:n,2])                                       #市盈率最高前n名的板块名称
pe_extent = paste(as.character(pe[1:n,17]),"%",sep="")                  #市盈率前n名的涨幅
pes = ""
for(i in 1:(n-1)){
  pes = paste(pes,pe_names[i],"(",pe_extent[i],")、",sep="")
}
pes= paste(pes,pe_names[n],"(",pe_extent[n],")",sep="")
pes

pe2 = arrange(ck,as.numeric(ck[,17]))
pe2_names= as.character(pe2[1:n,2])                                       #市盈率最低前n名的板块名称
pe2_extent = paste(as.character(pe2[1:n,17]),"%",sep="")                  #市盈率前n名的涨幅
pe2s = ""
for(i in 1:(n-1)){
  pe2s = paste(pe2s,pe2_names[i],"(",pe2_extent[i],")、",sep="")
}
pe2s= paste(pe2s,pe2_names[n],"(",pe2_extent[n],")",sep="")
pe2s

write.table(paste("    
                  概念板块方面，","当日上涨板块数量为",up_num,"个，占比",up_ratio,"，涨幅前",n,"名的板块是",ups,
                  "；当日下跌板块数量为",down_num,"个，占比",down_ratio,"，跌幅最大的",n,"个板块是",downs,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    当日换手率最高的",n,"个板块是",changes,"，最低的是",dechanges,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    市盈率最高的",n,"个板块是",pes,"，最低的是",pe2s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    平均收益最高的",n,"个板块是",pers,"，最低的是",pers,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    当日成交量最大的",n,"个板块是",deals,"，成交金额最高的板块是",amounts,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    过去3个交易日内，上涨板块数量为",up3_num,"个，占比",up3_ratio,"，涨幅前",n,"名的板块是",up3s,
                  "；下跌板块数量为",down3_num,"个，占比",down3_ratio,"，跌幅最大的",n,"个板块是",down3s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    3日内换手率最高的",n,"个板块是",change3s,"，最低的是",dechange3s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)




#-------------------------------------------------------------------------------------------------------------------
#板块内分析
paste(path,"/",bankuai1,".txt",sep = "")
data = file(paste(path,"/",bankuai1,".txt",sep = ""))      #重复定义data是要固定write的结果
content = readLines(data)
write.table(sub("万亿","万亿\t",content[1:length(content)]),paste(path,"/",bankuai1,".txt",sep = ""),quote=F,row.names = F,col.names = F)#万亿后面没有分隔符
data = file(paste(path,"/",bankuai1,".txt",sep = ""))   
content = readLines(data)
write.table(gsub(" ","",content[1:length(content)]),paste(path,"/",bankuai1,".txt",sep = ""),quote=F,row.names = F,col.names = F) #去掉股票名字空格
bk = read.table(paste(path,"/",bankuai1,".txt",sep = ""),header = T)

bk1 = bk                                      #不同的汇总要做不同的处理，用副本操作
bk1[,5] = as.numeric(as.character(bk1[,5]))   #处理掉"----",变成NA
bk1 = bk1[complete.cases(bk1[,5]),]           #把NA去掉
bk1 = bk1[row.names(bk1)!="1",]               #去除顶端的汇总行

bk1 = arrange(bk1,desc(as.numeric(bk1[,5]))) 
bk1_names= as.character(bk1[1:n,3])                                      #涨幅最高前n名的股票名称
bk1_extent = paste(as.character(bk1[1:n,5]),"%",sep="")                  #前n名的涨幅
bk1s = ""
for(i in 1:(n-1)){
  bk1s = paste(bk1s,bk1_names[i],"(",bk1_extent[i],")、",sep="")
}
bk1s= paste(bk1s,bk1_names[n],"(",bk1_extent[n],")",sep="")
ups = bk1s

bk11 = arrange(bk1,as.numeric(bk1[,5]) )
bk11_names= as.character(bk11[1:n,3])                                      #涨幅最低前n名的股票名称
bk11_extent = paste(as.character(bk11[1:n,5]),"%",sep="")                  #前n名的跌幅
bk11s = ""
for(i in 1:(n-1)){
  bk11s = paste(bk11s,bk11_names[i],"(",bk11_extent[i],")、",sep="")
}
bk11s= paste(bk11s,bk11_names[n],"(",bk11_extent[n],")",sep="")
downs = bk11s
downs


change = arrange(bk1,desc(as.numeric(as.character(bk1[,12]))))
change_names= as.character(change[1:n,3])                                          #换手率前n名的股票名称
change_extent = paste(as.character(change[1:n,9]),"%",sep="")                      #前n名的换手率
changes = ""
for(i in 1:(n-1)){
  changes = paste(changes,change_names[i],"(",change_extent[i],")、",sep="")
}
changes= paste(changes,change_names[n],"(",change_extent[n],")",sep="")


bk12 = arrange(bk1,desc(as.numeric(bk1[,35]))) 
bk12_names= as.character(bk12[1:n,3])                                       #3day涨幅最高前n名的股票名称
bk12_extent = paste(as.character(bk12[1:n,35]),"%",sep="")                  #3day前n名的涨幅
bk12s = ""
for(i in 1:(n-1)){
  bk12s = paste(bk12s,bk12_names[i],"(",bk12_extent[i],")、",sep="")
}
bk12s= paste(bk12s,bk12_names[n],"(",bk12_extent[n],")",sep="")
up3s=bk12s

bk22 = arrange(bk1,as.numeric(bk1[,35]))
bk22_names= as.character(bk22[1:n,3])                                      #3day涨幅最低前n名的股票名称
bk22_extent = paste(as.character(bk22[1:n,35]),"%",sep="")                  #3day前n名的跌幅
bk22s = ""
for(i in 1:(n-1)){
  bk22s = paste(bk22s,bk22_names[i],"(",bk22_extent[i],")、",sep="")
}
bk22s= paste(bk22s,bk22_names[n],"(",bk22_extent[n],")",sep="")
down3s = bk22s

change3 = arrange(bk1,desc(as.numeric(bk1[,37])) )
change3_names= as.character(change3[1:n,3])                                    #3days换手率前n名的股票名称
change3_extent = paste(as.character(change3[1:n,37]),"%",sep="")               #3days换手率前n名的换手率
change3_names
change3s = ""
for(i in 1:(n-1)){
  change3s = paste(change3s,change3_names[i],"(",change3_extent[i],")、",sep="")
}
change3s= paste(change3s,change3_names[n],"(",change3_extent[n],")",sep="")
change3s

#市盈率
pe = arrange(bk1,desc(as.numeric(as.character(bk1[,14]))))
pe_names= as.character(pe[1:n,3])                                       #市盈率最高前n名的股票名称
pe_extent = paste(as.character(pe[1:n,14]),"%",sep="")                  #市盈率前n名的涨幅
pes = ""
for(i in 1:(n-1)){
  pes = paste(pes,pe_names[i],"(",pe_extent[i],")、",sep="")
}
pes= paste(pes,pe_names[n],"(",pe_extent[n],")",sep="")
pes

pe2 = arrange(bk1,as.numeric(as.character(bk1[,14])))
pe2_names= as.character(pe2[1:n,3])                                       #市盈率最低前n名的股票名称
pe2_extent = paste(as.character(pe2[1:n,14]),"%",sep="")                  #市盈率前n名的涨幅
pe2s = ""
for(i in 1:(n-1)){
  pe2s = paste(pe2s,pe_names[i],"(",pe2_extent[i],")、",sep="")
}
pe2s= paste(pe2s,pe2_names[n],"(",pe2_extent[n],")",sep="")
pe2s

#市净率
net = arrange(bk1,desc(as.numeric(as.character(bk1[,30]))))
net_names= as.character(net[1:n,3])                                       #市净率最高前n名的股票名称
net_extent = paste(as.character(net[1:n,30]),"%",sep="")                  #市净率前n名的涨幅
nets = ""
for(i in 1:(n-1)){
  nets = paste(nets,net_names[i],"(",net_extent[i],")、",sep="")
}
nets= paste(nets,net_names[n],"(",net_extent[n],")",sep="")
nets


#委比
assign = arrange(bk1,desc(as.numeric(as.character(bk1[,22]))))
assign_names= as.character(assign[1:n,3])                                       #委比最高前n名的股票名称
assign_extent = paste(as.character(assign[1:n,22]),"%",sep="")                  #前n名的委比
assigns = ""
for(i in 1:(n-1)){
  assigns = paste(assigns,assign_names[i],"(",assign_extent[i],")、",sep="")
}
assigns= paste(assigns,assign_names[n],"(",assign_extent[n],")",sep="")
assigns

assign2 = arrange(bk1,as.numeric(as.character(bk1[,22])))
assign2_names= as.character(assign2[1:n,3])                                       #委比最低前n名的股票名称
assign2_extent = paste(as.character(assign2[1:n,22]),"%",sep="")                  #空头强势前n名的涨幅
assign2s = ""
for(i in 1:(n-1)){
  assign2s = paste(assign2s,assign2_names[i],"(",assign2_extent[i],")、",sep="")
}
assign2s= paste(assign2s,assign2_names[n],"(",assign2_extent[n],")",sep="")
assign2s
write.table(paste("    
                  具体到",bankuai1,"板块，","当日涨幅前",n,"名的股票是",ups,
                  "；当日涨幅最低的股票为",downs,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    当日换手率最高的",n,"只股票是",changes,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)
write.table(paste("    市盈率最高的",n,"只股票是",pes,"，最低的是",pe2s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    市净率最高的",n,"只股票是",nets,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    用委比衡量，当天多头最强势的",n,"只股票是",assigns,"空头最强势的",n,"只股票是",assign2s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    过去3个交易日内，涨幅最高的股票为",up3s,
                  "，跌幅最大的",n,"只股票是",down3s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste( "    3日内换手率最高的",n,"只股票是",change3s,sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

#-------------------------------------------------------------------------------------------------------------------
#基金
data = file(paste(path,"/上证基金.txt",sep = ""))      #重复定义data是要固定write的结果
content = readLines(data)
write.table(sub("万亿","万亿\t",content[1:length(content)]),paste(path,"/上证基金.txt",sep = ""),quote=F,row.names = F,col.names = F)#万亿后面没有分隔符
data = file(paste(path,"/上证基金.txt",sep = ""))   
content = readLines(data)
write.table(gsub(" ","",content[1:length(content)]),paste(path,"/上证基金.txt",sep = ""),quote=F,row.names = F,col.names = F) #去掉股票名字空格
szfund = read.table(paste(path,"/上证基金.txt",sep = ""),header = T)

#涨幅
szfund1 = szfund                                           #不同的汇总要做不同的处理，用副本操作
szfund1[,5] = as.numeric(as.character(szfund1[,5]))        #处理掉"----",变成NA
szfund1 = szfund1[complete.cases(szfund1[,5]),]            #把NA去掉
szfund1 = arrange(szfund1,desc(as.numeric(szfund1[,5]))) 
szfund1_names= as.character(szfund1[1:n,3])                                      #涨幅最高前n名的股票名称
szfund1_extent = paste(as.character(szfund1[1:n,5]),"%",sep="")                  #前n名的涨幅
szfund1_names
szfunds = ""
for(i in 1:(n-1)){
  szfunds = paste(szfunds,szfund1_names[i],"(",szfund1_extent[i],")、",sep="")
}
szfunds= paste(szfunds,szfund1_names[n],"(",szfund1_extent[n],")",sep="")
ups1=szfunds


#手数
szfund2 = szfund                                           #不同的汇总要做不同的处理，用副本操作
ncol(szfund)
for (i in 1:nrow(szfund2)){
  szfund2[i,28]  =  gsub("万","*10000",as.character(szfund2[i,7]))
  numbers = as.numeric(unlist(strsplit(szfund2[i,28],split = "*",fixed = T)))      ##不用fixed的话就把3000也拆开成3，0，0，0了
  options(scipen=200)   #200位数字之内不使用科学计数法
  szfund2[i,28]=prod(numbers)}
szfund2[,28] = as.numeric(szfund2[,28])
szfund2 = szfund2[complete.cases(szfund2[,28]),]
szfund2 = arrange(szfund2,desc(as.numeric(szfund2[,28]))) 
szfund2_names= as.character(szfund2[1:n,3])                                      #涨幅最高前n名的股票名称
szfund2_extent = paste(as.character(as.numeric(szfund2[1:n,28])/10000),"万手",sep="")                  #前n名的涨幅
szfund2_extent
szfund2s = ""
for(i in 1:(n-1)){
  szfund2s = paste(szfund2s,szfund2_names[i],"(",szfund2_extent[i],")、",sep="")
}
szfund2s= paste(szfund2s,szfund2_names[n],"(",szfund2_extent[n],")",sep="")
deals1=szfund2s

#3日涨幅
szfund3 = szfund                                           #不同的汇总要做不同的处理，用副本操作
szfund3[,26] = as.numeric(as.character(szfund3[,26]))        #处理掉"----",变成NA
szfund3 = szfund3[complete.cases(szfund3[,26]),]            #把NA去掉
szfund3 = arrange(szfund3,desc(as.numeric(szfund3[,26]))) 
szfund3_names= as.character(szfund3[1:n,3])                                      #涨幅最高前n名的股票名称
szfund3_extent = paste(as.character(szfund3[1:n,26]),"%",sep="")                  #前n名的涨幅
szfund3_names
szfund3s = ""
for(i in 1:(n-1)){
  szfund3s = paste(szfund3s,szfund3_names[i],"(",szfund3_extent[i],")、",sep="")
}
szfund3s= paste(szfund3s,szfund3_names[n],"(",szfund3_extent[n],")",sep="")
up3s1 = szfund3s

#6日涨幅
szfund4 = szfund                                           #不同的汇总要做不同的处理，用副本操作
szfund4[,27] = as.numeric(as.character(szfund4[,27]))        #处理掉"----",变成NA
szfund4 = szfund4[complete.cases(szfund4[,27]),]            #把NA去掉
szfund4 = arrange(szfund4,desc(as.numeric(szfund4[,27]))) 
szfund4_names= as.character(szfund4[1:n,3])                                      #涨幅最高前n名的股票名称
szfund4_extent = paste(as.character(szfund4[1:n,27]),"%",sep="")                  #前n名的涨幅
szfund4_names
szfund4s = ""
for(i in 1:(n-1)){
  szfund4s = paste(szfund4s,szfund4_names[i],"(",szfund4_extent[i],")、",sep="")
}
szfund4s= paste(szfund4s,szfund4_names[n],"(",szfund4_extent[n],")",sep="")
up6s1 = szfund4s
up6s1


#深证基金
data = file(paste(path,"/深证基金.txt",sep = ""))      #重复定义data是要固定write的结果
content = readLines(data)
write.table(sub("万亿","万亿\t",content[1:length(content)]),paste(path,"/深证基金.txt",sep = ""),quote=F,row.names = F,col.names = F)#万亿后面没有分隔符
data = file(paste(path,"/深证基金.txt",sep = ""))   
content = readLines(data)
write.table(gsub(" ","",content[1:length(content)]),paste(path,"/深证基金.txt",sep = ""),quote=F,row.names = F,col.names = F) #去掉股票名字空格
shenfund =  read.table(paste(path,"/深证基金.txt",sep = ""),header = T)

#涨幅
#涨幅
shenfund1 = shenfund                                           #不同的汇总要做不同的处理，用副本操作
shenfund1[,5] = as.numeric(as.character(shenfund1[,5]))        #处理掉"----",变成NA
shenfund1 = shenfund1[complete.cases(shenfund1[,5]),]            #把NA去掉
shenfund1 = arrange(shenfund1,desc(as.numeric(shenfund1[,5]))) 
shenfund1_names= as.character(shenfund1[1:n,3])                                      #涨幅最高前n名的股票名称
shenfund1_extent = paste(as.character(shenfund1[1:n,5]),"%",sep="")                  #前n名的涨幅
shenfund1_names
shenfunds = ""
for(i in 1:(n-1)){
  shenfunds = paste(shenfunds,shenfund1_names[i],"(",shenfund1_extent[i],")、",sep="")
}
shenfunds= paste(shenfunds,shenfund1_names[n],"(",shenfund1_extent[n],")",sep="")
ups2=shenfunds


#手数
shenfund2 = shenfund                                           #不同的汇总要做不同的处理，用副本操作
ncol(shenfund)
for (i in 1:nrow(shenfund2)){
  shenfund2[i,28]  =  gsub("万","*10000",as.character(shenfund2[i,7]))
  numbers = as.numeric(unlist(strsplit(shenfund2[i,28],split = "*",fixed = T)))      ##不用fixed的话就把3000也拆开成3，0，0，0了
  options(scipen=200)   #200位数字之内不使用科学计数法
  shenfund2[i,28]=prod(numbers)}
shenfund2[,28] = as.numeric(shenfund2[,28])
shenfund2 = shenfund2[complete.cases(shenfund2[,28]),]
shenfund2 = arrange(shenfund2,desc(as.numeric(shenfund2[,28]))) 
shenfund2_names= as.character(shenfund2[1:n,3])                                      #涨幅最高前n名的股票名称
shenfund2_extent = paste(as.character(as.numeric(shenfund2[1:n,28])/10000),"万手",sep="")                  #前n名的涨幅
shenfund2_extent
shenfund2s = ""
for(i in 1:(n-1)){
  shenfund2s = paste(shenfund2s,shenfund2_names[i],"(",shenfund2_extent[i],")、",sep="")
}
shenfund2s= paste(shenfund2s,shenfund2_names[n],"(",shenfund2_extent[n],")",sep="")
deals2=shenfund2s

#3日涨幅
shenfund3 = shenfund                                           #不同的汇总要做不同的处理，用副本操作
shenfund3[,26] = as.numeric(as.character(shenfund3[,26]))        #处理掉"----",变成NA
shenfund3 = shenfund3[complete.cases(shenfund3[,26]),]            #把NA去掉
shenfund3 = arrange(shenfund3,desc(as.numeric(shenfund3[,26]))) 
shenfund3_names= as.character(shenfund3[1:n,3])                                      #涨幅最高前n名的股票名称
shenfund3_extent = paste(as.character(shenfund3[1:n,26]),"%",sep="")                  #前n名的涨幅
shenfund3_names
shenfund3s = ""
for(i in 1:(n-1)){
  shenfund3s = paste(shenfund3s,shenfund3_names[i],"(",shenfund3_extent[i],")、",sep="")
}
shenfund3s= paste(shenfund3s,shenfund3_names[n],"(",shenfund3_extent[n],")",sep="")
up3s2 = shenfund3s

#6日涨幅
shenfund4 = shenfund                                           #不同的汇总要做不同的处理，用副本操作
shenfund4[,27] = as.numeric(as.character(shenfund4[,27]))        #处理掉"----",变成NA
shenfund4 = shenfund4[complete.cases(shenfund4[,27]),]            #把NA去掉
shenfund4 = arrange(shenfund4,desc(as.numeric(shenfund4[,27]))) 
shenfund4_names= as.character(shenfund4[1:n,3])                                      #涨幅最高前n名的股票名称
shenfund4_extent = paste(as.character(shenfund4[1:n,27]),"%",sep="")                  #前n名的涨幅
shenfund4_names
shenfund4s = ""
for(i in 1:(n-1)){
  shenfund4s = paste(shenfund4s,shenfund4_names[i],"(",shenfund4_extent[i],")、",sep="")
}
shenfund4s= paste(shenfund4s,shenfund4_names[n],"(",shenfund4_extent[n],")",sep="")
up6s2 = shenfund4s
up6s2

#ETF
data = file(paste(path,"/ETF.txt",sep = ""))      #重复定义data是要固定write的结果
content = readLines(data)
write.table(sub("万亿","万亿\t",content[1:length(content)]),paste(path,"/ETF.txt",sep = ""),quote=F,row.names = F,col.names = F)#万亿后面没有分隔符
data = file(paste(path,"/ETF.txt",sep = ""))   
content = readLines(data)
write.table(gsub(" ","",content[1:length(content)]),paste(path,"/ETF.txt",sep = ""),quote=F,row.names = F,col.names = F) #去掉股票名字空格
ETF =  read.table(paste(path,"/ETF.txt",sep = ""),header = T)

#涨幅
#涨幅
ETF1 = ETF                                           #不同的汇总要做不同的处理，用副本操作
ETF1[,5] = as.numeric(as.character(ETF1[,5]))        #处理掉"----",变成NA
ETF1 = ETF1[complete.cases(ETF1[,5]),]            #把NA去掉
ETF1 = arrange(ETF1,desc(as.numeric(ETF1[,5]))) 
ETF1_names= as.character(ETF1[1:n,3])                                      #涨幅最高前n名的股票名称
ETF1_extent = paste(as.character(ETF1[1:n,5]),"%",sep="")                  #前n名的涨幅
ETF1_names
ETFs = ""
for(i in 1:(n-1)){
  ETFs = paste(ETFs,ETF1_names[i],"(",ETF1_extent[i],")、",sep="")
}
ETFs= paste(ETFs,ETF1_names[n],"(",ETF1_extent[n],")",sep="")
ups3=ETFs


#手数
ETF2 = ETF                                           #不同的汇总要做不同的处理，用副本操作
ncol(ETF)
for (i in 1:nrow(ETF2)){
  ETF2[i,28]  =  gsub("万","*10000",as.character(ETF2[i,7]))
  numbers = as.numeric(unlist(strsplit(ETF2[i,28],split = "*",fixed = T)))      ##不用fixed的话就把3000也拆开成3，0，0，0了
  options(scipen=200)   #200位数字之内不使用科学计数法
  ETF2[i,28]=prod(numbers)}
ETF2[,28] = as.numeric(ETF2[,28])
ETF2 = ETF2[complete.cases(ETF2[,28]),]
ETF2 = arrange(ETF2,desc(as.numeric(ETF2[,28]))) 
ETF2_names= as.character(ETF2[1:n,3])                                      #涨幅最高前n名的股票名称
ETF2_extent = paste(as.character(as.numeric(ETF2[1:n,28])/10000),"万手",sep="")                  #前n名的涨幅
ETF2_extent
ETF2s = ""
for(i in 1:(n-1)){
  ETF2s = paste(ETF2s,ETF2_names[i],"(",ETF2_extent[i],")、",sep="")
}
ETF2s= paste(ETF2s,ETF2_names[n],"(",ETF2_extent[n],")",sep="")
deals3=ETF2s

#3日涨幅
ETF3 = ETF                                           #不同的汇总要做不同的处理，用副本操作
ETF3[,26] = as.numeric(as.character(ETF3[,26]))        #处理掉"----",变成NA
ETF3 = ETF3[complete.cases(ETF3[,26]),]            #把NA去掉
ETF3 = arrange(ETF3,desc(as.numeric(ETF3[,26]))) 
ETF3_names= as.character(ETF3[1:n,3])                                      #涨幅最高前n名的股票名称
ETF3_extent = paste(as.character(ETF3[1:n,26]),"%",sep="")                  #前n名的涨幅
ETF3_names
ETF3s = ""
for(i in 1:(n-1)){
  ETF3s = paste(ETF3s,ETF3_names[i],"(",ETF3_extent[i],")、",sep="")
}
ETF3s= paste(ETF3s,ETF3_names[n],"(",ETF3_extent[n],")",sep="")
up3s3 = ETF3s

#6日涨幅
ETF4 = ETF                                           #不同的汇总要做不同的处理，用副本操作
ETF4[,27] = as.numeric(as.character(ETF4[,27]))        #处理掉"----",变成NA
ETF4 = ETF4[complete.cases(ETF4[,27]),]            #把NA去掉
ETF4 = arrange(ETF4,desc(as.numeric(ETF4[,27]))) 
ETF4_names= as.character(ETF4[1:n,3])                                      #涨幅最高前n名的股票名称
ETF4_extent = paste(as.character(ETF4[1:n,27]),"%",sep="")                  #前n名的涨幅
ETF4_names
ETF4s = ""
for(i in 1:(n-1)){
  ETF4s = paste(ETF4s,ETF4_names[i],"(",ETF4_extent[i],")、",sep="")
}
ETF4s= paste(ETF4s,ETF4_names[n],"(",ETF4_extent[n],")",sep="")
up6s3 = ETF4s
up6s3

#LOF
data = file(paste(path,"/LOF.txt",sep = ""))      #重复定义data是要固定write的结果
content = readLines(data)
write.table(sub("万亿","万亿\t",content[1:length(content)]),paste(path,"/LOF.txt",sep = ""),quote=F,row.names = F,col.names = F)#万亿后面没有分隔符
data = file(paste(path,"/LOF.txt",sep = ""))   
content = readLines(data)
write.table(gsub(" ","",content[1:length(content)]),paste(path,"/LOF.txt",sep = ""),quote=F,row.names = F,col.names = F) #去掉股票名字空格
LOF =  read.table(paste(path,"/LOF.txt",sep = ""),header = T)

#涨幅
#涨幅
LOF1 = LOF                                           #不同的汇总要做不同的处理，用副本操作
LOF1[,5] = as.numeric(as.character(LOF1[,5]))        #处理掉"----",变成NA
LOF1 = LOF1[complete.cases(LOF1[,5]),]            #把NA去掉
LOF1 = arrange(LOF1,desc(as.numeric(LOF1[,5]))) 
LOF1_names= as.character(LOF1[1:n,3])                                      #涨幅最高前n名的股票名称
LOF1_extent = paste(as.character(LOF1[1:n,5]),"%",sep="")                  #前n名的涨幅
LOF1_names
LOFs = ""
for(i in 1:(n-1)){
  LOFs = paste(LOFs,LOF1_names[i],"(",LOF1_extent[i],")、",sep="")
}
LOFs= paste(LOFs,LOF1_names[n],"(",LOF1_extent[n],")",sep="")
ups4=LOFs


#手数
LOF2 = LOF                                           #不同的汇总要做不同的处理，用副本操作
ncol(LOF)
for (i in 1:nrow(LOF2)){
  LOF2[i,28]  =  gsub("万","*10000",as.character(LOF2[i,7]))
  numbers = as.numeric(unlist(strsplit(LOF2[i,28],split = "*",fixed = T)))      ##不用fixed的话就把3000也拆开成3，0，0，0了
  options(scipen=200)   #200位数字之内不使用科学计数法
  LOF2[i,28]=prod(numbers)}
LOF2[,28] = as.numeric(LOF2[,28])
LOF2 = LOF2[complete.cases(LOF2[,28]),]
LOF2 = arrange(LOF2,desc(as.numeric(LOF2[,28]))) 
LOF2_names= as.character(LOF2[1:n,3])                                      #涨幅最高前n名的股票名称
LOF2_extent = paste(as.character(as.numeric(LOF2[1:n,28])/10000),"万手",sep="")                  #前n名的涨幅
LOF2_extent
LOF2s = ""
for(i in 1:(n-1)){
  LOF2s = paste(LOF2s,LOF2_names[i],"(",LOF2_extent[i],")、",sep="")
}
LOF2s= paste(LOF2s,LOF2_names[n],"(",LOF2_extent[n],")",sep="")
deals4=LOF2s

#3日涨幅
LOF3 = LOF                                           #不同的汇总要做不同的处理，用副本操作
LOF3[,26] = as.numeric(as.character(LOF3[,26]))        #处理掉"----",变成NA
LOF3 = LOF3[complete.cases(LOF3[,26]),]            #把NA去掉
LOF3 = arrange(LOF3,desc(as.numeric(LOF3[,26]))) 
LOF3_names= as.character(LOF3[1:n,3])                                      #涨幅最高前n名的股票名称
LOF3_extent = paste(as.character(LOF3[1:n,26]),"%",sep="")                  #前n名的涨幅
LOF3_names
LOF3s = ""
for(i in 1:(n-1)){
  LOF3s = paste(LOF3s,LOF3_names[i],"(",LOF3_extent[i],")、",sep="")
}
LOF3s= paste(LOF3s,LOF3_names[n],"(",LOF3_extent[n],")",sep="")
up3s4 = LOF3s

#6日涨幅
LOF4 = LOF                                           #不同的汇总要做不同的处理，用副本操作
LOF4[,27] = as.numeric(as.character(LOF4[,27]))        #处理掉"----",变成NA
LOF4 = LOF4[complete.cases(LOF4[,27]),]            #把NA去掉
LOF4 = arrange(LOF4,desc(as.numeric(LOF4[,27]))) 
LOF4_names= as.character(LOF4[1:n,3])                                      #涨幅最高前n名的股票名称
LOF4_extent = paste(as.character(LOF4[1:n,27]),"%",sep="")                  #前n名的涨幅
LOF4_names
LOF4s = ""
for(i in 1:(n-1)){
  LOF4s = paste(LOF4s,LOF4_names[i],"(",LOF4_extent[i],")、",sep="")
}
LOF4s= paste(LOF4s,LOF4_names[n],"(",LOF4_extent[n],")",sep="")
up6s4 = LOF4s
up6s4

write.table(paste("    
                  基金方面，当日",
                  "上证基金","涨幅最高的基金是",ups1,
                  "；成交量最高的",n,"只基金是",deals1,
                  "；过去3个交易日内，涨幅最高的基金为",up3s1,
                  "；6个交易日内，涨幅最高的基金为",up6s1, sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    深证基金","涨幅最高的基金是",ups2,
                  "；成交量最高的",n,"只基金是",deals2,
                  "；过去3个交易日内，涨幅最高的基金为",up3s2,
                  "；6个交易日内，涨幅最高的基金为",up6s2,  sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    ETF","涨幅最高的基金是",ups3,
                  "；成交量最高的",n,"只基金是",deals3,
                  "；过去3个交易日内，涨幅最高的基金为",up3s3,
                  "；6个交易日内，涨幅最高的基金为",up6s3, sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)

write.table(paste("    LOF","涨幅最高的基金是",ups4,
                  "；成交量最高的",n,"只基金是",deals4,
                  "；过去3个交易日内，涨幅最高的基金为",up3s4,
                  "；6个交易日内，涨幅最高的基金为",up6s4, sep=""),paste(path,"/大盘信息抓取",".txt",sep=""),quote=F,row.names = F,col.names = F,append = T)



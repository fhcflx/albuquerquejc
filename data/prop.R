hemangioma=read.csv2("/Users/Helder/SkyDrive/Trabalhos/Production/propranolol/est/Hemangioma2012.csv")
attach(hemangioma)
hemangioma$nasc=as.Date(strptime(hemangioma$Nasc,"%Y-%m-%d"))
hemangioma$adm=as.Date(strptime(hemangioma$Adm,"%Y-%m-%d"))
hemangioma$ini1=as.Date(strptime(hemangioma$Initrat1,"%Y-%m-%d"))
hemangioma$ini2=as.Date(strptime(hemangioma$Initrat2,"%Y-%m-%d"))
hemangioma$ini3=as.Date(strptime(hemangioma$Initrat3,"%Y-%m-%d"))
hemangioma$ini4=as.Date(strptime(hemangioma$Initrat4,"%Y-%m-%d"))
hemangioma$ult=as.Date(strptime(hemangioma$ULTDAT,"%Y-%m-%d"))
hemangioma$age=as.numeric(round((hemangioma$adm-hemangioma$nasc)/(365.25),digits=1))
hemangioma$follow=as.numeric(round(12*(hemangioma$ult-hemangioma$adm)/(365.25),digits=1))
hemangioma$prop=as.factor(ifelse(hemangioma$Trat1=="PROP"|hemangioma$Trat1=="PPROP","Y",ifelse(hemangioma$Trat2=="PROP"|hemangioma$Trat2=="PPROP","Y",ifelse(hemangioma$Trat3=="PROP"|hemangioma$Trat3=="PPROP","Y",ifelse(hemangioma$Trat4=="PROP"|hemangioma$Trat4=="PPROP","Y","N")))))
hemangioma$des=as.factor(ifelse((Trat1=="PROP"|Trat1=="PPROP")&DES1=="RC","RC",ifelse((Trat1=="PROP"|Trat1=="PPROP")&DES1=="RP","RP",ifelse((Trat1=="PROP"|Trat1=="PPROP")&DES1=="DE","DE",ifelse((Trat1=="PROP"|Trat1=="PPROP")&DES1=="DP","DP",ifelse((Trat2=="PROP"|Trat2=="PPROP")&DES2=="RC","RC",ifelse((Trat2=="PROP"|Trat2=="PPROP")&(DES2=="RP"|DES2=="RM"),"RP",ifelse((Trat2=="PROP"|Trat2=="PPROP")&DES2=="DE","DE",ifelse((Trat3=="PROP"|Trat3=="PPROP")&DES3=="RC","RC",ifelse((Trat3=="PROP"|Trat3=="PPROP")&DES3=="RP","RP",ifelse((Trat3=="PROP"|Trat1=="PPROP")&DES3=="RC","RC",NA)))))))))))
des.prop=summary(subset(hemangioma$des,hemangioma$prop=="Y"))
des.prop1=summary(subset(hemangioma$des,hemangioma$prop=="Y"&hemangioma$age<=1))
des.prop2=summary(subset(hemangioma$des,hemangioma$prop=="Y"&hemangioma$age>1))
des.prop3=summary(subset(hemangioma$des,hemangioma$prop=="Y"&hemangioma$Diag=="HI"))
des.prop4=summary(subset(hemangioma$des,hemangioma$prop=="Y"&hemangioma$Diag!="HI"))
des.prop5=summary(subset(hemangioma$des,hemangioma$prop=="Y"&hemangioma$Diag=="HI"&hemangioma$age<=1))
chisq1=chisq.test(matrix(c(des.prop1,des.prop2),ncol=2)[1:3,])
chisq2=chisq.test(matrix(c(des.prop3,des.prop4),ncol=2)[1:3,])
chisq3=chisq.test(matrix(c(des.prop1,des.prop5),ncol=2)[1:3,])
chisq4=chisq.test(matrix(c(des.prop1,des.prop2),ncol=2)[2:3,])
chisq5=chisq.test(matrix(c(des.prop3,des.prop4),ncol=2)[2:3,])
detach(hemangioma)
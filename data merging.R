# Kaggle_Coupon_Prediction_Challenge
Kaggle Coupon prediction challenge codes.
ulist<-read.csv("user_list.csv")
str(ulist)
cpv<-read.csv("coupon_visit_train.csv")
str(cpv)
table(cpv$PURCHASE_FLG)
library(dplyr)
ucv<-left_join(ulist,cpv,by.x=ulist$USER_ID_hash,by.y=cpv$USER_ID_hash)
str(ucv)
cplist<-read.csv("coupon_list_train_en.csv",stringsAsFactors=FALSE)
str(cplist)
ucv$COUPON_ID_hash <- ucv$VIEW_COUPON_ID_hash
usercplist<-left_join(ucv,cplist,by.x=ucv$COUPON_ID_hash,by.y=COUPON_ID_hash)

cpdetail<-read.csv("coupon_detail_train.csv")
str(cpdetail)

cparea<-read.csv("coupon_area_train_en.csv")
str(cparea)

viewlog<-read.csv("coupon_visit_train.csv")
str(viewlog)

usr_vw_log<-left_join(viewlog,ulist,by.x=ulist$USER_ID_hash,by.y=viewlog$USER_ID_hash)
head(usr_vw_log)
str(usr_vw_log)
usr_vw_log$COUPON_ID_hash=usr_vw_log$VIEW_COUPON_ID_hash
usr_vw_cp<-left_join(usr_vw_log,cplist,by.x=usr_vw_log$VIEW_COUPON_ID_hash,by.y=cplist$COUPON_ID_hash)
str(usr_vw_cp)

inp_temp<-select(usr_vw_cp,-c(I_DATE,REFERRER_hash,VIEW_COUPON_ID_hash,USER_ID_hash,SESSION_ID_hash,PURCHASEID_hash,
                         REG_DATE ,WITHDRAW_DATE,PREF_NAME,COUPON_ID_hash,DISPFROM,DISPEND))
str(inp_temp)
summary(inp_temp)

inp<-select(inp_temp,-c(5:25,PAGE_SERIAL))
str(inp)

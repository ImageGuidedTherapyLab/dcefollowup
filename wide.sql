.mode csv
.import datalocation/DCE_WIDE.csv imaging
.headers on

create table longformat  as 
select im.DCE1StudyUID as StudyUID, im.DCE1UID SeriesUID, im.AUC1 as AUC from imaging im where im.DCE1UID != '' union
select im.DCE2StudyUID, im.DCE2UID, im.AUC2 from imaging im where im.DCE2UID != '' union
select im.DCE3StudyUID, im.DCE3UID, im.AUC3 from imaging im where im.DCE3UID != '' union
select im.DCE4StudyUID, im.DCE4UID, im.AUC4 from imaging im where im.DCE4UID != '' union
select im.DCE5StudyUID, im.DCE5UID, im.AUC5 from imaging im where im.DCE5UID != '' union
select im.DCE6StudyUID, im.DCE6UID, im.AUC6 from imaging im where im.DCE6UID != '' ;
-- sqlite3   -init wide.sql 
-- cat wide.sql  | sqlite3
-- .quit

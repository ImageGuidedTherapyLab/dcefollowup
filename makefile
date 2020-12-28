SHELL := /bin/bash
MRNLIST       = $(shell sed 1d datalocation/DCE_LONG.csv | cut -d, -f1 )
STUDYUIDLIST  = $(shell sed 1d datalocation/DCE_LONG.csv | cut -d, -f2 )
SERIESUIDLIST = $(shell sed 1d datalocation/DCE_LONG.csv | cut -d, -f3 )
DICOMDIR = /mnt/FUS4/IPVL_research
# keep tmp files
.SECONDARY: 

COUNT := $(words $(MRNLIST))
#SEQUENCE = $(shell seq $(COUNT))
# dbg with 5
SEQUENCE = $(shell seq 5)
slicerimport: $(addprefix Processed/,$(addsuffix /storescu,$(SEQUENCE)))
Processed/%/storescu:
	storescu -aec storescp localhost 11112 $(DICOMDIR)/$(word $(shell expr $* + 0 ), $(MRNLIST))/*/$(word $(shell expr $* + 0 ), $(STUDYUIDLIST))/$(word $(shell expr $* + 0 ), $(SERIESUIDLIST))/* 

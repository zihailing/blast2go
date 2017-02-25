#!/bin/bash
####################################################################
#
#A (quite) simple submit script for a one or tow processor job
#
####################################################################
#
# SGE options
#
#Change to the current working directory upon starting of the job
#$ -cwd
#
# Specify the kind of shell script you use, for example, bash
#$ -S /bin/bash
#
# join the error and standard output streams
#$ -j y
#
#
# don't flood myself with e-mail
#$ -m e
#
# this is my e-mail address
##$ -M zihailing@live.cn
#
#where the format error go
#$ -e /home/hlzi/infor
#where the format output go
#$ -o /home/hlzi/infor
# notify me about pending SIG_STOP and SIG_KILL
#$ -notify
#
# Specify the array start ,end , step
#$ -t 1-119:1
# end of SGE stuff
#########################################################
# now execute my job:
ARRAY=(head `ls /home/hlzi/project/bulkwheat_blast2go_20170225/splited_pep/*.fa`)
# end of job script
DIR=/home/hlzi/personaldata/bulkwheat_blast2go_20170225/splited_pep
/share/apps/prog/blast-2.2.26/bin/blastall -p blastp -e 1e-5 -m 7  -i ${ARRAY[$SGE_TASK_ID]} -d /oldgroupshare/bioinformatics/zhaocheng/NR_NT/nr -o ${ARRAY[$SGE_TASK_ID]}.xml
# end of job script

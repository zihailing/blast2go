#!/bin/sh
export PATH=/psc/program/install/jdk1.7.0_45/bin:$PATH
export JAVA_HOME=/psc/program/install/jdk1.7.0_45
cd /psc/home/zihailing/zihailing/blast2go_buckwheat
for i in splited_pep/*.xml
do
/psc/program/install/blast2go_cli_v1.0.2/blast2go_cli.run -properties cli.prop -useobo go.obo -loadfasta Fta_with_at_annotion.pep -protein -loadblast $i -mapping -annotation -annex -gograph mf,bp,cc -statistics gdatadis,agodiscc -savedat ${i}.dat -saveannot ${i}.annot -tempfolder TMP
done

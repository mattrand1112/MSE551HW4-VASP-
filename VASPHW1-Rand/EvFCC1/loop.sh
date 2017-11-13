#! /bin/bash
rm WAVECAR
for i in  3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 ; do
cat >POSCAR <<!
fcc:
   $i
    0.4957871571304797    0.4957871571304797    0.0000000000000000
     0.0000000000000000    0.4957871571304797    0.4957871571304797
     0.4957871571304797   -0.0000000000000000    0.4957871571304797
   1
cartesian
0 0 0
!

qsub vasp.job

echo "a= $i" ; $BIN
E=`tail -1 OSZICAR` ; echo $i $E  >>SUMMARY.fcc
done
cat SUMMARY.fcc


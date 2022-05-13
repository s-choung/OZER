#!/bin/bash

# 0 folder needed which have 1~n folders with different dopants

# usage
mkdir 1_OH 2_O 3_OOH 4_O2 5_OH+O2 6_O2+O
declare -a arr
arr=("V" "V" "Nb" "Ta" "Bi" "Bi") # add dopants here
##################################################### loop for OH
i=1
cd 1_OH
for l in ${arr[@]}; do
 mkdir ./$i
 cd ./$i
 cp ../../0/"$i"/CONTCAR POSCAR
 cp ../../0/"$i"/INCAR INCAR
 cp ../../0/"$i"/KPOINTS KPOINTS
 cp ../../0/"$i"/run_slurm.sh run_slurm.sh
 cp ../../0/"$i"/POTCAR pot
 sed -i '2s/.*/#SBATCH --nodes=1/g' run_slurm.sh
 sed -i "3s/.*/#SBATCH --ntasks-per-node=32/g" run_slurm.sh
 sed -i "4s/.*/#SBATCH --partition=g5/g" run_slurm.sh
 sed -i "6s/.*/   Sn   O    $l   O H/g" POSCAR
 sed -i "7s/.*/   15 32 1 1 1/g" POSCAR
 sed -i "58s/.*/  0.5019961760616789  0.5213411324476454  0.4985816347532996   T   T   T/g" POSCAR
 sed -i "59s/.*/  0.5072876125978886  0.6613053514837918  0.5068171580081129   T   T   T/g" POSCAR
 sed -i "60s/.*//g" POSCAR
 cat pot ~/potcars/O/POTCAR ~/potcars/H/POTCAR > POTCAR
 ((i=i+1))
 cd ../
done
cd ../
##################################################### loop for O
i=1
cd 2_O
for l in ${arr[@]}; do
 mkdir ./$i
 cd ./$i
 cp ../../0/"$i"/CONTCAR POSCAR
 cp ../../0/"$i"/INCAR INCAR
 cp ../../0/"$i"/KPOINTS KPOINTS
 cp ../../0/"$i"/run_slurm.sh run_slurm.sh
 cp ../../0/"$i"/POTCAR pot
 sed -i '2s/.*/#SBATCH --nodes=1/g' run_slurm.sh
 sed -i "3s/.*/#SBATCH --ntasks-per-node=32/g" run_slurm.sh
 sed -i "4s/.*/#SBATCH --partition=g5/g" run_slurm.sh
 sed -i "6s/.*/   Sn   O    $l  O /g" POSCAR
 sed -i "7s/.*/   15 32 1 1/g" POSCAR
 sed -i "58s/.*/    0.5090507226050356  0.5026342580089005  0.4976112257193870   T   T   T/g" POSCAR
 sed -i "59s/.*//g" POSCAR
 cat pot ~/potcars/O/POTCAR  > POTCAR
 ((i=i+1))
 cd ../
done
cd ../
##################################################### loop for OOH

i=1
cd 3_OOH
for l in ${arr[@]}; do
 mkdir ./$i
 cd ./$i
 cp ../../0/"$i"/CONTCAR POSCAR
 cp ../../0/"$i"/INCAR INCAR
 cp ../../0/"$i"/KPOINTS KPOINTS
 cp ../../0/"$i"/run_slurm.sh run_slurm.sh
 cp ../../0/"$i"/POTCAR pot
 sed -i '2s/.*/#SBATCH --nodes=1/g' run_slurm.sh
 sed -i "3s/.*/#SBATCH --ntasks-per-node=32/g" run_slurm.sh
 sed -i "4s/.*/#SBATCH --partition=g5/g" run_slurm.sh
 sed -i "6s/.*/   Sn   O    $l  O H/g" POSCAR
 sed -i "7s/.*/   15 32 1 2 1/g" POSCAR
 sed -i "58s/.*/ -0.1047763832358391  0.4943731364002451  0.4951327030188530   T   T   T/g" POSCAR
 sed -i "59s/.*/  0.6684262460297178  0.4674855913524610  0.4963714498153630   T   T   T/g" POSCAR
 sed -i "60s/.*/  0.6574449716961944  0.3258358635056821  0.5035108000495532   T   T   T/g" POSCAR
 sed -i "61s/.*//g" POSCAR
 cat pot ~/potcars/O/POTCAR ~/potcars/H/POTCAR > POTCAR
 ((i=i+1))
 cd ../
done
cd ../

##################################################### loop for O2

i=1
cd 4_O2
for l in ${arr[@]}; do
 mkdir ./$i
 cd ./$i
 cp ../../0/"$i"/CONTCAR POSCAR
 cp ../../0/"$i"/INCAR INCAR
 cp ../../0/"$i"/KPOINTS KPOINTS
 cp ../../0/"$i"/run_slurm.sh run_slurm.sh
 cp ../../0/"$i"/POTCAR pot
 sed -i '2s/.*/#SBATCH --nodes=1/g' run_slurm.sh
 sed -i "3s/.*/#SBATCH --ntasks-per-node=32/g" run_slurm.sh
 sed -i "4s/.*/#SBATCH --partition=g5/g" run_slurm.sh
 sed -i "6s/.*/   Sn   O    $l   O /g" POSCAR
 sed -i "7s/.*/   15 32 1 2/g" POSCAR
 sed -i "58s/.*/ -0.0008316008001055  0.5000001634114883  0.5030679219373225   T   T   T/g" POSCAR
 sed -i "59s/.*/  0.8212904154103638  0.5000003701243670  0.5232727770357383   T   T   T/g" POSCAR
 sed -i "60s/.*//g" POSCAR
 cat pot ~/potcars/O/POTCAR > POTCAR
 ((i=i+1))
 cd ../
done
cd ../
##################################################### loop for O2+OH

i=1
cd 5_OH+O2
for l in ${arr[@]}; do
 mkdir ./$i
 cd ./$i
 cp ../../0/"$i"/CONTCAR POSCAR
 cp ../../0/"$i"/INCAR INCAR
 cp ../../0/"$i"/KPOINTS KPOINTS
 cp ../../0/"$i"/run_slurm.sh run_slurm.sh
 cp ../../0/"$i"/POTCAR pot
 sed -i '2s/.*/#SBATCH --nodes=1/g' run_slurm.sh
 sed -i "3s/.*/#SBATCH --ntasks-per-node=32/g" run_slurm.sh
 sed -i "4s/.*/#SBATCH --partition=g5/g" run_slurm.sh
 sed -i "6s/.*/   Sn   O    $l  O H/g" POSCAR
 sed -i "7s/.*/   15 32 1  3 1/g" POSCAR
 sed -i "58s/.*/  0.8649958155547766  0.4390891306664355  0.5299325429517745   T   T   T/g" POSCAR
 sed -i "59s/.*/  0.0022833555483377  0.5217632282400019  0.5056397622673861   T   T   T/g" POSCAR
 sed -i "60s/.*/  0.5034199895925668  0.4839411065152998  0.4964238816241604   T   T   T/g" POSCAR
 sed -i "61s/.*/  0.4963765360982613  0.3443802786149684  0.5047888487514978   T   T   T/g" POSCAR
 sed -i "62s/.*//g" POSCAR
 cat pot ~/potcars/O/POTCAR ~/potcars/H/POTCAR > POTCAR
 ((i=i+1))
 cd ../
done
cd ../

##################################################### loop for O2+O

i=1
cd 6_O2+O
for l in ${arr[@]}; do
 mkdir ./$i
 cd ./$i
 cp ../../0/"$i"/CONTCAR POSCAR
 cp ../../0/"$i"/INCAR INCAR
 cp ../../0/"$i"/KPOINTS KPOINTS
 cp ../../0/"$i"/run_slurm.sh run_slurm.sh
 cp ../../0/"$i"/POTCAR pot
 sed -i '2s/.*/#SBATCH --nodes=1/g' run_slurm.sh
 sed -i "3s/.*/#SBATCH --ntasks-per-node=32/g" run_slurm.sh
 sed -i "4s/.*/#SBATCH --partition=g5/g" run_slurm.sh
 sed -i "6s/.*/   Sn   O    $l O /g" POSCAR
 sed -i "7s/.*/   15 32 1  3/g" POSCAR
 sed -i "58s/.*/  0.4871188899945731  0.5238957857861952  0.4973324281664961   T   T   T/g" POSCAR
 sed -i "59s/.*/  0.0210859920688110  0.5159480119786209  0.5127770620200286   T   T   T/g" POSCAR
 sed -i "60s/.*/  0.8784655087845870  0.5280986386879493  0.5425225277896061   T   T   T/g" POSCAR
 sed -i "61s/.*//g" POSCAR
 cat pot ~/potcars/O/POTCAR > POTCAR
 ((i=i+1))
 cd ../
done


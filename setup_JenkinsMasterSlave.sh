#!/bin/bash
#set -x
function usage
{
    echo -e "Usage:\n\t-m, --master\t\t set master (either hostname or ip)\n\t-s, --slave\t\t set slave (either hostname or ip)\n\t-h, --help\t\t print this help message"
}

if [ "$1" == "" ]; then
    usage
    exit 1
fi


master=
slave=


while [ "$1" != "" ]; do
    case $1 in
        -m | --master )         shift
                                master=$1
                                ;;
        -s | --slave )          shift
				slave=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

TMP_DIR=/tmp
rm -rf DemandCubePlaybooks
git clone https://jeroldleslie@github.com/jeroldleslie/DemandCubePlaybooks.git 
cd DemandCubePlaybooks
git clone https://github.com/DemandCube/ansible-flow.git
mv -f  ./ansible-flow/library/ ./library
rm -rf ./ansible-flow
cd ../
slave=$(echo $slave | sed 's/,/??/g')
sed -e "s/MASTER/$master/;s/SLAVE1/$slave/" jenkins_global_vars.yml > $TMP_DIR/tmp1.yml
sed 's/??/\
/g' $TMP_DIR/tmp1.yml > $TMP_DIR/tmp2.yml

mv jenkins_playbook.yml ./DemandCubePlaybooks/jenkins_playbook.yml
cd DemandCubePlaybooks
ansible-playbook jenkins_playbook.yml -i $TMP_DIR/tmp2.yml
rm -rf $TMP_DIR




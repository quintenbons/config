# ENSIMAG
alias runqemu="qemu-system-riscv32 -machine cep -bios none -nographic -kernel"
alias runqemugraphic="qemu-system-riscv32 -serial mon:stdio -machine cep -bios none -display default,show-cursor=on -kernel"
alias debugqemu='riscv32-unknown-elf-gdb'

source /bigsoft/Xilinx/Vivado/2019.1/settings64.sh

function ceprun {
    echo "Debut du test $1"
    echo "_______________________________________________"

    runqemu $1 < test/$1.entree | tee test/$1.sortie

    echo "_______________________________________________"
    echo "La sortie a ete sauvegardee dans test/$1.sortie"
}

function cepruntimeout {
    echo "Debut du test $1"
    echo "_______________________________________________"

    timeout 10 qemu-system-riscv32 -machine cep -bios none -nographic -kernel $1 | tee test/$1.sortie

    echo "_______________________________________________"
    echo "La sortie a ete sauvegardee dans test/$1.sortie"
}

function brocomatise {
    a=${1#*_}
    ceprun $a
}

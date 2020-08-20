#!/bin/bash
#Sorveteria

contador=1

function erro() {
	echo "Infelizmente não temos esta opção"
	sleep 3
}

function defineSabor() {
	case $sabor in
		1) novoSabor="chocolate" ;;
		2) novoSabor="morango" ;;
		3) novoSabor="baunilha" ;;
		4) novoSabor="flocos" ;;
	esac

	if [ $contador = 1 ]; then
		sabor1=$novoSabor
	else
		if [ $sabor1 = $novoSabor ]; then
			sabor2="";
		else
			sabor2="e $novoSabor"
		fi
	fi
}

function primeiro() {
	clear
	echo
	echo "Zeca Sorvetes"
	echo "Boa tarde, o que gostaria?"
	echo "[1] Casquinha (1 bola)"
	echo "[2] Cascão (2 bolas)"
	echo -n "Eu gostaria da opção "
	read opcao

	if [ $opcao = "1" ]; then
		casquinha
	elif [ $opcao = "2" ]; then
		cascao
	else
		erro
		primeiro
	fi
}

function casquinha() {
	clear
	echo "Casquinha selecionada!"
	echo "Qual sabor você deseja?"
	echo "[1] Chocolate"
	echo "[2] Morango"
	echo "[3] Baunilha"	
	echo "[4] Flocos"
	echo -n "Eu gostaria da opção "
	read sabor

	case $sabor in
		1) clear ; echo "Aqui está a sua casquinha de chocolate, volte sempre! :)" ; exit ;;
		2) clear ; echo "Aqui está a sua casquinha de morango, volte sempre! :)" ; exit ;;
		3) clear ; echo "Aqui está a sua casquinha de baunilha, volte sempre! :)" ; exit ;;
		4) clear ; echo "Aqui está a sua casquinha de flocos, volte sempre! :)" ; exit ;;
		*) echo "Infelizmente não possuímos esse sabor" ; sleep 3 ; casquinha ;;
	esac
}

function cascao() {
	clear
	echo "Cascão selecionado!"
	if [ $sabor1 ]; then
		echo "Seu primeiro sabor é $sabor1"
	fi
	echo "Qual é o $contador° sabor?"
	echo "[1] Chocolate"
	echo "[2] Morango"
	echo "[3] Baunilha"	
	echo "[4] Flocos"
	echo -n "Eu gostaria da opção "
	read sabor

	key=0
	for i in $(seq 4); do
		if [ $sabor = $i ]; then
			key=1
		fi
	done

	if [ $key = 1 ]; then
		defineSabor contador sabor 
	fi

	if [ $contador = 1 ] && [ $key = 1 ]; then
		let contador++
		cascao
	else
		case $sabor in
			1) clear ; echo "Aqui está o seu cascão de $sabor1$sabor2, volte sempre! :)" ; exit ;;
			2) clear ; echo "Aqui está a sua casquinha de $sabor1$sabor2, volte sempre! :)" ; exit ;;
			3) clear ; echo "Aqui está a sua casquinha de $sabor1$sabor2, volte sempre! :)" ; exit ;;
			4) clear ; echo "Aqui está a sua casquinha de $sabor1$sabor2, volte sempre! :)" ; exit ;;
			*) echo "Infelizmente não possuímos esse sabor" ; sleep 3 ; cascao ;;
		esac
	fi
}

primeiro
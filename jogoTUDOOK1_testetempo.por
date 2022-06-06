programa
{
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Tipos --> tp
	inclua biblioteca Texto --> txt
	inclua biblioteca Util --> ut 

	cadeia escolhaUsuario, palavras[100], dicas[100][10], linha, palavra, dica_sorteia, sorteiaD[10], dicas_organiza[10]
	inteiro ContPalavra=0, ContDicas=0, ContIndiceP=0
	inteiro DicasUsadas[10]
	inteiro DicasDadas=0, tempo
	cadeia resposta_jogo="NÃ£o"
	
	funcao inicio()
	{
		inicia_ambiente()
		ler_palavras()
		
			faca
			{
				sorteia_palavra()
				iniciar_jogo() 
			}enquanto(txt.caixa_baixa(resposta_jogo) == "sim")
	}


	//------- funÃ§Ãµes utilizadas------------------


	funcao inicia_ambiente()
	{
		escreva("Andrey Milano   RA:")
		escreva("\nLucas Santos Marques   RA:")
		escreva("\nThais Petrocino Benatti   RA:")

		escreva("\n\nPartes Desenvolvidas:")
		escreva("\nJOGO [X]\nDICAS [X]\nCONTROLE DE TEMPO [ ] ")
	}

	funcao ler_palavras()
	{
		inteiro refArq
		inteiro indiceLinha = 0, indicePalavra = -1, indiceDica = 0, aleatorio = 0 , indice = 0
		
		refArq = arq.abrir_arquivo("jogo.txt", arq.MODO_LEITURA) // inicia o arquivo e informa em qual modo ele ira ser aberto existe 3 leitura escrita e acrescentar 
		
		enquanto (nao arq.fim_arquivo(refArq))
		{ // aqui basicamente esta informando que o laco vai funfa ate chegar na ultima linha do arquivo
			linha = arq.ler_linha(refArq) // aqui o programa esta lendo a linha e armazenando ela dentro de uma variavel no caso a "linha"
				
				se(txt.numero_caracteres(linha) > 2)
				{
					se(txt.extrair_subtexto(linha, 0, 1) == "P") 
					{ // aqui o programa usa uma funcao da bibli texto para pegar a parte inicial da linha como todo arquivo tem que ter p: e d: pra vc separar as dicas das palavras e so usar o p e d como referencia
						indicePalavra++
						palavras[indicePalavra] = txt.extrair_subtexto(linha, 2, txt.numero_caracteres(linha)-1) // aqui ele extrai do valor da linha o P: cada caracter tem o valor de 1 ponto ou seja se vc nao que armazenar o p e o : vc tem que comeÃ§ar a pegar o texto apartir do valor 2 . a segunda parte da sentenÃ§a e a seguinte o programa vai pegar o numero total de caracteres da linha para usar como parametro ou seja em rezumo ele vai pegar do 2 (logo dps do P e do : ) ate o final da linha 
						palavras[indicePalavra] = txt.substituir(palavras[indicePalavra], " ", "") //aqui esta removendo os espaÃ§os em branco no fim da linha
						indiceDica = 0	// aqui o programa indica que o valor do indice de dicas Ã© igual a 0 para ser usado futuramente. (tipo toda vez que vc roda o programa ele vai armazenar a palavra dps as 10 dicas porem se vc nao zera o indice que marca qual e o valor da dica ele basicamente vai ficar crashar pq vai chegar uma hora que vai ter um valor gigante no indice mas na matriz o mesmo valor nao existe sacas?)
						ContPalavra++
				    
					}	
					senao 
					{// se nao for uma palavra logo so pode ser uma dica entao daqui pra baixo o programa faz a mesma coisa que la em cima porem com as dicas 
						dicas[indicePalavra][indiceDica] = txt.extrair_subtexto(linha, 2, txt.numero_caracteres(linha)-1)
						indiceDica++
					}
						
					indice++
				}
		}
		
		arq.fechar_arquivo(refArq)
		retorne
	} 

	
	funcao sorteia_palavra()
	{
	
	    ContIndiceP = ut.sorteia(0, ContPalavra)
	    palavra = palavras[ContIndiceP]
	    
	    		para(inteiro cont=0; cont<10; cont++)
	    		{
	    			sorteiaD[cont]= dicas[ContIndiceP][cont]
	    		}
	    		
	    retorne
	}
	
	
	funcao sorteia_dica()
	{	
		DicasDadas++
		inteiro numeroElementos = 0

			enquanto(sorteiaD[numeroElementos]!="")
			{
				numeroElementos++
			}

			se(DicasDadas > numeroElementos) 
			{	
				retorne
			}
		
		inteiro DicasSorteada = ut.sorteia(1, numeroElementos)
		inteiro DicaUsada = 0
		
	    		para(inteiro cont=0; cont<10; cont++)
	   	 	{		
	        		se(DicasSorteada == DicasUsadas[cont])
	        		{
	        			DicaUsada = 1 
	        		}
	    		}
	    
	    
			se(DicaUsada == 0)
			{
				DicasUsadas[DicasDadas-1] = DicasSorteada
				dica_sorteia = sorteiaD[DicasSorteada-1]
			}
			senao
			{
				DicasDadas--
				sorteia_dica() //Vai sortear uma dica e validar se jÃ¡ foi usada, chama a propria funÃ§Ã£o novamente atÃ© sortear uma dica que nÃ£o foi usada		
			}
	    
	    retorne
	}


	funcao iniciar_jogo()
	{
		inteiro Q_perder,Q_ganhar //decide se ganha ou perde
		inteiro valeL1,valeL2,valeL3,valeL4,valeL5,valeL6,valeL7,valeL8 // vai permitir q se repetir a letra certa n der + pontos
		cadeia L1,L2,L3,L4,L5,L6,L7,L8,L9,L10 //variaveis de cada letra (quando entrar as palavras do txt nao sera mais preciso)
		cadeia Letra = " " // decide qual letra vai ganhar valor de caractere no ESCOLHA
		cadeia B1,B2,B3,B4,B5,B6,B7 //partes do boneco
		//starta o contador
		ut.tempo_decorrido()

		//pega o valor do tempo atual
		tempo = ut.tempo_decorrido()
		
		L1 = " _"
		L2 = " _"
		L3 = " _"
		L4 = " _"
		L5 = " _"
		L6 = " _"
		L7 = " _"
		L8 = " _"
		L9 = " _"
		L10 = " _"
		B1 =  "       |           O"
		B2 = "       |    "
		B3 = "       |    "
		B4 = "       |    "
		B5 = "       |    "
		B6 = "       |    "
		B7 = "       |    "
		Q_ganhar = 0
		Q_perder = 0
		valeL1 = 0
		valeL2 = 0
		valeL3 = 0
		valeL4 = 0
		valeL5 = 0
		valeL6 = 0
		valeL7 = 0
		valeL8 = 0


		
		se(ut.tempo_decorrido() - tempo < 4000) // essa coisinha aq n funciona
		{

			enquanto(Q_perder < 7 e Q_ganhar < txt.numero_caracteres(palavra))
		{
			Q_perder--
			Letra = "DICA"
		     	enquanto(Letra == "DICA" e Q_perder < 6) 
		     	{
		     		Q_perder++
		 		   	escolha(Q_perder)
		   			{
					     caso 1:
					       B1 = "       |         (-.-)"
					       pare
					       
					     caso 2:
					       B2 = "       |      \\  _||_   /"
					       pare
					       
					     caso 3:
					       B3 = "       |       \\|     |/"
					       pare
					       
					     caso 4:
					       B4 = "       |        |_____|"
					       pare
					       
					     caso 5:
					       B5 = "       |         ||  ||"
					       pare
					       
					     caso 6:
					       B6 = "       |        _|| _||"
					       pare
					       
					     caso 7:
					       B7 = "       |       |__||__|"
					       pare
					}
					
		     		sorteia_dica()
		     		limpa()
		     		
				     escreva("******* JOGO DA FORCA *********")
				   	escreva("\n\n")
				   	escreva("\n         /---------|")
				   	escreva("\n        /          |")
				   	escreva("\n       |           |")
				   	escreva("\n       |           |")
				   	escreva("\n",B1)
				   	escreva("\n",B2)
				   	escreva("\n",B3)
				   	escreva("\n",B4)
				   	escreva("\n",B5)
				   	escreva("\n",B6)
				   	escreva("\n",B7)
				   	escreva("\n       |               ")
				   	escreva("\n       |               ")
				   	escreva("\n=======|======= ")
				   	escreva("\n")
				   	escreva("\n")
				   	escreva(L1,L2,L3,L4,L5,L6,L7,L8,L9,L10)
				   	escreva("\n\nDica: ",dica_sorteia)  
				   	escreva("\n\nVocÃª acertou: ",Q_ganhar,"\nVocÃª errou: ",Q_perder)
				   	escreva("\n------------------------------------")
				   	escreva("-"+palavra+"-","\n")
				   	escreva("\n\nDigite uma letra ou a palavra DICA para receber uma: ")
				     leia(Letra)

							
				}
		     
		     inteiro acerto = 0 //Indica se houve acerto de letra e a posicao durante a iteracao
		     
			para (inteiro iteracao=0 ; iteracao<txt.numero_caracteres(palavra) ; iteracao++ )
			{
				cadeia letraDaIteracao = "" + txt.obter_caracter(txt.caixa_baixa(palavra), iteracao)
				
				se (letraDaIteracao == Letra)
				{
					acerto = iteracao++
					escolha(acerto)
					{
		     			caso 1:
		       				Q_ganhar = Q_ganhar + 1
		       				L1 = ""+Letra+""
		       				valeL1 = valeL1 + 1
		       				pare
		       				
		       			caso 2:
		       				Q_ganhar = Q_ganhar + 1
		       				L2 = ""+Letra+""
		       				valeL2 = valeL2 + 1
		       				pare
		       				
		       			caso 3:
		       				Q_ganhar = Q_ganhar + 1
		       				L3 = ""+Letra+""
		       				valeL3 = valeL3 + 1
		       				pare
		       				
		       			caso 4:
		       				Q_ganhar = Q_ganhar + 1
		       				L4 = ""+Letra+""
		       				valeL4 = valeL4 + 1
		       				pare
		       				
		       			caso 5:
		       				Q_ganhar = Q_ganhar + 1
		       				L5 = ""+Letra+""
		       				valeL5 = valeL5 + 1
		       				pare
		       				
		       			caso 6:
		       				Q_ganhar = Q_ganhar + 1
		       				L6 = ""+Letra+""
		       				valeL6 = valeL6 + 1
		       				pare
		       				
		       			caso 7:
		       				Q_ganhar = Q_ganhar + 1
		       				L7 = ""+Letra+""
		       				valeL7 = valeL7 + 1
		       				pare
		       				
		       			caso 8:
		       				Q_ganhar = Q_ganhar + 1
		       				L1 = ""+Letra+""
		       				valeL8 = valeL8 + 1		
		  			}					
				}
			}
			
		  	se(acerto == 0)
		  	{
		  		Q_perder = Q_perder + 1
		  	}
		  	
		  	se(valeL1 > 1)
		  	{
			     Q_perder = Q_perder + 1
			     Q_ganhar = Q_ganhar - 1
			     valeL1 = valeL1 - 1
			}
			
		   	se(valeL2 > 1)
		   	{
		      	Q_perder = Q_perder + 1
		      	Q_ganhar = Q_ganhar - 1
		      	valeL2 = valeL2 - 1
		   	}
		   	
		   	se(valeL3 > 1)
		   	{
		      	Q_perder = Q_perder + 1
		      	Q_ganhar = Q_ganhar - 1
		      	valeL3 = valeL3 - 1
		   	}
		   	
		   	se(valeL4 > 1)
		   	{
		      	Q_perder = Q_perder + 1
		      	Q_ganhar = Q_ganhar - 1
		      	valeL4 = valeL4 - 1
		   	}
		   	
		   	se(valeL5 > 1)
		   	{
		      	Q_perder = Q_perder + 1
		      	Q_ganhar = Q_ganhar - 1
		      	valeL5 = valeL5 - 1
		   	}
		   	
		   	se(valeL6 > 1)
		   	{
		      	Q_perder = Q_perder + 1
		      	Q_ganhar = Q_ganhar - 1
		      	valeL6 = valeL6 - 1
		   	}
		   	
		   	se(valeL7 > 1)
		   	{
			     Q_perder = Q_perder + 1
			     Q_ganhar = Q_ganhar - 1
			     valeL7 = valeL7 - 1
		   	}
		   	
		   	se(valeL8 > 1)
		   	{
		      	Q_perder = Q_perder + 1
		      	Q_ganhar = Q_ganhar - 1
		      	valeL8 = valeL8 - 1
		   	}
		   
		   	limpa()
		   
		   	escolha(Q_perder)
		   	{
			     caso 1:
			       B1 = "       |         (-.-)"
			       pare
			       
			     caso 2:
			       B2 = "       |      \\  _||_   /"
			       pare
			       
			     caso 3:
			       B3 = "       |       \\|     |/"
			       pare
			       
			     caso 4:
			       B4 = "       |        |_____|"
			       pare
			       
			     caso 5:
			       B5 = "       |         ||  ||"
			       pare
			       
			     caso 6:
			       B6 = "       |        _|| _||"
			       pare
			       
			     caso 7:
			       B7 = "       |       |__||__|"
			       pare
			}

		   
		   
		} // fim do enquanto
		
		escreva("******* JOGO DA FORCA *********")
	   	escreva("\n\n")
	   	escreva("\n         /---------|")
	   	escreva("\n        /          |")
	   	escreva("\n       |           |")
	   	escreva("\n       |           |")
	   	escreva("\n",B1)
	   	escreva("\n",B2)
	   	escreva("\n",B3)
	   	escreva("\n",B4)
	   	escreva("\n",B5)
	   	escreva("\n",B6)
	   	escreva("\n",B7)
	   	escreva("\n       |               ")
	   	escreva("\n       |               ")
	   	escreva("\n=======|======= ")
	   	escreva("\n")
	   	escreva("\n")
	   	escreva(L1,L2,L3,L4,L5,L6,L7,L8)
		escreva("\n\nDica: ",dica_sorteia)
	   	escreva("\n\nVocÃª acertou: ",Q_ganhar,"\nVocÃª errou: ",Q_perder)
	   	escreva("\n------------------------------------")
	   	
		se(Q_ganhar > 3)
		{
		   escreva("\nGanhamokkkkkk")
		}
		
		se(Q_perder > 5)
		{
		  escreva("\nPerdemokkkkkkkk")
		}
		
		escreva("\nDeseja jogar novamente? ")
		leia(resposta_jogo)

		
		}
		senao // muito menos essa
		{
			escreva("Tempo esgotado!\nPassou ",ut.tempo_decorrido() - tempo,
			" milissegundos")	
		}
		
		
		

	}

}



/* $$$ Portugol Studio $$$ 
 * 
 * Esta seÃ§Ã£o do arquivo guarda informaÃ§Ãµes do Portugol Studio.
 * VocÃª pode apagÃ¡-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 249; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 11631; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
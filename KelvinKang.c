// Kelvin Kang
// Numero USP: 10284271

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define t 3

typedef int TipoChave;
typedef struct s {
TipoChave chave[2*t]; /// 1 a mais por conta do 0. 0 1 2 3 possui num chave 3, mas cabem 4 com o 0
struct s* filho[2*t+1];
int numChaves;
bool folha;
}NO;

void criaB(NO* *raiz) {
    (*raiz) = (NO*) malloc(sizeof(NO));
    (*raiz)->folha = true;
    (*raiz)->numChaves = 0;
}

NO* buscaB (NO* *raiz, int chave, int* indice) {
    int cont = 1;
    while (cont <= (*raiz)->numChaves && (*raiz)->chave < chave) chave++;

    if (cont <= (*raiz)->numChaves && (*raiz)->chave == chave) {
        *indice = cont;
        return (*raiz);
    }
    if ((*raiz)->folha == true) return NULL;
    else return buscaB((*raiz)->filho[cont], chave, indice);
}

NO* insereB(NO* *raiz, int valor) { /// faz a preparação, verificando se o (*raiz) está cheia ou não, após isso, deixa o resto com insereNaoCheio
    if((*raiz) != NULL && (*raiz)->numChaves == (2*t-1)) {
        NO* sobe = (NO*) malloc(sizeof(NO));
        sobe->filho[1] = (*raiz);
        sobe->folha = false;
        sobe->numChaves = 0; /// 0 pois splitB incrementa

        splitB(&sobe, raiz, 1);
        insereNaoCheioB(&sobe, valor); /// foi preparado anteriormente um split, agora preciso começar na nova (*raiz) (que é sobe)
        return sobe;
    }
    else insereNaoCheioB(raiz, valor); /// como (*raiz) não está cheia, não temos (*raiz)es novas e, portanto, (*raiz) continua sendo (*raiz)
    return *raiz;
}

void splitB (NO* *raiz, NO* *filhoE, int indice) {
    NO* filhoD;
    filhoD = (NO*) malloc(sizeof(NO));
    filhoD->folha = (*filhoE)->folha;
    filhoD->numChaves = t-1;
    /// cria filho direito
    int cont = 1;
    while (cont <= filhoD->numChaves) {
        filhoD->chave[cont] = (*filhoE)->chave[cont+t];
        cont++;
    }
    if ((*filhoE)->folha == false) {
        cont = 1;
        while (cont <= filhoD->numChaves+1) {
            filhoD->filho[cont] = (*filhoE)->filho[cont+t];
            cont++;
        }
    }
    ///ajusta o filho esquerdo;
    (*filhoE)->numChaves = t-1;
    /// sobe o elemento pra (*raiz)
    cont = (*raiz)->numChaves+1;
    while (cont > indice) {
        (*raiz)->chave[cont] = (*raiz)->chave[cont-1];
        cont--;
    }
    (*raiz)->chave[indice] = (*filhoE)->chave[t]; /// t é o meio
    /// ajusta os filhos, lembrando que é o da direita e ele é +1 (+2 por causa do espaço extra e por ser 2t-1
    cont = (*raiz)->numChaves+2;
    while (cont > indice+1) {
        (*raiz)->filho[cont] = (*raiz)->filho[cont-1];
        cont--;
}
    (*raiz)->filho[indice+1] = filhoD;

    ///a (*raiz) ganhou um novo elemento, "(*raiz)++"
    (*raiz)->numChaves++;
}

void insereNaoCheioB(NO* *raiz, int valor) {
    int cont;

    if ((*raiz) != NULL && (*raiz)->folha == true) {
        cont = (*raiz)->numChaves;

        while (cont > 0 && valor < (*raiz)->chave[cont]) { ///vai criando espaço enquanto procura a melhor posição
            (*raiz)->chave[cont+1] = (*raiz)->chave[cont];    /// a inserção é na folha
            cont--;
        }
        cont++;
        (*raiz)->chave[cont] = valor; /// insere o valor
        (*raiz)->numChaves++;
    }
    else {  /// (*raiz) tem filhos
        cont = 1;

        while (cont <= (*raiz)->numChaves && valor > (*raiz)->chave[cont]) cont++;
        if ((*raiz)->filho[cont]->numChaves == 2*t-1) { /// como (*raiz) tem filhos, verifica se há espaço para o inserir na posição correta
            splitB(raiz, &((*raiz)->filho[cont]), cont);
            if ((*raiz)->chave[cont] < valor) cont++; /// como subiu um novo elemento, preciso saber se o novo elemento é maior que o meu valor
        }
        insereNaoCheioB(&((*raiz)->filho[cont]), valor); /// sempre insiro na folha
    }
}

void printaTudo (NO* *raiz, FILE* saida) {
    int cont = 1;
    if ((*raiz)->folha == true) {
            fprintf(saida, "(");
        while (cont <= (*raiz)->numChaves) {
                fprintf(saida, "%i", (*raiz)->chave[cont]);
                if(cont != (*raiz)->numChaves) fprintf(saida," ");
                cont++;
        }
    fprintf(saida,")");
    }
    else {
            fprintf(saida,"(");
        while (cont <= (*raiz)->numChaves+1) {
            printaTudo((&(*raiz)->filho[cont]), saida);
            if(cont <=(*raiz)->numChaves) fprintf(saida," %i ", (*raiz)->chave[cont]);
            cont++;
        }
    fprintf(saida, ")");
    }
}

void deletaDaRaizB (NO* *raiz, int deletar) {
    if ((*raiz)->numChaves == 0) return;
    if ((*raiz)->folha == true) {
        int cont = 1;
        while (cont <= (*raiz)->numChaves && (*raiz)->chave[cont] < deletar) cont++; /// para quando excede o numero de chaves OU quando acho
                                                                                     ///o elemento ou maior que ele
        if ((*raiz)->chave[cont] == deletar) {
            while (cont <= (*raiz)->numChaves-1) {
                (*raiz)->chave[cont] = (*raiz)->chave[cont+1];
                cont++;
            }
            (*raiz)->numChaves--;
        }
    }
}

NO* deletaRecursivo (NO* *raiz, int deletar) {

    if ((*raiz)->folha == true) {
        deletaDaRaizB(raiz, deletar);
        return (*raiz);
    }
    int cont = 1;
    while (cont <= (*raiz)->numChaves && (*raiz)->chave[cont] < deletar) cont++; /// encontra melhor posição
    if (cont <= (*raiz)->numChaves && (*raiz)->chave[cont] == deletar) {

        if ((*raiz)->filho[cont]->numChaves >= t) { /// filhoE tem mais que minimo
            NO* noPredecessor = (*raiz)->filho[cont];
            while (noPredecessor->folha == false) {
                noPredecessor = noPredecessor->filho[noPredecessor->numChaves+1];
            }
            int predecessor = noPredecessor->chave[noPredecessor->numChaves];
            noPredecessor->chave[noPredecessor->numChaves] = (*raiz)->chave[cont];
            (*raiz)->chave[cont] = predecessor;
            deletaRecursivo(&((*raiz)->filho[cont]), deletar);
            return (*raiz);
        }
        else if ((*raiz)->filho[cont+1]->numChaves >= t) { /// filhoD tem mais que minimo mas filho E nao
            NO* noPredecessor = (*raiz)->filho[cont+1];
            while (noPredecessor->folha == false) {
                noPredecessor = noPredecessor->filho[1];
            }
            int predecessor = noPredecessor->chave[1];
            noPredecessor->chave[1] = (*raiz)->chave[cont];
            (*raiz)->chave[cont] = predecessor;
            deletaRecursivo(&((*raiz)->filho[cont+1]), deletar);
            return (*raiz);
       }
        else { /// ao chegar aqui, filhoE e filhoD têm o mínimo (t-1)
            NO* filhoE = (*raiz)->filho[cont];
            NO* filhoD = (*raiz)->filho[cont+1];
            filhoE->chave[t] = (*raiz)->chave[cont];
            int i = 1;
            while (i <= t-1) {
                filhoE->chave[i+t] = filhoD->chave[i];
                i++;
            }
            i = 1;
            while(i <= t && filhoE->folha == false) {
                filhoE->filho[i+t] = filhoD->filho [i];
                i++;
            }
            filhoE->numChaves = 2*t-1;
            i = cont;
            while (i <= (*raiz)->numChaves-1) {
                (*raiz)->chave[i] = (*raiz)->chave[i+1];
                i++;
            }
            i = cont;
            while (i <= (*raiz)->numChaves) {
                (*raiz)->filho[i] = (*raiz)->filho[i+1];
                i++;
            }
            (*raiz)->numChaves--;
            if ((*raiz)->numChaves == 0) {
                (*raiz) = filhoE;
            }
            else (*raiz)->filho[cont] = filhoE;
            deletaRecursivo(raiz, deletar);
            return (*raiz);
        }
    }
    /// else deletaRecursivo(&((*raiz)->filho[cont]), deletar); era o que acessava o filho e buscava na posicao, incrementar!
    else {
        if ((*raiz)->filho[cont]->numChaves == t-1) { /// se ci[x] tem t-1 ver irmão imediatos
            NO* filhoPobre = (*raiz)->filho[cont];
            if (cont >=2 && (*raiz)->filho[cont-1]->numChaves >= t) { /// irmão ESQUERDO tem pelo menos t chaves?
                NO* irmaoE = (*raiz)->filho[cont-1];

                int i = filhoPobre->numChaves;
                while (i >= 1) {
                    filhoPobre->chave[i+1] = filhoPobre->chave[i];
                    i--;
                }
                i = filhoPobre->numChaves+1;
                while (i>= 1) {
                    filhoPobre->filho[i+1] = filhoPobre->filho[i];
                    i--;
                }
                filhoPobre->chave[1] = (*raiz)->chave[cont-1];
                filhoPobre->filho[1] = irmaoE->filho[irmaoE->numChaves+1];
                filhoPobre->numChaves++;
                (*raiz)->chave[cont-1] = irmaoE->chave[irmaoE->numChaves];
                irmaoE->numChaves--;
                deletaRecursivo(&filhoPobre, deletar);
                return (*raiz);
            }
            else if (cont >=1 && cont <= (*raiz)->numChaves && (*raiz)->filho[cont+1]->numChaves >= t) { /// irmão DIREITO tem pelo menos t chaves?
                NO* irmaoD = (*raiz)->filho[cont+1];
                filhoPobre->chave[t] = (*raiz)->chave[cont];
                filhoPobre->filho[t+1] = irmaoD->filho[1];
                filhoPobre->numChaves++;
                (*raiz)->chave[cont] = irmaoD->chave[1];
                int i = 1;
                while (i <= irmaoD->numChaves-1) {
                    irmaoD->chave[i] = irmaoD->chave[i+1];
                    i++;
                }
                i = 1;
                while (i <= irmaoD->numChaves) {
                    irmaoD->filho[i] = irmaoD->filho[i+1];
                    i++;
                }
                irmaoD->numChaves--;

                deletaRecursivo(&filhoPobre, deletar);
                return (*raiz);
            }
            else { /// irmaoE e irmaoD nao possuem ao menos t para "DOAR"
                if (cont >= 2) { /// se cont for 1, nao temos filhoE para juntar
                    NO* irmaoE = (*raiz)->filho[cont-1];

                    irmaoE->chave[t] = (*raiz)->chave[cont-1];
                    int i = 1;
                    while (i <= t-1) {
                        irmaoE->chave[i+t] = filhoPobre->chave[i];
                        i++;
                    }
                    i = 1;
                    while (i <= t && irmaoE->folha == false) {
                        irmaoE->filho[i+t] = filhoPobre->filho[i];
                        i++;
                    }
                    irmaoE->numChaves = 2*t-1;
                    i = cont-1;
                    while (i <= (*raiz)->numChaves-1) {
                        (*raiz)->chave[i] = (*raiz)->chave[i+1];
                        i++;
                    }
                    i = cont-1;
                    while (i <= (*raiz)->numChaves) {
                        (*raiz)->filho[i] = (*raiz)->filho[i+1];
                        i++;
                    }
                    (*raiz)->numChaves--;
                    if ((*raiz)->numChaves == 0) {
                        (*raiz) = irmaoE;
                    }
                    else (*raiz)->filho[cont-1] = irmaoE;
                    deletaRecursivo(raiz, deletar);
                    return (*raiz);
                }
                else if (cont >= 1 && cont <= (*raiz)->numChaves) {
                    NO* irmaoD = (*raiz)->filho[cont+1];

                    filhoPobre->chave[t] = (*raiz)->chave[cont]; /// antes era cont-1
                    int i = 1;
                    while (i <= t-1) {
                        filhoPobre->chave[i+t] = irmaoD->chave[i];
                        i++;
                    }
                    i = 1;
                    while (i <= t) {
                        filhoPobre->filho[i+t] = irmaoD->filho[i];
                        i++;
                    }
                    filhoPobre->numChaves = 2*t-1;
                    i = cont; /// antes era cont -1
                    while (i <= (*raiz)->numChaves-1) {
                        (*raiz)->chave[i] = (*raiz)->chave[i+1];
                        i++;
                    }
                    i = cont; /// antes era cont-1
                    while (i <= (*raiz)->numChaves) {
                        (*raiz)->filho[i] = (*raiz)->filho[i+1];
                        i++;
                    }
                    (*raiz)->numChaves--;
                    if ((*raiz)->numChaves == 0) {
                        (*raiz) = filhoPobre;
                    }
                    else (*raiz)->filho[cont] = filhoPobre; /// ante era cont -1
                    deletaRecursivo(raiz, deletar);
                    return (*raiz);
                }
            }
        }
    }
    deletaRecursivo(&((*raiz)->filho[cont]), deletar);
    return (*raiz);
}

/*int main() {
    printf("Hello world!\n");
    NO *no;
        criaB(&no);
    no = insereB(&no, 50);
    no = insereB(&no, 1);
    no = insereB(&no, 2);
    no = insereB(&no, 80);
    no = insereB(&no, 81);
    no = insereB(&no, 3);
    no = insereB(&no, 4);
    no = insereB(&no, 5);
    no = insereB(&no, 6);
    no = insereB(&no, 10);
    no = insereB(&no, 11);
    no = insereB(&no, 20);
    no = insereB(&no, 25);
    no = insereB(&no, 26);
    no = insereB(&no, 32);
    no = insereB(&no, 82);
    no = insereB(&no, 83);
    no = insereB(&no, 90);
    no = insereB(&no, 91);
    no = insereB(&no, 12);
    no = insereB(&no, 13);
    no = insereB(&no, 14);
    no = insereB(&no, 92);
    printaTudo(&no);
    printf("\n\n");
    no = insereB(&no, 15);
    printaTudo(&no);
    printf("\n\n");
    no = deletaRecursivo(&no, 81);
    printaTudo(&no);
    printf("\n\n");
    int cont = 1;
    /*while (cont <= 19) {
        no = insereB(&no, cont);
        cont++;
    }*/
    //no = insereB(&no, 2);
    //no = insereB(&no, 8);
    //printaTudo(&no);
    //no = deletaRecursivo(&no, 12);
    //printaB(&no);
    //printf("\n\n");
    //printaTudo(&no);
    /*no = deletaRecursivo(&no, 3);
    printf("\n\n");
    printaTudo(&no);
    no = deletaRecursivo(&no, 6);
    printf("\n\n");
    printaTudo(&no);
    return 0;
}*/

int main(int argc, char *argv[]){
    char ch;
	FILE *entrada;
	entrada = fopen(argv[1], "r");
    FILE *saida;
    saida = fopen(argv[2], "w");
	if(entrada == NULL){
	    fprintf(saida, "Erro, nao foi possivel abrir o arquivo de entrada\n");
        return 0;
    }
    if(saida == NULL){
	    fprintf(saida, "Erro, nao foi possivel abrir o arquivo de saida\n");
        return 0;
    }
    NO* no;
    criaB(&no);
    char comando = NULL;
    int valor = -1;
    while (comando != 'f'){
        fscanf(entrada, "%c %d", &comando, &valor);
        if (comando == 'p') {
            printaTudo(&no, saida);
            fprintf(saida, "\n");
            continue;
        }
        else if (comando == 'i'){
            no = insereB(&no, valor);
            continue;
        }
        else if (comando == 'r') {
            no = deletaRecursivo(&no, valor);
            continue;
        }

    }
	fclose(entrada);
    fclose(saida);
	return 0;
}

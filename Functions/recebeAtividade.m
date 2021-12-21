function bloco = recebeAtividade(dados,labels,labelAtual,i,current)
info = dados(labels(labelAtual(i,1),4):labels(labelAtual(i,1),5),current);
bloco = info;
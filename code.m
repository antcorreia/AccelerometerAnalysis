clc
close all
clear 

aUser = {'21', '22', '23', '24'};
aExp = {'42', '43', '44', '45', '46', '47', '48', '49'};

vExp = 1;
vUser = 1;

sensoresEixo = {'ACC\_X', 'ACC\_Y', 'ACC\_Z'};

walking_x = {{},{},{},{},{},{},{},{}};
walking_y = {{},{},{},{},{},{},{},{}};
walking_z = {{},{},{},{},{},{},{},{}};

walking_up_x = {{},{},{},{},{},{},{},{}};
walking_up_y = {{},{},{},{},{},{},{},{}};
walking_up_z = {{},{},{},{},{},{},{},{}};

walking_down_x = {{},{},{},{},{},{},{},{}};
walking_down_y = {{},{},{},{},{},{},{},{}};
walking_down_z = {{},{},{},{},{},{},{},{}};

sit_x = {{},{},{},{},{},{},{},{}};
sit_y = {{},{},{},{},{},{},{},{}};
sit_z = {{},{},{},{},{},{},{},{}};
 
stand_x = {{},{},{},{},{},{},{},{}};
stand_y = {{},{},{},{},{},{},{},{}};
stand_z = {{},{},{},{},{},{},{},{}};
 
lay_x = {{},{},{},{},{},{},{},{}};
lay_y = {{},{},{},{},{},{},{},{}};
lay_z = {{},{},{},{},{},{},{},{}};
 
stand_to_sit_x = {{},{},{},{},{},{},{},{}};
stand_to_sit_y = {{},{},{},{},{},{},{},{}};
stand_to_sit_z = {{},{},{},{},{},{},{},{}};
 
sit_to_stand_x = {{},{},{},{},{},{},{},{}};
sit_to_stand_y = {{},{},{},{},{},{},{},{}};
sit_to_stand_z = {{},{},{},{},{},{},{},{}};
 
sit_to_lay_x = {{},{},{},{},{},{},{},{}};
sit_to_lay_y = {{},{},{},{},{},{},{},{}};
sit_to_lay_z = {{},{},{},{},{},{},{},{}};
 
lay_to_sit_x = {{},{},{},{},{},{},{},{}};
lay_to_sit_y = {{},{},{},{},{},{},{},{}};
lay_to_sit_z = {{},{},{},{},{},{},{},{}};
 
stand_to_lay_x = {{},{},{},{},{},{},{},{}};
stand_to_lay_y = {{},{},{},{},{},{},{},{}};
stand_to_lay_z = {{},{},{},{},{},{},{},{}};
 
lay_to_stand_x = {{},{},{},{},{},{},{},{}};
lay_to_stand_y = {{},{},{},{},{},{},{},{}};
lay_to_stand_z = {{},{},{},{},{},{},{},{}};

atividades = {'D-WLK', 'D-W-U-S', 'D-W-D-S', 'S-STNG', 'S-STDNG', 'S-LNG',  'STD2ST', 'ST2STD', 'ST2L', 'L2ST', 'STD2L', 'L2STD'};

labels = importa_labels('Data/labels.txt');

for p = 8:-1:1
    vExp = p;
    vUser = ceil(p/2);

    file = sprintf('Data/acc_exp%s_user%s.txt', aExp{vExp}, aUser{vUser});
   
    dados = importa_dados(file);
    
    
    labelAtual = intersect(find(labels(:, 1) == str2num(aExp{vExp})), find(labels(:, 2) == str2num(aUser{vUser})));
   
    vetor = [0: size(dados, 1) - 1]./50;
    
    [nmrPontos, nmrPlots] = size(dados);
    
    
    
    %Ex 2
    
    f = figure('Name',strcat("Teste Número ",int2str(str2num(aUser{vUser})-20)),'NumberTitle','off');
    f.Position = [100,100,1200,700];
    for i=1:nmrPlots
        
        subplot(nmrPlots, 1, i);
        plot(vetor./60, dados(:,i),'Color','#000000')
        axis([0, vetor(end)./60 min(dados(:, i)) max(dados(:, i))])
        xlabel('Time (min)');
        ylabel(sensoresEixo{i});
        hold on
        for j = 1 : numel(labelAtual)
            plot(vetor(labels(labelAtual(j), 4):labels(labelAtual(j), 5))./60, dados(labels(labelAtual(j), 4):labels(labelAtual(j), 5),i));
            if mod(j, 2) == 1
                ypos = min(dados(:, i)) - (0.2 * min(dados(:, i)));
            else
                ypos = max(dados(:, i)) - (0.2 * min(dados(:, i)));
            end
            text(vetor(labels(labelAtual(j), 4))/60, ypos, atividades{labels(labelAtual(j), 3)});
        end
        
    end
    
    for i=1:size(labelAtual,1)
         
        switch labels((labelAtual(i,1)),3)
            case 1
                
                walking_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                walking_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                walking_z{p} = recebeAtividade(dados, labels,labelAtual,i,3);
            
            case 2
                walking_up_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                walking_up_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                walking_up_z{p} = recebeAtividade(dados, labels,labelAtual,i,3);
            
            case 3
                walking_down_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                walking_down_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                walking_down_z{p} = recebeAtividade(dados, labels,labelAtual,i,3);
            case 4
                sit_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                sit_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                sit_z{p} = recebeAtividade(dados, labels,labelAtual,i,3);
            
            case 5
                stand_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                stand_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                stand_z{p} = recebeAtividade(dados, labels,labelAtual,i,3);
            
            case 6
                lay_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                lay_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                lay_z{p} = recebeAtividade(dados, labels,labelAtual,i,3);
            case 7
                stand_to_sit_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                stand_to_sit_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                stand_to_sit_z{p} = recebeAtividade(dados, labels,labelAtual,i,3);  
            case 8
                sit_to_stand_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                sit_to_stand_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                sit_to_stand_z{p} = recebeAtividade(dados, labels,labelAtual,i,3);  
                
            case 9
                sit_to_lay_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                sit_to_lay_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                sit_to_lay_z{p} = recebeAtividade(dados, labels,labelAtual,i,3);  
            
            case 10  
                lay_to_sit_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                lay_to_sit_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                lay_to_sit_z{p} = recebeAtividade(dados, labels,labelAtual,i,3); 
                
            case 11
                stand_to_lay_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                stand_to_lay_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                stand_to_lay_z{p} = recebeAtividade(dados, labels,labelAtual,i,3); 
                
            case 12
                lay_to_stand_x{p} = recebeAtividade(dados, labels,labelAtual,i,1);
                lay_to_stand_y{p} = recebeAtividade(dados, labels,labelAtual,i,2);
                lay_to_stand_z{p} = recebeAtividade(dados, labels,labelAtual,i,3); 
           
        end
    end
end



% Ex 3.1

dynamic = {{cat(1,walking_x{1},walking_x{2}),cat(1,walking_y{1},walking_y{2}),cat(1,walking_z{1},walking_z{2})},{cat(1,walking_up_x{1},walking_up_x{2}),cat(1,walking_up_y{1},walking_up_y{2}),cat(1,walking_up_z{1},walking_up_z{2})},{cat(1,walking_down_x{1},walking_down_x{2}),cat(1,walking_down_y{1},walking_down_y{2}),cat(1,walking_down_z{1},walking_down_z{2})}}

allWindowsdynamicDFT(dynamic,50,1);



%Ex 3.2
%Tem erros, para correr o codigo seguinte comentar a linha 239

for i=1:2:8
    todasAtividadesUser = {{},{},{},{},{},{},{},{},{},{},{},{}};
    todasAtividadesUser{1} = {walking_x{i},walking_x{i+1},walking_y{1},walking_y{i+1},walking_z{i},walking_z{i+1}};
    todasAtividadesUser{2} = {walking_up_x{i}, walking_up_x{i+1}, walking_up_y{i}, walking_up_y{i+1}, walking_up_z{i}, walking_up_z{i+1}};
    todasAtividadesUser{3} = {walking_down_x{i}, walking_down_x{i+1}, walking_down_y{i}, walking_down_y{i+1}, walking_down_z{i}, walking_down_z{i+1}};
    todasAtividadesUser{4} = {sit_x{i}, sit_x{i+1}, sit_y{i}, sit_y{i+1}, sit_z{i}, sit_z{i+1}};
    todasAtividadesUser{5} = {stand_x{i}, stand_x{i+1}, stand_y{i}, stand_y{i+1}, stand_z{i}, stand_z{i+1}};
    todasAtividadesUser{6} = {lay_x{i}, lay_x{i+1}, lay_y{i}, lay_y{i+1}, lay_z{i}, lay_z{i+1}};
    todasAtividadesUser{7} = {stand_to_sit_x{i}, stand_to_sit_x{i+1}, stand_to_sit_y{i}, stand_to_sit_y{i+1}, stand_to_sit_z{i}, stand_to_sit_z{i+1}};
    todasAtividadesUser{8} = {sit_to_stand_x{i}, sit_to_stand_x{i+1}, sit_to_stand_y{i}, sit_to_stand_y{i+1}, sit_to_stand_z{i}, sit_to_stand_z{i+1}};
    todasAtividadesUser{9} = {sit_to_lay_x{i}, sit_to_lay_x{i+1}, sit_to_lay_y{i}, sit_to_lay_y{i+1}, sit_to_lay_z{i}, sit_to_lay_z{i+1}};
    todasAtividadesUser{10} = {lay_to_sit_x{i}, lay_to_sit_x{i+1}, lay_to_sit_y{i}, lay_to_sit_y{i+1}, lay_to_sit_z{i}, lay_to_sit_z{i+1}};
    todasAtividadesUser{11} = {stand_to_lay_x{i}, stand_to_lay_x{i+1}, stand_to_lay_y{i}, stand_to_lay_y{i+1}, stand_to_lay_z{i}, stand_to_lay_z{i+1}};
    todasAtividadesUser{12} = {lay_to_stand_x{i}, lay_to_stand_x{i+1}, lay_to_stand_y{i}, lay_to_stand_y{i+1}, lay_to_stand_z{i}, lay_to_stand_z{i+1}};
    
    %calcDFT(todasAtividadesUser,atividades,50,i) 
end


%Ex 3.4 

walking = {walking_x,walking_y,walking_z};
walkingUp = {walking_up_x,walking_up_y,walking_up_z};
walkingDown = {walking_down_x,walking_down_y,walking_down_z};
    
calculaNmrMedioPassos(walking,walkingUp,walkingDown);



%Ex 3.5 e 3.6
%Tem erros, para correr o codigo seguinte comentar ate ao proximo exercicio

todasAtividadesUserX = {{},{},{},{}};
todasAtividadesUserY = {{},{},{},{}};
todasAtividadesUserZ = {{},{},{},{}};

for i=1:2:8
    todasAtividadesUserX{ceil(i/2)} = {cat(1,walking_x{i},walking_x{i+1}),cat(1,walking_up_x{i}, walking_up_x{i+1}),cat(1,walking_down_x{i}, walking_down_x{i+1}),cat(1,sit_x{i}, sit_x{i+1}),cat(1,stand_x{i}, stand_x{i+1}),cat(1,lay_x{i}, lay_x{i+1}),cat(1,stand_to_sit_x{i}, stand_to_sit_x{i+1}),cat(1,sit_to_stand_x{i}, sit_to_stand_x{i+1}),cat(1,sit_to_lay_x{i}, sit_to_lay_x{i+1}),cat(1,lay_to_sit_x{i}, lay_to_sit_x{i+1}),cat(1,stand_to_lay_x{i}, stand_to_lay_x{i+1}),cat(1,lay_to_stand_x{i}, lay_to_stand_x{i+1})};
    todasAtividadesUserY{ceil(i/2)} = {cat(1,walking_y{i},walking_y{i+1}),cat(1,walking_up_y{i}, walking_up_y{i+1}),cat(1,walking_down_y{i}, walking_down_y{i+1}),cat(1,sit_y{i}, sit_y{i+1}),cat(1,stand_y{i}, stand_y{i+1}),cat(1,lay_y{i}, lay_y{i+1}),cat(1,stand_to_sit_y{i}, stand_to_sit_y{i+1}),cat(1,sit_to_stand_y{i}, sit_to_stand_y{i+1}),cat(1,sit_to_lay_y{i}, sit_to_lay_y{i+1}),cat(1,lay_to_sit_y{i}, lay_to_sit_y{i+1}),cat(1,stand_to_lay_y{i}, stand_to_lay_y{i+1}),cat(1,lay_to_stand_x{i}, lay_to_stand_y{i+1})};
    todasAtividadesUserZ{ceil(i/2)} = {cat(1,walking_z{i},walking_z{i+1}),cat(1,walking_up_z{i}, walking_up_z{i+1}),cat(1,walking_down_z{i}, walking_down_z{i+1}),cat(1,sit_z{i}, sit_z{i+1}),cat(1,stand_z{i}, stand_z{i+1}),cat(1,lay_z{i}, lay_z{i+1}),cat(1,stand_to_sit_z{i}, stand_to_sit_z{i+1}),cat(1,sit_to_stand_z{i}, sit_to_stand_z{i+1}),cat(1,sit_to_lay_z{i}, sit_to_lay_z{i+1}),cat(1,lay_to_sit_z{i}, lay_to_sit_z{i+1}),cat(1,stand_to_lay_z{i}, stand_to_lay_z{i+1}),cat(1,lay_to_stand_x{i}, lay_to_stand_z{i+1})};

end
freq_imp = cell(1,3);
tudo = cat(1,todasAtividadesUserX,todasAtividadesUserY,todasAtividadesUserZ);

for i = 1:12
        atual{i} = cat(1,tudo{1}{1}{i},tudo{1}{2}{i},tudo{1}{3}{i},tudo{1}{4}{i});
end
freq_imp{1,1} = calcDFTEX35(atual,50)
for i = 1:12
        atual{i} = cat(1,tudo{5}{i},tudo{6}{i},tudo{7}{i},tudo{8}{i});
end
freq_imp{1,2} = calcDFTEX35(atual,50)
for i = 1:12
        atual{i} = cat(1,tudo{9}{i},tudo{10}{i},tudo{11}{i},tudo{12}{i});
end
freq_imp{1,3} = calcDFTEX35(atual,50)

dif3D(freq_imp, atividades);



%Ex 4

[sA1, sA2] = size(walking_z{2});
[sB1, sB2] = size(walking_up_z{2});
[sC1, sC2] = size(walking_down_z{2});
[sD1, sD2] = size(sit_z{2});
[sE1, sE2] = size(stand_z{2});
[sF1, sF2] = size(lay_z{2});
[sG1, sG2] = size(stand_to_sit_z{2});
[sH1, sH2] = size(sit_to_stand_z{2});
[sI1, sI2] = size(sit_to_lay_z{2});
[sJ1, sJ2] = size(lay_to_sit_z{2});
[sK1, sK2] = size(stand_to_lay_z{2});
[sL1, sL2] = size(lay_to_stand_z{2});

ALLZS(1:sA1,1) = walking_z{2};
total = sA1;
ALLZS(total+1:total+sB1,1) = walking_up_z{2};
total = total + sB1;
ALLZS(total+1:total+sC1,1) = walking_down_z{2};
total = total + sC1;
ALLZS(total+1:total+sD1,1) = sit_z{2};
total = total + sD1;
ALLZS(total+1:total+sE1,1) = stand_z{2};
total = total + sE1;
ALLZS(total+1:total+sF1,1) = lay_z{2};
total = total + sF1;
ALLZS(total+1:total+sG1,1) = stand_to_sit_z{2};
total = total + sG1;
ALLZS(total+1:total+sH1,1) = sit_to_stand_z{2};
total = total + sH1;
ALLZS(total+1:total+sI1,1) = sit_to_lay_z{2};
total = total + sI1;
ALLZS(total+1:total+sJ1,1) = lay_to_sit_z{2};
total = total + sJ1;
ALLZS(total+1:total+sK1,1) = stand_to_lay_z{2};
total = total + sK1;
ALLZS(total+1:total+sL1,1) = lay_to_stand_z{2};
total = total + sL1;

STFT(ALLZS,50,1.10,0.55);

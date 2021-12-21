
function iLabel = importa_labels(nome_ficheiro)


inicio = 1;
fim = inf;
espacamento = ' ';

formatacao = '%f%f%f%f%f%[^\n\r]';
id = fopen(nome_ficheiro,'r');

dados = textscan(id, formatacao,fim(1)-inicio(1)+1, 'Delimiter', espacamento, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'HeaderLines', inicio(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(inicio)
    frewind(fileID);
    dadosTemp = textscan(fileID, formatacao,fim(block)-inicio(block)+1, 'espacamento', espacamento, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'HeaderLines', inicio(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dados)
        dados{col} = [dados{col};dadosTemp{col}];
    end
end

fclose(id);
iLabel = [dados{1:end-1}];

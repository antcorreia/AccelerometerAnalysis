function accData = importa_dados(nome_ficheiro)

inicio = 1;
fim = inf;

espacamento = ' ';


formatacao = '%f%f%f%[^\n\r]';


id = fopen(nome_ficheiro,'r');

dados = textscan(id, formatacao, fim(1)-inicio(1)+1, 'Delimiter', espacamento, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', inicio(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for i=2:length(inicio)
    frewind(id);
    dadosTemp = textscan(id, formatacao, fim(i)-inicio(i)+1, 'Delimiter', espacamento, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', inicio(i)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dados) 
        dados{col} = [dados{col};dadosTemp{col}];
    end
end

fclose(id);
accData = [dados{1:end-1}];
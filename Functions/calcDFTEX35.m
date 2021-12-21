function [r3] = calcDFTEX35(DATA,fs)
    
    %Funcao que utilizamos para resolver o exercico 3.5m, decidimos
    %utilizar a window retangular, dado que não conseguimos implementar
    %corretamente com a Hamming.
    threshold = 0.4;
    freqs = cell(1,1);
    
        
   for i = 1:12 
       
        atual = DATA{i,:};
        
        tamanho = length(atual);
         
        freqTemp = cell(tamanho,1);
         

      
        for j = 1:tamanho

            info = atual{1,j}{:,1};

            N = length(info);
            info = detrend(info);

            if (mod(N,2)==0)

                f = -fs/2:fs/N:fs/2-fs/N;
            else

                f = -fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
            end

            dft = fftshift(fft(info));

            dft(find(abs(dft)<0.001)) = 0; 

            mdl = abs(dft);
            maior = max(mdl);
            min = threshold*maior;

            [~,ind] = findpeaks(mdl,'MinPeakHeight',min);

            freq_imp = f(ind);
            freq_imp = freq_imp(freq_imp>=0);
            round(freq_imp);


            freqTemp{j,1} = freq_imp;


        end

        r3{i,1} = freqTemp;
    end
    
end
function [] = calcDFT(DATA,atividades,fs,i)
    
    user = ceil(i/2);
    figure("Name",user + "o USER",'NumberTitle','off');
    


    for i=1:12
        
        
        atual = DATA{i};
        
        
        atual = cat(1,atual{1},atual{2},atual{3},atual{4},atual{5},atual{6});
        
        
        atividade = atividades(i);
        
        windowSize = size(atual,1);
        hammingWindow = hamming(windowSize);
        
        if(mod(windowSize,2)==0)
            f = -fs/2 : fs/windowSize : fs/2-fs/windowSize;
        else
            f = -fs/2+fs/(2*windowSize):fs/windowSize:fs/2-fs/(2*windowSize);
        end
        
        dft = abs(fftshift(fft(detrend(atual)))).*hammingWindow;


        subplot(4,3,i);
        plot(f,dft);
        title("Atividade " + atividade);

    end
end
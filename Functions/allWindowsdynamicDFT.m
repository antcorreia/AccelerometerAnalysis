function [xDFT,yDFT,zDFT] = allWindowsdynamicDFT(data,fs,caso)
    if caso == 1
        activity_names = ["Walking", "Walking Up Stairs", "Walking Down Stairs"];

        for i=1:length(data)

            janela_x = data{i}{1};
            janela_y = data{i}{2};
            janela_z = data{i}{3};

            activity = activity_names(i);
            windowSize = size(data{i}{1},1);




            if(mod(windowSize,2)==0)
                f = -fs/2 : fs/windowSize : fs/2-fs/windowSize;
            else
                f = -fs/2+fs/(2*windowSize):fs/windowSize:fs/2-fs/(2*windowSize);
            end

            figure();
            subplot(3,1, 1);
            plot(f, janela_x);
            title("ORIGINAL X")
            subplot(3,1, 2);
            plot(f, janela_y);
            title("ORIGINAL Y")
            subplot(3,1, 3);
            plot(f, janela_z);
            title("ORIGINAL Z")





            figure("Name", activity + " - Janelas",'NumberTitle','off');

          


            dft_x = abs(fftshift(fft(janela_x)));
            dft_y = abs(fftshift(fft(janela_y)));
            dft_z = abs(fftshift(fft(janela_z)));

            subplot(3,4, 1);
            plot(f, dft_x);
            title("DFT X")
            subplot(3,4, 5);
            plot(f, dft_y);
            title("DFT Y")
            subplot(3,4, 9);
            plot(f, dft_z);
            title("DFT Z")

            
            hammingWindow = hamming(windowSize);

            janela_x = data{i}{1}.*hammingWindow;
            janela_y = data{i}{2}.*hammingWindow;
            janela_z = data{i}{3}.*hammingWindow;

            dft_x = abs(fftshift(fft(janela_x)));
            dft_y = abs(fftshift(fft(janela_y)));
            dft_z = abs(fftshift(fft(janela_z)));

            subplot(3,4, 2);
            plot(f, dft_x);
            title("Hamming X")
            subplot(3,4, 6);
            plot(f, dft_y);
            title("Hamming Y")
            subplot(3,4, 10);
            plot(f, dft_z);
            title("Hamming Z");


      
            hannWindow = hann(windowSize);

            janela_x = data{i}{1}.*hannWindow;
            janela_y = data{i}{2}.*hannWindow;
            janela_z = data{i}{3}.*hannWindow;   

            dft_x = abs(fftshift(fft(janela_x)));
            dft_y = abs(fftshift(fft(janela_y)));
            dft_z = abs(fftshift(fft(janela_z)));

            subplot(3,4, 3);
            plot(f, dft_x);
            title("Hann X")
            subplot(3,4, 7);
            plot(f, dft_y);
            title("Hann Y")
            subplot(3,4, 11);
            plot(f, dft_z);
            title("Hann Z");

 
            blackmanWindow = blackman(windowSize);

            janela_x = data{i}{1}.*blackmanWindow;
            janela_y = data{i}{2}.*blackmanWindow;
            janela_z = data{i}{3}.*blackmanWindow;

            dft_x = abs(fftshift(fft(janela_x)));
            dft_y = abs(fftshift(fft(janela_y)));
            dft_z = abs(fftshift(fft(janela_z)));

            subplot(3,4, 4);
            plot(f, dft_x);
            title("Blackman X")
            subplot(3,4, 8);
            plot(f, dft_y);
            title("Blackman Y")
            subplot(3,4, 12);
            plot(f, dft_z);
            title("Blackman Z");   

            if(i == 2)
                disp(activity);
                wvtool(hamming(windowSize),hann(windowSize),blackman(windowSize))

            end

        end
        
    else
        hammingWindow = hamming(length(data{1}));
        xDFT = abs(fftshift(fft(detrend(data{1})))).*hammingWindow;
        yDFT = abs(fftshift(fft(detrend(data{2})))).*hammingWindow;
        zDFT = abs(fftshift(fft(detrend(data{3})))).*hammingWindow;

    end
    
        
        
end
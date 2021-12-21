function stft = STFT (data, fs, Tframe, Toverlap)


    size(data);

    N = numel(data); %periodo fundamental

    Nframe = round(Tframe * fs)% número de amostras na janela
    Noverlap = round(Toverlap * fs); % número de amostras sobrepostas na janela

    h = hamming(Nframe);

    STFT = [];

    f = linspace(-fs/2, fs/2, Nframe);
    x = find(f>=0)

    for i = 1 : Nframe-Noverlap : N-Nframe
        % aplicar a janela ao sinal do tempo
        x_frame = data(i:i+Nframe-1, 1).*h; 
        m_x_frame = abs(fftshift(fft(x_frame))); 
        STFT = horzcat(STFT,m_x_frame(x));

    end
    % GRÁFICOS
    STFTdB = 20 * log10(STFT);

    figure();
    imagesc(STFTdB)
    set(gca,'YDir','normal')

    %{
    figure();
    plot((1:numel(data))./(20*log10(fs)), data, '-k');
%}


stft = STFT;
end
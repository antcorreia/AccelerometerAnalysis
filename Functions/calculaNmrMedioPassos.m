function [stepsPM_Wx,stepsPM_Wy,stepsPM_Wz] = calculaNmrMedioPassos(walking,walkingUp,walkingDown)
        mediaStepsWalkingX = [];
        mediaStepsWalkingY = [];
        mediaStepsWalkingZ = [];
        mediaStepsWalkingUpX = [];
        mediaStepsWalkingUpY = [];
        mediaStepsWalkingUpZ = [];
        mediaStepsWalkingDownX = [];
        mediaStepsWalkingDownY = [];
        mediaStepsWalkingDownZ = [];
        
       for p = 1:2:8
            data = {{},{},{}};
            data{1} = {cat(1,walking{1}{p},walking{1}{p+1}),cat(1,walking{2}{p},walking{2}{p+1}),cat(1,walking{3}{p},walking{3}{p+1})};
            data{2} = {cat(1,walkingUp{1}{p},walkingUp{1}{p+1}),cat(1,walkingUp{2}{p},walkingUp{2}{p+1}),cat(1,walkingUp{3}{p},walkingUp{3}{p+1})};
            data{3} = {cat(1,walkingDown{1}{p},walkingDown{1}{p+1}),cat(1,walkingDown{2}{p},walkingDown{2}{p+1}),cat(1,walkingDown{3}{p},walkingDown{3}{p+1})};
    
            tamanho = size(data,2);
            
           
            for i = 1:tamanho
                
                    largura = size(data{i}{1},1);
                    
                    switch i
                        case 1
                           [originalSteps_x, originalSteps_y, originalSteps_z] = allWindowsdynamicDFT(data{i},50,0); 

                           [stepsPM_Wx, stepsPM_Wy, stepsPM_Wz] = passosMinuto(originalSteps_x, originalSteps_y, originalSteps_z, largura);

                        case 2
                           [originalSteps_x, originalSteps_y, originalSteps_z] = allWindowsdynamicDFT(data{i},50,0); 
                           [stepsPM_WUx, stepsPM_WUy, stepsPM_WUz] = passosMinuto(originalSteps_x, originalSteps_y, originalSteps_z, largura);

                        case 3
                           [originalSteps_x, originalSteps_y, originalSteps_z] = allWindowsdynamicDFT(data{i},50,0); 
                           [stepsPM_WDx, stepsPM_WDy, stepsPM_WDz] = passosMinuto(originalSteps_x, originalSteps_y, originalSteps_z, largura);

                    end
            end
            
            media_walking_x = mean(stepsPM_Wx);
            media_walking_y = mean(stepsPM_Wy);
            media_walking_z = mean(stepsPM_Wz);
            
            
            mediaStepsWalkingX = [mediaStepsWalkingX, media_walking_x];
            mediaStepsWalkingY = [mediaStepsWalkingY, media_walking_y];
            mediaStepsWalkingZ = [mediaStepsWalkingZ, media_walking_z];
             
        
            media_walkingUp_x = mean(stepsPM_WUx);
            media_walkingUp_y = mean(stepsPM_WUy);
            media_walkingUp_z = mean(stepsPM_WUz);
            
            mediaStepsWalkingUpX = [mediaStepsWalkingUpX,media_walkingUp_x];
            mediaStepsWalkingUpY = [mediaStepsWalkingUpY,media_walkingUp_y];
            mediaStepsWalkingUpZ = [mediaStepsWalkingUpZ,media_walkingUp_z];
            
            
            media_walkingDown_x = mean(stepsPM_WDx);
            media_walkingDown_y = mean(stepsPM_WDy);
            media_walkingDown_z = mean(stepsPM_WDz);
            
            mediaStepsWalkingDownX = [mediaStepsWalkingDownX,media_walkingDown_x];
            mediaStepsWalkingDownY = [mediaStepsWalkingDownY,media_walkingDown_y];
            mediaStepsWalkingDownZ = [mediaStepsWalkingDownZ,media_walkingDown_z];

        end

        mediaFINAL_Walking_x = mean(mediaStepsWalkingX);
        mediaFINAL_Walking_y = mean(mediaStepsWalkingY);
        mediaFINAL_Walking_z = mean(mediaStepsWalkingZ);
        desvioP_walking_x = std(mediaStepsWalkingX);
        desvioP_walking_y = std(mediaStepsWalkingY);
        desvioP_walking_z = std(mediaStepsWalkingZ);
        disp("Walking X -> Media: " + mediaFINAL_Walking_x);
        disp("Walking Y -> Media: " + mediaFINAL_Walking_y);
        disp("Walking Z -> Media: " + mediaFINAL_Walking_z);
        disp("Walking X -> Desvio Padrao: " + desvioP_walking_x);
        disp("Walking Y -> Desvio Padrao: " + desvioP_walking_y);
        disp("Walking Z -> Desvio Padrao: " + desvioP_walking_z);
       
            
        mediaFINAL_WalkingUp_x = mean(mediaStepsWalkingUpX);
        mediaFINAL_WalkingUp_y = mean(mediaStepsWalkingUpY);
        mediaFINAL_WalkingUp_z = mean(mediaStepsWalkingUpZ);
        desvioP_WalkingUp_x = std(mediaStepsWalkingUpX);
        desvioP_WalkingUp_y = std(mediaStepsWalkingUpY);
        desvioP_WalkingUp_z = std(mediaStepsWalkingUpZ);
        disp("Walking Up X -> Media: " + mediaFINAL_WalkingUp_x);
        disp("Walking UP Y -> Media: " + mediaFINAL_WalkingUp_y);
        disp("Walking UP Z -> Media: " + mediaFINAL_WalkingUp_z);
        disp("Walking UP X -> Desvio Padrao: " + desvioP_WalkingUp_x);
        disp("Walking UP Y -> Desvio Padrao: " + desvioP_WalkingUp_y);
        disp("Walking UP Z -> Desvio Padrao: " + desvioP_WalkingUp_z);
        
        
        mediaFINAL_walkingDown_x = mean(mediaStepsWalkingDownX);
        mediaFINAL_walkingDown_y = mean(mediaStepsWalkingDownY);
        mediaFINAL_walkingDown_z = mean(mediaStepsWalkingDownZ);
        desvioP_walkingDown_x = std(mediaStepsWalkingDownX);
        desvioP_walkingDown_y = std(mediaStepsWalkingDownY);
        desvioP_walkingDown_z = std(mediaStepsWalkingDownZ);
        disp("Walking DOWN X -> Media: " + mediaFINAL_walkingDown_x);
        disp("Walking DOWN Y -> Media: " + mediaFINAL_walkingDown_y);
        disp("Walking DOWN Z -> Media: " + mediaFINAL_walkingDown_z);
        disp("Walking DOWN X -> Desvio Padrao: " + desvioP_walkingDown_x);
        disp("Walking DOWN Y -> Desvio Padrao: " + desvioP_walkingDown_y);
        disp("Walking DOWN Z -> Desvio Padrao: " + desvioP_walkingDown_z);

end




function [spmX, spmY, spmZ] = passosMinuto(xDFT, yDFT, zDFT, tamanho)
    N = tamanho;   
    fs = 50;             
    if (mod(N,2)==0)
        f = -fs/2:fs/N:fs/2-fs/N;
    else
        f = -fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
    end
    
   
    
    newf = f(f>0);
    
    
   
    xDFT = xDFT(f > 0);
    yDFT = yDFT(f > 0);
    zDFT = zDFT(f > 0);
    
    
    peaksX = findpeaks(xDFT);
    peaksY = findpeaks(yDFT);
    peaksZ = findpeaks(zDFT);
    
   
    threshold = 0.4;
    thresholdX = max(peaksX)*threshold;
    thresholdY = max(peaksY)*threshold;
    thresholdZ = max(peaksZ)*threshold;
    
    peakArrayX = peaksX(peaksX > thresholdX);
    peakArrayY = peaksY(peaksY > thresholdY);
    peakArrayZ = peaksZ(peaksZ > thresholdZ);

    
    spmX = newf(xDFT == peakArrayX(1))*60;
    spmY = newf(yDFT == peakArrayY(1))*60;
    spmZ = newf(zDFT == peakArrayZ(1))*60;

end
function [] = dif3D (freq_imp,atividades)
    
    formaGraf = ['o','o','o','+','+','+','*','*','*','*','*','*'];
    
    figure()
    
    for i=1:12    
      tempX=freq_imp{i}{1};
      
      tempY=freq_imp{i}{2};
      tempZ=freq_imp{i}{3};
      finalX=[];
      finalY=[];
      finalZ=[];
      for j=1:length(tempX)
          
           
           finalX(j)=tempX(j);
           finalY(j)=tempY(j);
           finalZ(j)=tempZ(j);
           
      end
      hold on
      
      plot3(finalX,finalY,finalZ,formaGraf(i));
      view(3) 
      
    end

    legend(atividades);
end
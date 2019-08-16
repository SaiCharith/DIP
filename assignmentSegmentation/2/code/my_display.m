            
function my_display(s1,res)
    myNumOfColors = 256;
    myColorScale = zeros(myNumOfColors,3);
    myColorScale(:,1) = 0:1/(myNumOfColors-1):1;% ,[0:1/(myNumOfColors-1):1] ,[0:1/(myNumOfColors-1):1]  ];
    myColorScale(:,2) = 0:1/(myNumOfColors-1):1;
    myColorScale(:,3) = 0:1/(myNumOfColors-1):1;
    figure();
    imagesc((s1));
    axis on;
    title(res); 
%     imwrite(mat2gray(s1),res);
    
    if size(s1,3)==1
%         colormap jet;
        colormap (myColorScale);
        colorbar;
    end
    daspect ([1 1 1]);
    axis tight;
    

            
function my_display(s1,res)
    myNumOfColors = 256;
    myColorScale = zeros(myNumOfColors,3);
    myColorScale(:,1) = 0:1/(myNumOfColors-1):1;% ,[0:1/(myNumOfColors-1):1] ,[0:1/(myNumOfColors-1):1]  ];
    myColorScale(:,2) = 0:1/(myNumOfColors-1):1;
    myColorScale(:,3) = 0:1/(myNumOfColors-1):1;
    figure();
    imagesc(mat2gray(s1));
    axis on;
    title(res); 
    size(s1,3);
    if size(s1,3)==1
        colormap (myColorScale);
        colorbar;
    end
    axis tight;
    

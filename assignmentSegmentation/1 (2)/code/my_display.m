            
function my_display(s1,res)
    myNumOfColors = 256;
    myColorScale = zeros(myNumOfColors,3);
    myColorScale(:,1) = 0:1/(myNumOfColors-1):1;% ,[0:1/(myNumOfColors-1):1] ,[0:1/(myNumOfColors-1):1]  ];
    myColorScale(:,2) = 0:1/(myNumOfColors-1):1;
    myColorScale(:,3) = 0:1/(myNumOfColors-1):1;
%     
    
    if size(s1,3)==1
%         colormap jet;
        colormap (myColorScale);
	    figure
	    imshow(mat2gray(s1)),colorbar
	    axis on;
	    title(res); 
    end	
    daspect ([1 1 1]);
    axis tight;
    

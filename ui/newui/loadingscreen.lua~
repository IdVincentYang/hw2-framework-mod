-- LuaDC version 0.9.20
-- 11/11/2008 7:35:15 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
LoadingScreen = 
{ 
    size = { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1, 
    RootElementSettings = 
    { 
        backgroundColor = { 0, 0, 0, 255, }, 
    }, 
; 
	{
		type = "Frame",
		name = "bgimage",
		visible = 1,
		position = {0, 0},
		size = {800, 600},
		BackgroundGraphic = 
		{
			type = "Graphic",
			size = {800, 600},
			color = { 255, 255, 255, 255, },
			textureUV = {0,0,1600,1200},
			texture = "Data:UI\\NewUI\\Textures\\background.tga",
		}, 
	; 
		{ 
			type = "Frame", 
			name="container",
			backgroundColor = "FEColorBackground1", 
			position = { 274, 268, }, 
			size = { 252, 65, }, 
		; 
			{ 
			    type = "Frame", 
			    name="containerBorder",
			    outerBorderWidth = 2, 
			    borderColor = "FEColorOutline", 
			    position = { 4, 4, }, 
			    size = { 244, 57, },
			}, 
			{ 
			    type = "Frame", 
			    name="progressBorder",
			    position = { 8, 20, }, 
			    size =  { 236, 16, }, 
			    outerBorderWidth = 2, 
			    borderColor =  { 107, 149, 172, 255, }, 
			    backgroundColor =  { 0, 0, 0, 50, }, 
			;
				{ 
				    type = "ProgressBar", 
				    progressColor =  { 240, 170, 0, 255, }, 
				    position =  { 2, 2, }, 
				    size = { 232, 12, }, 
				    name = "loadingProgress", 
				},
			},
			{
			    type = "TextLabel",
			    name = "moduleLabel",
			    position = { 0, 45, },
			    size = { 250, 20, },
			    Text =
			    {
				textStyle = "FEButtonTextStyle",
				color = { 255, 255, 255, 255, }, 
				hAlign = "Center",
				vAlign = "Top",
			     },
			},
		},
	},
}

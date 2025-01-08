function Initialize()
	Oldtime = {10,10,10,10}
	
	
	Arr =  {{{{90,45,90,90,90,90,90,90,90,90},{180,45,180,180,180,180,180,180,180,180}},{{90,90,90,90,180,90,90,90,90,90},{270,180,270,270,270,270,270,270,270,270}},{{90,90,90,90,90,90,90,90,90,90},      {270,270,270,270,180,270,270,270,270,270}},{{180, 180, 180, 180, 180, 180, 180, 180, 180, 180},{270,270,270,270,270,270,270,270,270,270}}},
			{{{0,45,0,0,0,0,0,0,0,0},         {180,45,90,90,180,180,180,90,180,180}},   {{90,0,90,90,0,90,90,90,90,90},   {180,90,270,270,180,180,180,270,180,180}}, {{180,180,180,180,0,90,90,180,180,180},{270,270,270,270,180,270,270,270,270,270}},{{0,0,0,0,0,0,0,0,0,0},                             {180,180,180,180,180,270,270,180,180,180}}},
			{{{0,45,90,90,0,0,0,45,0,0},      {180,45,180,180,180,180,180,45,135,180}}, {{0,45,90,90,0,0,0,45,0,0},       {180,45,270,270,90,90,90,45,90,90}},       {{0,0,0,0,0,90,90,0,0,0},              {180,180,270,270,270,270,270,180,270,270}},{{0,0,0,0,0,180,180,0,0,0},                         {180,180,180,180,180,270,270,180,225,180}}},
			{{{0,45,0,0,0,0,0,45,45,0},       {180,45,180,90,90,90,180,45,180,90}},     {{0,45,90,90,90,90,90,45,90,90},  {180,45,180,270,270,270,180,45,180,270}},  {{0,0,90,180,180,180,180,0,180,180},   {180,180,270,270,270,270,270,180,270,270}},{{0,0,0,0,0,0,0,0,180,0},                           {180,180,270,180,180,180,180,180,315,180}}},
			{{{0,45,0,90,45,90,0,45,0,90},    {180,45,180,180,45,180,180,45,180,180}},  {{0,45,0,90,45,90,0,45,0,90},     {90,45,90,270,45,270,90,45,90,270}},       {{0,0,90,0,0,0,0,0,0,0},               {270,180,270,270,180,270,270,180,270,270}},{{0,0,180,0,0,0,0,0,0,0},                           {180,180,270,180,180,180,180,180,180,180}}},
			{{{0,45,0,0,45,0,0,45,0,0},       {90,45,90,90,45,90,90,45,90,90}},         {{90,45,90,90,45,90,90,45,90,90}, {270,45,270,270,45,270,270,45,270,270}},   {{90,0,90,90,0,90,90,0,90,90},         {270,90,270,270,90,270,270,90,270,270}},   {{0,0,0,0,0,0,0,0,0,0},                             {270,270,270,270,270,270,270,270,270,270}}}}
	
	Midarr =   {{{90,180},{180,270}},
				{{0,180}, {0,180}},
				{{0,90},  {0,270}},
				{{90,180},{180,270}},
				{{0,180}, {0,180}},
				{{0,90},  {0,270}}}
	
	T = 0
	
	Time = {0, 0, 0, 10}
	Rotate = false
	speed = tonumber(SKIN:GetVariable('Speed'))
	
	scale = tonumber(SKIN:GetVariable('Scale'))/6
	offset = 0

	Oldarr = {}
	for i=1,4 do
		Oldarr[i] = {}
		if(i>=3) then
			offset = 2*scale
		end
		for j=1,6 do
			Oldarr[i][j] = {}
			for k=1,4 do
				Oldarr[i][j][k] = {}
				for l=1,2 do
					Oldarr[i][j][k][l] = 45
					SKIN:GetMeter('Meter'..i..j..k..l):SetY((j-1)*scale)
					SKIN:GetMeter('Meter'..i..j..k..l):SetX(((i-1)*200)+((k-1)*50)+offset)
				end
			end
		end
	end
	
	Oldmidarr = {}
	for i=1,6 do
		Oldmidarr[i] = {}
		for j=1,2 do
			Oldmidarr[i][j] = {}
			for k=1,2 do
				Oldmidarr[i][j][k] = nil
				SKIN:GetMeter('MeterMid'..i..j..k):SetY((i-1)*scale)
				SKIN:GetMeter('MeterMid'..i..j..k):SetX(((j-1)*50)+400)
			end
		end
	end
end

function Update()
	
	Time[1] = math.floor(((SKIN:GetMeasure("MeasureTime"):GetValue())%86400)/36000)
	Time[2] = math.floor(((SKIN:GetMeasure("MeasureTime"):GetValue())%86400)/3600)%10
	
	Time[3] = math.floor(((SKIN:GetMeasure("MeasureTime"):GetValue())%3600)/600)
	Time[4] = math.floor((SKIN:GetMeasure("MeasureTime"):GetValue())/60)%10
	
	-- Time[1] = math.floor((SKIN:GetMeasure("MeasureTime"):GetValue())/60)%10
	-- Time[2] = math.floor((SKIN:GetMeasure("MeasureTime"):GetValue())/60)%10
	
	-- Time[3] = math.floor((SKIN:GetMeasure("MeasureTime"):GetValue())/60)%10
	-- Time[4] = math.floor((SKIN:GetMeasure("MeasureTime"):GetValue())/60)%10
	if((not Rotate) and Oldtime[4] ~= Time[4]) then
		for li=1,4 do
			Oldtime[li] = Time[li]
			for i=1,6 do
				for j=1,4 do
					for k=1,2 do
						-- print(Oldarr[li][i][j][k])
						Oldarr[li][i][j][k] = SKIN:GetMeasure('Measure'..li..i..j..(3-k)):GetNumberOption('Formula')
					end
				end
			end
			end
		
		for i=1,6 do
			for j=1,2 do
				for k=1,2 do
					Oldmidarr[i][j][k] = SKIN:GetMeasure('MeasureMid'..i..j..(3-k)):GetNumberOption('Formula')
				end
			end
		end	
		Rotate = true
	end
	if(Rotate) then
		T = T + speed
		for li=1,4 do
			for i=1,6 do
				for j=1,4 do
					for k=1,2 do
						SKIN:Bang('!SetOption', 'Measure'..li..i..j..k, 'Formula', Lerp(Oldarr[li][i][j][k], Arr[i][j][k][Oldtime[li]+1]))
					end
				end
			end
		end
		for i=1,6 do
			for j=1,2 do
				for k=1,2 do
					SKIN:Bang('!SetOption', 'MeasureMid'..i..j..k, 'Formula', Lerp(Oldmidarr[i][j][k], Midarr[i][j][k]))
				end
			end
		end
		if(T >= 1) then
			Rotate = false
			T = 0
		end
	end
end

function Lerp(old, new)
	return (T*(new+360) + (1-T)*old)%360
end

/*-----------------------------------
Written by Amadeo Delgado Casado
23/01/2019
Licensed under AGPL
-------------------------------------*/




delete $*

--If there is any open rollout, close it
try(destroydialog ProcedimentalRollout) catch ()


-- Variables for all posibles walls

global wallInstances
global GeneratedRoom

global window
global window2
global window3
global door
global door2
global door3
global wall1
global wall2
global wall3


rollout ProcedimentalRollout "ProcedimentalRollout" width:525 height:580
(
	label 'ProcedimentalTool"' "Procedimental tool" pos:[76,24] width:112 height:16 align:#left

	groupBox 'WallsSettingsText' "Wall" pos:[24,64] width:232 height:216 align:#left
	groupBox 'LenghtsGroupBox' "Lenghts" pos:[40,96] width:200 height:112 align:#left
	spinner 'WallLenght1' "" pos:[56,128] width:168 height:16 range:[0,1000,100] align:#left
	spinner 'WallLenght2' "" pos:[56,152] width:168 height:16 range:[0,1000,50]align:#left
	spinner 'WallLenght3' "" pos:[56,176] width:168 height:16 range:[0,1000,125]align:#left
	spinner 'WallHeight' "Height       " pos:[48,216] width:124 height:16 range:[0,1000,80] align:#left
	spinner 'WallThicness' "Thicness   " pos:[48,240] width:124 height:16 range:[0,1000,5]align:#left

	groupBox 'WindowGroupBox' "Window" pos:[24,288] width:232 height:112 align:#left
	spinner 'WindowHeight' "Height       " pos:[48,320] width:124 height:16 range:[0,1000,40]align:#left
	spinner 'WindowLenght' "Lenght      " pos:[48,344] width:125 height:16 range:[0,1000,20]align:#left
	spinner 'WindowFloorDistance' "Floor Distance     " pos:[48,368] width:93 height:16 range:[0,WallHeight.value,20]align:#left

	groupBox 'DoorGroupBox' "Door" pos:[24,408] width:232 height:88 align:#left
	spinner 'DoorHeight' "Height       " pos:[48,440] width:124 height:16 range:[0,WallHeight.value,60]align:#left
	spinner 'DoorLenght' "Lenght      " pos:[48,464] width:125 height:16 range:[0,1000,25]align:#left

	button 'GenerateButton' "Generate Modules" pos:[24,512] width:232 height:32 align:#left
  
	groupBox 'grp35' "Room Genrator" pos:[275,64] width:232 range:[0,100000,0] height:120 align:#left 
	spinner 'posX' "Position   " pos:[291,96] width:55  height:16 range:[-100000,100000,0] align:#left
	spinner 'posY' "" pos:[395,96] width:48 height:16 range:[-100000,100000,0] align:#left
	spinner 'posZ' "" pos:[450,96] width:48 height:16 range:[-100000,100000,0]  align:#left
	spinner 'RoomLenght' "Lenght    " pos:[291,120] width:147 height:16 range:[0,100000,400] align:#left
	spinner 'RoomWidth' "Width     " pos:[291,144] width:146 height:16 range:[0,100000,700]   align:#left

	button 'RoomButton' "Generate room" pos:[275,200] width:232 height:32 align:#left enabled:false

	pickButton 'ChangeWall' "Change to Wall" pos:[275,270] width:232 height:32 align:#left enabled:false autoDisplay:false
	pickButton 'ChangeWindow' "Change to Window" pos:[275,300] width:232 height:32 align:#left enabled:false autoDisplay:false
	pickButton 'ChangeDoor' "Change to Door" pos:[275,330] width:232 height:32 align:#left enabled:false autoDisplay:false
	







on ChangeWall picked obj do
	(
		/* When this button is pressed it changes the selected object
		with a wall deppending on its type
		*/


		if (obj.name=="1") then 
			(
			wall= instance  wall1
			wall.parent=obj.parent
			wall.rotation=obj.rotation
			wall.pos=obj.pos			
			wall.name=obj.name
			wall.wirecolor=obj.wirecolor
			
			
		)

		if (obj.name=="2") then 
			(
			wall= instance  wall2
			wall.parent=obj.parent
			wall.rotation=obj.rotation
			wall.pos=obj.pos
			wall.name=obj.name
			
			wall.wirecolor=obj.wirecolor
			
		)

		if (obj.name=="3") then 
			(
			wall= instance  wall3
			wall.parent=obj.parent
			wall.rotation=obj.rotation
			wall.pos=obj.pos
			wall.name=obj.name
			
			wall.wirecolor=obj.wirecolor
			
		)

		delete obj
	
)

on ChangeDoor picked obj do
	(
		/* When this button is pressed it changes the selected object
		with a door deppending on its type
		*/

		if (obj.name=="1") then 
			(
			wall= instance  door
			wall.parent=obj.parent
			wall.rotation=obj.rotation
			wall.pos=obj.pos
			wall.name=obj.name			
			wall.wirecolor=obj.wirecolor
			
		)

		if (obj.name=="2") then 
			(
			wall= instance  door2
			wall.parent=obj.parent
			wall.rotation=obj.rotation
			wall.pos=obj.pos
			wall.name=obj.name
		
			wall.wirecolor=obj.wirecolor
			
		)

		if (obj.name=="3") then 
			(
			wall= instance  door3
			wall.parent=obj.parent
			wall.rotation=obj.rotation
			wall.pos=obj.pos
			wall.name=obj.name
			
			wall.wirecolor=obj.wirecolor
			
		)
		delete obj
)

on ChangeWindow picked obj do
	(
		/* When this button is pressed it changes the selected object
		with a window deppending on its type
		*/
		
		if (obj.name=="1") then 
			(
			wall= instance  window
			wall.parent=obj.parent
			wall.rotation=obj.rotation
			wall.pos=obj.pos
			wall.name=obj.name
			
			wall.wirecolor=obj.wirecolor
			
		)

		if (obj.name=="2") then 
			(
			wall= instance  window2
			wall.parent=obj.parent
			wall.rotation=obj.rotation
			wall.pos=obj.pos
			wall.name=obj.name
			
			wall.wirecolor=obj.wirecolor
			
		)

		if (obj.name=="3") then 
			(
			wall= instance  window3
			wall.parent=obj.parent
			wall.rotation=obj.rotation
			wall.pos=obj.pos
			wall.name=obj.name
			
			wall.wirecolor=obj.wirecolor
			
		)
	
		delete obj

)




on WallHeight changed val do 
(
		WindowFloorDistance.range=[0,val,WindowFloorDistance.value]
		DoorHeight.range=[0,val,WindowFloorDistance.value]
)--So Floor distance is never superior to wallheight

on GenerateButton pressed do 
	(

		/* This function re/generates all walls,doors and windows 
		with the data provided
		*/

		--Enable room generation
		RoomButton.enabled=true
		
		

		--Reestart scene
		delete $*

	
	

		wallInstances = Point pos:[0,0,0] name:"Wall instances"

		--Walls
		wall1= Box pos:[-200,0,0] name:"Wall1" length:WallLenght1.value width:WallThicness.value height:WallHeight.value 
		wall1.pivot=wall1.min
		wall2= Box pos:[0,0,0] name:"Wall2" length:WallLenght2.value width:WallThicness.value height:WallHeight.value
		wall2.pivot=wall2.min
		wall3= Box pos:[200,0,0] name:"Wall3" length:WallLenght3.value width:WallThicness.value height:WallHeight.value
		wall3.pivot=wall3.min

		--Window Walls

		window= Box pos:[-200,200,0] name:"Window1" 
		--window.pivot=window.min
		window2= Box pos:[0,200,0] name:"Window2" 
		--window2.pivot=window2.min
		window3= Box pos:[200,200,0] name:"Window3" 
		--window3.pivot=window3.min

		windows=#(window,window2,window3)
		counter=0
		for window in windows do
		(
			counter+=1
			window.length = WindowLenght.value
			window.height = WindowFloorDistance.value
			window.width  = WallThicness.value
			
			convertTo window Editable_Poly 

			case counter of
				(
					1: polyop.extrudeFaces window #{3,5} ((WallLenght1.value-WindowLenght.value)/2)
					2: polyop.extrudeFaces window #{3,5} ((WallLenght2.value-WindowLenght.value)/2)
					3: polyop.extrudeFaces window #{3,5} ((WallLenght3.value-WindowLenght.value)/2)
					default:print "error"

			)
			
			
			
			polyop.extrudeFaces window #{9,13}  WindowHeight.value
			polyop.extrudeFaces window #{9,13} ( WallHeight.value - WindowFloorDistance.value  - WindowHeight.value )

			window.SetSelection #Face #{23, 27}
			
			window.bridgeSelected = 1

		
			window.Bridge selLevel: #Face 

			window.pivot=window.min
			
		)

		--door
		door = Box pos:[-200,400,0] name:"Door1" 
		
		door2 = Box pos:[0,400,0] name:"Door2" 
		
		door3 = Box pos:[200,400,0] name:"Door3" 
		
		doors=#(door,door2,door3) 
		counter = 0
		for doorelm in doors  do
			(
				counter+=1

				case counter of
					(
						1: doorelm.length = ((WallLenght1.value-DoorLenght.value)/2)
						2: doorelm.length = ((WallLenght2.value-DoorLenght.value)/2)
						3: doorelm.length = ((WallLenght3.value-DoorLenght.value)/2)
						default:print "error"
	
				)

				
				doorelm.height = DoorHeight.value
				doorelm.width  = WallThicness.value

				convertTo doorelm Editable_Poly 

				polyop.extrudeFaces doorelm #{2} (WallHeight.value - DoorHeight.value)

				polyop.extrudeFaces doorelm #{9} DoorLenght.value

				case counter of
					(
						1: polyop.extrudeFaces doorelm #{9} ((WallLenght1.value-DoorLenght.value)/2)
						2: polyop.extrudeFaces doorelm #{9} ((WallLenght2.value-DoorLenght.value)/2)
						3: polyop.extrudeFaces doorelm #{9} ((WallLenght3.value-DoorLenght.value)/2)
						default:print "error"
	
				)
				
				polyop.extrudeFaces doorelm #{15} DoorHeight.value
				


				doorelm.pivot=doorelm.min
			)
	
			--Groups all instances 
			wall1.parent=wallInstances
			wall2.parent=wallInstances
			wall3.parent=wallInstances
			door.parent=wallInstances
			door2.parent=wallInstances
			door3.parent=wallInstances
			window.parent=wallInstances
			window2.parent=wallInstances
			window3.parent=wallInstances

			wallInstances.position=[0,-1250,0]
	
	)

on RoomButton pressed do
(
	/* This fuction generates a room in the position provided
	and fills it with instances of the walls */

	struct OPosition(x,y,z)
	OriginPosition = OPosition x:posX.value y:posY.value z:posZ.value

	GeneratedRoom = Point pos:[OriginPosition.x,OriginPosition.y,OriginPosition.z] name:"Room"

	--Enables changing walls buttons
	ChangeWall.enabled=true
	ChangeWindow.enabled=true
	ChangeDoor.enabled=true
	
	
	--Number of walls per posible lenght
	nwall1=0
	nwall2=0
	nwall3=0

	--Number of walls per posible Width
	Wwall1=0
	Wwall2=0
	Wwall3=0

	

	--3 lenghts of walls
	Lengths = #(WallLenght1.value,WallLenght2.value,WallLenght3.value)
	
	
	RoomLenghte = RoomLenght.value
	RoomWidthe = RoomWidth.value

	numberOfWalls=0 as integer
	Completed=false

	/* Loops until there is no posible division bigger than 1
	then returns number of walls and types
	*/

	--Loop 1 for lenghts
	while (Completed==false) do
	(
		

		counter = 0
		Repeticions  = 9999999
		DistanceLeft = 9999999
		typeofwall = 0 as integer
		
		for length_es in Lengths do
			(	
				
				counter+=1

				--Number of posible walls to fit and space left
				numberOfWalls = (RoomLenghte / length_es) as integer
				SpaceLeft = (RoomLenghte - (numberOfWalls*length_es ))

				--No posible wall end loop
				if(counter==3 and numberOfWalls == 0 )then (Completed=true  )

				if(numberOfWalls != 0 ) then
				(
					if (SpaceLeft < DistanceLeft  ) then
						(
							Repeticions=numberOfWalls
							DistanceLeft=SpaceLeft
							typeofwall=counter

						)

					if (SpaceLeft == DistanceLeft and numberOfWalls < Repeticions  ) then 
						(
							Repeticions=numberOfWalls
							DistanceLeft=SpaceLeft
							typeofwall=counter
						)


				)
			)

			
			if (Completed==false) then 
				(
			
					case typeofwall of
				(
					1: (
						nwall1=Repeticions 
						)

					2: (
						nwall2=Repeticions 
					)

					3: (
						nwall3=Repeticions 
					)	

					default:Print"error"				
				)

			
			RoomLenghte=DistanceLeft
			
		)



	)

	--reset
	Completed=false
	numberOfWalls=0

   --Number of walls along width
	while (Completed==false) do
		(
			counter = 0
			Repeticions  = 9999999
			DistanceLeft = 9999999
			typeofwall = 0 as integer
			
			for length_es in Lengths do
				(	
					
					counter+=1
	
						--Number of posible walls to fit and space left
					numberOfWalls = (RoomWidthe / length_es) as integer
					SpaceLeft = (RoomWidthe - (numberOfWalls*length_es ))
	
					--No posible wall end loop
					if(counter==3 and numberOfWalls == 0 )then (Completed=true  )
	
					if(numberOfWalls != 0 ) then
					(
						if (SpaceLeft < DistanceLeft  ) then
							(
								Repeticions=numberOfWalls
								DistanceLeft=SpaceLeft
								typeofwall=counter
	
							)
	
						if (SpaceLeft == DistanceLeft and numberOfWalls < Repeticions  ) then 
							(
								Repeticions=numberOfWalls
								DistanceLeft=SpaceLeft
								typeofwall=counter
							)
	
	
					)
				)
	
				
				if (Completed==false) then 
					(
				
						case typeofwall of
					(
						1: (
							Wwall1=Repeticions 
							)
	
						2: (
							Wwall2=Repeticions 
						)
	
						3: (
							Wwall3=Repeticions 
						)	
	
						default:Print"error"				
					)
	
				
				RoomWidthe=DistanceLeft

			)
	
	
	
		)

	
	

--Intanciate lenght walls
	
if (nwall1 != 0 ) then(
	for i=1  to nwall1 do 
	(

		Wall = instance wall1 
		Wall2 =instance wall1

		wall.parent=GeneratedRoom
		wall2.parent=GeneratedRoom

		Wall.name="1"
		Wall2.name="1"

		Wall.wirecolor=color 8 8 136
		Wall2.wirecolor=color 8 8 136

		Wall.pos=[OriginPosition.x,OriginPosition.y,OriginPosition.z]
		Wall2.pos=[OriginPosition.x + RoomWidth.value - wall1.width ,OriginPosition.y,OriginPosition.z]
		OriginPosition.y = (OriginPosition.y + wall1.length)

	)
)

if (nwall2 != 0 ) then(
	for i=1  to nwall2 do 
		(
			
			Wall= instance wall2
			Wall2=instance wall2

			wall.parent=GeneratedRoom
			wall2.parent=GeneratedRoom

			Wall.name="2"
			Wall2.name="2"

			Wall.wirecolor=color 8 8 136
		    Wall2.wirecolor=color 8 8 136
	
			Wall.pos=[OriginPosition.x,OriginPosition.y,OriginPosition.z]
			Wall2.pos=[OriginPosition.x + RoomWidth.value - wall2.width  ,OriginPosition.y,OriginPosition.z]
			OriginPosition.y = (OriginPosition.y + wall2.length)
	
		))

if (nwall3 != 0 ) then(
	for i=1  to nwall3 do 
			(
				
				Wall = instance wall3
				Wall2=instance wall3

				wall.parent=GeneratedRoom
				wall2.parent=GeneratedRoom

				Wall.name="3"
				Wall2.name="3"

				Wall.wirecolor=color 8 8 136
				Wall2.wirecolor=color 8 8 136
		
				Wall.pos=[OriginPosition.x,OriginPosition.y,OriginPosition.z]
				Wall2.pos=[OriginPosition.x + RoomWidth.value - wall3.width,OriginPosition.y,OriginPosition.z]
				OriginPosition.y = (OriginPosition.y + wall3.length)
		
			)
		)


--reset
OriginPosition.x=posX.value
OriginPosition.y=posY.value
OriginPosition.Z=posZ.value

--Intanciate width walls


	if (Wwall1 != 0 ) then(
			for i=1  to Wwall1 do 
			(
				
				Wall = instance wall1 
				Wall2 =instance wall1

				wall.parent=GeneratedRoom
				wall2.parent=GeneratedRoom

				Wall.name="1"
				Wall2.name="1"

				Wall.rotation.z_rotation=-90
				Wall2.rotation.z_rotation=-90

				Wall.wirecolor=color 8 8 136
				Wall2.wirecolor=color 8 8 136
				
				Wall.pos=[OriginPosition.x,OriginPosition.y + wall1.width ,OriginPosition.z]
				
				if((RoomWidth.value - RoomLenght.value) > 0) then(
				Wall2.pos=[OriginPosition.x  ,OriginPosition.y + RoomWidth.value - ( abs (RoomWidth.value - RoomLenght.value )) ,OriginPosition.z])

				if((RoomWidth.value - RoomLenght.value) <= 0) then(
					Wall2.pos=[OriginPosition.x  ,OriginPosition.y + RoomWidth.value + ( abs (RoomWidth.value - RoomLenght.value )) ,OriginPosition.z])

				
				
				OriginPosition.x = (OriginPosition.x + wall1.length)
		
			)
		)

		if (Wwall2 != 0 ) then(
			for i=1  to Wwall2 do 
			(

				Wall = instance wall2 
				Wall2 =instance wall2

				wall.parent=GeneratedRoom
				wall2.parent=GeneratedRoom

				Wall.name="2"
				Wall2.name="2"

				Wall.rotation.z_rotation=-90
				Wall2.rotation.z_rotation=-90
				

				Wall.wirecolor=color 8 8 136
				Wall2.wirecolor=color 8 8 136
				
				Wall.pos=[OriginPosition.x,OriginPosition.y + wall2.width ,OriginPosition.z]
				
				if((RoomWidth.value - RoomLenght.value) > 0) then(
					Wall2.pos=[OriginPosition.x  ,OriginPosition.y + RoomWidth.value - ( abs (RoomWidth.value - RoomLenght.value )) ,OriginPosition.z])
	
					if((RoomWidth.value - RoomLenght.value) <= 0) then(
						Wall2.pos=[OriginPosition.x  ,OriginPosition.y + RoomWidth.value + ( abs (RoomWidth.value - RoomLenght.value )) ,OriginPosition.z])
				
				OriginPosition.x = (OriginPosition.x + wall2.length)
		
			)
		)

		if (Wwall3 != 0 ) then(
			for i=1  to Wwall3 do 
			(

				Wall = instance wall3
				Wall2 =instance wall3

				wall.parent=GeneratedRoom
				wall2.parent=GeneratedRoom

				Wall.name="3"
				Wall2.name="3"

				Wall.rotation.z_rotation=-90
				Wall2.rotation.z_rotation=-90

				Wall.wirecolor=color 8 8 136
				Wall2.wirecolor=color 8 8 136
		
				Wall.pos=[OriginPosition.x,OriginPosition.y + wall3.width,OriginPosition.z]
				if((RoomWidth.value - RoomLenght.value) > 0) then(
					Wall2.pos=[OriginPosition.x  ,OriginPosition.y + RoomWidth.value - ( abs (RoomWidth.value - RoomLenght.value )) ,OriginPosition.z])
	
					if((RoomWidth.value - RoomLenght.value) <= 0) then(
						Wall2.pos=[OriginPosition.x ,OriginPosition.y + RoomWidth.value + ( abs (RoomWidth.value - RoomLenght.value )) ,OriginPosition.z])

				OriginPosition.x = (OriginPosition.x + wall3.length)
		
			)
		)

		)
	
--End rollout
)






createDialog ProcedimentalRollout

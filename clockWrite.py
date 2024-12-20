configa = open("ClockTemp.txt", "r")
config = open("ClockActual.txt", "w")
config.write(configa.read())



for i in range(1,5):
    for j in range(1,7):
        for k in range(1,5):
            for l in range(1, 3):
                config.write(f"[Measure{i}{j}{k}{l}]\n")
                config.write('Measure=Calc\n')
                config.write('Formula=45\n\n')

                config.write(f"[Meter{i}{j}{k}{l}]\n")
                config.write('Meter=ROUNDLINE\n')
                config.write(f'MeasureName=Measure{i}{j}{k}{l}\n')
                config.write('X=0\n')
                config.write('Y=0\n')
                config.write('W=#PosScale#\n')
                config.write('H=#PosScale#\n')
                config.write('LineLength=#LineLength#\n')
                config.write('LineWidth=2\n')
                config.write('AntiAlias=1\n')
                config.write('StartAngle=4.7124\n')
                config.write('RotationAngle=6.2832\n')
                config.write('SetAngle=1\n')
                config.write('ValueRemainder=360\n\n')

for i in range(1,7):
    for j in range(1,3):
        for k in range(1,3):
            config.write(f"[MeasureMid{i}{j}{k}]\n")
            config.write('Measure=Calc\n')
            config.write('Formula=45\n\n')

            config.write(f"[MeterMid{i}{j}{k}]\n")
            config.write('Meter=ROUNDLINE\n')
            config.write(f'MeasureName=MeasureMid{i}{j}{k}\n')
            config.write('X=0\n')
            config.write('Y=0\n')
            config.write('W=#PosScale#\n')
            config.write('H=#PosScale#\n')
            config.write('LineLength=#LineLength#\n')
            config.write('LineWidth=2\n')
            config.write('AntiAlias=1\n')
            config.write('StartAngle=4.7124\n')
            config.write('RotationAngle=6.2832\n')
            config.write('SetAngle=1\n')
            config.write('ValueRemainder=360\n\n')

config.close()
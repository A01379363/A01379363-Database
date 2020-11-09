import serial

ser = serial.Serial('COM5', 9600)
while(1):
    value = ser.readline()
    print(value)
clear 
clc
prefix='./two_plate_total_field_mesh';
fnam=strcat(prefix,'.nas');
fid=fopen(fnam,'r');
for i=1:6
    fgetl( fid );
end
tline = fgetl( fid );
triNum = sscanf(tline, '$           triangles:         %d');
vertex0=zeros(3*triNum,3);
triangle=zeros(triNum,3);
for i=1:2
    fgetl( fid );
end
tline=fgetl( fid );
vertNum=0;
while(~startsWith(tline,'ENDDATA'))
while (startsWith(tline,'GRID*'))
    data1 = sscanf(tline, 'GRID* %d%f%f%d');
    tline = fgetl( fid );
    data2 = sscanf(tline, '* %d%f');
    vertex0(data1(1),:)=[data1(2),data1(3),data2(2)];
    tline = fgetl( fid );
    vertNum=vertNum+1;
end
while (startsWith(tline,'CTRIA3'))
    data3 = sscanf(tline, 'CTRIA3 %d%d%d%d%d');
    triangle(data3(1),:)=[data3(3),data3(4),data3(5)];
    tline = fgetl( fid );
end
end
fclose(fid);
vertex=vertex0(1:vertNum,:);

p=vertex';
t0=triangle';
t=[t0;ones(1,triNum)];
save fekoMesh p t;
figure
viewer fekoMesh
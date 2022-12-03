%añadimos cambio
P = [1 2 3 4];         
T = [4.0008 3.4 1.3 1.0]   

net = newgrnn(P,T);        
x=[0.2,0.8];               
y=sim(net,x)     
input = 'C:/Users/juanj/OneDrive/Documentos/Examen Castillo/dataset1.csv'
inputs = csvread(input); 

net = competlayer(50);            
net = train(net,inputs);       
outputs = net(inputs);         
classes = vec2ind(outputs)      
c=hist(classes,4)              
  
xy = 'C:/Users/juanj/Downloads/dataset2.csv'
x = csvread(xy);  
plot(x(1,:),x(2,:),'o')  
set(gcf,'color','w')  
title('Datos sin procesar')  
net = selforgmap([6 6]);        
net = train(net,x);            
y = net(x);  
classes = vec2ind(y);  
hist(classes,64)                
set(gcf,'color','w')  
title('Resultados de agrupamiento')  
xlabel('Categoria')  
ylabel('Numero de muestras que contiene la clase')  
net = selforgmap([1,6]);  
net = train(net,x);  
y = net(x);  

classes = vec2ind(y);  
c=hist(classes,8)           
plotsomhits(net,x)        
plotsompos(net,x)            
plotsompos(net,x)   
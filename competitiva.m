clc
clear
close all
%patrones de entrada
p =[0.2 0.3
    1.8 0.5
   0.6 0.2
   0.9 0.8]
%neuronas
w=[1 1
   1 1]
tamP = size(p);
tamN = size(w);
for neurona = 1: tamN
    resDist = [];
    %Se calcula la distancia de cada neurona con todos los patrones
    for patron = 1: tamP
        wp = p(patron,:)-w(neurona,:);
        dwp = sqrt((wp(1)^2)+(wp(2)^2));%ajustar al tamaño de nuestra neurona
        %Se guardan los resultados para despues ver cual es el menor 
        resDist = [resDist, dwp];
    end
    %Sacamos el valor minimo de nuestras distancias
    [valor, posicion] = min(resDist);
    %En caso de realizar por maximo ocupamos
    %[valor, posicion] = max(resDist);
    %Se almacena la mejor neurona, junto con el mejor patron
    pp = p(posicion, :);
    wnuevo= w(neurona, :);
    %sacamos el angulo y magnitud de nuestro patron
    mP = sqrt((pp(1)^2) + (pp(2)^2)); %ajustar al tamaño de nuestra neurona
    oP = atand(pp(2)/pp(1));
    "Magnitud de " + mP + " & " + oP + "°" + " de nuestro patrón, la neurona debe aproximarse"
    "El patrón " + posicion + " es el patrón ganador con respecto a la neurona " + neurona
    %guardamos los valores y vemos que tanto van cambiando
    varMag = [];
    varAng = [];
    %Se ajustan pesos y calculan salidas para cada neurona ganadora
    for rec = 1:15 %total de iteraciones para el ajuste
        wnuevo = wnuevo + 0.5 * (pp-wnuevo);
        m = sqrt((wnuevo(1)^2) + (wnuevo(2)^2)); %ajustar al tamaño de nuestra neurona
        o = atand(wnuevo(2)/wnuevo(1));
        if m == mP && o == oP
            "Magnitud de " + m + " & " + o + "°"
            "Se convergio nuestra neurona se acerco al patron"
            break
        end
        "Magnitud de " + m + " & " + o + "°"
    end
end
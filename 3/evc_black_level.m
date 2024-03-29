%
% Copyright 2016 Vienna University of Technology.
% Institute of Computer Graphics and Algorithms.
%

function [result, asShotNeutral, fnc_read_file_info, fnc_tranform_colors] = evc_black_level(input, filename)
% Diese Funktion ist die Hauptfunktion.
% Sie ruft in der richtigen Reihenfolge die zu implementierenden Funktionen auf.
% ACHTUNG: Diese Funktion darf nicht ver�ndert werden!

	fnc_read_file_info = @(filename) evc_read_file_info(filename);
	fnc_tranform_colors = @(input, blackLevel) evc_transform_colors(input, blackLevel);

	[blackLevel, asShotNeutral] = evc_read_file_info(filename);
	result                      = evc_transform_colors(input, blackLevel);
end

function [blackLevel, asShotNeutral] = evc_read_file_info(filename)
% evc_read_file_info liest den Schwarzwert(blackLevel) und
% den neutralen Wei�abgleich(asShotNeutral) aus der Datei,
% die durch filename beschrieben ist, aus.
%
%   EINGABE
%   filename       Dateiname des Bildes (f�r imfinfo)
%
%   AUSGABE
%   blackLevel     Schwarzwert, welcher in den Bildinformationen
%                  gespeichert ist (siehe imfinfo)
%   asShotNeutral  Neutraler Wei�abgleich, welcher in den
%                  Bildinformationen gespeichert ist (siehe imfinfo)

    info = imfinfo(filename);
    blackLevel = info.BlackLevel
    asShotNeutral = info.AsShotNeutral
end

function [result] = evc_transform_colors(input, blackLevel)    
% evc_transform_colors verschiebt und skaliert den Kontrast so, dass Schwarz
% (blackLevel und Werte darunter) auf 0 und Wei� auf 1 abgebildet wird.
% Das Bild, das in input �bergeben wird, verwendet den Wei�wert 65535.
%
%   EINGABE
%   input       Eingabebild
%   blackLevel  Schwarzwert, welcher in den Bildinformationen
%               gespeichert ist (siehe imfinfo)
%
%   AUSGABE
%   result      Das Bild im double Format, wobei das Interval
%               [Schwarzwert, 65535] auf [0, 1] abgebildet wurde
%               und alle Werte kleiner oder gleich dem Schwarzwert 0 sind.

    result = double(input);
    result = result - blackLevel;
    result(result < 0) = 0;
    result = result / (65535 - blackLevel);
end

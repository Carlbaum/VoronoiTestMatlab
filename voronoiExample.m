close all;
clear all;
width = 800;
height = 600;
numberOfCells = 600;

voronoiImage = CreateVoronoiImage(width,height,numberOfCells);

imshow(voronoiImage);


# Assignment 2

# Where is my AliExpress package? 

![The box](https://i.imgur.com/HNF7P0N.png)

# Pastas

## Data
Contém os dados coletados com o Kinect V2.
Inclui a foto que o sensor tirou, o OBJ e a texturização.

## CSV
Contém as nuvens de pontos em formato .csv, com colunas x,y,z. 
Elas são obtidas através do script **obj2points.py**, que recebe como argumento um OBJ.

## Visualization
Contém o código em Processing para visualizar os arquivos da pasta CSV.

## Weka
Contém os resultados da clusterização utilizando K-Means no Weka.

# Workflow

Exemplo do workflow do trabalho utilizando como exemplo a cena 2.

## 1 - Obter nuvem de pontos

```sh
$ python obj2points.py data/scene2.obj > csv/scene2.csv
```

## 2 - Clusterizar

No Weka, carregar o arquivo .csv da cena.

Na aba **Cluster**, rodar com o algoritmo K-Means. 

Nos nossos experimentos, 10 clusters foi o suficiente para esse tipo de cena.

Na aba **Visualize**, conseguimos esses resultados:

![](https://i.imgur.com/eNnrzkD.png)

Clicando no cluster da caixa, é possível extrair alguns pontos. Salvamos esses pontos em um arquivo **scene2_box_cluster**.

## 3 - Visualizar

```sh
$ python parse_cluster.py csv/scene2_box_cluster > csv/scene2_box_points.csv
```

Esses dois arquivos são carregados em Processing (**Visualization**). 

Uma pequena animação ocorre na região dos pontos identificados.

![](https://i.imgur.com/d9lVjFL.gif)



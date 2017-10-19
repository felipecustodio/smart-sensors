# Retreino

Instalei o Tensorflow sem utilizar a GPU do Notebook e sem compilar da fonte. A instalação foi feita utilizando *pip*. 

O primeiro passo foi clonar o repositório do Tensorflow para a HOME.

Seguindo o [tutorial de retreino do Tensorflow](https://www.tensorflow.org/tutorials/image_retraining):

``` sh
~/tensorflow on  master 
λ bazel-bin/tensorflow/examples/image_retraining/retrain --image_dir /home/crochi/Dropbox/code/ml/images --summaries_dir /home/crochi/Dropbox/code/ml/logs --how_many_training_steps 8000
```
Eu realizei o treino com o dobro do número de passos sugerido, para obter uma acurácia maior. Mesmo assim ainda rodou em apenas cerca de 20 minutos.

Configurações do notebook onde o projeto foi feito:
```
CPU: Intel i5-6200U (4) @ 2.700GHz 
Memory: 7854MiB 
```

Para visualizar o retreino e gerar gráficos, utilizei o Tensorboard:

``` sh
~ via ⬢ v8.7.0 
λ tensorboard --logdir /home/crochi/Dropbox/code/ml/logs
```

![Acurácia](https://i.imgur.com/kKX3hE7.png)

Peguei então os scripts de treino da pasta *tensorflow/examples/image_retraining* e copiei para o diretório do projeto 1.

Nesse diretório, tenho as pastas:
* **Logs** - Possui os logs de treino do Tensorflow que o Tensorboard visualizou
* **Layer** - Possui a nova camada de treino com as bases de dados novas
* **Images** - Bases de dados usadas para treino
* **Tests** - Imagens usadas para testes 

## Base de Dados

Utilizei o script *google.py* para obter imagens de diversas celebridades (~100 imagens). Peguei diversas fotos minhas ao longo dos anos, com cabelos diferentes, com e sem barba, diferentes locais, iluminação e roupas. Acho que essa diversificação contribuiu muito para a rede identificar mais o meu rosto do que uma pessoa com cabelo comprido e barba apenas. 

```
code/ml/images on  master [✘+?] 
λ ls

 bruce+springsteen   george+harrison   terry+crews
 bruce+willis        jerry+seinfeld    tom+petty
 elle+fanning        mark+knopfler
 felipe              neymar
```

 felipe sou eu! :) 


# Rodando com a nova camada:

``` sh
λ python image_retraining/label_image.py --graph=layer/output_graph.pb --labels=layer/output_labels.txt --output_layer=final_result:0  --image=tests/felipe7.jpg 
```

**Exemplos de Resultados:**

## Sucessos

Para a maioria dos casos, a rede obteve sucesso em seu chute, com grande precisão, quase sempre acima de 90%.

Utilizando novas fotos tiradas com a webcam do notebook. 

Rodando com 'felipe2.jpg'

```
felipe (score = 0.99210)
bruce springsteen (score = 0.00473)
mark knopfler (score = 0.00130)
bruce willis (score = 0.00125)
george harrison (score = 0.00052)
```

Rodando com 'willis1.jpg'

```
bruce willis (score = 0.99510)
mark knopfler (score = 0.00199)
bruce springsteen (score = 0.00110)
felipe (score = 0.00079)
jerry seinfeld (score = 0.00078)
```

## Falhas

Rodando com uma foto do **Terry Crews**, que é careca, a rede teve mais certeza que era o **Bruce Willis**, que também é careca!
Apesar da diferença de etnia, diversos fatores podem ter gerado essa falha, como a direção do rosto e a expressão. 

```
--image=tests/terry.jpg 

bruce willis (score = 0.72014)
terry crews (score = 0.19836)
bruce springsteen (score = 0.04245)
mark knopfler (score = 0.03664)
neymar (score = 0.00173)
```



# Grafo do Tensorboard
![Grafo](https://i.imgur.com/v399Yr6.png)



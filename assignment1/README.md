# Retreino

Instalei o Tensorflow sem utilizar a GPU do Notebook e sem compilar da fonte. A instalação foi feita utilizando *pip*. 

O primeiro passo foi clonar o repositório do Tensorflow para a HOME.

Seguindo o [tutorial de retreino do Tensorflow](https://www.tensorflow.org/tutorials/image_retraining):

```sh
~/tensorflow on  master 
λ bazel-bin/tensorflow/examples/image_retraining/retrain --image_dir /home/crochi/Dropbox/code/ml/images --summaries_dir /home/crochi/Dropbox/code/ml/logs --how_many_training_steps 8000
```
Eu realizei o treino com o dobro do número de passos sugerido, para obter uma acurácia maior. Mesmo assim ainda rodou em apenas cerca de 20 minutos.

Configurações do notebook onde o projeto foi feito:

```
CPU: Intel i5-6200U @ 2.700GHz - 2 cores
Memory: 7854MiB 
```

Para visualizar o retreino e gerar gráficos, utilizei o Tensorboard:

```sh
~ via ⬢ v8.7.0 
λ tensorboard --logdir /home/crochi/Dropbox/code/ml/logs
```

### Acurácia 

Podemos ver a progressão da acurácia de treino x validação no gráfico gerado pelo Tensorboard:

![Acurácia](https://i.imgur.com/kKX3hE7.png)

### Diretório do projeto

Copiei os scripts de *tensorflow/examples/image_retraining* para o diretório do projeto 1.

Nesse diretório, tenho as pastas:
* **Logs** - Possui os logs de treino que o Tensorboard utiliza
* **Layer** - Possui a nova camada da rede
* **Images** - Bases de dados usadas para treino
* **Tests** - Imagens usadas para testes 

## Base de Dados

Utilizei o script *google.py* para obter imagens de diversas celebridades (~100 imagens). Peguei diversas fotos minhas ao longo dos anos, com cabelos diferentes, com e sem barba, diferentes locais, iluminação, roupas e filtros de fotos, como por exemplo, fotos em preto e branco. Acho que essa diversificação contribuiu muito para a rede identificar mais o meu rosto do que uma pessoa com cabelo comprido e barba apenas. 

```sh
code/ml/images on  master [✘+?] 
λ ls

 bruce+springsteen   george+harrison   terry+crews
 bruce+willis        jerry+seinfeld    tom+petty
 elle+fanning        mark+knopfler
 felipe              neymar
```

 felipe sou eu! :) 


# Rodando com a nova camada:

```sh
λ python image_retraining/label_image.py --graph=layer/output_graph.pb --labels=layer/output_labels.txt --output_layer=final_result:0  --image=tests/felipe7.jpg 
```

## Sucessos

Para a maioria dos casos, a rede obteve sucesso em seu chute, com grande precisão, quase sempre acima de 90%.

Utilizando novas fotos tiradas com a webcam do notebook:

```
--image=tests/felipe2.jpg 

felipe (score = 0.99210)
bruce springsteen (score = 0.00473)
mark knopfler (score = 0.00130)
bruce willis (score = 0.00125)
george harrison (score = 0.00052)
```

```
--image=tests/felipe6.jpg 

felipe (score = 0.99846)
terry crews (score = 0.00073)
jerry seinfeld (score = 0.00026)
bruce willis (score = 0.00026)
bruce springsteen (score = 0.00013)
```

```
--image=tests/felipe7.jpg 

felipe (score = 0.99974)
bruce willis (score = 0.00013)
terry crews (score = 0.00005)
bruce springsteen (score = 0.00004)
mark knopfler (score = 0.00002)
```

Testes com fotos de celebridades:

```
--image=tests/willis1.jpg 

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

Rodando com a foto de um amigo meu que também faz a disciplina, Gabriel (Salsicha), a rede identifica como se fosse eu, por ser o mais parecido. 
Isso é curioso pois **já aconteceu** em sistemas reais como Facebook e Instagram. Em fotos nossas, às vezes o site sugere a marcação errada. 

```
--image=tests/salsicha1.jpg

felipe (score = 0.94795)
bruce willis (score = 0.01877)
bruce springsteen (score = 0.01763)
terry crews (score = 0.01012)
mark knopfler (score = 0.00246)
```


# Grafo do Tensorboard

![Grafo](https://i.imgur.com/v399Yr6.png)



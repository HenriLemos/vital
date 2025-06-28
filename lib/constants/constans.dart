import 'package:flutter/material.dart';

const String rapidApiKey = '255548e0f7msh6aba32057466d70p1d6be5jsnc14ca0d20813';

final List<String> sliderImages = [
  'assets/images/slide1.png',
  'assets/images/slide2.png',
  'assets/images/slide3.png',
  'assets/images/slide4.png',
  'assets/images/slide5.png',
];


final List<Map<String, dynamic>> bodyParts = [
  {
    'name': 'costas',
    'image': 'assets/images/back.png',
  },
  {
    'name': 'cardio',
    'image': 'assets/images/cardio.png',
  },
  {
    'name': 'peitoral',
    'image': 'assets/images/chest.png',
  },
  {
    'name': 'Braço',
    'image': 'assets/images/lowerArms.png',
  },
  {
    'name': 'Perna inferior',
    'image': 'assets/images/lowerLegs.png',
  },
  {
    'name': 'Pescoço',
    'image': 'assets/images/neck.png',
  },
  {
    'name': 'Ombro',
    'image': 'assets/images/shoulders.png',
  },
  {
    'name': 'Braço Superior',
    'image': 'assets/images/upperArms.png',
  },
  {
    'name': 'Perna Superior',
    'image': 'assets/images/upperLegs.png',
  },
  {
    'name': 'Abdomen',
    'image': 'assets/images/waist.png',
  },
];

final List<Map<String, dynamic>> demoExercises = [
  {
    "bodyPart":"costas",
    "equipment":"cabo",
    "gifUrl":"assets/gifs/001.gif",
    "id":"0007",
    "instructions":[
      "Sente-se na máquina de cabos com as costas retas e os pés apoiados no chão.",
      "Segure as alças com pegada por cima (supinada), um pouco mais larga que a largura dos ombros.",
      "Incline-se ligeiramente para trás e puxe as alças em direção ao peito, contraindo as escápulas.",
      "Faça uma pausa momentânea no ponto máximo do movimento, depois solte lentamente as alças de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"Puxada Lateral Alternativa",
    "secondaryMuscles":[
      "biceps",
      "rhomboids"
    ],
    "target":"dorsais"
  },
  {
    "bodyPart":"costas",
    "equipment":"máquina de assistência",
    "gifUrl":"assets/gifs/002.gif",
    "id":"0015",
    "instructions":[
      "Ajuste a máquina para o peso e altura desejados.",
      "Coloque suas mãos nas barras paralelas com pegada fechada, palmas das mãos voltadas uma para a outra.",
      "Pendure-se nas barras com os braços totalmente estendidos e os pés fora do chão.",
      "Engage os músculos das costas e puxe seu corpo para cima em direção às barras, mantendo os cotovelos próximos ao corpo.",
      "Continue puxando até que seu queixo esteja acima das barras.",
      "Faça uma pausa momentânea no topo, depois abaixe lentamente seu corpo de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"barra paralela com pegada fechada assistida",
    "secondaryMuscles":[
      "bíceps",
      "antebraços"
    ],
    "target":"dorsais"
  },
  {
    "bodyPart":"costas",
    "equipment":"máquina de assistência",
    "gifUrl":"assets/gifs/003.gif",
    "id":"0017",
    "instructions":[
      "Ajuste a máquina para o peso e altura desejados.",
      "Segure as alças com uma pegada por cima, um pouco mais larga que a largura dos ombros.",
      "Fique pendurado com os braços totalmente estendidos e os pés fora do chão.",
      "Contraia os músculos das costas e puxe seu corpo para cima em direção às alças, mantendo os cotovelos próximos ao corpo.",
      "Continue puxando até que seu queixo esteja acima das alças.",
      "Faça uma pausa momentânea no topo, depois abaixe lentamente seu corpo de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"barra fixa assistida",
    "secondaryMuscles":[
      "bíceps",
      "antebraços"
    ],
    "target":"dorsais"
  },
  {
    "bodyPart":"costas",
    "equipment":"barra",
    "gifUrl":"assets/gifs/004.gif",
    "id":"0022",
    "instructions":[
      "Deite-se em um banco com sua cabeça em uma extremidade e seus pés no chão.",
      "Segure a barra com uma pegada pronada (palmas das mãos voltadas para longe de você) e estenda os braços diretamente acima do seu peito.",
      "Mantendo os braços retos, abaixe a barra atrás da sua cabeça em um movimento em arco até sentir um alongamento nos dorsais.",
      "Faça uma pausa momentânea, depois inverta o movimento e pressione a barra de volta à posição inicial acima do seu peito.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"pullover com barra para supino",
    "secondaryMuscles":[
      "tríceps",
      "peito",
      "ombros"
    ],
    "target":"dorsais"
  },
  {
    "bodyPart":"costas",
    "equipment":"barra",
    "gifUrl":"assets/gifs/005.gif",
    "id":"0027",
    "instructions":[
      "Fique em pé com os pés na largura dos ombros e os joelhos levemente flexionados.",
      "Incline-se para a frente nos quadris, mantendo as costas retas e o peito para cima.",
      "Segure a barra com uma pegada por cima, mãos um pouco mais largas que a largura dos ombros.",
      "Puxe a barra em direção à parte inferior do peito, retraindo as escápulas e contraindo os músculos das costas.",
      "Faça uma pausa momentânea no topo, depois abaixe lentamente a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"remada curvada com barra",
    "secondaryMuscles":[
      "bíceps",
      "antebraços"
    ],
    "target":"parte superior das costas"
  },
  {
    "bodyPart":"costas",
    "equipment":"barra",
    "gifUrl":"assets/gifs/006.gif",
    "id":"0034",
    "instructions":[
      "Deite-se em um banco inclinado com a cabeça mais baixa que os quadris e os pés presos.",
      "Segure uma barra com pegada pronada (palmas das mãos voltadas para longe de você) e estenda os braços diretamente acima do peito.",
      "Abaixe a barra atrás da cabeça de maneira controlada, mantendo os braços levemente dobrados.",
      "Faça uma pausa momentânea, depois levante a barra de volta à posição inicial contraindo os dorsais.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"pullover com barra em banco declinado com braços flexionados",
    "secondaryMuscles":[
      "tríceps",
      "peito"
    ],
    "target":"dorsais"
  },
  {
    "bodyPart":"costas",
    "equipment":"barra",
    "gifUrl":"assets/gifs/007.gif",
    "id":"0037",
    "instructions":[
      "Deite-se em um banco inclinado com a cabeça mais baixa que os quadris e os pés presos.",
      "Segure uma barra com pegada larga e estenda os braços diretamente acima do peito.",
      "Abaixe a barra atrás da cabeça de maneira controlada, mantendo os braços retos.",
      "Faça uma pausa momentânea, depois levante a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"pullover com barra em banco declinado com pegada larga",
    "secondaryMuscles":[
      "tríceps",
      "peito"
    ],
    "target":"dorsais"
  },
  {
    "bodyPart":"costas",
    "equipment":"barra",
    "gifUrl":"assets/gifs/008.gif",
    "id":"0049",
    "instructions":[
      "Ajuste um banco inclinado em um ângulo de 45 graus.",
      "Deite-se de bruços no banco com o peito contra o apoio e os pés apoiados no chão.",
      "Segure a barra com uma pegada por cima, mãos um pouco mais largas que a largura dos ombros.",
      "Mantenha as costas retas e o core contraído.",
      "Puxe a barra em direção ao seu peito, apertando as escápulas juntas.",
      "Faça uma pausa momentânea no topo, depois abaixe lentamente a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"remada inclinada com barra",
    "secondaryMuscles":[
      "bíceps",
      "antebraços"
    ],
    "target":"parte superior das costas"
  },
  {
    "bodyPart":"costas",
    "equipment":"barra",
    "gifUrl":"assets/gifs/009.gif",
    "id":"0064",
    "instructions":[
      "Fique em pé com os pés na largura dos ombros, joelhos levemente flexionados, e segure uma barra com uma mão usando pegada por cima.",
      "Incline-se para a frente nos quadris, mantendo as costas retas e a cabeça em posição neutra.",
      "Puxe a barra para cima em direção ao peito, mantendo o cotovelo próximo ao corpo e apertando as escápulas juntas.",
      "Abaixe a barra de volta à posição inicial de maneira controlada.",
      "Repita pelo número desejado de repetições, depois mude para o outro braço."
    ],
    "name":"remada curvada unilateral com barra",
    "secondaryMuscles":[
      "bíceps",
      "antebraços"
    ],
    "target":"parte superior das costas"
  },
  {
    "bodyPart":"costas",
    "equipment":"barra",
    "gifUrl":"assets/gifs/010.gif",
    "id":"0073",
    "instructions":[
      "Deite-se em um banco com sua cabeça em uma extremidade e seus pés no chão.",
      "Segure uma barra com pegada na largura dos ombros e estenda seus braços diretamente acima do seu peito.",
      "Mantendo os braços retos, abaixe a barra atrás da sua cabeça de maneira controlada até sentir um alongamento nos dorsais.",
      "Faça uma pausa momentânea, depois levante a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"pullover com barra",
    "secondaryMuscles":[
      "peito",
      "tríceps"
    ],
    "target":"dorsais"
  },
  {
    "bodyPart":"cardio",
    "equipment":"peso corporal",
    "gifUrl":"assets/gifs/011.gif",
    "id":"0501",
    "instructions":[
      "Comece em posição ereta com os pés na largura dos ombros.",
      "Abaixe o corpo em posição de agachamento, colocando as mãos no chão à sua frente.",
      "Chute os pés para trás, aterrissando na posição de flexão.",
      "Execute uma flexão, abaixando o peito até o chão e depois empurrando para cima.",
      "Salte com os pés para frente, aterrissando na posição de agachamento.",
      "Salte explosivamente para cima, estendendo os braços acima da cabeça.",
      "Aterrisse suavemente e imediatamente abaixe de volta à posição de agachamento para iniciar a próxima repetição."
    ],
    "name":"burpee com salto",
    "secondaryMuscles":[
      "quadríceps",
      "isquiotibiais",
      "panturrilhas",
      "ombros",
      "tríceps",
      "core"
    ],
    "target":"sistema cardiovascular"
  },
  {
    "bodyPart":"cardio",
    "equipment":"peso corporal",
    "gifUrl":"assets/gifs/012.gif",
    "id":"0630",
    "instructions":[
      "Comece em posição de prancha alta com as mãos diretamente abaixo dos ombros e o corpo em linha reta.",
      "Contraia o core e traga o joelho direito em direção ao peito, então rapidamente alterne e traga o joelho esquerdo em direção ao peito.",
      "Continue alternando as pernas em um movimento de corrida, mantendo os quadris baixos e o core contraído.",
      "Mantenha um ritmo constante e respire uniformemente durante todo o exercício.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"escalador",
    "secondaryMuscles":[
      "core",
      "ombros",
      "tríceps"
    ],
    "target":"sistema cardiovascular"
  },
  {
    "bodyPart":"cardio",
    "equipment":"peso corporal",
    "gifUrl":"assets/gifs/013.gif",
    "id":"0684",
    "instructions":[
      "Comece em pé com os pés na largura dos quadris.",
      "Contraia o core e mantenha a parte superior do corpo relaxada.",
      "Comece a correr no lugar, levantando os joelhos em direção ao peito e aterrissando suavemente na ponta dos pés.",
      "Mantenha um ritmo constante e continue correndo pela duração ou distância desejada.",
      "Lembre-se de respirar profundamente e manter uma boa postura durante todo o exercício."
    ],
    "name":"corrida (equipamento)",
    "secondaryMuscles":[
      "quadríceps",
      "isquiotibiais",
      "panturrilhas"
    ],
    "target":"sistema cardiovascular"
  },
  {
    "bodyPart":"cardio",
    "equipment":"peso corporal",
    "gifUrl":"assets/gifs/014.gif",
    "id":"0685",
    "instructions":[
      "Comece em pé com os pés na largura dos quadris.",
      "Contraia o core e mantenha a parte superior do corpo relaxada.",
      "Comece a correr no lugar, levantando os joelhos em direção ao peito e aterrissando suavemente na ponta dos pés.",
      "Mantenha um ritmo constante e continue correndo pela duração ou distância desejada.",
      "Lembre-se de respirar profundamente e manter uma boa postura durante todo o exercício."
    ],
    "name":"corrida",
    "secondaryMuscles":[
      "quadríceps",
      "isquiotibiais",
      "panturrilhas"
    ],
    "target":"sistema cardiovascular"
  },
  {
    "bodyPart":"cardio",
    "equipment":"máquina de alavanca",
    "gifUrl":"assets/gifs/015.gif",
    "id":"0798",
    "instructions":[
      "Ajuste a altura e a posição do assento na bicicleta estacionária para garantir o alinhamento adequado.",
      "Coloque seus pés nos pedais e prenda-os com as tiras, se disponíveis.",
      "Comece a pedalar em um ritmo confortável, mantendo as costas retas e o core contraído.",
      "Mantenha um ritmo constante e aumente o nível de resistência, se desejar.",
      "Continue pedalando pela duração desejada do seu treino cardiovascular.",
      "Diminua gradualmente o ritmo e o nível de resistência para resfriar.",
      "Alongue os músculos das pernas após o treino para evitar tensão e promover a recuperação."
    ],
    "name":"caminhada em bicicleta estacionária",
    "secondaryMuscles":[
      "quadríceps",
      "isquiotibiais",
      "panturrilhas"
    ],
    "target":"sistema cardiovascular"
  },
  {
    "bodyPart":"cardio",
    "equipment":"peso corporal",
    "gifUrl":"assets/gifs/016.gif",
    "id":"1160",
    "instructions":[
      "Comece em posição ereta com os pés na largura dos ombros.",
      "Abaixe seu corpo em posição de agachamento dobrando os joelhos e colocando as mãos no chão à sua frente.",
      "Chute os pés para trás em posição de flexão.",
      "Realize uma flexão, mantendo seu corpo em linha reta.",
      "Salte com os pés de volta para a posição de agachamento.",
      "Salte explosivamente para cima, estendendo os braços acima da cabeça.",
      "Aterrisse suavemente e imediatamente abaixe para a posição de agachamento para começar a próxima repetição."
    ],
    "name":"burpee",
    "secondaryMuscles":[
      "quadríceps",
      "isquiotibiais",
      "panturrilhas",
      "ombros",
      "peito"
    ],
    "target":"sistema cardiovascular"
  },
  {
    "bodyPart":"cardio",
    "equipment":"halter",
    "gifUrl":"assets/gifs/017.gif",
    "id":"1201",
    "instructions":[
      "Comece em posição ereta com os pés na largura dos ombros e um halter em cada mão.",
      "Abaixe seu corpo em posição de agachamento, colocando os halteres no chão à sua frente.",
      "Chute os pés para trás em posição de flexão, mantendo seu corpo em linha reta.",
      "Realize uma flexão, dobrando os cotovelos e abaixando o peito em direção ao chão.",
      "Salte com os pés de volta para a posição de agachamento.",
      "Levante-se explosivamente, erguendo os halteres do chão e trazendo-os aos seus ombros.",
      "Pressione os halteres acima da cabeça, estendendo completamente os braços.",
      "Abaixe os halteres de volta aos ombros e repita toda a sequência pelo número desejado de repetições."
    ],
    "name":"burpee com halter",
    "secondaryMuscles":[
      "quadríceps",
      "isquiotibiais",
      "panturrilhas",
      "ombros",
      "tríceps",
      "core"
    ],
    "target":"sistema cardiovascular"
  },
 {
    "bodyPart":"cardio",
    "equipment":"bicicleta estacionária",
    "gifUrl":"assets/gifs/015.gif",
    "id":"2138",
    "instructions":[
      "Ajuste a altura e a posição do assento para garantir o alinhamento adequado.",
      "Coloque seus pés nos pedais e prenda-os com as tiras, se disponíveis.",
      "Comece a pedalar em um ritmo confortável.",
      "Mantenha um ritmo constante e aumente o nível de resistência, se desejar.",
      "Contraia os músculos do core para manter a estabilidade e a postura adequada.",
      "Continue pedalando pela duração desejada do seu treino.",
      "Diminua gradualmente a resistência e reduza a velocidade antes de parar completamente.",
      "Alongue as pernas e faça um resfriamento após o treino."
    ],
    "name":"corrida em bicicleta estacionária v. 3",
    "secondaryMuscles":[
      "quadríceps",
      "isquiotibiais",
      "panturrilhas"
    ],
    "target":"sistema cardiovascular"
  },
  {
    "bodyPart":"cardio",
    "equipment":"máquina elíptica",
    "gifUrl":"assets/gifs/018.gif",
    "id":"2141",
    "instructions":[
      "Ajuste o nível de resistência e a inclinação da máquina elíptica para as configurações desejadas.",
      "Suba nos pedais da máquina e segure as alças levemente.",
      "Comece empurrando para baixo com os pés e puxando as alças em direção ao seu corpo.",
      "Continue esse movimento, alternando entre empurrar e puxar, para simular um movimento de caminhada ou corrida.",
      "Mantenha um ritmo constante e mantenha o core contraído durante todo o exercício.",
      "Continue pelo tempo desejado do seu treino cardiovascular.",
      "Diminua gradualmente a intensidade e a velocidade da máquina antes de descer."
    ],
    "name":"caminhada no elíptico cross trainer",
    "secondaryMuscles":[
      "quadríceps",
      "isquiotibiais",
      "glúteos",
      "panturrilhas"
    ],
    "target":"sistema cardiovascular"
  },
  {
    "bodyPart":"cardio",
    "equipment":"máquina de escada",
    "gifUrl":"assets/gifs/019.avif",
    "id":"2311",
    "instructions":[
      "Ajuste a máquina de escada para um nível confortável.",
      "Suba na máquina e coloque as mãos nos corrimãos para apoio.",
      "Comece a caminhar colocando um pé em um degrau e depois o outro, alternando entre as pernas.",
      "Mantenha uma postura ereta e contraia os músculos do core.",
      "Continue caminhando pela duração ou distância desejada.",
      "Aumente gradualmente a intensidade ou velocidade conforme você se torna mais confortável com o exercício.",
      "Lembre-se de fazer um resfriamento e alongamento após completar o exercício."
    ],
    "name":"caminhada na máquina de escada",
    "secondaryMuscles":[
      "quadríceps",
      "isquiotibiais",
      "glúteos",
      "panturrilhas"
    ],
    "target":"sistema cardiovascular"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"máquina de alavanca",
    "gifUrl":"assets/gifs/020.gif",
    "id":"0009",
    "instructions":[
      "Ajuste a máquina na altura desejada e fixe seus joelhos no apoio.",
      "Segure as alças com as palmas das mãos voltadas para baixo e os braços totalmente estendidos.",
      "Abaixe seu corpo dobrando os cotovelos até que seus Braço estejam paralelos ao chão.",
      "Faça uma pausa momentânea e depois empurre-se para cima até a posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"mergulho assistido para peitoral (ajoelhado)",
    "secondaryMuscles":[
      "tríceps",
      "ombros"
    ],
    "target":"peitorais"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"barra",
    "gifUrl":"assets/gifs/021.gif",
    "id":"0025",
    "instructions":[
      "Deite-se em um banco com os pés apoiados no chão e as costas pressionadas contra o banco.",
      "Segure a barra com pegada por cima, um pouco mais larga que a largura dos ombros.",
      "Levante a barra do suporte e segure-a diretamente acima do seu peito com os braços totalmente estendidos.",
      "Abaixe a barra lentamente em direção ao seu peito, mantendo os cotovelos próximos ao corpo.",
      "Faça uma pausa momentânea quando a barra tocar seu peito.",
      "Empurre a barra para cima de volta à posição inicial estendendo os braços.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"supino com barra",
    "secondaryMuscles":[
      "tríceps",
      "ombros"
    ],
    "target":"peitorais"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"barra",
    "gifUrl":"assets/gifs/022.gif",
    "id":"0033",
    "instructions":[
      "Deite-se em um banco declinado com os pés presos e a cabeça mais baixa que os quadris.",
      "Segure a barra com pegada por cima, um pouco mais larga que a largura dos ombros.",
      "Retire a barra do suporte e abaixe-a lentamente em direção ao seu peito, mantendo os cotovelos próximos ao corpo.",
      "Faça uma pausa momentânea na parte inferior, depois empurre a barra para cima até a posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"supino declinado com barra",
    "secondaryMuscles":[
      "tríceps",
      "ombros"
    ],
    "target":"peitorais"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"barra",
    "gifUrl":"assets/gifs/023.gif",
    "id":"0036",
    "instructions":[
      "Deite-se em um banco declinado com os pés presos e a cabeça mais baixa que os quadris.",
      "Segure a barra com pegada larga, um pouco mais larga que a largura dos ombros.",
      "Abaixe a barra em direção ao seu peito, mantendo os cotovelos abertos para os lados.",
      "Empurre a barra para cima até a posição inicial, estendendo completamente os braços.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"supino declinado com pegada larga",
    "secondaryMuscles":[
      "tríceps",
      "ombros"
    ],
    "target":"peitorais"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"barra",
    "gifUrl":"assets/gifs/024.gif",
    "id":"0040",
    "instructions":[
      "Fique em pé com os pés na largura dos ombros e segure uma barra com pegada por cima, palmas das mãos voltadas para baixo.",
      "Mantenha os braços retos e levante a barra à sua frente até que ela alcance a altura dos ombros.",
      "Faça uma pausa momentânea no topo, depois abaixe lentamente a barra de volta à posição inicial.",
      "Em seguida, abaixe a barra atrás da sua cabeça, mantendo os braços retos.",
      "Faça uma pausa momentânea na parte inferior, depois levante a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"elevação frontal e pullover com barra",
    "secondaryMuscles":[
      "deltoides",
      "tríceps"
    ],
    "target":"peitorais"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"barra",
    "gifUrl":"assets/gifs/025.gif",
    "id":"0045",
    "instructions":[
      "Deite-se em um banco com os pés apoiados no chão e as costas pressionadas contra o banco.",
      "Segure a barra com pegada por cima, um pouco mais larga que a largura dos ombros.",
      "Abaixe a barra lentamente em direção ao seu Pescoço, mantendo os cotovelos apontados para fora.",
      "Faça uma pausa momentânea quando a barra estiver logo acima do seu Pescoço.",
      "Empurre a barra para cima até a posição inicial, estendendo completamente os braços.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"supino guillotina com barra",
    "secondaryMuscles":[
      "ombros",
      "tríceps"
    ],
    "target":"peitorais"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"barra",
    "gifUrl":"assets/gifs/026.gif",
    "id":"0047",
    "instructions":[
      "Ajuste um banco inclinado em um ângulo de 45 graus.",
      "Deite-se no banco com os pés apoiados no chão.",
      "Segure a barra com pegada por cima, um pouco mais larga que a largura dos ombros.",
      "Retire a barra do suporte e abaixe-a lentamente em direção ao seu peito, mantendo os cotovelos em um ângulo de 45 graus.",
      "Faça uma pausa momentânea na parte inferior, depois empurre a barra para cima até a posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"supino inclinado com barra",
    "secondaryMuscles":[
      "ombros",
      "tríceps"
    ],
    "target":"peitorais"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"barra",
    "gifUrl":"assets/gifs/027.gif",
    "id":"0050",
    "instructions":[
      "Ajuste um banco inclinado em um ângulo de 45 graus.",
      "Sente-se no banco com as costas contra o apoio e os pés apoiados no chão.",
      "Segure uma barra com pegada por cima, um pouco mais larga que a largura dos ombros.",
      "Levante a barra até a altura dos ombros, mantendo os cotovelos levemente dobrados.",
      "Lentamente, levante a barra acima da cabeça, estendendo completamente os braços.",
      "Faça uma pausa momentânea no topo, depois abaixe lentamente a barra de volta à altura dos ombros.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"elevação de ombros inclinada com barra",
    "secondaryMuscles":[
      "deltoides",
      "trapézio"
    ],
    "target":"serratus anterior"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"barra",
    "gifUrl":"assets/gifs/085.gif",
    "id":"0122",
    "instructions":[
      "Deite-se em um banco com os pés apoiados no chão e as costas pressionadas contra o banco.",
      "Segure a barra com pegada larga, um pouco mais larga que a largura dos ombros.",
      "Levante a barra do suporte e segure-a diretamente acima do seu peito com os braços totalmente estendidos.",
      "Abaixe a barra lentamente em direção ao seu peito, mantendo os cotovelos levemente abertos para fora.",
      "Faça uma pausa momentânea quando a barra tocar seu peito, depois empurre-a para cima até a posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"supino com pegada larga",
    "secondaryMuscles":[
      "ombros",
      "tríceps"
    ],
    "target":"peitorais"
  },
  {
    "bodyPart":"peitoral",
    "equipment":"cabo",
    "gifUrl":"assets/gifs/028.gif",
    "id":"0151",
    "instructions":[
      "Ajuste a máquina de cabos na altura do peito e conecte as alças.",
      "Fique de costas para a máquina com os pés na largura dos ombros.",
      "Segure as alças com pegada por cima e dê um passo à frente para criar tensão nos cabos.",
      "Posicione seus pés firmemente no chão e contraia o core.",
      "Dobre os cotovelos e traga as mãos à altura dos ombros, mantendo os cotovelos em um ângulo de 90 graus.",
      "Empurre as alças para frente, estendendo completamente os braços à sua frente.",
      "Faça uma pausa momentânea, depois reverta lentamente o movimento, trazendo as mãos de volta à altura dos ombros.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"supino com cabo",
    "secondaryMuscles":[
      "tríceps",
      "ombros"
    ],
    "target":"peitorais"
  },
  {
    "bodyPart":"Braço",
    "equipment":"assistido",
    "gifUrl":"assets/gifs/029.gif",
    "id":"0018",
    "instructions":[
      "Fique em pé com os pés na largura dos ombros e segure uma toalha com as duas mãos atrás da cabeça.",
      "Mantenha os cotovelos próximos às orelhas e os Braço estacionários.",
      "Estenda lentamente os antebraços para cima, contraindo os tríceps no topo.",
      "Faça uma pausa momentânea, depois abaixe lentamente a toalha de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"extensão de tríceps em pé assistida (com toalha)",
    "secondaryMuscles":[
      "ombros"
    ],
    "target":"tríceps"
  },
  {
    "bodyPart":"Braço",
    "equipment":"máquina de alavanca",
    "gifUrl":"assets/gifs/030.gif",
    "id":"0019",
    "instructions":[
      "Ajuste a máquina para o peso e altura desejados.",
      "Ajoelhe-se no apoio de frente para a máquina, com as mãos segurando as alças.",
      "Abaixe seu corpo dobrando os cotovelos, mantendo as costas retas e próximas à máquina.",
      "Faça uma pausa momentânea na parte inferior, depois empurre-se para cima até a posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"mergulho assistido para tríceps (ajoelhado)",
    "secondaryMuscles":[
      "peitoral",
      "ombros"
    ],
    "target":"tríceps"
  },
  {
    "bodyPart":"Braço",
    "equipment":"barra",
    "gifUrl":"assets/gifs/031.gif",
    "id":"0023",
    "instructions":[
      "Fique em pé com os pés na largura dos ombros e segure uma barra em cada mão, com as palmas voltadas para frente.",
      "Mantenha os Braço estacionários e expire enquanto curva os pesos, contraindo os bíceps.",
      "Continue levantando as barras até que seus bíceps estejam totalmente contraídos e as barras estejam na altura dos ombros.",
      "Mantenha a posição contraída por uma breve pausa enquanto aperta os bíceps.",
      "Inspire enquanto começa a abaixar as barras lentamente de volta à posição inicial.",
      "Repita pelo número desejado de repetições, alternando os braços."
    ],
    "name":"rosca alternada com barra",
    "secondaryMuscles":[
      "antebraços"
    ],
    "target":"bíceps"
  },
  {
    "bodyPart":"Braço",
    "equipment":"barra",
    "gifUrl":"assets/gifs/032.gif",
    "id":"0030",
    "instructions":[
      "Deite-se em um banco com os pés apoiados no chão e as costas pressionadas contra o banco.",
      "Segure a barra com pegada fechada, um pouco mais estreita que a largura dos ombros.",
      "Retire a barra do suporte e abaixe-a lentamente em direção ao seu peito, mantendo os cotovelos próximos ao corpo.",
      "Faça uma pausa momentânea quando a barra tocar seu peito.",
      "Empurre a barra para cima até a posição inicial, estendendo completamente os braços.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"supino com pegada fechada",
    "secondaryMuscles":[
      "peitoral",
      "ombros"
    ],
    "target":"tríceps"
  },
  {
    "bodyPart":"Braço",
    "equipment":"barra",
    "gifUrl":"assets/gifs/033.gif",
    "id":"0031",
    "instructions":[
      "Fique em pé com os pés na largura dos ombros e segure uma barra com pegada supinada, palmas das mãos voltadas para frente.",
      "Mantenha os cotovelos próximos ao torso e expire enquanto curva a barra, contraindo os bíceps.",
      "Continue levantando a barra até que seus bíceps estejam totalmente contraídos e a barra esteja na altura dos ombros.",
      "Mantenha a posição contraída por uma breve pausa enquanto aperta os bíceps.",
      "Inspire enquanto começa a abaixar a barra lentamente de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"rosca direta com barra",
    "secondaryMuscles":[
      "antebraços"
    ],
    "target":"bíceps"
  },
  {
    "bodyPart":"Braço",
    "equipment":"barra",
    "gifUrl":"assets/gifs/034.gif",
    "id":"0035",
    "instructions":[
      "Deite-se em um banco declinado com a cabeça mais baixa que os pés e segure uma barra com pegada fechada.",
      "Abaixe a barra em direção à sua testa dobrando os cotovelos, mantendo os Braço estacionários.",
      "Faça uma pausa momentânea, depois estenda os braços para empurrar a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"rosca testa declinada com pegada fechada",
    "secondaryMuscles":[
      "peitoral",
      "ombros"
    ],
    "target":"tríceps"
  },
  {
    "bodyPart": "Braço",
    "equipment": "barra",
    "gifUrl": "assets/gifs/035.gif",
    "id": "0038",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e segure uma barra com as palmas das mãos voltadas para cima (pegada supinada).",
      "Deixe a barra pendurada à frente das suas coxas, com os braços estendidos.",
      "Mantendo o braço imóvel, flexione a barra em direção ao seu peitoral contraindo os bíceps.",
      "Pause por um momento no topo, depois abaixe lentamente a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "rosca drag com barra",
    "secondaryMuscles": [
      "antebraços"
    ],
    "target": "bíceps"
  },
  {
    "bodyPart": "Braço",
    "equipment": "barra",
    "gifUrl": "assets/gifs/036.gif",
    "id": "0048",
    "instructions": [
      "Ajuste um banco inclinado em um ângulo de 45 graus.",
      "Deite-se de costas no banco e segure a barra com uma pegada reversa, mãos um pouco mais afastadas que a largura dos ombros.",
      "Retire a barra do suporte e abaixe-a em direção à parte superior do peitoral, mantendo os cotovelos próximos ao corpo.",
      "Pause por um momento na parte inferior, depois empurre a barra de volta para a posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "supino inclinado com barra pegada reversa",
    "secondaryMuscles": [
      "peitoral",
      "ombro"
    ],
    "target": "tríceps"
  },
  {
    "bodyPart": "Braço",
    "equipment": "barra",
    "gifUrl": "assets/gifs/037.gif",
    "id": "0052",
    "instructions": [
      "Deite-se em um banco com os pés apoiados no chão e as costas pressionadas contra o banco.",
      "Segure a barra com uma pegada pronada, um pouco mais aberta que a largura dos ombros.",
      "Abaixe a barra até o peitoral, mantendo os cotovelos próximos ao corpo.",
      "Empurre a barra de volta para a posição inicial, estendendo totalmente os braços.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "supino jm com barra",
    "secondaryMuscles": [
      "peitoral",
      "ombro"
    ],
    "target": "tríceps"
  },
  {
    "bodyPart": "Braço",
    "equipment": "barra",
    "gifUrl": "assets/gifs/038.gif",
    "id": "0055",
    "instructions": [
      "Deite-se em um banco com os pés apoiados no chão e as costas pressionadas contra o banco.",
      "Segure a barra com pegada fechada, mãos na largura dos ombros, palmas voltadas para os pés.",
      "Retire a barra do suporte e segure-a diretamente acima do peitoral com os braços totalmente estendidos.",
      "Abaixe lentamente a barra em direção ao peitoral, mantendo os cotovelos próximos ao corpo.",
      "Pause por um momento quando a barra tocar o peitoral, depois empurre-a de volta para a posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "supino reto com barra pegada fechada",
    "secondaryMuscles": [
      "peitoral",
      "ombro"
    ],
    "target": "tríceps"
  },
  {
    "bodyPart": "Perna inferior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/039.gif",
    "id": "0088",
    "instructions": [
      "Sente-se em um banco com os pés apoiados no chão e uma barra apoiada sobre as coxas.",
      "Coloque a ponta dos pés em uma plataforma elevada, como um bloco ou degrau.",
      "Posicione a barra sobre as coxas e segure-a firmemente com as mãos.",
      "Mantendo as costas retas e o core contraído, eleve os calcanhares do chão, estendendo os tornozelos.",
      "Pause por um momento no topo, depois abaixe lentamente os calcanhares de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação de panturrilha sentado com barra",
    "secondaryMuscles": [
      "posterior de coxa",
      "quadríceps"
    ],
    "target": "panturrilhas"
  },
  {
    "bodyPart": "Perna inferior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/040.gif",
    "id": "0108",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e coloque uma barra sobre a parte superior das costas.",
      "Eleve os calcanhares do chão o máximo possível, usando as panturrilhas.",
      "Pause por um momento no topo, depois abaixe lentamente os calcanhares de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação de panturrilha em pé com barra",
    "secondaryMuscles": [
      "posterior de coxa",
      "glúteos"
    ],
    "target": "panturrilhas"
  },
  {
    "bodyPart": "Perna inferior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/041.gif",
    "id": "0111",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e segure uma barra sobre a parte superior das costas.",
      "Eleve os calcanhares do chão o máximo possível, equilibrando-se na ponta dos pés.",
      "Abaixe lentamente os calcanhares de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação de panturrilha balançando em pé com barra",
    "secondaryMuscles": [
      "posterior de coxa",
      "quadríceps"
    ],
    "target": "panturrilhas"
  },
  {
    "bodyPart": "Perna inferior",
    "equipment": "peso corporal",
    "gifUrl": "assets/gifs/042.gif",
    "id": "0257",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e as mãos nos quadris.",
      "Dobre levemente os joelhos e eleve os calcanhares do chão, equilibrando-se na ponta dos pés.",
      "Mantendo os joelhos dobrados, faça movimentos circulares com os joelhos, primeiro no sentido horário e depois no anti-horário.",
      "Realize o movimento pelo número desejado de repetições."
    ],
    "name": "alongamento de joelho em círculos",
    "secondaryMuscles": [
      "posterior de coxa",
      "quadríceps"
    ],
    "target": "panturrilhas"
  },
  {
    "bodyPart": "Perna inferior",
    "equipment": "peso corporal",
    "gifUrl": "assets/gifs/043.avif",
    "id": "0284",
    "instructions": [
      "Fique em pé com as pontas dos pés em uma superfície elevada, como um degrau ou bloco.",
      "Coloque as mãos em um apoio estável, como uma parede ou corrimão, para manter o equilíbrio.",
      "Eleve os calcanhares o máximo possível, levantando o peso do corpo sobre a ponta dos pés.",
      "Pause por um momento no topo, depois abaixe lentamente os calcanhares de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação de panturrilha tipo burro",
    "secondaryMuscles": [
      "posterior de coxa",
      "glúteos"
    ],
    "target": "panturrilhas"
  },
  {
    "bodyPart": "Perna inferior",
    "equipment": "halter",
    "gifUrl": "assets/gifs/044.gif",
    "id": "0400",
    "instructions": [
      "Sente-se em um banco ou cadeira com os pés apoiados no chão e um halter apoiado sobre a coxa direita.",
      "Estenda a perna esquerda à sua frente, mantendo o pé flexionado.",
      "Coloque a ponta do pé direito em uma superfície elevada, como um degrau ou anilha.",
      "Usando os músculos da panturrilha, eleve o calcanhar direito o máximo possível.",
      "Pause por um momento no topo, depois abaixe lentamente o calcanhar de volta à posição inicial.",
      "Repita pelo número desejado de repetições e depois troque de perna."
    ],
    "name": "elevação de panturrilha sentado com um halter",
    "secondaryMuscles": [
      "posterior de coxa",
      "glúteos"
    ],
    "target": "panturrilhas"
  },
  {
    "bodyPart": "Perna inferior",
    "equipment": "halter",
    "gifUrl": "assets/gifs/045.gif",
    "id": "0409",
    "instructions": [
      "Fique na beirada de um degrau ou plataforma com os calcanhares para fora e as pontas dos pés sobre o degrau.",
      "Segure um halter em uma das mãos e apoie a outra mão em uma parede ou corrimão para suporte.",
      "Eleve o calcanhar o máximo possível, levantando o corpo sobre a ponta do pé.",
      "Pause por um momento no topo, depois abaixe lentamente o calcanhar abaixo do nível do degrau.",
      "Repita pelo número desejado de repetições e depois troque de perna."
    ],
    "name": "elevação de panturrilha unilateral com halter",
    "secondaryMuscles": [
      "tornozelos"
    ],
    "target": "panturrilhas"
  },
  {
    "bodyPart": "Perna inferior",
    "equipment": "halter",
    "gifUrl": "assets/gifs/046.gif",
    "id": "0417",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros, segurando um halter em cada mão.",
      "Eleve os calcanhares do chão o máximo possível, usando as panturrilhas.",
      "Pause por um momento no topo, depois abaixe lentamente os calcanhares de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação de panturrilha em pé com halteres",
    "secondaryMuscles": [
      "tornozelos"
    ],
    "target": "panturrilhas"
  },
  {
    "bodyPart": "Perna inferior",
    "equipment": "máquina de alavanca",
    "gifUrl": "assets/gifs/047.gif",
    "id": "0594",
    "instructions": [
      "Ajuste a altura do assento para que seus joelhos fiquem levemente dobrados e os pés apoiados na plataforma.",
      "Coloque as pontas dos pés na plataforma com os calcanhares para fora da borda.",
      "Segure as alças ou as laterais do assento para estabilidade.",
      "Empurre com a ponta dos pés para elevar os calcanhares o máximo possível.",
      "Pause por um momento no topo, depois abaixe lentamente os calcanhares de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação de panturrilha sentado na máquina de alavanca",
    "secondaryMuscles": [
      "sóleo",
      "estabilizadores do tornozelo"
    ],
    "target": "panturrilhas"
  },
  {
    "bodyPart": "Pescoço",
    "equipment": "peso corporal",
    "gifUrl": "assets/gifs/048.gif",
    "id": "0716",
    "instructions": [
      "Fique em pé ou sente-se com a coluna ereta e os ombros relaxados.",
      "Incline a cabeça para a direita, levando a orelha direita em direção ao ombro direito.",
      "Coloque a mão direita no lado esquerdo da cabeça e aplique uma leve pressão para aumentar o alongamento.",
      "Mantenha o alongamento por 15-30 segundos.",
      "Repita do outro lado, inclinando a cabeça para a esquerda e aplicando pressão com a mão esquerda.",
      "Repita o alongamento 2-3 vezes de cada lado."
    ],
    "name": "alongamento lateral do pescoço com pressão",
    "secondaryMuscles": [
      "trapézio",
      "esternocleidomastoideo"
    ],
    "target": "levantador da escápula"
  },
  {
    "bodyPart": "Pescoço",
    "equipment": "peso corporal",
    "gifUrl": "assets/gifs/049.gif",
    "id": "1403",
    "instructions": [
      "Fique em pé ou sente-se com a coluna ereta e os ombros relaxados.",
      "Incline a cabeça para um lado, levando a orelha em direção ao ombro.",
      "Mantenha o alongamento por 15-30 segundos.",
      "Repita do outro lado.",
      "Realize 2-4 séries de cada lado."
    ],
    "name": "alongamento lateral do pescoço",
    "secondaryMuscles": [
      "trapézio",
      "esternocleidomastoideo"
    ],
    "target": "levantador da escápula"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/050.gif",
    "id": "0041",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e segure uma barra à frente das coxas com pegada pronada.",
      "Mantenha os braços estendidos e levante a barra para frente e para cima até a altura dos ombros.",
      "Pause por um momento no topo, depois abaixe lentamente a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação frontal com barra",
    "secondaryMuscles": [
      "bíceps",
      "tríceps"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/051.gif",
    "id": "0067",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros, com as pontas dos pés levemente para fora.",
      "Segure a barra com uma pegada pronada, mãos um pouco mais afastadas que a largura dos ombros.",
      "Dobre os joelhos e abaixe o quadril em posição de agachamento, mantendo as costas retas e o peitoral para cima.",
      "Estenda explosivamente o quadril, joelhos e tornozelos, impulsionando a barra para cima.",
      "Quando a barra atingir o nível do peitoral, puxe-a para cima com o braço, mantendo-a próxima ao corpo.",
      "Gire o cotovelo sob a barra e estenda totalmente o braço acima da cabeça, travando o cotovelo.",
      "Abaixe a barra de volta até a posição inicial de forma controlada.",
      "Repita pelo número desejado de repetições e depois troque de braço."
    ],
    "name": "snatch unilateral com barra",
    "secondaryMuscles": [
      "trapézio",
      "antebraços",
      "core"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/052.gif",
    "id": "0075",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e segure uma barra com pegada pronada, palmas para baixo.",
      "Dobre levemente os joelhos e incline-se para frente a partir do quadril, mantendo as costas retas.",
      "Eleve a barra para os lados, mantendo os braços estendidos, até que fiquem paralelos ao chão.",
      "Pause por um momento no topo e depois abaixe lentamente a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação posterior de ombro com barra",
    "secondaryMuscles": [
      "trapézio",
      "romboides"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/053.gif",
    "id": "0076",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e joelhos levemente flexionados.",
      "Segure uma barra com pegada pronada, mãos um pouco mais afastadas que a largura dos ombros.",
      "Incline-se para frente a partir do quadril, mantendo as costas retas e o peitoral para cima.",
      "Puxe a barra em direção ao peitoral, contraindo as escápulas.",
      "Pause por um momento no topo e depois abaixe lentamente a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "remada posterior de ombro com barra",
    "secondaryMuscles": [
      "trapézio",
      "romboides",
      "bíceps"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/054.gif",
    "id": "0086",
    "instructions": [
      "Sente-se em um banco com as costas retas e os pés apoiados no chão.",
      "Segure a barra com uma pegada pronada, um pouco mais larga que a largura dos ombros.",
      "Retire a barra do suporte e leve-a até a altura dos ombros, atrás da cabeça.",
      "Empurre a barra para cima até que seus braços estejam totalmente estendidos.",
      "Abaixe a barra de volta atrás da cabeça até a posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "desenvolvimento no smith sentado com barra atrás da cabeça",
    "secondaryMuscles": [
      "tríceps",
      "parte superior das costas"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/055.webp",
    "id": "0087",
    "instructions": [
      "Sente-se em um banco com as costas retas e os pés apoiados no chão.",
      "Segure a barra com uma pegada pronada, um pouco mais larga que a largura dos ombros.",
      "Levante a barra até a altura dos ombros, mantendo os cotovelos levemente flexionados e apontados para frente.",
      "Empurre a barra acima da cabeça, estendendo totalmente os braços.",
      "Abaixe a barra até a altura dos ombros e repita pelo número desejado de repetições."
    ],
    "name": "desenvolvimento bradford rocky sentado com barra",
    "secondaryMuscles": [
      "tríceps",
      "parte superior das costas"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/056.gif",
    "id": "0091",
    "instructions": [
      "Sente-se em um banco com as costas retas e os pés apoiados no chão.",
      "Segure a barra com uma pegada pronada, um pouco mais larga que a largura dos ombros.",
      "Retire a barra do suporte e leve-a até a altura dos ombros, com os cotovelos flexionados e as palmas das mãos voltadas para frente.",
      "Empurre a barra acima da cabeça, estendendo totalmente os braços.",
      "Pause por um momento no topo, depois abaixe lentamente a barra até a altura dos ombros.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "desenvolvimento sentado com barra acima da cabeça",
    "secondaryMuscles": [
      "tríceps",
      "parte superior das costas"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/086.png",
    "id": "0100",
    "instructions": [
      "Fique em pé com os pés na largura dos ombros e segure uma barra à frente das coxas com uma pegada pronada.",
      "Flexione levemente os joelhos e incline-se para frente a partir dos quadris, mantendo as costas retas e o peito para cima.",
      "Simultaneamente, levante a barra em direção ao ombro enquanto salta levemente do chão.",
      "Ao chegar ao topo do movimento, rapidamente reverta o movimento e abaixe a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "esquiador com barra",
    "secondaryMuscles": [
      "tríceps",
      "core"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/058.gif",
    "id": "0105",
    "instructions": [
      "Fique em pé com os pés na largura dos ombros e segure a barra à frente dos ombros com uma pegada pronada.",
      "Empurre a barra acima da cabeça, estendendo totalmente os braços.",
      "Abaixe a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "desenvolvimento bradford em pé com barra",
    "secondaryMuscles": [
      "tríceps",
      "parte superior das costas"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Ombro",
    "equipment": "barra",
    "gifUrl": "assets/gifs/058.gif",
    "id": "0107",
    "instructions": [
      "Fique em pé com os pés na largura dos ombros, segurando uma barra à frente das coxas com uma pegada pronada.",
      "Mantenha as costas retas e ative o core.",
      "Levante lentamente a barra à sua frente, mantendo os braços estendidos e as palmas das mãos voltadas para baixo.",
      "Continue levantando até que a barra esteja um pouco acima da altura dos ombros.",
      "Pause por um momento no topo, depois abaixe lentamente a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação frontal em pé com barra acima da cabeça",
    "secondaryMuscles": [
      "tríceps",
      "parte superior das costas"
    ],
    "target": "deltoides"
  },
  {
    "bodyPart": "Braço Superior",
    "equipment": "assistido",
    "gifUrl": "assets/gifs/056.gif",
    "id": "0018",
    "instructions": [
      "Fique em pé com os pés na largura dos ombros e segure uma toalha com as duas mãos atrás da cabeça.",
      "Mantenha os cotovelos próximos às orelhas e o braço superior imóvel.",
      "Estenda lentamente os antebraços para cima, contraindo os tríceps no topo.",
      "Pause por um momento, depois abaixe lentamente a toalha de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "extensão de tríceps em pé assistida (com toalha)",
    "secondaryMuscles": [
      "Ombro"
    ],
    "target": "tríceps"
  },
  {
    "bodyPart": "Braço Superior",
    "equipment": "máquina de alavanca",
    "gifUrl": "assets/gifs/059.gif",
    "id": "0019",
    "instructions": [
      "Ajuste a máquina para o peso e altura desejados.",
      "Ajoelhe-se no apoio de joelhos de frente para a máquina, segurando as alças.",
      "Abaixe o corpo dobrando os cotovelos, mantendo as costas retas e próximas à máquina.",
      "Pause por um momento na parte inferior, depois empurre o corpo de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "mergulho de tríceps assistido (ajoelhado)",
    "secondaryMuscles": [
      "peitoral",
      "Ombro"
    ],
    "target": "tríceps"
  },
  {
    "bodyPart": "Braço Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/061.gif",
    "id": "0023",
    "instructions": [
      "Fique em pé com os pés na largura dos ombros e segure uma barra em cada mão, palmas voltadas para frente.",
      "Mantenha o braço superior imóvel e expire enquanto flexiona os pesos, contraindo os bíceps.",
      "Continue levantando as barras até que os bíceps estejam totalmente contraídos e as barras estejam na altura dos ombros.",
      "Segure a posição contraída por um breve momento enquanto contrai os bíceps.",
      "Inspire enquanto começa a abaixar lentamente as barras de volta à posição inicial.",
      "Repita pelo número desejado de repetições, alternando os braços."
    ],
    "name": "rosca alternada com barra",
    "secondaryMuscles": [
      "antebraços"
    ],
    "target": "bíceps"
  },
  {
    "bodyPart": "Braço Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/062.gif",
    "id": "0030",
    "instructions": [
      "Deite-se em um banco com os pés apoiados no chão e as costas pressionadas contra o banco.",
      "Segure a barra com pegada fechada, um pouco mais estreita que a largura dos ombros.",
      "Retire a barra do suporte e abaixe-a lentamente em direção ao peito, mantendo os cotovelos próximos ao corpo.",
      "Pause por um momento quando a barra tocar o peito.",
      "Empurre a barra de volta à posição inicial, estendendo completamente os braços.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "supino com pegada fechada",
    "secondaryMuscles": [
      "peitoral",
      "ombro"
    ],
    "target": "tríceps"
  },
  {
    "bodyPart": "Braço Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/063.gif",
    "id": "0031",
    "instructions": [
      "Fique em pé com os pés na largura dos ombros e segure uma barra com pegada supinada, palmas das mãos voltadas para frente.",
      "Mantenha os cotovelos próximos ao tronco e expire enquanto flexiona a barra, contraindo os bíceps.",
      "Continue levantando a barra até que os bíceps estejam totalmente contraídos e a barra esteja na altura dos ombros.",
      "Mantenha a posição contraída por um breve momento enquanto aperta os bíceps.",
      "Inspire enquanto começa a abaixar lentamente a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "rosca direta com barra",
    "secondaryMuscles": [
      "antebraços"
    ],
    "target": "bíceps"
  },
  {
    "bodyPart": "Braço Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/064.gif",
    "id": "0035",
    "instructions": [
      "Deite-se em um banco declinado com a cabeça mais baixa que os pés e segure uma barra com pegada fechada.",
      "Abaixe a barra em direção à testa dobrando os cotovelos, mantendo o braço superior imóvel.",
      "Pause por um momento, depois estenda os braços para empurrar a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "rosca testa declinada com pegada fechada",
    "secondaryMuscles": [
      "peitoral",
      "ombro"
    ],
    "target": "tríceps"
  },
  {
    "bodyPart": "Braço Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/087.gif",
    "id": "0038",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e segure uma barra com pegada supinada, palmas das mãos voltadas para cima.",
      "Deixe a barra pendurada à frente das suas coxas, com os braços estendidos.",
      "Mantendo o braço superior imóvel, flexione a barra em direção ao peitoral contraindo os bíceps.",
      "Pause por um momento no topo, depois abaixe lentamente a barra de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "rosca drag com barra",
    "secondaryMuscles": [
      "antebraços"
    ],
    "target": "bíceps"
  },
  {
  "bodyPart": "Braço Superior",
  "equipment": "barra",
  "gifUrl": "assets/gifs/089.gif",
  "id": "0048",
  "instructions": [
    "Ajuste um banco inclinado em um ângulo de 45 graus.",
    "Deite-se de costas no banco e segure a barra com pegada reversa, mãos um pouco mais afastadas que a largura dos ombros.",
    "Retire a barra do suporte e abaixe-a em direção à parte superior do peitoral, mantendo os cotovelos próximos ao corpo.",
    "Pause por um momento na parte inferior, depois empurre a barra de volta à posição inicial.",
    "Repita pelo número desejado de repetições."
  ],
  "name": "supino inclinado com barra pegada reversa",
  "secondaryMuscles": [
    "peitoral",
    "ombro"
  ],
  "target": "tríceps"
  },
  {
  "bodyPart": "Braço Superior",
  "equipment": "barra",
  "gifUrl": "assets/gifs/090.png",
  "id": "0052",
  "instructions": [
    "Deite-se em um banco com os pés apoiados no chão e as costas pressionadas contra o banco.",
    "Segure a barra com pegada pronada, um pouco mais aberta que a largura dos ombros.",
    "Abaixe a barra até o peitoral, mantendo os cotovelos próximos ao corpo.",
    "Empurre a barra de volta à posição inicial, estendendo totalmente os braços.",
    "Repita pelo número desejado de repetições."
  ],
  "name": "supino jm com barra",
  "secondaryMuscles": [
    "peitoral",
    "ombro"
  ],
  "target": "tríceps"
  },
  {
    "bodyPart":"Braço Superior",
    "equipment":"barra",
    "gifUrl":"assets/gifs/091.gif",
    "id":"0055",
    "instructions":[
      "Deite-se em um banco com os pés apoiados no chão e as costas pressionadas contra o banco.",
      "Segure a barra com uma pegada fechada, mãos na largura dos ombros, palmas voltadas para os pés.",
      "Levante a barra do suporte e segure-a diretamente acima do peito com os braços totalmente estendidos.",
      "Abaixe lentamente a barra em direção ao peito, mantendo os cotovelos próximos ao corpo.",
      "Pause por um momento quando a barra tocar o peito, depois empurre-a de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name":"supino reto com pegada fechada",
    "secondaryMuscles":[
      "peitoral",
      "ombro"
    ],
    "target":"tríceps"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "assistido",
    "gifUrl": "assets/gifs/065.gif",
    "id": "0016",
    "instructions": [
      "Deite-se de bruços em um colchonete ou banco com as pernas totalmente estendidas.",
      "Peça para um parceiro ou use uma faixa de resistência para prender seus tornozelos.",
      "Ative os isquiotibiais e levante as pernas em direção aos glúteos, mantendo os joelhos estendidos.",
      "Pause por um momento no topo, depois abaixe lentamente as pernas de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "flexão de pernas deitado assistido",
    "secondaryMuscles": [
      "glúteos",
      "lombar"
    ],
    "target": "isquiotibiais"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "peso corporal",
    "gifUrl": "assets/gifs/066.gif",
    "id": "0020",
    "instructions": [
      "Coloque a prancha de equilíbrio em uma superfície plana.",
      "Suba na prancha de equilíbrio com um pé, certificando-se de que está centralizado.",
      "Transfira lentamente o peso para o pé que está na prancha, mantendo o core ativado.",
      "Mantenha o equilíbrio e a estabilidade enquanto segura a posição pelo tempo desejado.",
      "Repita o exercício com o outro pé."
    ],
    "name": "prancha de equilíbrio",
    "secondaryMuscles": [
      "panturrilhas",
      "isquiotibiais",
      "glúteos"
    ],
    "target": "quadríceps"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/067.gif",
    "id": "0024",
    "instructions": [
      "Comece em pé com os pés afastados na largura dos ombros e a barra apoiada na parte superior do peitoral, logo abaixo da clavícula.",
      "Segure a barra com uma pegada pronada, mantendo os cotovelos elevados e os braços paralelos ao chão.",
      "Abaixe o corpo em posição de agachamento, dobrando os joelhos e quadris, mantendo as costas retas e o peito para cima.",
      "Pause por um momento na parte inferior do agachamento, depois empurre pelos calcanhares para retornar à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "agachamento frontal com barra",
    "secondaryMuscles": [
      "isquiotibiais",
      "glúteos",
      "panturrilhas"
    ],
    "target": "quadríceps"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/084.gif",
    "id": "0026",
    "instructions": [
      "Configure uma barra em um rack de agachamento na altura do peitoral.",
      "Fique em pé de costas para o rack, com os pés afastados na largura dos ombros.",
      "Dobre os joelhos e abaixe o corpo em posição de agachamento, mantendo as costas retas e o peitoral para cima.",
      "Segure a barra com pegada pronada, um pouco mais afastada que a largura dos ombros.",
      "Retire a barra do rack e dê um passo para trás, certificando-se de que os pés ainda estejam na largura dos ombros.",
      "Abaixe o corpo em posição de agachamento, mantendo os joelhos alinhados com os pés.",
      "Pause por um momento na parte inferior, depois empurre pelos calcanhares para retornar à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "agachamento no banco com barra",
    "secondaryMuscles": [
      "glúteos",
      "isquiotibiais",
      "panturrilhas"
    ],
    "target": "quadríceps"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/068.gif",
    "id": "0028",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e a barra no chão à sua frente.",
      "Dobre os joelhos e flexione o quadril para abaixar e segurar a barra com uma pegada pronada, mãos um pouco mais afastadas que a largura dos ombros.",
      "Empurre pelos calcanhares e estenda os quadris e joelhos para levantar a barra do chão, mantendo-a próxima ao corpo.",
      "Quando a barra chegar às coxas, estenda explosivamente os quadris, dê um encolhimento de ombros e puxe a barra em direção ao peito.",
      "Quando a barra atingir a altura do peito, rapidamente passe por baixo dela e segure-a na altura dos ombros, com os cotovelos apontando para frente e as palmas das mãos voltadas para cima.",
      "A partir da posição de pegada, pressione a barra acima da cabeça estendendo os braços e empurrando a barra para cima.",
      "Abaixe a barra de volta à posição inicial e repita pelo número desejado de repetições."
    ],
    "name": "clean and press com barra",
    "secondaryMuscles": [
      "isquiotibiais",
      "glúteos",
      "ombro",
      "tríceps"
    ],
    "target": "quadríceps"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/069.gif",
    "id": "0029",
    "instructions": [
      "Comece em pé com os pés afastados na largura dos ombros e a barra apoiada na parte superior do peito, com os cotovelos apontando para frente.",
      "Abaixe o corpo dobrando os joelhos e empurrando o quadril para trás, como se fosse sentar em uma cadeira.",
      "Mantenha o peito para cima e as costas retas enquanto desce, certificando-se de que os joelhos não ultrapassem a ponta dos pés.",
      "Continue descendo até que as coxas fiquem paralelas ao chão ou o mais baixo que conseguir confortavelmente.",
      "Pause por um momento na parte inferior, depois empurre pelos calcanhares para voltar à posição inicial, estendendo quadris e joelhos.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "agachamento frontal com pegada clean e barra",
    "secondaryMuscles": [
      "quadríceps",
      "isquiotibiais",
      "panturrilhas",
      "core"
    ],
    "target": "glúteos"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/070.gif",
    "id": "0032",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e a barra no chão à sua frente.",
      "Dobre os joelhos e flexione o quadril para abaixar o tronco e segurar a barra com uma pegada pronada, mãos um pouco mais afastadas que a largura dos ombros.",
      "Mantenha as costas retas e o peito elevado enquanto empurra pelos calcanhares para levantar a barra do chão, estendendo quadris e joelhos.",
      "Ao ficar totalmente ereto, contraia os glúteos e mantenha o core ativado.",
      "Abaixe a barra de volta ao chão dobrando quadris e joelhos, mantendo as costas retas.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "levantamento terra com barra",
    "secondaryMuscles": [
      "isquiotibiais",
      "lombar"
    ],
    "target": "glúteos"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/071.gif",
    "id": "0039",
    "instructions": [
      "Comece em pé com os pés afastados na largura dos ombros e as pontas dos pés levemente voltadas para fora.",
      "Segure a barra à frente do peitoral com as mãos na largura dos ombros, cotovelos apontando para frente.",
      "Ative o core e mantenha o peito erguido enquanto abaixa o corpo em posição de agachamento, empurrando o quadril para trás e dobrando os joelhos.",
      "Desça até que as coxas fiquem paralelas ao chão ou o mais baixo que conseguir confortavelmente.",
      "Pause por um momento na parte inferior, depois empurre pelos calcanhares para retornar à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "agachamento frontal com barra no peitoral",
    "secondaryMuscles": [
      "quadríceps",
      "isquiotibiais",
      "panturrilhas",
      "core"
    ],
    "target": "glúteos"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/072.gif",
    "id": "0042",
    "instructions": [
      "Comece em pé com os pés afastados na largura dos ombros e as pontas dos pés levemente voltadas para fora.",
      "Segure a barra à frente dos ombros, apoiando-a na clavícula e nos ombros.",
      "Ative o core e mantenha o peito erguido enquanto abaixa o corpo em posição de agachamento, empurrando o quadril para trás e dobrando os joelhos.",
      "Desça até que as coxas fiquem paralelas ao chão ou o mais baixo que conseguir confortavelmente.",
      "Pause por um momento na parte inferior, depois empurre pelos calcanhares para retornar à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "agachamento frontal com barra",
    "secondaryMuscles": [
      "quadríceps",
      "isquiotibiais",
      "panturrilhas",
      "core"
    ],
    "target": "glúteos"
  },
  {
    "bodyPart": "Perna Superior",
    "equipment": "barra",
    "gifUrl": "assets/gifs/073.gif",
    "id": "0043",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e as pontas dos pés levemente voltadas para fora.",
      "Segure a barra sobre a parte superior das costas, apoiando-a nos trapézios ou deltoides posteriores.",
      "Ative o core e mantenha o peito erguido enquanto começa a abaixar o corpo.",
      "Dobre os joelhos e quadris, empurrando o quadril para trás e para baixo como se fosse sentar em uma cadeira.",
      "Desça até que as coxas fiquem paralelas ao chão ou um pouco abaixo.",
      "Mantenha os joelhos alinhados com os pés e o peso nos calcanhares.",
      "Empurre pelos calcanhares para voltar à posição inicial, estendendo quadris e joelhos.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "agachamento completo com barra",
    "secondaryMuscles": [
      "quadríceps",
      "isquiotibiais",
      "panturrilhas",
      "core"
    ],
    "target": "glúteos"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "peso corporal",
    "gifUrl": "assets/gifs/074.gif",
    "id": "0001",
    "instructions": [
      "Deite-se de costas com os joelhos dobrados e os pés apoiados no chão.",
      "Coloque as mãos atrás da cabeça com os cotovelos apontando para fora.",
      "Contraindo o abdômen, eleve lentamente a parte superior do corpo do chão, enrolando o tronco até que ele forme um ângulo de 45 graus.",
      "Pause por um momento no topo, depois abaixe lentamente a parte superior do corpo de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "abdominal 3/4",
    "secondaryMuscles": [
      "flexores do quadril",
      "lombar"
    ],
    "target": "abdômen"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "peso corporal",
    "gifUrl": "assets/gifs/075.gif",
    "id": "0002",
    "instructions": [
      "Fique em pé com os pés afastados na largura dos ombros e os braços estendidos ao lado do corpo.",
      "Mantendo as costas retas e o core ativado, incline lentamente o tronco para um lado, levando a mão em direção ao joelho.",
      "Pause por um momento na parte inferior, depois retorne lentamente à posição inicial.",
      "Repita para o outro lado.",
      "Continue alternando os lados pelo número desejado de repetições."
    ],
    "name": "flexão lateral 45°",
    "secondaryMuscles": [
      "oblíquos"
    ],
    "target": "abdômen"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "peso corporal",
    "gifUrl": "assets/gifs/076.gif",
    "id": "0003",
    "instructions": [
      "Deite-se de costas com as mãos atrás da cabeça.",
      "Eleve as pernas do chão e dobre os joelhos em um ângulo de 90 graus.",
      "Leve o cotovelo direito em direção ao joelho esquerdo enquanto estende a perna direita.",
      "Retorne à posição inicial e repita o movimento do lado oposto, levando o cotovelo esquerdo ao joelho direito enquanto estende a perna esquerda.",
      "Continue alternando os lados em um movimento de pedalada pelo número desejado de repetições."
    ],
    "name": "bicicleta no ar",
    "secondaryMuscles": [
      "flexores do quadril"
    ],
    "target": "abdômen"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "peso corporal",
    "gifUrl": "assets/gifs/077.gif",
    "id": "0006",
    "instructions": [
      "Deite-se de costas com os joelhos dobrados e os pés apoiados no chão.",
      "Estenda os braços para os lados, paralelos ao chão.",
      "Contraindo o abdômen, eleve o ombro do chão e alcance o calcanhar direito com a mão direita.",
      "Retorne à posição inicial e repita do lado esquerdo, alcançando o calcanhar esquerdo com a mão esquerda.",
      "Continue alternando os lados pelo número desejado de repetições."
    ],
    "name": "toque alternado nos calcanhares",
    "secondaryMuscles": [
      "oblíquos"
    ],
    "target": "abdômen"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "assistido",
    "gifUrl": "assets/gifs/078.png",
    "id": "0010",
    "instructions": [
      "Pendure-se em uma barra fixa com os braços totalmente estendidos e as palmas das mãos voltadas para longe de você.",
      "Ative o core e eleve os joelhos em direção ao peitoral, mantendo as pernas juntas.",
      "Quando os joelhos estiverem na altura do peitoral, jogue as pernas explosivamente para baixo, estendendo-as completamente.",
      "Deixe as pernas balançarem para cima e repita o movimento pelo número desejado de repetições."
    ],
    "name": "elevação de joelhos suspenso assistido com arremesso",
    "secondaryMuscles": [
      "flexores do quadril",
      "lombar"
    ],
    "target": "abdômen"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "assistido",
    "gifUrl": "assets/gifs/079.png",
    "id": "0011",
    "instructions": [
      "Pendure-se em uma barra fixa com os braços totalmente estendidos e as palmas das mãos voltadas para longe de você.",
      "Ative os músculos do core e eleve os joelhos em direção ao peitoral, dobrando quadris e joelhos.",
      "Pause por um momento no topo do movimento, contraindo o abdômen.",
      "Abaixe lentamente as pernas de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação de joelhos suspenso assistido",
    "secondaryMuscles": [
      "flexores do quadril"
    ],
    "target": "abdômen"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "assistido",
    "gifUrl": "assets/gifs/080.gif",
    "id": "0012",
    "instructions": [
      "Deite-se de costas com as pernas estendidas e os braços ao lado do corpo.",
      "Coloque as mãos sob os glúteos para apoio.",
      "Ative o abdômen e levante as pernas do chão, mantendo-as retas.",
      "Mantendo as pernas juntas, abaixe-as para um lado até ficarem a alguns centímetros do chão.",
      "Pause por um momento, depois levante as pernas de volta à posição inicial.",
      "Repita o movimento para o outro lado.",
      "Continue alternando os lados pelo número desejado de repetições."
    ],
    "name": "elevação de pernas deitado assistido com arremesso lateral",
    "secondaryMuscles": [
      "flexores do quadril",
      "oblíquos"
    ],
    "target": "abdômen"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "assistido",
    "gifUrl": "assets/gifs/081.gif",
    "id": "0013",
    "instructions": [
      "Deite-se de costas com as pernas estendidas e os braços ao lado do corpo.",
      "Coloque as mãos sob os glúteos para apoio.",
      "Ative o core e levante as pernas do chão, mantendo-as retas.",
      "Levante as pernas até ficarem perpendiculares ao chão.",
      "Abaixe as pernas de volta à posição inicial.",
      "Simultaneamente, jogue as pernas para baixo em direção ao chão, mantendo-as retas.",
      "Levante as pernas novamente até a posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "elevação de pernas deitado assistido com arremesso",
    "secondaryMuscles": [
      "flexores do quadril",
      "quadríceps"
    ],
    "target": "abdômen"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "bola medicinal",
    "gifUrl": "assets/gifs/082.gif",
    "id": "0014",
    "instructions": [
      "Sente-se no chão com os joelhos dobrados e os pés apoiados no chão.",
      "Segure a bola medicinal com as duas mãos à frente do peito.",
      "Incline-se levemente para trás, ativando o abdômen e mantendo as costas retas.",
      "Gire lentamente o tronco para a direita, levando a bola medicinal em direção ao lado direito do corpo.",
      "Pause por um momento, depois gire o tronco para a esquerda, levando a bola medicinal para o lado esquerdo.",
      "Continue alternando os lados pelo número desejado de repetições."
    ],
    "name": "torção russa assistida com bola medicinal",
    "secondaryMuscles": [
      "oblíquos",
      "lombar"
    ],
    "target": "abdômen"
  },
  {
    "bodyPart": "Abdomen",
    "equipment": "barra",
    "gifUrl": "assets/gifs/083.gif",
    "id": "0071",
    "instructions": [
      "Deite-se de costas em um colchonete com os joelhos dobrados e os pés apoiados no chão.",
      "Segure a barra com pegada pronada, apoiando-a sobre o peito.",
      "Ativando o abdômen, eleve lentamente a parte superior do corpo do chão, enrolando o tronco até formar um ângulo de 45 graus.",
      "Pause por um momento no topo, depois abaixe lentamente a parte superior do corpo de volta à posição inicial.",
      "Repita pelo número desejado de repetições."
    ],
    "name": "abdominal com barra no peito",
    "secondaryMuscles": [
      "ombro",
      "peitoral"
    ],
    "target": "abdômen"
  }
];
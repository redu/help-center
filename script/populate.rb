# encoding: utf-8

#!/usr/bin/env ruby

def fill_db
  faq = Faq.create(title: "Dúvidas Frequentes", icon_name: "frequent-questions")

  general = Topic.create(title: "Redu em Geral", icon_name: "frequent-questions")
  general.move_to_child_of(faq)

  first = Topic.create(title: "Primeiros Passos", icon_name: "frequent-questions")
  first.move_to_child_of(general)

  what = Topic.create(title: "O que é o Redu?", icon_name: "doubt-topic", body: "O Redu é uma plataforma educacional que favorece a aprendizagem e o desenvolvimento de habilidades por meio da tecnologia. Além de fornecer recursos específicos à prática do Ensino A Distância, o Redu permite a criação, o compartilhamento e a discussão de conteúdos das mais diversas formas – estimulando, assim, o aprendizado, a colaboração e a diversão.

A fim de atingir esse objetivo, a plataforma se utiliza de recursos presentes em redes sociais: murais de discussão, vínculos interpessoais e troca de mensagens instantâneas, por exemplo. Dessa maneira, aulas, exercícios e outros componentes aplicados à educação transpõem as barreiras da sala de aula, a distância entre professor e aluno deixa de ser um obstáculo à aprendizagem e o conhecimento flui livre e espontaneamente.")
  what.move_to_child_of(first)

  what = Topic.create(title: "Eu sou aluno. O que o Redu tem a me oferecer?", icon_name: "doubt-topic", body: "O céu é o limite. O Redu provê as ferramentas e os meios oportunos para que alunos de ensino fundamental, médio, técnico e superior alcancem seus objetivos, supram suas necessidades de saber e estendam seus conhecimentos – o que é feito em parceria com professores (fornecedores de conteúdo, avaliadores e auxiliadores dos alunos) e gestores (administradores de ambientes de aprendizagem encarregados de gerenciar para que todos tirem o máximo proveito da plataforma).

Além de tudo isso, como o Redu se baseia fortemente nas características de colaboração e interação das redes sociais, os alunos podem se comunicar livremente com outros alunos, professores e gestores, incentivar e participar em discussões através de seus murais e se divertir por meio de Recursos Educacionais Abertos, aplicativos disponibilizados pela plataforma de aplicativos e outros recursos oferecidos pelo Redu.")
  what.move_to_child_of(first)

  what = Topic.create(title: "Eu sou professor. O que o Redu tem a me oferecer?", icon_name: "doubt-topic", body: "O professor é o elo maior entre o aprendizado e o aprendiz. O Redu dá suporte aos mestres do saber favorecendo a criação e manutenção de ambientes virtuais de aprendizagem em que seus alunos possam navegar facilmente, assistir a vídeo-aulas, visualizar documentos, responder a exercícios avaliativos e realizar outras atividades que estimulem a assimilação dos conteúdos didáticos.

A plataforma disponibilizada preza pela facilidade de disponibilização desses conteúdos, permitindo ao professor maior controle sobre seus materiais e possibilitando sua reutilização com diversas turmas – o que culmina em ganho de tempo na execução da prática docente.")
  what.move_to_child_of(first)

  functionalities = Topic.create(title: "Funcionalidades", icon_name: "frequent-questions")
  functionalities.move_to_child_of(faq)

  social = Topic.create(title: "Rede Social", icon_name: "social-networks")
  social.move_to_child_of(functionalities)

  what = Topic.create(title: "O que é a Rede Social no Redu?", icon_name: "doubt-topic", body: "O Redu é uma rede social com foco educacional, um ambiente de troca e compartilhamento de informacoes entre os usuários. O detalhe da rede social está em poder adicionar os seus amigos, enviar mensagens direta, conversar através do chat, postar dúvidas, links e interagir com outros contatos através do mural. ")
  what.move_to_child_of(social)

  what = Topic.create(title: "Como posso adicionar contatos?", icon_name: "doubt-topic", body: "Assim que você se conecta no Redu, o chat fica disponível. Clicando nele todos os seus amigos que estão online irão aparecer como disponível e você pode entrar em contato de forma mais direta.")
  what.move_to_child_of(social)

  chat = Topic.create(title: "Chat", icon_name: "chat")
  chat.move_to_child_of(functionalities)

  what = Topic.create(title: "Como funciona o Chat do Redu?", icon_name: "doubt-topic", body: "Para adicionar um amigo / contato, você vai no perfil da pessoa que deseja adicionar e clica no botão “Adicionar Contato” na parte superior do menu da direita.")
  what.move_to_child_of(chat)

  what = Topic.create(title: "Posso mudar meu status no Chat do Redu?", icon_name: "doubt-topic", body: "Não ha possibilidade de alterar o status, pois o objetivo do mesmo é incentivar o usuário a ter uma conversa mais pessoal com sua rede de contatos.")
  what.move_to_child_of(chat)

  basic = BasicGuide.create(title: "Guia Básico", icon_name: "basic-guide", body: "Conheça o funcionamento básico do Redu, sua estrutura e funcionalidades; e como tirar proveito de cada uma delas.")

  start = Topic.create(title: "Começando...")
  start.move_to_child_of(basic)
  what = Topic.create(title: "O que é o Redu?", icon_name: "guide-topic", body: "O Redu é uma plataforma educacional que favorece a aprendizagem e o desenvolvimento de habilidades por meio da tecnologia. Além de fornecer recursos específicos à prática do Ensino A Distância, o Redu permite a criação, o compartilhamento e a discussão de conteúdos das mais diversas formas – estimulando, assim, o aprendizado, a colaboração e a diversão.

A fim de atingir esse objetivo, a plataforma se utiliza de recursos presentes em redes sociais: murais de discussão, vínculos interpessoais e troca de mensagens instantâneas, por exemplo. Dessa maneira, aulas, exercícios e outros componentes aplicados à educação transpõem as barreiras da sala de aula, a distância entre professor e aluno deixa de ser um obstáculo à aprendizagem e o conhecimento flui livre e espontaneamente.")
  what.move_to_child_of(start)

  what = Topic.create(title: "Cadastro", icon_name: "guide-topic", body: "Vá em “www.redu.com.br”, e no menu superior clique no botão “Não possui conta? Cadastre-se, é grátis”, ou
acesse diretamente “www.redu.com.br/registrar”. Nos campos vazios, preencha:

Informações pessoais - nome, sobrenome;
Informações de contato - crie um login não existente com 5 a 20 caracteres, informe seu email e o repita no campo de confirmação;
Senha - crie uma senha de no mínimo 6 (e no máximo 20) caracteres e preencha o campo de confirmação com a mesma senha;

Quase lá! É importante que você tenha em mente os Termos de Uso da plataforma Redu. Caso os aceite, marque a opção “Aceito” e clique no botão “Cadastrar”. Sua conta está criada e você já pode utilizar o Redu.

É necessário, no entanto, confirmar a conta. Para isso, o sistema enviará um email para sua caixa de entrada e, na mensagem, haverá um link: clique nele. Parabéns, todo o processo foi concluído! Obs.: Você tem até 30 dias para realizar esta última etapa.

Você também pode efetuar o cadastro utilizando sua conta do Facebook. Para isto basta clicar, no formulário de cadastro, em 'Cadastre-se no Redu utilizando sua conta do Facebook' ou, no box de login (mais informações na próxima seção), em 'Entre com sua conta do Facebook.")
  what.move_to_child_of(start)

  navigation = Topic.create(title: "A Navegação no Redu")
  navigation.move_to_child_of(basic)
  what = Topic.create(title: "Hierarquia e Áreas do Redu", icon_name: "redu-areas", body: "O Menu Superior está visivel em toda a navegação do Redu. Nele constam os botões:

Início: te direciona para a navegação casual (link para explicação de Início)
Ensine: te direciona para a criação de ambiente e posteriormente cursos, disciplinas e módulos. (link para a explicação de ambientes)
Cursos: te direciona para a busca dos cursos existentes no Redu. Os primeiros cursos que aparecem são aqueles que foram modificados mais recentemente, você pode visualizar todos os cursos, aqueles que você é aluno, ou os cursos que você administra. Você também pode procurar pelo nome do curso digitando no campo de busca o nome desejado e em seguida apertando enter, ou clicando no botão 'Buscar'. No lado esquerdo você tem a opção de filtrar os cursos mostrados pelas suas características, podendo escolher mais de uma: Ensino Superior, Ensino Médio, Ensino Fundamental, Pesquisa, Empresa, Concurso, Pré-Vestibular, Certificações ou Diversos.

No lado direito do menu superior você pode passar o mouse por cima do seu login e terá acesso ao seu Perfil, suas Mensagens e Configurações e a tela de Parceiros do Redu. Há também a opção de se desconectar do Redu ao clicar em Sair.
A fim de atingir esse objetivo, a plataforma se utiliza de recursos presentes em redes sociais: murais de discussão, vínculos interpessoais e troca de mensagens instantâneas, por exemplo. Dessa maneira, aulas, exercícios e outros componentes aplicados à educação transpõem as barreiras da sala de aula, a distância entre professor e aluno deixa de ser um obstáculo à aprendizagem e o conhecimento flui livre e espontaneamente.")
  what.move_to_child_of(navigation)

  what = Topic.create(title: "Meu Perfil", icon_name: "profile", body: "A página de perfil pessoal pode ser visualizada através do menu superior (posicionando o cursor sobre o seu nome que aparece no canto superior direito e clicando em 'Meu Perfil') ou acessando o endereço único de cada usuário do Redu 'www.redu.com.br/pessoas/<nome de usuário>' em que <nome de usuário> é substituído pelo nome do usuário. Por exemplo: Tiago Lima (que tem nome de usuário tiagolima) pode ter seu perfil acessado através do link 'www.redu.com.br/pessoas/tiagolima'.

No conteúdo central desta página, você visualizará e estará disponibilizando aos outros informacões sobre você. Essas informações subdividem-se em pessoais e curriculares. As pessoais consistem em:

Nome e Sobrenome: em destaque acima de todas as outras informações, Data de Nascimento, Cidade onde nasceu, Cidade onde vive, idade, Idiomas: em detalhe logo abaixo de seu nome;

Sobre você, Frase marcante, Interesses, Contatos (celular, perfis de outras redes sociais): fazem parte de sua Descrição.

As informações curriculares situam-se logo abaixo das informações pessoais. São elas:

Título da profissão, empresa(s) em que trabalha ou trabalhou, tempo em que executou cada função, descrição do trabalho: fazem parte do tópico Experiência Profissional

Categoria de Ensino, Instituição de Ensino, Nome do curso, ano de ingresso, descrição do curso: fazem parte do tópico Experiênca Acadêmica

As principais informações dos últimos tópicos também aparecem em detalhe logo abaixo de seu nome. Há também um link para edição das informações do perfil no canto superior direito do conteúdo central.

Na barra lateral esquerda você poderá navegar para seu Mural ou Contatos. Na direita poderá visualizar os cursos em que está inscrito.")
  what.move_to_child_of(navigation)

  home = Topic.create(title: "Início", icon_name: "home")
  home.move_to_child_of(basic)

  what = Topic.create(title: "Imagem (Foto)", icon_name: "profile", body: "Está no topo do Menu Esquerdo. Ao lado dela você encontrará as opções de visualizar perfil e mudar a foto.")
  what.move_to_child_of(home)

  what = Topic.create(title: "Visão Geral", icon_name: "home", body: "Em “Visão geral” constam as atualições de seus Ambientes e Contatos: comentários, respostas, pedidos de ajuda, novos cursos, novos membros, etc.

Para cada atualização de comentários você terá a opção de responder no lado direito inferior do post.")
  what.move_to_child_of(home)

  what = Topic.create(title: "Meu Mural", icon_name: "wall", body: "Em “Meu Mural” constam todos os seus próprios comentários/postagens, os comentários feitos diretamente no seu mural, suas atualizações nos ambientes e seus novos contatos.

É também em “Meu Mural” que você escreve e envia seus comentários, preenchendo o campo localizado na parte superior do conteúdo central. Ao escrever você pode enviar, ou cancelar, clicando nos respectivos botões que estarão visíveis abaixo do campo de texto.

Para cada comentário você terá a opção de excluir ou responder do lado inferior direito do post.")
  what.move_to_child_of(home)

  what = Topic.create(title: "Mensagens", icon_name: "message", body: "Em “Mensagens” você visualizará as Mensagens Recebidas (informando assunto e remetente). Clicando na aba 'Enviadas' vocIe visualizará as Mensagens Enviadas (assunto e destinatário). Em ambos há o local de marcação para selecionar as mensagens que você deseja deletar. Ao clicar na mensagem desejada você irá visualizá-la e terá o campo de resposta logo abaixo da visualização se desejar responder. A conversação então é visualizada em lista.

Para escrever uma nova mensagem clique na aba “Nova”. Digite o destinatário, o assunto e a
mensagem nos respectivos campos e clique Enviar na parte inferior direita da janela.")
  what.move_to_child_of(home)

  config = Topic.create(title: "Configurações")
  config.move_to_child_of(home)

  what = Topic.create(title: "Biografia", icon_name: "biography", body: "Foto do seu Perfil - Mude sua foto clicando em “Choose File” e escolha um arquivo de seu computador.
Dados Pessoais - Preencha nos campos indicados: Nome, Sobrenome, Data de Nascimento, Cidade onde nasceu, Cidade onde vive, Celular e Idiomas.
Mais - Escreva sobre sua personalidade ou informações adicionais em “Sobre Você”; escreva uma frase sua ou de outra pessoa, que reflita sua maneira de pensar e agir em “Frase Marcante”; cite ramos do conhecimento que despertam seu interesse em “Áreas de seu interesse”
Perfis adicionais - coloque o link de seu perfil de outras redes sociais.
Ao concluir clique em “Salvar alterações” no canto inferior direito do conteúdo central.")
  what.move_to_child_of(config)

  what = Topic.create(title: "Currículo", icon_name: "curriculum", body: "Nesta seção, você pode alocar informações a respeito de sua formação escolar e acadêmica, bem como sua experiência no mercado de trabalho.

Exponha seu currículo de forma simples e divulgue-o junto a sua rede de contatos.

Experiência Profissional - Em “+ Novo Projeto” preencha o Nome de sua profissão, empresa atual, data de entrada e faça uma pequena descrição das atividades pelas quais é responsável. Você pode adicionar outros itens de trabalhos anteriores. Para os itens adicionados você também pode editar a exepriência clicando em 'editar' do lado esquerdo do título da profissão, existe também a opção de excluir o item clicando no 'x' no canto superior direito.

Experiência Acadêmica - Em educação há quatro categorias: ensino fundamental, superior, complementar e eventos. Fundamental: corresponde à sua educação básica escolar; Superior: academia e correlatos; Complementar: cursos extras; Eventos: seminários e palestras. Clicando em “Adicionar novo item” preencha os campos com as informações requisitadas. Você pode editar ou excluir os itens depois de adicioná-los.")
  what.move_to_child_of(config)

  gestor = Guide.create(title: "Guia do Gestor", icon_name: "manager", body: "Conheça o funcionamento do Redu sob a perspectiva de um Gestor da Instituição de Ensino e como utilizá-lo para gerenciar o desempenho de seu Ambiente.")

  start = Topic.create(title: "Começando...")
  start.move_to_child_of(gestor)

  what = Topic.create(title: "O que fazer como Gestor(a) de um Ambiente?", icon_name: "guide-topic", body: "O gestor de um Ambiente no Redu, tem à sua disposição o controle de membros e todo conteúdo desse ambiente. O gestor pode criar desde Cursos até Aulas, adicionar material de apoio, e convidar Alunos, Professores e Tutores para participar do ambiente, também pode trocar os seus papéis a qualquer momento ou até mesmo remover algum membro. Terá acesso à relatórios estatísticos e descritivos sobre a participação dos Alunos e Professores, além de poder interagir dentro do ambiente com os membros.

O gestor é responsável pela manutenção do plano para aquele ambiente, ou seja, é ele quem é responsável pelo controle da quantidade de membros e materiais que podem ser adicionados ao ambiente e também quanto ao pagamento das faturas, para planos pagos.")
  what.move_to_child_of(start)

  environment = Topic.create(title: "Ambientes de Aprendizagem", icon_name: "environment")
  environment.move_to_child_of(gestor)

  what = Topic.create(title: "Convidar alunos para o Curso", icon_name: "member", body: "Para convidar Alunos é simples, basta ir até a página do Curso, ao lado da aba 'Disciplinas' existe outra aba clique nela(seria bom colocar o ícone que aparece), e você verá no conteúdo central os membros do Curso, do lado direito da tela existe um botão 'Convidar membros' clique nele e você será direcionado para a página de convites, lá você pode convidar os Alunos pelo nome ou pelo e-mail apenas digitando no campo que aparece logo abaixo de 'Convide membros para o seu curso'. Ao terminar de escrever os nomes ou e-mails clique em enviar convites, e um convite será enviado para os Alunos.")
  what.move_to_child_of(environment)

  manage = Topic.create(title: "Gerenciamento")
  manage.move_to_child_of(environment)

  what = Topic.create(title: "Informações", icon_name: "description", body: "Assim que a página de gerenciamento é carregada as informações referentes ao seu espaço serão mostradas com seus detalhes, você também tem a opção de editar essas informações básicas como nome, descrição, palavras-chaves e configurações específicas de cada tipo de ambiente. Depois de alterar as informações, confirme clicando em 'Salvar alterações'.

Caso deseje remover o Ambiente clique no botão vermelho na parte inferior do lado esquerdo 'Remover'")
  what.move_to_child_of(manage)

  Guide.create(title: "Guia do Aluno", icon_name: "wall", body: "Conheça o funcionamento do Redu sob a perspectiva de um Aluno e como utilizá-lo para melhorar seu aprendizado.")

  Guide.create(title: "Guia do Professor", icon_name: "teacher", body: "Conheça o funcionamento do Redu sob a perspectiva de um Professor e como utilizá-lo para melhorar o aprendizado de seus alunos.")

  Guide.create(title: "Guia do Desenvolvedor", icon_name: "app", body: "Conheça as ferramentas que o Redu disponibiliza aos Desenvolvedores de Software e saiba como integrar a outros serviços.")
end

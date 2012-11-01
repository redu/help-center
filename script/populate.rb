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
  social.move_to_child_of(general)

  what = Topic.create(title: "O que é a Rede Social no Redu?", icon_name: "doubt-topic", body: "O Redu é uma rede social com foco educacional, um ambiente de troca e compartilhamento de informacoes entre os usuários. O detalhe da rede social está em poder adicionar os seus amigos, enviar mensagens direta, conversar através do chat, postar dúvidas, links e interagir com outros contatos através do mural. ")
  what.move_to_child_of(social)

  what = Topic.create(title: "Como posso adicionar contatos?", icon_name: "doubt-topic", body: "Assim que você se conecta no Redu, o chat fica disponível. Clicando nele todos os seus amigos que estão online irão aparecer como disponível e você pode entrar em contato de forma mais direta.")
  what.move_to_child_of(social)

  chat = Topic.create(title: "Chat", icon_name: "chat")
  chat.move_to_child_of(general)

  what = Topic.create(title: "Como funciona o Chat do Redu?", icon_name: "doubt-topic", body: "Para adicionar um amigo / contato, você vai no perfil da pessoa que deseja adicionar e clica no botão “Adicionar Contato” na parte superior do menu da direita.")
  what.move_to_child_of(chat)

  what = Topic.create(title: "Posso mudar meu status no Chat do Redu?", icon_name: "doubt-topic", body: "Não ha possibilidade de alterar o status, pois o objetivo do mesmo é incentivar o usuário a ter uma conversa mais pessoal com sua rede de contatos.")
  what.move_to_child_of(chat)

  BasicGuide.create(title: "Guia Básico", icon_name: "basic-guide")
  Guide.create(title: "Guia do Aluno", icon_name: "wall")
  Guide.create(title: "Guia do Professor", icon_name: "teacher")
  Guide.create(title: "Guia do Gestor", icon_name: "manager")
  Guide.create(title: "Guia do Desenvolvedor", icon_name: "app")
end

# encoding: utf-8

namespace :populate do
  desc "Populate DB with Faq, Guides and Basic Guide"
  task :minimun => :environment do
    cats = Array.new
    cats << Faq.create(title: "Dúvidas Frequentes", icon_name: "frequent-questions")
    cats << BasicGuide.create(title: "Guia Básico", icon_name: "basic-guide")
    cats << Guide.create(title: "Guia do Aluno", icon_name: "wall")
    cats << Guide.create(title: "Guia do Professor", icon_name: "teacher")
    cats << Guide.create(title: "Guia do Gestor", icon_name: "manager")
    cats << Guide.create(title: "Guia do Desenvolvedor", icon_name: "app")
  end
end


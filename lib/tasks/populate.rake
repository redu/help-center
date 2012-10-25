# encoding: utf-8

namespace :populate do
  desc "Populate DB with Faq and Guides"
  task :minimun => :environment do
    cats = Array.new
    cats << Faq.create(title: "Dúvidas Frequentes")
    cats << Guide.create(title: "Guia Básico")
    cats << Guide.create(title: "Guia do Aluno")
    cats << Guide.create(title: "Guia do Professor")
    cats << Guide.create(title: "Guia do Gestor")
    cats << Guide.create(title: "Guia do Desenvolvedor")
  end
end


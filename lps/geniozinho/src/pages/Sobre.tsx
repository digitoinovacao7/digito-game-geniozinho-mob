
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Target, Users, Award } from "lucide-react";

const Sobre = () => {
  return (
    <div className="min-h-screen bg-fundo-claro">
      <Header />
      
      <section className="pt-20 pb-16 px-4">
        <div className="container mx-auto">
          <div className="max-w-4xl mx-auto">
            {/* Header */}
            <div className="text-center mb-12">
              <h1 className="font-poppins font-bold text-4xl lg:text-5xl text-cinza-profundo mb-4">
                Sobre o{" "}
                <span className="text-verde-genio">Gêniozinho</span>
              </h1>
              <p className="font-inter text-xl text-cinza-suave">
                Conheça nossa missão de tornar o aprendizado mais divertido e eficaz
              </p>
            </div>

            {/* Mission */}
            <div className="bg-white rounded-2xl shadow-lg p-8 mb-12">
              <div className="text-center mb-8">
                <div className="w-16 h-16 bg-verde-genio/10 rounded-full flex items-center justify-center mx-auto mb-4">
                  <Target className="w-8 h-8 text-verde-genio" />
                </div>
                <h2 className="font-poppins font-bold text-2xl text-cinza-profundo mb-4">
                  Nossa Missão
                </h2>
              </div>
              
              <p className="font-inter text-lg text-cinza-suave leading-relaxed mb-6">
                O Gêniozinho nasceu da convicção de que o aprendizado deve ser uma experiência 
                prazerosa e transformadora. Acreditamos que cada pessoa possui um potencial 
                intelectual único que pode ser desenvolvido através de desafios estimulantes 
                e métodos educativos inovadores.
              </p>
              
              <p className="font-inter text-lg text-cinza-suave leading-relaxed">
                Nossa missão é democratizar o acesso a jogos educativos de alta qualidade, 
                proporcionando ferramentas que fortalecem as capacidades cognitivas de forma 
                divertida e eficaz, independentemente da idade ou background educacional.
              </p>
            </div>

            {/* Values */}
            <div className="grid md:grid-cols-2 gap-8 mb-12">
              <div className="bg-white rounded-xl p-6 shadow-lg">
                <Users className="w-8 h-8 text-verde-genio mb-4" />
                <h3 className="font-poppins font-semibold text-xl text-cinza-profundo mb-3">
                  Acessibilidade Universal
                </h3>
                <p className="font-inter text-cinza-suave leading-relaxed">
                  Desenvolvemos jogos que podem ser aproveitados por pessoas de todas as idades 
                  e níveis de habilidade, garantindo que ninguém fique para trás na jornada 
                  do conhecimento.
                </p>
              </div>
              
              <div className="bg-white rounded-xl p-6 shadow-lg">
                <Award className="w-8 h-8 text-verde-genio mb-4" />
                <h3 className="font-poppins font-semibold text-xl text-cinza-profundo mb-3">
                  Excelência Científica
                </h3>
                <p className="font-inter text-cinza-suave leading-relaxed">
                  Nossos jogos são baseados em pesquisas científicas sobre neuroplasticidade, 
                  psicologia cognitiva e métodos pedagógicos modernos, garantindo eficácia 
                  comprovada.
                </p>
              </div>
            </div>

            {/* Story */}
            <div className="bg-gradient-to-r from-verde-genio/10 to-verde-genio/5 rounded-2xl p-8 mb-12">
              <h2 className="font-poppins font-bold text-2xl text-cinza-profundo mb-6 text-center">
                Nossa História
              </h2>
              
              <div className="space-y-6">
                <p className="font-inter text-lg text-cinza-suave leading-relaxed">
                  O Gêniozinho foi criado por uma equipe multidisciplinar de educadores, 
                  psicólogos cognitivos e desenvolvedores de jogos que compartilhavam uma 
                  visão comum: transformar a maneira como as pessoas aprendem e se desenvolvem 
                  intelectualmente.
                </p>
                
                <p className="font-inter text-lg text-cinza-suave leading-relaxed">
                  Após anos de pesquisa e desenvolvimento, combinando os mais recentes avanços 
                  em neurociência com técnicas de gamificação comprovadas, nasceu o Gêniozinho - 
                  uma plataforma que torna o fortalecimento mental tão viciante quanto os melhores 
                  jogos de entretenimento.
                </p>
                
                <p className="font-inter text-lg text-cinza-suave leading-relaxed">
                  Hoje, milhares de usuários ao redor do mundo confiam no Gêniozinho para 
                  desenvolver suas capacidades cognitivas, alcançar melhores resultados acadêmicos 
                  e profissionais, e simplesmente desfrutar do prazer de aprender algo novo 
                  todos os dias.
                </p>
              </div>
            </div>

            {/* Team */}
            <div className="text-center">
              <h2 className="font-poppins font-bold text-2xl text-cinza-profundo mb-6">
                Equipe Dedicada
              </h2>
              <p className="font-inter text-lg text-cinza-suave leading-relaxed max-w-3xl mx-auto">
                Nossa equipe é formada por especialistas apaixonados por educação e tecnologia, 
                trabalhando incansavelmente para criar experiências de aprendizado que são 
                simultaneamente desafiadoras, divertidas e transformadoras. Cada membro contribui 
                com sua expertise única para garantir que o Gêniozinho continue evoluindo e 
                atendendo às necessidades de nossos usuários.
              </p>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </div>
  );
};

export default Sobre;


import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { FileText, Scale, AlertTriangle, CheckCircle } from "lucide-react";

const TermosCondicoes = () => {
  return (
    <div className="min-h-screen bg-fundo-claro">
      <Header />
      
      <section className="pt-20 pb-16 px-4">
        <div className="container mx-auto">
          <div className="max-w-4xl mx-auto">
            {/* Header */}
            <div className="text-center mb-12">
              <div className="w-16 h-16 bg-verde-genio/10 rounded-full flex items-center justify-center mx-auto mb-6">
                <FileText className="w-8 h-8 text-verde-genio" />
              </div>
              <h1 className="font-poppins font-bold text-4xl lg:text-5xl text-cinza-profundo mb-4">
                Termos e{" "}
                <span className="text-verde-genio">Condições</span>
              </h1>
              <p className="font-inter text-xl text-cinza-suave">
                Última atualização: Janeiro de 2025
              </p>
            </div>

            {/* Content */}
            <div className="space-y-8">
              {/* Introduction */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <div className="flex items-center mb-4">
                  <Scale className="w-6 h-6 text-verde-genio mr-3" />
                  <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo">
                    Acordo de Uso
                  </h2>
                </div>
                <p className="font-inter text-lg text-cinza-suave leading-relaxed">
                  Bem-vindo ao Gêniozinho! Estes termos e condições governam o uso do nosso 
                  aplicativo e serviços. Ao usar o Gêniozinho, você concorda em cumprir estes 
                  termos. Por favor, leia-os cuidadosamente.
                </p>
              </div>

              {/* Service Description */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-6">
                  1. Descrição do Serviço
                </h2>
                
                <p className="font-inter text-lg text-cinza-suave leading-relaxed mb-4">
                  O Gêniozinho é uma plataforma de jogos educativos projetada para desenvolver 
                  habilidades cognitivas através de desafios mentais. Oferecemos:
                </p>
                
                <ul className="font-inter text-cinza-suave space-y-2 ml-4">
                  <li>• Jogos de quebra-cabeças matemáticos</li>
                  <li>• Exercícios de memória e concentração</li>
                  <li>• Desafios de lógica e raciocínio</li>
                  <li>• Treinamento de cálculo mental</li>
                  <li>• Jogos temáticos educativos</li>
                  <li>• Sistema de progresso personalizado</li>
                </ul>
              </div>

              {/* User Responsibilities */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-6">
                  2. Responsabilidades do Usuário
                </h2>
                
                <div className="space-y-4">
                  <div>
                    <h3 className="font-poppins font-semibold text-lg text-cinza-profundo mb-2">
                      Uso Adequado:
                    </h3>
                    <ul className="font-inter text-cinza-suave space-y-2 ml-4">
                      <li>• Utilizar o aplicativo apenas para fins educativos e pessoais</li>
                      <li>• Não tentar burlar ou hackear o sistema de jogos</li>
                      <li>• Respeitar outros usuários em interações sociais</li>
                      <li>• Não compartilhar credenciais de conta com terceiros</li>
                    </ul>
                  </div>
                  
                  <div>
                    <h3 className="font-poppins font-semibold text-lg text-cinza-profundo mb-2">
                      Idade Mínima:
                    </h3>
                    <p className="font-inter text-cinza-suave ml-4">
                      Usuários menores de 13 anos devem ter supervisão dos pais ou responsáveis 
                      legais para usar o aplicativo.
                    </p>
                  </div>
                </div>
              </div>

              {/* Prohibited Activities */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <div className="flex items-center mb-4">
                  <AlertTriangle className="w-6 h-6 text-red-500 mr-3" />
                  <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo">
                    3. Atividades Proibidas
                  </h2>
                </div>
                
                <p className="font-inter text-lg text-cinza-suave leading-relaxed mb-4">
                  Para manter um ambiente seguro e positivo, as seguintes atividades são proibidas:
                </p>
                
                <div className="grid md:grid-cols-2 gap-6">
                  <ul className="font-inter text-cinza-suave space-y-2">
                    <li>• Uso de software malicioso ou vírus</li>
                    <li>• Tentativas de acesso não autorizado</li>
                    <li>• Distribuição de conteúdo ofensivo</li>
                    <li>• Violação de direitos autorais</li>
                  </ul>
                  <ul className="font-inter text-cinza-suave space-y-2">
                    <li>• Spam ou comunicação não solicitada</li>
                    <li>• Uso comercial não autorizado</li>
                    <li>• Criação de contas falsas</li>
                    <li>• Interferência no funcionamento do app</li>
                  </ul>
                </div>
              </div>

              {/* Intellectual Property */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-6">
                  4. Propriedade Intelectual
                </h2>
                
                <p className="font-inter text-lg text-cinza-suave leading-relaxed mb-4">
                  Todo o conteúdo do Gêniozinho, incluindo jogos, design, código, textos, 
                  gráficos e algoritmos, é propriedade exclusiva da nossa empresa e está 
                  protegido por leis de direitos autorais e propriedade intelectual.
                </p>
                
                <div className="bg-verde-genio/10 rounded-lg p-4">
                  <p className="font-inter text-cinza-profundo font-medium">
                    <CheckCircle className="w-5 h-5 text-verde-genio inline mr-2" />
                    Você recebe uma licença limitada e não exclusiva para uso pessoal do aplicativo.
                  </p>
                </div>
              </div>

              {/* Limitation of Liability */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-6">
                  5. Limitação de Responsabilidade
                </h2>
                
                <p className="font-inter text-lg text-cinza-suave leading-relaxed mb-4">
                  Embora nos esforcemos para fornecer um serviço de alta qualidade, fornecemos 
                  o aplicativo "como está" e não podemos garantir:
                </p>
                
                <ul className="font-inter text-cinza-suave space-y-2 ml-4 mb-4">
                  <li>• Funcionamento ininterrupto do aplicativo</li>
                  <li>• Ausência total de bugs ou erros</li>
                  <li>• Resultados específicos de aprendizado</li>
                  <li>• Compatibilidade com todos os dispositivos</li>
                </ul>
                
                <p className="font-inter text-cinza-suave leading-relaxed">
                  Nossa responsabilidade está limitada ao valor pago pelo usuário nos últimos 
                  12 meses, quando aplicável.
                </p>
              </div>

              {/* Modifications */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-6">
                  6. Modificações do Serviço
                </h2>
                
                <p className="font-inter text-lg text-cinza-suave leading-relaxed">
                  Reservamo-nos o direito de modificar, suspender ou descontinuar qualquer 
                  parte do serviço a qualquer momento, com ou sem aviso prévio. Também podemos 
                  atualizar estes termos ocasionalmente. Mudanças significativas serão comunicadas 
                  através do aplicativo ou por e-mail.
                </p>
              </div>

              {/* Termination */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-6">
                  7. Rescisão
                </h2>
                
                <div className="space-y-4">
                  <div>
                    <h3 className="font-poppins font-semibold text-lg text-cinza-profundo mb-2">
                      Por parte do usuário:
                    </h3>
                    <p className="font-inter text-cinza-suave ml-4">
                      Você pode encerrar sua conta a qualquer momento através das configurações 
                      do aplicativo ou entrando em contato conosco.
                    </p>
                  </div>
                  
                  <div>
                    <h3 className="font-poppins font-semibold text-lg text-cinza-profundo mb-2">
                      Por nossa parte:
                    </h3>
                    <p className="font-inter text-cinza-suave ml-4">
                      Podemos suspender ou encerrar contas que violem estes termos, após 
                      notificação adequada sempre que possível.
                    </p>
                  </div>
                </div>
              </div>

              {/* Contact */}
              <div className="bg-gradient-to-r from-verde-genio/10 to-verde-genio/5 rounded-xl p-8">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-4">
                  Dúvidas sobre os Termos?
                </h2>
                <p className="font-inter text-lg text-cinza-suave leading-relaxed mb-4">
                  Se você tiver qualquer dúvida sobre estes termos e condições, entre em 
                  contato conosco:
                </p>
                <p className="font-inter text-verde-genio font-semibold">
                  legal@geniozinho.com.br
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <Footer />
    </div>
  );
};

export default TermosCondicoes;

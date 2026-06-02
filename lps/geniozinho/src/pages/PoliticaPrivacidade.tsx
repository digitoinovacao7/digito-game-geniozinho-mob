
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Shield, Eye, Lock, UserCheck } from "lucide-react";

const PoliticaPrivacidade = () => {
  return (
    <div className="min-h-screen bg-fundo-claro">
      <Header />
      
      <section className="pt-20 pb-16 px-4">
        <div className="container mx-auto">
          <div className="max-w-4xl mx-auto">
            {/* Header */}
            <div className="text-center mb-12">
              <div className="w-16 h-16 bg-verde-genio/10 rounded-full flex items-center justify-center mx-auto mb-6">
                <Shield className="w-8 h-8 text-verde-genio" />
              </div>
              <h1 className="font-poppins font-bold text-4xl lg:text-5xl text-cinza-profundo mb-4">
                Política de{" "}
                <span className="text-verde-genio">Privacidade</span>
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
                  <Eye className="w-6 h-6 text-verde-genio mr-3" />
                  <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo">
                    Transparência Total
                  </h2>
                </div>
                <p className="font-inter text-lg text-cinza-suave leading-relaxed">
                  No Gêniozinho, valorizamos profundamente sua privacidade e estamos comprometidos 
                  em proteger suas informações pessoais. Esta política explica de forma clara e 
                  transparente como coletamos, usamos, armazenamos e protegemos seus dados quando 
                  você utiliza nosso aplicativo e serviços.
                </p>
              </div>

              {/* Information Collection */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-6">
                  1. Informações que Coletamos
                </h2>
                
                <div className="space-y-4">
                  <div>
                    <h3 className="font-poppins font-semibold text-lg text-cinza-profundo mb-2">
                      Informações Fornecidas por Você:
                    </h3>
                    <ul className="font-inter text-cinza-suave space-y-2 ml-4">
                      <li>• Nome de usuário e e-mail (quando criar uma conta)</li>
                      <li>• Preferências de jogos e configurações personalizadas</li>
                      <li>• Feedback e comunicações conosco</li>
                    </ul>
                  </div>
                  
                  <div>
                    <h3 className="font-poppins font-semibold text-lg text-cinza-profundo mb-2">
                      Informações Coletadas Automaticamente:
                    </h3>
                    <ul className="font-inter text-cinza-suave space-y-2 ml-4">
                      <li>• Progresso nos jogos e estatísticas de desempenho</li>
                      <li>• Tempo de uso e padrões de interação com o app</li>
                      <li>• Informações técnicas do dispositivo (modelo, sistema operacional)</li>
                      <li>• Dados de uso para melhorar nossa experiência</li>
                    </ul>
                  </div>
                </div>
              </div>

              {/* How We Use Information */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-6">
                  2. Como Usamos suas Informações
                </h2>
                
                <div className="grid md:grid-cols-2 gap-6">
                  <div>
                    <h3 className="font-poppins font-semibold text-lg text-cinza-profundo mb-3">
                      Para Melhorar sua Experiência:
                    </h3>
                    <ul className="font-inter text-cinza-suave space-y-2">
                      <li>• Personalizar desafios ao seu nível</li>
                      <li>• Salvar seu progresso</li>
                      <li>• Recomendar jogos adequados</li>
                      <li>• Fornecer suporte técnico</li>
                    </ul>
                  </div>
                  
                  <div>
                    <h3 className="font-poppins font-semibold text-lg text-cinza-profundo mb-3">
                      Para Desenvolvimento:
                    </h3>
                    <ul className="font-inter text-cinza-suave space-y-2">
                      <li>• Analisar padrões de uso</li>
                      <li>• Identificar bugs e problemas</li>
                      <li>• Desenvolver novos recursos</li>
                      <li>• Melhorar algoritmos de aprendizado</li>
                    </ul>
                  </div>
                </div>
              </div>

              {/* Data Protection */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <div className="flex items-center mb-4">
                  <Lock className="w-6 h-6 text-verde-genio mr-3" />
                  <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo">
                    3. Proteção de Dados
                  </h2>
                </div>
                
                <p className="font-inter text-lg text-cinza-suave leading-relaxed mb-4">
                  Implementamos medidas de segurança rigorosas para proteger suas informações:
                </p>
                
                <ul className="font-inter text-cinza-suave space-y-2 ml-4">
                  <li>• Criptografia de dados em trânsito e em repouso</li>
                  <li>• Servidores seguros com acesso limitado</li>
                  <li>• Monitoramento contínuo de segurança</li>
                  <li>• Políticas internas rigorosas de acesso a dados</li>
                  <li>• Auditorias regulares de segurança</li>
                </ul>
              </div>

              {/* Your Rights */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <div className="flex items-center mb-4">
                  <UserCheck className="w-6 h-6 text-verde-genio mr-3" />
                  <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo">
                    4. Seus Direitos
                  </h2>
                </div>
                
                <p className="font-inter text-lg text-cinza-suave leading-relaxed mb-4">
                  Você tem total controle sobre suas informações pessoais:
                </p>
                
                <div className="grid md:grid-cols-2 gap-6">
                  <ul className="font-inter text-cinza-suave space-y-2">
                    <li>• <strong>Acesso:</strong> Visualizar dados que temos sobre você</li>
                    <li>• <strong>Correção:</strong> Atualizar informações incorretas</li>
                    <li>• <strong>Exclusão:</strong> Solicitar remoção de seus dados</li>
                  </ul>
                  <ul className="font-inter text-cinza-suave space-y-2">
                    <li>• <strong>Portabilidade:</strong> Exportar seus dados</li>
                    <li>• <strong>Limitação:</strong> Restringir processamento</li>
                    <li>• <strong>Objeção:</strong> Recusar certos usos</li>
                  </ul>
                </div>
              </div>

              {/* Contact */}
              <div className="bg-gradient-to-r from-verde-genio/10 to-verde-genio/5 rounded-xl p-8">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-4">
                  Dúvidas sobre Privacidade?
                </h2>
                <p className="font-inter text-lg text-cinza-suave leading-relaxed mb-4">
                  Se você tiver qualquer dúvida sobre esta política de privacidade ou sobre como 
                  tratamos seus dados, entre em contato conosco:
                </p>
                <p className="font-inter text-verde-genio font-semibold">
                  privacidade@geniozinho.com.br
                </p>
              </div>

              {/* Updates */}
              <div className="bg-white rounded-xl p-8 shadow-lg">
                <h2 className="font-poppins font-semibold text-2xl text-cinza-profundo mb-4">
                  5. Atualizações desta Política
                </h2>
                <p className="font-inter text-lg text-cinza-suave leading-relaxed">
                  Podemos atualizar esta política ocasionalmente para refletir mudanças em nossos 
                  serviços ou requisitos legais. Notificaremos você sobre alterações significativas 
                  através do aplicativo ou por e-mail. A versão mais atual estará sempre disponível 
                  em nosso site e aplicativo.
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

export default PoliticaPrivacidade;

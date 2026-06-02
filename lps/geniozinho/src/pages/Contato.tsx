import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Card, CardContent } from "@/components/ui/card";
import { Mail, Phone, Users, Lightbulb, HelpCircle, Newspaper, Instagram, Youtube } from "lucide-react";
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion";
import useSEO from "@/hooks/useSEO";

const Contato = () => {
  useSEO({
    title: "Contato - Gêniozinho",
    description: "Entre em contato com nossa equipe para parcerias, suporte ou mais informações.",
    path: "/contato"
  });

  return (
    <div className="min-h-screen bg-gray-50">
      <Header />
      
      <main className="py-20 px-4 pt-32">
        <div className="container mx-auto">
          {/* Header */}
          <div className="text-center mb-16">
            <h1 className="font-poppins font-extrabold text-4xl lg:text-5xl text-gray-900 mb-4">
              Vamos Conversar!
            </h1>
            <p className="font-inter text-lg text-gray-600 max-w-2xl mx-auto">
              Adoramos ouvir nossa comunidade! Seja para parcerias, ideias ou suporte, nossa porta está sempre aberta.
            </p>
          </div>

          {/* Main Grid */}
          <div className="grid lg:grid-cols-5 gap-10">
            {/* Left Column (Contact Info) */}
            <div className="lg:col-span-2 space-y-6">
              <Card className="shadow-lg border-t-4 border-yellow-400">
                <CardContent className="p-8">
                  <div className="flex items-center mb-4">
                    <Mail className="w-7 h-7 text-yellow-600 mr-4" />
                    <h3 className="font-poppins font-semibold text-2xl text-gray-800">
                      E-mail
                    </h3>
                  </div>
                  <p className="font-inter text-gray-600 mb-1">Para marketing e parcerias:</p>
                  <a href="mailto:marketing@geniozinho.com.br" className="font-inter text-yellow-600 hover:text-yellow-700 transition-colors text-lg font-medium break-all">
                    marketing@geniozinho.com.br
                  </a>
                </CardContent>
              </Card>

              <Card className="shadow-lg border-t-4 border-yellow-400">
                <CardContent className="p-8">
                  <div className="flex items-center mb-4">
                    <Phone className="w-7 h-7 text-yellow-600 mr-4" />
                    <h3 className="font-poppins font-semibold text-2xl text-gray-800">
                      Telefones
                    </h3>
                  </div>
                  <div className="space-y-2">
                    <a href="tel:+5531983457946" className="flex items-center font-inter text-gray-700 hover:text-yellow-600 transition-colors text-lg font-medium">
                      (31) 98345-7946
                    </a>
                    <a href="tel:+5531983270513" className="flex items-center font-inter text-gray-700 hover:text-yellow-600 transition-colors text-lg font-medium">
                      (31) 98327-0513
                    </a>
                  </div>
                </CardContent>
              </Card>

              <Card className="shadow-lg">
                 <CardContent className="p-8">
                    <h3 className="font-poppins font-semibold text-xl text-gray-800 mb-4">Siga-nos</h3>
                    <div className="flex space-x-4">
                       <a href="https://www.instagram.com/geniozinhogame/" target="_blank" rel="noopener noreferrer" className="flex-1 text-center bg-gray-100 hover:bg-gray-200 p-4 rounded-lg transition-colors">
                          <Instagram className="w-8 h-8 mx-auto text-pink-600"/>
                          <span className="mt-2 text-sm font-medium text-gray-700">Instagram</span>
                       </a>
                       <a href="https://www.youtube.com/@geniozinho-d7k" target="_blank" rel="noopener noreferrer" className="flex-1 text-center bg-gray-100 hover:bg-gray-200 p-4 rounded-lg transition-colors">
                          <Youtube className="w-8 h-8 mx-auto text-red-600"/>
                          <span className="mt-2 text-sm font-medium text-gray-700">YouTube</span>
                       </a>
                    </div>
                 </CardContent>
              </Card>
            </div>

            {/* Right Column (Creative Content) */}
            <div className="lg:col-span-3">
                <div className="bg-white p-8 rounded-lg shadow-lg">
                    <h2 className="font-poppins font-bold text-2xl text-gray-900 mb-6">Como podemos ajudar?</h2>
                    <div className="grid md:grid-cols-2 gap-6 mb-8">
                        <div className="bg-yellow-50 p-4 rounded-lg flex items-center">
                            <Users className="w-6 h-6 text-yellow-600 mr-3"/>
                            <span className="font-medium text-gray-800">Parcerias e Colaborações</span>
                        </div>
                        <div className="bg-yellow-50 p-4 rounded-lg flex items-center">
                            <Lightbulb className="w-6 h-6 text-yellow-600 mr-3"/>
                            <span className="font-medium text-gray-800">Feedback e Sugestões</span>
                        </div>
                        <div className="bg-yellow-50 p-4 rounded-lg flex items-center">
                            <HelpCircle className="w-6 h-6 text-yellow-600 mr-3"/>
                            <span className="font-medium text-gray-800">Suporte e Dúvidas</span>
                        </div>
                        <div className="bg-yellow-50 p-4 rounded-lg flex items-center">
                            <Newspaper className="w-6 h-6 text-yellow-600 mr-3"/>
                            <span className="font-medium text-gray-800">Imprensa</span>
                        </div>
                    </div>

                    <h3 className="font-poppins font-bold text-2xl text-gray-900 mb-6 mt-10">Perguntas Frequentes</h3>
                    <Accordion type="single" collapsible className="w-full space-y-3">
                        <AccordionItem value="item-1" className="bg-gray-50 p-4 rounded-lg">
                            <AccordionTrigger className="font-poppins font-semibold text-left hover:no-underline">Como posso sugerir um novo jogo?</AccordionTrigger>
                            <AccordionContent className="font-inter text-gray-600 pt-2">
                                Adoramos novas ideias! Envie sua sugestão para nosso e-mail de marketing. As melhores ideias podem se tornar o próximo grande desafio do Gêniozinho!
                            </AccordionContent>
                        </AccordionItem>
                        <AccordionItem value="item-2" className="bg-gray-50 p-4 rounded-lg">
                            <AccordionTrigger className="font-poppins font-semibold text-left hover:no-underline">Vocês oferecem pacotes para escolas ou empresas?</AccordionTrigger>
                            <AccordionContent className="font-inter text-gray-600 pt-2">
                                Sim! Temos planos especiais para instituições de ensino e empresas que desejam promover o desenvolvimento cognitivo de seus alunos ou equipes. Entre em contato para saber mais.
                            </AccordionContent>
                        </AccordionItem>
                        <AccordionItem value="item-3" className="bg-gray-50 p-4 rounded-lg">
                            <AccordionTrigger className="font-poppins font-semibold text-left hover:no-underline">Encontrei um problema no app, o que fazer?</AccordionTrigger>
                            <AccordionContent className="font-inter text-gray-600 pt-2">
                                Por favor, envie um e-mail para nós com o máximo de detalhes possível (modelo do seu dispositivo, versão do app e descrição do problema). Nossa equipe de suporte técnico irá investigar e ajudar você.
                            </AccordionContent>
                        </AccordionItem>
                    </Accordion>
                </div>
            </div>
          </div>
        </div>
      </main>

      <Footer />
    </div>
  );
};

export default Contato;

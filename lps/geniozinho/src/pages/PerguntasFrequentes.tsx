import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import useSEO from "@/hooks/useSEO";
import { Brain, DollarSign, Wifi, Bug, PlusCircle, Gamepad2, ArrowRight } from 'lucide-react';
import { Link } from "react-router-dom";

const PerguntasFrequentes = () => {
  useSEO({
    title: "Perguntas Frequentes - Gêniozinho",
    description: "Encontre respostas para as dúvidas mais comuns sobre os jogos, o aplicativo e a plataforma Gêniozinho.",
    path: "/perguntas-frequentes"
  });

  const faqs = [
    {
      icon: Brain,
      question: "O que é o Gêniozinho?",
      answer: "O Gêniozinho é uma plataforma de jogos educativos projetada para desafiar e desenvolver habilidades cognitivas como lógica, memória e cálculo mental de uma forma divertida e interativa. É perfeito para todas as idades!"
    },
    {
      icon: DollarSign,
      question: "Os jogos são gratuitos?",
      answer: "Sim! Oferecemos uma grande variedade de jogos e desafios gratuitamente. Também possuímos uma versão Premium, que desbloqueia todos os níveis, remove anúncios e oferece uma experiência ainda mais completa."
    },
    {
      icon: Gamepad2,
      question: "Para qual idade o Gêniozinho é recomendado?",
      answer: "Nossos jogos foram pensados para todas as idades. Os níveis de dificuldade se ajustam, tornando-os acessíveis para crianças em fase de aprendizado e desafiadores para adultos que querem manter a mente afiada."
    },
    {
      icon: Wifi,
      question: "Preciso de internet para jogar?",
      answer: "Após baixar o aplicativo, a maioria dos nossos jogos pode ser acessada offline. No entanto, uma conexão com a internet é necessária para salvar seu progresso na nuvem, competir em rankings e receber novos desafios."
    },
    {
      icon: Bug,
      question: "Encontrei um problema ou bug. Como posso relatar?",
      answer: "Agradecemos sua ajuda! Por favor, envie os detalhes do problema (modelo do seu dispositivo, o que aconteceu, etc.) para nosso e-mail de contato. Nossa equipe técnica irá investigar o mais rápido possível."
    },
    {
      icon: PlusCircle,
      question: "Novos jogos são adicionados com frequência?",
      answer: "Sim! Estamos constantemente trabalhando em novos desafios e categorias de jogos para manter a plataforma sempre interessante e estimulante. Siga nossas redes sociais para ficar por dentro das novidades!"
    }
  ];

  return (
    <div className="bg-background text-foreground">
      <Header />
      <main className="container mx-auto px-4 py-12 pt-28">
        <div className="text-center mb-16">
          <h1 className="font-poppins font-extrabold text-4xl lg:text-5xl text-foreground mb-4">
            Perguntas Frequentes
          </h1>
          <p className="font-inter text-lg text-muted-foreground max-w-2xl mx-auto">
            Tudo o que você precisa saber sobre o Gêniozinho em um só lugar.
          </p>
        </div>

        <div className="grid lg:grid-cols-2 gap-12 items-start">
            {/* Coluna da Imagem */}
            <div className="flex items-center justify-center lg:sticky lg:top-28">
                <img 
                    src="/lovable-uploads/962c3566-e901-41f9-8f4d-02dd1688cffc.png"
                    alt="Mascote Gêniozinho com uma lupa, procurando respostas"
                    className="w-full max-w-md rounded-lg"
                    loading="lazy"
                />
            </div>

            {/* Coluna do FAQ */}
            <div className="space-y-6">
                <Accordion type="single" collapsible className="w-full space-y-4">
                    {faqs.map((faq, index) => (
                    <AccordionItem key={index} value={`item-${index}`} className="border-none">
                        <Card className="bg-card shadow-sm hover:shadow-md transition-shadow">
                            <AccordionTrigger className="font-poppins font-semibold text-left text-lg p-6 rounded-lg hover:no-underline">
                                <faq.icon className="w-6 h-6 text-primary mr-4 flex-shrink-0" />
                                {faq.question}
                            </AccordionTrigger>
                            <AccordionContent className="font-inter text-muted-foreground pt-0 pb-6 px-6 leading-relaxed">
                                {faq.answer}
                            </AccordionContent>
                        </Card>
                    </AccordionItem>
                    ))}
                </Accordion>

                <Card className="bg-accent/10 border-accent/20 border-2 shadow-lg mt-8">
                    <CardContent className="p-8 text-center">
                        <h3 className="font-poppins font-bold text-2xl text-foreground mb-3">Não encontrou sua resposta?</h3>
                        <p className="text-muted-foreground mb-6">Nossa equipe está pronta para ajudar. Entre em contato conosco e teremos prazer em responder.</p>
                        <Link to="/contato">
                            <Button variant="accent">
                                Fale Conosco <ArrowRight className="ml-2 h-4 w-4"/>
                            </Button>
                        </Link>
                    </CardContent>
                </Card>
            </div>
        </div>
      </main>
      <Footer />
    </div>
  );
};

export default PerguntasFrequentes;
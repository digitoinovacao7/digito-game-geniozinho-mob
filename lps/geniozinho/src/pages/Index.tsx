import * as React from "react";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import DownloadButtons from "@/components/DownloadButtons";
import SEO from "@/components/SEO";
import TrustBadges from "@/components/TrustBadges";
import SocialProof from "@/components/SocialProof";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Link } from "react-router-dom";
import { Brain, Calculator, Lightbulb, CheckCircle, ArrowRight, Star, Gamepad2, Zap, Puzzle, Search, Play } from "lucide-react";
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion";
import heroImage from "@/assets/hero-gen.jpg";
import SuperRunnerGame from "@/components/SuperRunnerGame";

const Index = () => {

  const jogos = [
    {
      icon: Puzzle,
      title: "Quebra-cabeças Matemáticos",
      description: "Combine cálculos e lógica para fortalecer suas habilidades com números.",
      path: "/quebra-cabecas-matematicos",
    },
    {
      icon: Brain,
      title: "Jogos de Memória",
      description: "Exercite sua capacidade de recordação com desafios divertidos e progressivos.",
      path: "/jogos-memoria",
    },
    {
      icon: Calculator,
      title: "Cálculo Mental",
      description: "Aprimore sua agilidade para resolver operações matemáticas de cabeça.",
      path: "/calculo-mental",
    },
    {
      icon: Search,
      title: "Desafios de Lógica",
      description: "Resolva enigmas e problemas que estimulam seu pensamento crítico.",
      path: "/desafios-logica",
    },
  ];

  const beneficios = [
    "Melhora do raciocínio lógico",
    "Aumento da concentração",
    "Desenvolvimento da memória",
    "Estímulo à criatividade",
    "Fortalecimento do pensamento crítico",
    "Redução do estresse mental"
  ];

  return (
    <div className="bg-background text-foreground">
      <SEO
        title="Gêniozinho — Desafie sua Mente, Aprenda Brincando"
        description="Explore jogos de lógica, memória, cálculo mental e quebra-cabeças matemáticos. Transforme seu tempo livre em crescimento intelectual com o Gêniozinho!"
        keywords="jogos educativos, jogos de lógica, quebra-cabeças, cálculo mental, jogos de memória, raciocínio lógico, educação infantil, aprendizado divertido"
        url="https://geniozinho.com"
        schema="WebApplication"
      />
      <Header />
      
      {/* Hero Section */}
      <section
        className="relative pt-32 pb-28 px-4 text-center bg-cover bg-center overflow-hidden"
        style={{ backgroundImage: `url(${heroImage})` }}
        aria-label="Criança sorrindo e interagindo com elementos gráficos de matemática e lógica"
      >
        <div className="absolute inset-0 bg-slate-900/80 z-10" aria-hidden="true" />
        <div className="container mx-auto relative z-20">
          <div className="max-w-3xl mx-auto">
            <div className="mb-6 inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/10 backdrop-blur-sm border border-white/20 text-white text-sm font-medium">
              <Star className="w-4 h-4 text-yellow-400 fill-yellow-400" />
              <span>Recomendado por Guia do Player Oficial</span>
            </div>
            
            <h1 className="font-poppins font-extrabold text-5xl md:text-7xl text-white mb-6 leading-tight tracking-tight">
              Desafie sua Mente.<br/> Aprenda Brincando.
            </h1>
            <p className="font-inter text-lg md:text-xl text-white/80 mb-10 max-w-2xl mx-auto leading-relaxed">
              Explore jogos inteligentes que transformam seu tempo livre em crescimento intelectual de forma divertida e envolvente.
            </p>
            
            <div className="flex flex-col sm:flex-row items-center justify-center gap-6">
              <Link to="/quebra-cabecas-matematicos">
                <Button size="lg" className="h-14 px-8 text-lg rounded-full bg-primary hover:bg-primary/90 text-primary-foreground shadow-lg hover:shadow-xl transition-all hover:-translate-y-1">
                  <Gamepad2 className="mr-2 h-6 w-6" />
                  Começar a Jogar
                </Button>
              </Link>
              <DownloadButtons />
            </div>
          </div>
        </div>
      </section>

      {/* Nossos Jogos */}
      <section id="jogos" className="py-24 px-4 bg-background">
        <div className="container mx-auto">
          <div className="text-center mb-16">
            <h2 className="font-poppins font-bold text-4xl lg:text-5xl text-foreground mb-4 tracking-tight">
              Explore Nossos Desafios
            </h2>
            <p className="font-inter text-lg text-muted-foreground max-w-2xl mx-auto">
              Temos o jogo perfeito para exercitar cada parte do seu cérebro.
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
            {jogos.map((jogo) => (
              <Card key={jogo.path} className="group bg-secondary/30 border-none hover:bg-secondary/60 transition-all duration-300">
                <CardContent className="p-8 text-center flex flex-col h-full">
                  <div className={`w-16 h-16 rounded-2xl flex items-center justify-center mb-6 mx-auto bg-primary/10 text-primary group-hover:scale-110 transition-transform duration-300`}>
                    <jogo.icon className="w-8 h-8" />
                  </div>
                  <h3 className="font-poppins font-semibold text-xl text-foreground mb-3">
                    {jogo.title}
                  </h3>
                  <p className="font-inter text-muted-foreground mb-8 leading-relaxed flex-grow text-sm">
                    {jogo.description}
                  </p>
                  <Link to={jogo.path} className="mt-auto">
                    <Button variant="ghost" className="w-full group-hover:bg-primary group-hover:text-primary-foreground transition-all">
                      Jogar Agora <ArrowRight className="ml-2 h-4 w-4" />
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>
      
      {/* Featured Game Section */}
      <section className="py-20 px-4 bg-background">
        <div className="container mx-auto">
            <div className="text-center mb-12">
                <span className="inline-block px-3 py-1 rounded-full bg-accent/20 text-accent-foreground text-sm font-semibold mb-4">
                    Jogue Agora Mesmo!
                </span>
                <h2 className="font-poppins font-bold text-3xl lg:text-4xl text-foreground mb-4">
                    Destaque do Mês: Super Runner
                </h2>
                <p className="font-inter text-lg text-muted-foreground leading-relaxed max-w-2xl mx-auto">
                    Não precisa baixar nada! Experimente nosso jogo mais viciante diretamente aqui. 
                    Pule os obstáculos e veja até onde você consegue chegar.
                </p>
            </div>
            
            <div className="flex justify-center">
                <div className="w-full max-w-4xl shadow-2xl rounded-xl overflow-hidden border-4 border-accent/20 transform hover:scale-[1.01] transition-transform duration-300">
                    <SuperRunnerGame />
                </div>
            </div>
            
            <div className="text-center mt-8">
                 <Link to="/jogos-tematicos">
                    <Button size="lg" variant="outline">
                        Ver Página do Jogo <ArrowRight className="ml-2 h-5 w-5" />
                    </Button>
                </Link>
            </div>
        </div>
      </section>

      {/* Benefícios */}
      <section className="py-24 px-4 bg-secondary/30">
        <div className="container mx-auto">
          <div className="text-center mb-16">
              <h2 className="font-poppins font-bold text-4xl lg:text-5xl text-foreground mb-4 tracking-tight">
                Fortaleça sua Mente
              </h2>
              <p className="font-inter text-lg text-muted-foreground max-w-2xl mx-auto">
                Jogar no Gêniozinho traz benefícios que vão além da diversão.
              </p>
          </div>
          <div className="max-w-5xl mx-auto">
            <div className="grid grid-cols-2 md:grid-cols-3 gap-y-10 gap-x-8 text-center">
              {beneficios.map((beneficio) => (
                <div key={beneficio} className="flex flex-col items-center group">
                  <div className="w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                    <CheckCircle className="w-6 h-6 text-primary" />
                  </div>
                  <span className="font-inter font-medium text-foreground text-lg">{beneficio}</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Perguntas Frequentes */}
      <section className="py-20 px-4 bg-background">
        <div className="container mx-auto max-w-3xl">
          <h2 className="font-poppins font-bold text-3xl lg:text-4xl text-foreground mb-8 text-center">
            Perguntas Frequentes
          </h2>
          <Accordion type="single" collapsible className="w-full space-y-3">
            <AccordionItem value="item-1" className="bg-secondary p-4 rounded-lg shadow-sm">
              <AccordionTrigger className="font-poppins font-semibold text-left text-lg hover:no-underline">O app é indicado para qual idade?</AccordionTrigger>
              <AccordionContent className="font-inter text-muted-foreground pt-2">
                O Gêniozinho foi pensado para todas as idades. Nossos jogos possuem níveis de dificuldade variados, que se adaptam tanto a crianças em fase de aprendizado quanto a adultos que buscam manter a mente ativa.
              </AccordionContent>
            </AccordionItem>
            <AccordionItem value="item-2" className="bg-secondary p-4 rounded-lg shadow-sm">
              <AccordionTrigger className="font-poppins font-semibold text-left text-lg hover:no-underline">Preciso de internet para jogar?</AccordionTrigger>
              <AccordionContent className="font-inter text-muted-foreground pt-2">
                Após baixar o aplicativo, a maioria dos nossos jogos pode ser acessada offline. No entanto, uma conexão com a internet é recomendada para salvar seu progresso, competir em rankings e receber novos desafios.
              </AccordionContent>
            </AccordionItem>
            <AccordionItem value="item-3" className="bg-secondary p-4 rounded-lg shadow-sm">
              <AccordionTrigger className="font-poppins font-semibold text-left text-lg hover:no-underline">Os jogos são gratuitos?</AccordionTrigger>
              <AccordionContent className="font-inter text-muted-foreground pt-2">
                Sim! Oferecemos uma vasta seleção de jogos gratuitos. Também temos uma versão Premium que desbloqueia todos os desafios, remove anúncios e oferece recursos exclusivos para acelerar seu desenvolvimento.
              </AccordionContent>
            </AccordionItem>
          </Accordion>
        </div>
      </section>

      <Footer />
    </div>
  );
};

export default Index;
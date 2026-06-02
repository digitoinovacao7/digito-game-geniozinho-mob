import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Brain, Clock, Award, ArrowRight } from "lucide-react";
import useSEO from "@/hooks/useSEO";
import { Link } from "react-router-dom";

const JogosMemoria = () => {
  useSEO({
    title: "Jogos de Memória - Gêniozinho",
    description: "Fortaleça sua memória e concentração com jogos divertidos e desafiadores. Para todas as idades!",
    path: "/jogos-memoria"
  });

  return (
    <div className="bg-background text-foreground">
      <Header />

      {/* Hero Section */}
      <section className="pt-28 pb-16 text-center bg-secondary">
        <div className="container mx-auto px-4">
          <div className="w-20 h-20 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-6">
            <Brain className="w-10 h-10 text-primary" />
          </div>
          <h1 className="font-poppins font-extrabold text-4xl lg:text-5xl mb-4">
            Jogos de Memória
          </h1>
          <p className="font-inter text-lg text-muted-foreground max-w-2xl mx-auto">
            Exercite sua capacidade de recordação com desafios progressivos e divertidos que estimulam sua mente.
          </p>
        </div>
      </section>

      {/* Content Section */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid lg:grid-cols-2 gap-12 items-center mb-16">
            <div className="prose lg:prose-lg max-w-none text-muted-foreground">
              <h2 className="font-poppins font-bold text-3xl text-foreground">Por que treinar sua memória?</h2>
              <p>
                A memória é uma das funções cognitivas mais importantes. Treiná-la regularmente ajuda a melhorar o foco no dia a dia, a reter novas informações com mais facilidade e a manter o cérebro saudável e ativo ao longo dos anos. Nossos jogos transformam esse treino em uma atividade prazerosa.
              </p>
              <ul className="space-y-2">
                <li>Aumenta a capacidade de concentração e atenção.</li>
                <li>Melhora a memória de curto e longo prazo.</li>
                <li>Estimula o raciocínio rápido e a agilidade mental.</li>
                <li>Ajuda a prevenir o declínio cognitivo relacionado à idade.</li>
              </ul>
            </div>
            <div className="flex justify-center">
              <img 
                src="/lovable-uploads/56edde36-ee5d-4784-bbf0-9145b8bedb95.png"
                alt="Ilustração de cartas de memória"
                className="rounded-lg shadow-xl w-full max-w-md"
                loading="lazy"
              />
            </div>
          </div>

          {/* Features Section */}
          <div className="text-center mb-12">
            <h2 className="font-poppins font-bold text-3xl text-foreground">Nossos Desafios de Memória</h2>
          </div>
          <div className="grid md:grid-cols-3 gap-8 text-center">
            <Card className="bg-secondary">
              <CardContent className="p-8">
                <Clock className="w-10 h-10 text-primary mx-auto mb-4" />
                <h3 className="font-poppins font-semibold text-xl mb-2">Jogo da Sequência</h3>
                <p className="text-muted-foreground">Teste sua memória de curto prazo repetindo sequências de cores e sons que ficam cada vez mais longas.</p>
              </CardContent>
            </Card>
            <Card className="bg-secondary">
              <CardContent className="p-8">
                <Brain className="w-10 h-10 text-primary mx-auto mb-4" />
                <h3 className="font-poppins font-semibold text-xl mb-2">Pares Escondidos</h3>
                <p className="text-muted-foreground">Encontre os pares de cartas idênticas em um tabuleiro que desafia sua memória visual e espacial.</p>
              </CardContent>
            </Card>
            <Card className="bg-secondary">
              <CardContent className="p-8">
                <Award className="w-10 h-10 text-primary mx-auto mb-4" />
                <h3 className="font-poppins font-semibold text-xl mb-2">Desafios Progressivos</h3>
                <p className="text-muted-foreground">A dificuldade aumenta conforme você joga, garantindo que seu cérebro esteja sempre sendo estimulado.</p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-16 bg-secondary">
        <div className="container mx-auto px-4 text-center">
            <h2 className="font-poppins font-bold text-3xl text-foreground mb-4">Pronto para turbinar sua memória?</h2>
            <p className="text-muted-foreground mb-8 max-w-xl mx-auto">Comece a treinar hoje mesmo com os jogos de memória do Gêniozinho e sinta a diferença.</p>
            <Link to="/">
                <Button size="lg" variant="accent">
                    Ver todos os jogos <ArrowRight className="ml-2 h-5 w-5" />
                </Button>
            </Link>
        </div>
      </section>

      <Footer />
    </div>
  );
};

export default JogosMemoria;
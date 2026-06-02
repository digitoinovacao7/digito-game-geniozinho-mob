import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Brain, Puzzle, Zap, ArrowRight } from "lucide-react";
import useSEO from "@/hooks/useSEO";
import { Link } from "react-router-dom";

const DesafiosLogica = () => {
  useSEO({
    title: "Desafios de Lógica - Gêniozinho",
    description: "Estimule seu pensamento crítico e raciocínio com enigmas e desafios de lógica para todas as idades.",
    path: "/desafios-logica"
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
            Desafios de Lógica
          </h1>
          <p className="font-inter text-lg text-muted-foreground max-w-2xl mx-auto">
            Resolva enigmas e problemas que estimulam seu pensamento crítico e sua capacidade de encontrar soluções criativas.
          </p>
        </div>
      </section>

      {/* Content Section */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid lg:grid-cols-2 gap-12 items-center mb-16">
            <div className="prose lg:prose-lg max-w-none text-muted-foreground">
              <h2 className="font-poppins font-bold text-3xl text-foreground">Por que a lógica é tão importante?</h2>
              <p>
                O raciocínio lógico é a base para a tomada de decisões, a resolução de problemas e o aprendizado em geral. Ao treinar sua lógica, você não está apenas se preparando para um jogo, mas para os desafios da vida real, aprendendo a pensar de forma mais estruturada e eficiente.
              </p>
              <ul className="space-y-2">
                <li>Desenvolve o pensamento crítico e a argumentação.</li>
                <li>Aumenta a capacidade de identificar padrões e resolver problemas.</li>
                <li>Melhora a tomada de decisões em situações complexas.</li>
                <li>Estimula a criatividade ao buscar soluções não convencionais.</li>
              </ul>
            </div>
            <div className="flex justify-center">
              <img 
                src="/lovable-uploads/d03904bf-f946-4f4d-ac0b-555b92051e6f.png"
                alt="Ilustração de um labirinto"
                className="rounded-lg shadow-xl w-full max-w-md"
                loading="lazy"
              />
            </div>
          </div>

          {/* Features Section */}
          <div className="text-center mb-12">
            <h2 className="font-poppins font-bold text-3xl text-foreground">Tipos de Desafios</h2>
          </div>
          <div className="grid md:grid-cols-3 gap-8 text-center">
            <Card className="bg-secondary">
              <CardContent className="p-8">
                <Puzzle className="w-10 h-10 text-primary mx-auto mb-4" />
                <h3 className="font-poppins font-semibold text-xl mb-2">Enigmas e Charadas</h3>
                <p className="text-muted-foreground">Quebra-cabeças que desafiam sua capacidade de pensar fora da caixa e interpretar informações.</p>
              </CardContent>
            </Card>
            <Card className="bg-secondary">
              <CardContent className="p-8">
                <Brain className="w-10 h-10 text-primary mx-auto mb-4" />
                <h3 className="font-poppins font-semibold text-xl mb-2">Problemas de Raciocínio</h3>
                <p className="text-muted-foreground">Situações que exigem dedução, análise e um processo de pensamento estruturado para resolver.</p>
              </CardContent>
            </Card>
            <Card className="bg-secondary">
              <CardContent className="p-8">
                <Zap className="w-10 h-10 text-primary mx-auto mb-4" />
                <h3 className="font-poppins font-semibold text-xl mb-2">Desafios Rápidos</h3>
                <p className="text-muted-foreground">Pequenos desafios para aquecer seu cérebro e testar sua agilidade mental em poucos minutos.</p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-16 bg-secondary">
        <div className="container mx-auto px-4 text-center">
            <h2 className="font-poppins font-bold text-3xl text-foreground mb-4">Pronto para pensar fora da caixa?</h2>
            <p className="text-muted-foreground mb-8 max-w-xl mx-auto">Desafie-se com os enigmas do Gêniozinho e veja seu raciocínio lógico atingir um novo nível.</p>
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

export default DesafiosLogica;
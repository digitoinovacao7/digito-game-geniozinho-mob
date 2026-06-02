import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Calculator, Target, TrendingUp, ArrowRight } from "lucide-react";
import useSEO from "@/hooks/useSEO";
import { Link } from "react-router-dom";

const QuebraCabecasMatematicos = () => {
  useSEO({
    title: "Quebra-cabeças Matemáticos - Gêniozinho",
    description: "Desafie sua mente com quebra-cabeças que unem matemática e lógica. Aprimore seu raciocínio e divirta-se!",
    path: "/quebra-cabecas-matematicos"
  });

  return (
    <div className="bg-background text-foreground">
      <Header />

      {/* Hero Section */}
      <section className="pt-28 pb-16 text-center bg-secondary">
        <div className="container mx-auto px-4">
          <div className="w-20 h-20 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-6">
            <Calculator className="w-10 h-10 text-primary" />
          </div>
          <h1 className="font-poppins font-extrabold text-4xl lg:text-5xl mb-4">
            Quebra-cabeças Matemáticos
          </h1>
          <p className="font-inter text-lg text-muted-foreground max-w-2xl mx-auto">
            Desafios que combinam cálculos com raciocínio lógico para fortalecer suas habilidades com números de forma divertida.
          </p>
        </div>
      </section>

      {/* Content Section */}
      <section className="py-16">
        <div className="container mx-auto px-4">
          <div className="grid lg:grid-cols-2 gap-12 items-center mb-16">
            <div className="prose lg:prose-lg max-w-none text-muted-foreground">
              <h2 className="font-poppins font-bold text-3xl text-foreground">Por que treinar com quebra-cabeças?</h2>
              <p>
                Resolver quebra-cabeças matemáticos não é apenas sobre encontrar a resposta certa. É um exercício completo para o cérebro que aprimora o pensamento crítico, a capacidade de identificar padrões e a habilidade de abordar problemas complexos de maneiras criativas.
              </p>
              <ul className="space-y-2">
                <li>Fortalece o raciocínio lógico e analítico.</li>
                <li>Aumenta a agilidade para resolver problemas do dia a dia.</li>
                <li>Melhora a concentração e o foco em tarefas complexas.</li>
                <li>Torna a matemática uma atividade mais lúdica e menos intimidante.</li>
              </ul>
            </div>
            <div className="flex justify-center">
              <img 
                src="/lovable-uploads/efd2f307-0550-46d3-a481-b58e058da11a.png"
                alt="Ilustração de um cérebro com engrenagens"
                className="rounded-lg shadow-xl w-full max-w-md"
                loading="lazy"
              />
            </div>
          </div>

          {/* Features Section */}
          <div className="text-center mb-12">
            <h2 className="font-poppins font-bold text-3xl text-foreground">O que você vai encontrar</h2>
          </div>
          <div className="grid md:grid-cols-3 gap-8 text-center">
            <Card className="bg-secondary">
              <CardContent className="p-8">
                <Target className="w-10 h-10 text-primary mx-auto mb-4" />
                <h3 className="font-poppins font-semibold text-xl mb-2">Desafios Variados</h3>
                <p className="text-muted-foreground">Enigmas, sequências lógicas, problemas de geometria e muito mais para nunca cair na rotina.</p>
              </CardContent>
            </Card>
            <Card className="bg-secondary">
              <CardContent className="p-8">
                <Calculator className="w-10 h-10 text-primary mx-auto mb-4" />
                <h3 className="font-poppins font-semibold text-xl mb-2">Cálculo e Lógica</h3>
                <p className="text-muted-foreground">Exercícios que exigem tanto habilidades de cálculo quanto um raciocínio afiado.</p>
              </CardContent>
            </Card>
            <Card className="bg-secondary">
              <CardContent className="p-8">
                <TrendingUp className="w-10 h-10 text-primary mx-auto mb-4" />
                <h3 className="font-poppins font-semibold text-xl mb-2">Níveis Progressivos</h3>
                <p className="text-muted-foreground">Comece com desafios mais simples e avance para quebra-cabeças que testarão seus limites.</p>
              </CardContent>
            </Card>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-16 bg-secondary">
        <div className="container mx-auto px-4 text-center">
            <h2 className="font-poppins font-bold text-3xl text-foreground mb-4">Pronto para começar a calcular?</h2>
            <p className="text-muted-foreground mb-8 max-w-xl mx-auto">Baixe o Gêniozinho e tenha acesso a centenas de quebra-cabeças matemáticos na palma da sua mão.</p>
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

export default QuebraCabecasMatematicos;
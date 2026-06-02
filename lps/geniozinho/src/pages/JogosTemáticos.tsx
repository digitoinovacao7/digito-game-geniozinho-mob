import Header from "@/components/Header";
import Footer from "@/components/Footer";
import useSEO from "@/hooks/useSEO";
import SuperRunnerGame from "@/components/SuperRunnerGame";

const JogosTematicos = () => {
  useSEO({
    title: "Super Runner - Gêniozinho",
    description: "Corra, pule e supere seus limites no nosso jogo estilo Dino Runner.",
    path: "/jogos-tematicos"
  });

  return (
    <div className="bg-background text-foreground text-center">
      <Header />

      <section className="pt-28 pb-10">
        <div className="container mx-auto px-4">
          <h1 className="font-poppins font-extrabold text-4xl mb-4">Super Runner</h1>
          <p className="text-muted-foreground">Pule os obstáculos e vá o mais longe que puder!</p>
        </div>
      </section>

      <section className="flex-grow flex items-center justify-center p-4">
        <SuperRunnerGame />
      </section>

      <Footer />
    </div>
  );
};

export default JogosTematicos;
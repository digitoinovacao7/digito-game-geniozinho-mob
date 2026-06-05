import * as React from "react";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import DownloadButtons from "@/components/DownloadButtons";
import SEO from "@/components/SEO";
import { Star } from "lucide-react";
import { Leaderboard } from "@/components/Leaderboard";

const Index = () => {
  return (
    <div className="bg-slate-950 text-slate-50 min-h-screen flex flex-col font-inter selection:bg-primary/30">
      <SEO
        title="Gêniozinho — Desafie sua Mente"
        description="Transforme seu tempo livre em crescimento intelectual com o Gêniozinho!"
        keywords="jogos educativos, jogos de lógica, raciocínio lógico"
        url="https://geniozinho.com"
        schema="WebApplication"
      />
      <Header />
      
      <main className="flex-grow">
        {/* Minimalist Hero Section */}
        <section className="relative pt-32 pb-20 px-4 text-center overflow-hidden">
          {/* Subtle Glows */}
          <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[800px] h-[500px] bg-primary/20 rounded-full blur-[120px] opacity-50 pointer-events-none animate-pulse duration-3000" />
          
          <div className="container mx-auto relative z-10">
            <div className="max-w-3xl mx-auto flex flex-col items-center">
              
              <div className="mb-8 inline-flex items-center gap-2 px-4 py-2 rounded-full bg-slate-900 border border-slate-800 text-slate-300 text-sm font-medium shadow-sm animate-in fade-in slide-in-from-top-4 duration-700">
                <Star className="w-4 h-4 text-amber-400 fill-amber-400" />
                <span>O App #1 para Treinamento Lógico</span>
              </div>
              
              <h1 className="font-poppins font-black text-5xl md:text-7xl text-white mb-6 leading-tight tracking-tight animate-in fade-in zoom-in-95 duration-1000 delay-150">
                Desafie sua mente.
              </h1>
              <p className="text-xl text-slate-400 mb-10 max-w-2xl mx-auto leading-relaxed animate-in fade-in slide-in-from-bottom-6 duration-1000 delay-300">
                Baixe o Gêniozinho, escolha seu apelido e prove que você é o mais rápido nos cálculos e lógica. O mundo está assistindo.
              </p>
              
              <div className="flex flex-col items-center justify-center gap-4 animate-in fade-in slide-in-from-bottom-8 duration-1000 delay-500">
                <DownloadButtons />
                <p className="text-sm text-slate-500 mt-4">Disponível para Android e iOS. 100% Gratuito.</p>
              </div>
            </div>
          </div>
        </section>

        {/* Leaderboard Section */}
        <section className="py-12 px-4 pb-32 animate-in fade-in slide-in-from-bottom-12 duration-1000 delay-700">
          <div className="container mx-auto relative z-10 max-w-5xl">
            <Leaderboard />
          </div>
        </section>
      </main>

      <Footer />
    </div>
  );
};

export default Index;
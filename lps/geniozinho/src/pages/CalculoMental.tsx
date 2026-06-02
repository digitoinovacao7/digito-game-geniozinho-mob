import React, { useState, useEffect, useRef } from "react";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Lightbulb, Timer, TrendingUp, ArrowRight, Play, RefreshCw, Trophy } from "lucide-react";
import useSEO from "@/hooks/useSEO";
import { Link } from "react-router-dom";
import { toast } from "sonner";

type GameState = "menu" | "playing" | "gameover";

type Operation = "+" | "-" | "*";

interface Problem {
  n1: number;
  n2: number;
  operator: Operation;
  answer: number;
}

const CalculoMental = () => {
  useSEO({
    title: "Cálculo Mental - Gêniozinho",
    description: "Aprimore sua agilidade matemática e resolva operações de cabeça com nossos desafios de cálculo mental.",
    path: "/calculo-mental"
  });

  const [gameState, setGameState] = useState<GameState>("menu");
  const [score, setScore] = useState(0);
  const [timeLeft, setTimeLeft] = useState(60);
  const [currentProblem, setCurrentProblem] = useState<Problem>({ n1: 0, n2: 0, operator: "+", answer: 0 });
  const [userAnswer, setUserAnswer] = useState("");
  const [highScore, setHighScore] = useState(0);
  const inputRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    const savedHighScore = localStorage.getItem("calculoMentalHighScore");
    if (savedHighScore) {
      setHighScore(parseInt(savedHighScore, 10));
    }
  }, []);

  useEffect(() => {
    let interval: NodeJS.Timeout;
    if (gameState === "playing" && timeLeft > 0) {
      interval = setInterval(() => {
        setTimeLeft((prev) => prev - 1);
      }, 1000);
    } else if (timeLeft === 0 && gameState === "playing") {
      endGame();
    }
    return () => clearInterval(interval);
  }, [gameState, timeLeft]);

  useEffect(() => {
    if (gameState === "playing" && inputRef.current) {
      inputRef.current.focus();
    }
  }, [gameState, currentProblem]);

  const generateProblem = () => {
    const operators: Operation[] = ["+", "-", "*"];
    const operator = operators[Math.floor(Math.random() * operators.length)];
    let n1 = 0;
    let n2 = 0;

    if (operator === "+") {
      n1 = Math.floor(Math.random() * 50) + 1;
      n2 = Math.floor(Math.random() * 50) + 1;
    } else if (operator === "-") {
      n1 = Math.floor(Math.random() * 50) + 10;
      n2 = Math.floor(Math.random() * n1); 
    } else if (operator === "*") {
      n1 = Math.floor(Math.random() * 10) + 1;
      n2 = Math.floor(Math.random() * 9) + 1;
    }

    const answer = eval(`${n1} ${operator} ${n2}`);
    setCurrentProblem({ n1, n2, operator, answer });
  };

  const startGame = () => {
    setScore(0);
    setTimeLeft(60);
    setGameState("playing");
    generateProblem();
    setUserAnswer("");
  };

  const endGame = () => {
    setGameState("gameover");
    if (score > highScore) {
      setHighScore(score);
      localStorage.setItem("calculoMentalHighScore", score.toString());
      toast.success("Novo Recorde! Parabéns!");
    }
  };

  const handleAnswerSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const val = parseInt(userAnswer, 10);
    if (!isNaN(val) && val === currentProblem.answer) {
      setScore((prev) => prev + 10);
      generateProblem();
      setUserAnswer("");
      toast.success("Correto!", { duration: 500, position: "top-center" });
    } else {
      toast.error("Errado!", { duration: 500, position: "top-center" });
      setUserAnswer("");
      // Optional: penalty?
    }
  };

  return (
    <div className="bg-background text-foreground min-h-screen flex flex-col">
      <Header />

      {/* Hero Section */}
      <section className="pt-28 pb-10 text-center bg-secondary">
        <div className="container mx-auto px-4">
          <div className="w-16 h-16 bg-primary/10 rounded-full flex items-center justify-center mx-auto mb-4">
            <Lightbulb className="w-8 h-8 text-primary" />
          </div>
          <h1 className="font-poppins font-extrabold text-3xl lg:text-5xl mb-3">
            Cálculo Mental
          </h1>
          <p className="font-inter text-base lg:text-lg text-muted-foreground max-w-2xl mx-auto">
            Resolva o máximo de operações matemáticas antes que o tempo acabe!
          </p>
        </div>
      </section>

      {/* Game Area */}
      <section className="flex-grow py-8 px-4">
        <div className="container mx-auto max-w-2xl">
          <Card className="shadow-lg border-2 border-primary/20 bg-card">
            <CardContent className="p-6 lg:p-10 text-center">
              
              {gameState === "menu" && (
                <div className="space-y-6">
                   <div className="flex justify-center mb-6">
                     <div className="bg-accent/10 p-6 rounded-full animate-pulse">
                        <Timer className="w-16 h-16 text-accent" />
                     </div>
                   </div>
                  <h2 className="text-2xl font-bold font-poppins">Pronto para o desafio?</h2>
                  <p className="text-muted-foreground">Você tem 60 segundos para acertar o maior número de contas.</p>
                  
                  {highScore > 0 && (
                    <div className="bg-secondary/50 py-3 px-6 rounded-lg inline-flex items-center gap-2 mb-4">
                      <Trophy className="w-5 h-5 text-yellow-500" />
                      <span className="font-semibold text-foreground">Recorde Atual: {highScore} pontos</span>
                    </div>
                  )}

                  <div className="pt-4">
                    <Button onClick={startGame} size="lg" className="w-full md:w-auto px-10 py-6 text-lg">
                      <Play className="mr-2 w-6 h-6" /> Começar Jogo
                    </Button>
                  </div>
                </div>
              )}

              {gameState === "playing" && (
                <div className="space-y-8">
                  <div className="flex justify-between items-center text-lg font-semibold text-muted-foreground">
                    <div className="flex items-center gap-2">
                       <Timer className="w-5 h-5" />
                       <span className={timeLeft < 10 ? "text-red-500" : ""}>{timeLeft}s</span>
                    </div>
                    <div className="flex items-center gap-2">
                       <span className="text-primary">Pontos: {score}</span>
                    </div>
                  </div>

                  <div className="py-8">
                    <span className="text-5xl md:text-7xl font-bold font-mono tracking-wider">
                      {currentProblem.n1} {currentProblem.operator} {currentProblem.n2}
                    </span>
                  </div>

                  <form onSubmit={handleAnswerSubmit} className="max-w-xs mx-auto space-y-4">
                    <Input
                      autoFocus
                      ref={inputRef}
                      type="number"
                      placeholder="?"
                      value={userAnswer}
                      onChange={(e) => setUserAnswer(e.target.value)}
                      className="text-center text-3xl py-6 font-bold"
                    />
                    <Button type="submit" size="lg" className="w-full">
                      Enviar Resposta
                    </Button>
                  </form>
                </div>
              )}

              {gameState === "gameover" && (
                <div className="space-y-6 animate-fade-in">
                  <div className="mb-6">
                    <span className="text-6xl">🎉</span>
                  </div>
                  <h2 className="text-3xl font-bold font-poppins">Fim de Jogo!</h2>
                  
                  <div className="grid grid-cols-2 gap-4 max-w-sm mx-auto my-6">
                     <div className="bg-secondary p-4 rounded-lg">
                        <p className="text-sm text-muted-foreground">Sua Pontuação</p>
                        <p className="text-3xl font-bold text-primary">{score}</p>
                     </div>
                     <div className="bg-secondary p-4 rounded-lg">
                        <p className="text-sm text-muted-foreground">Melhor Recorde</p>
                        <p className="text-3xl font-bold text-yellow-600">{highScore}</p>
                     </div>
                  </div>

                  <div className="flex flex-col sm:flex-row gap-4 justify-center pt-4">
                    <Button onClick={startGame} size="lg" variant="default">
                      <RefreshCw className="mr-2 w-5 h-5" /> Jogar Novamente
                    </Button>
                    <Link to="/">
                      <Button size="lg" variant="outline">
                        Voltar ao Início
                      </Button>
                    </Link>
                  </div>
                </div>
              )}

            </CardContent>
          </Card>
        </div>
      </section>

      {/* Info Section (moved bottom) */}
      <section className="py-12 px-4 bg-background border-t">
        <div className="container mx-auto max-w-4xl text-center">
            <h3 className="font-poppins font-bold text-2xl mb-6">Por que praticar?</h3>
            <div className="grid md:grid-cols-3 gap-6">
                <div className="p-4">
                    <h4 className="font-semibold mb-2 flex items-center justify-center gap-2"><TrendingUp className="w-4 h-4" /> Agilidade</h4>
                    <p className="text-sm text-muted-foreground">Treine seu cérebro para processar números rapidamente.</p>
                </div>
                <div className="p-4">
                    <h4 className="font-semibold mb-2 flex items-center justify-center gap-2"><Timer className="w-4 h-4" /> Foco</h4>
                    <p className="text-sm text-muted-foreground">A pressão do tempo ajuda a melhorar sua concentração.</p>
                </div>
                <div className="p-4">
                    <h4 className="font-semibold mb-2 flex items-center justify-center gap-2"><Lightbulb className="w-4 h-4" /> Confiança</h4>
                    <p className="text-sm text-muted-foreground">Perca o medo da matemática com prática diária.</p>
                </div>
            </div>
        </div>
      </section>

      <Footer />
    </div>
  );
};

export default CalculoMental;
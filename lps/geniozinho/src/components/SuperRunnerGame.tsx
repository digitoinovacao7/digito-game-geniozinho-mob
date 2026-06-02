import React, { useState, useEffect, useRef, useCallback } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Gamepad2, Trophy, RotateCcw, Play } from "lucide-react";
import { toast } from "sonner";

const JUMP_HEIGHT = 150;
const OBSTACLE_SPEED = 3;
const GRAVITY = 5;
const GAME_SPEED = 20;

const SuperRunnerGame = () => {
  const [gameState, setGameState] = useState<"start" | "playing" | "gameover">("start");
  const [score, setScore] = useState(0);
  const [highScore, setHighScore] = useState(0);
  
  // Game Refs for performance (avoiding re-renders for every pixel movement)
  const dinoRef = useRef<HTMLDivElement>(null);
  const obstacleRef = useRef<HTMLDivElement>(null);
  const requestRef = useRef<number>();
  
  // State for rendering positions (synced less frequently or used for React styling)
  const [dinoBottom, setDinoBottom] = useState(0);
  const [obstacleLeft, setObstacleLeft] = useState(600); // Start off-screen

  const isJumping = useRef(false);
  const jumpCount = useRef(0); // 0 or upwards

  useEffect(() => {
    const saved = localStorage.getItem("superRunnerHighScore");
    if (saved) setHighScore(parseInt(saved, 10));
  }, []);

  const startGame = () => {
    setGameState("playing");
    setScore(0);
    setObstacleLeft(600);
    setDinoBottom(0);
    isJumping.current = false;
    jumpCount.current = 0;
  };

  const jump = useCallback(() => {
    if (!isJumping.current && gameState === "playing") {
      isJumping.current = true;
    }
  }, [gameState]);

  // Jump control
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      // Prevent default scrolling for Space/ArrowUp only when game is focused/playing
      if ((e.code === "Space" || e.code === "ArrowUp") && gameState === "playing") {
        e.preventDefault();
        jump();
      }
    };
    window.addEventListener("keydown", handleKeyDown);
    return () => window.removeEventListener("keydown", handleKeyDown);
  }, [gameState, jump]);

  // Game Loop
  useEffect(() => {
    let obstaclePos = 600;
    let dinoPos = 0;
    let jumpUp = true;
    let scoreCount = 0;

    const loop = () => {
      if (gameState !== "playing") return;

      // Obstacle Logic
      if (obstaclePos < -20) {
        obstaclePos = 600 + Math.random() * 200; // Randomize gap slightly
        scoreCount += 1;
        setScore(scoreCount);
      } else {
        obstaclePos -= OBSTACLE_SPEED + (scoreCount * 0.1); // Increase speed over time
      }
      setObstacleLeft(obstaclePos);

      // Dino Logic
      if (isJumping.current) {
        if (jumpUp) {
           if (dinoPos < JUMP_HEIGHT) {
              dinoPos += 8;
           } else {
              jumpUp = false;
           }
        } else {
           if (dinoPos > 0) {
              dinoPos -= 8;
           } else {
              dinoPos = 0;
              isJumping.current = false;
              jumpUp = true;
           }
        }
        setDinoBottom(dinoPos);
      }

      // Collision Detection
      const dinoLeftPos = 50; 
      const dinoRightPos = 50 + 40; // width
      
      if (
        obstaclePos < dinoRightPos &&
        obstaclePos > dinoLeftPos - 20 && // tolerance
        dinoPos < 35 // Hit height
      ) {
        // Collision!
        setGameState("gameover");
        if (scoreCount > highScore) {
            const newHigh = scoreCount;
            setHighScore(newHigh);
            localStorage.setItem("superRunnerHighScore", newHigh.toString());
            toast.success("Novo Recorde!");
        } else {
            toast.error("Bateu!");
        }
        return; // Stop loop
      }

      requestRef.current = requestAnimationFrame(loop);
    };

    if (gameState === "playing") {
      requestRef.current = requestAnimationFrame(loop);
    }

    return () => {
      if (requestRef.current) cancelAnimationFrame(requestRef.current);
    };
  }, [gameState, highScore]);
  return (
    <div className="w-full mx-auto">
      <Card className="border-4 border-primary overflow-hidden bg-sky-100 dark:bg-sky-900 relative h-80 select-none shadow-xl">
        <CardContent className="h-full p-0 relative" onClick={jump}>
          
          {/* Ground */}
          <div className="absolute bottom-0 w-full h-4 bg-green-500 z-10"></div>
          
          {/* Game Area */}
          {gameState === "playing" && (
              <>
                 {/* Score */}
                 <div className="absolute top-4 right-4 font-mono text-2xl font-bold text-primary">
                    {score.toString().padStart(4, '0')}
                 </div>

                 {/* Dino */}
                 <div 
                    ref={dinoRef}
                    className="absolute left-[50px] w-10 h-10 bg-primary rounded-lg flex items-center justify-center shadow-lg transition-transform"
                    style={{ bottom: `${dinoBottom + 16}px` }} // +16 for ground height
                 >
                    <span className="text-xl">🦖</span>
                 </div>

                 {/* Obstacle */}
                 <div 
                    ref={obstacleRef}
                    className="absolute w-8 h-8 bg-destructive rounded flex items-center justify-center animate-spin-slow"
                    style={{ left: `${obstacleLeft}px`, bottom: '16px' }}
                 >
                    🌵
                 </div>
              </>
          )}

          {gameState === "start" && (
              <div className="absolute inset-0 flex flex-col items-center justify-center bg-black/40 z-20 text-white">
                  <Gamepad2 className="w-16 h-16 mb-4 animate-bounce" />
                  <h2 className="text-3xl font-bold mb-2">Pronto para correr?</h2>
                  <p className="mb-6">Pressione Espaço ou Toque na tela para pular</p>
                  <Button onClick={startGame} size="lg" className="font-bold text-lg">
                     <Play className="mr-2" /> JOGAR
                  </Button>
              </div>
          )}

          {gameState === "gameover" && (
              <div className="absolute inset-0 flex flex-col items-center justify-center bg-black/70 z-20 text-white">
                  <Trophy className="w-16 h-16 mb-4 text-yellow-400" />
                  <h2 className="text-4xl font-bold mb-2">Game Over!</h2>
                  <p className="text-xl mb-4">Pontuação: {score}</p>
                  <p className="text-sm mb-6 opacity-80">Melhor Recorde: {highScore}</p>
                  <Button onClick={startGame} size="lg" variant="secondary" className="font-bold text-lg">
                     <RotateCcw className="mr-2" /> Tentar Novamente
                  </Button>
              </div>
          )}

        </CardContent>
      </Card>
      
      <div className="mt-4 text-center text-sm text-muted-foreground">
         <p>Dica: Quanto mais tempo você correr, mais rápido fica!</p>
      </div>
    </div>
  );
};

export default SuperRunnerGame;

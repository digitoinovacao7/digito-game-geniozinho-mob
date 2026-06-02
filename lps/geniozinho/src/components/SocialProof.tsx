import { useEffect, useState } from 'react';
import { Users, TrendingUp } from 'lucide-react';

const SocialProof = () => {
  const [downloads, setDownloads] = useState(50000);
  const [isAnimating, setIsAnimating] = useState(false);

  useEffect(() => {
    // Simular incremento de downloads em tempo real
    const interval = setInterval(() => {
      setDownloads(prev => {
        const increment = Math.floor(Math.random() * 3) + 1;
        return prev + increment;
      });
      setIsAnimating(true);
      setTimeout(() => setIsAnimating(false), 500);
    }, 8000); // Atualiza a cada 8 segundos

    return () => clearInterval(interval);
  }, []);

  const formatNumber = (num: number) => {
    return num.toLocaleString('pt-BR');
  };

  return (
    <div className="flex flex-col sm:flex-row items-center justify-center gap-6 py-6">
      {/* Downloads Counter */}
      <div className="flex items-center gap-3 bg-gradient-to-r from-primary/10 to-accent/10 px-6 py-3 rounded-full border border-primary/20">
        <TrendingUp className="w-5 h-5 text-primary" />
        <div className="text-center">
          <div className={`text-2xl font-bold text-foreground transition-all duration-500 ${isAnimating ? 'scale-110 text-primary' : ''}`}>
            {formatNumber(downloads)}+
          </div>
          <div className="text-xs text-muted-foreground">Downloads</div>
        </div>
      </div>

      {/* Active Users */}
      <div className="flex items-center gap-3 bg-gradient-to-r from-green-500/10 to-emerald-500/10 px-6 py-3 rounded-full border border-green-500/20">
        <Users className="w-5 h-5 text-green-500" />
        <div className="text-center">
          <div className="text-2xl font-bold text-foreground">
            12.500+
          </div>
          <div className="text-xs text-muted-foreground">Usuários Ativos</div>
        </div>
      </div>

      {/* Rating */}
      <div className="flex items-center gap-2 bg-gradient-to-r from-yellow-500/10 to-orange-500/10 px-6 py-3 rounded-full border border-yellow-500/20">
        <div className="flex gap-1">
          {[1, 2, 3, 4, 5].map((star) => (
            <svg
              key={star}
              className="w-5 h-5 fill-yellow-500"
              viewBox="0 0 20 20"
            >
              <path d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z" />
            </svg>
          ))}
        </div>
        <div className="text-center">
          <div className="text-xl font-bold text-foreground">4.8</div>
          <div className="text-xs text-muted-foreground">15.420 avaliações</div>
        </div>
      </div>
    </div>
  );
};

export default SocialProof;

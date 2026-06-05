import { useEffect, useState } from "react";
import { collection, query, orderBy, limit, getDocs } from "firebase/firestore";
import { db } from "../firebase";

interface PlayerScore {
  id: string;
  nickname: string;
  score: number;
}

export const Leaderboard = () => {
  const [scores, setScores] = useState<PlayerScore[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchScores = async () => {
      try {
        const q = query(collection(db, "leaderboard"), orderBy("score", "desc"), limit(100));
        
        // Timeout de 5 segundos para evitar loop infinito na tela
        const querySnapshot = await Promise.race([
          getDocs(q),
          new Promise((_, reject) => setTimeout(() => reject(new Error('Tempo limite excedido ao buscar o ranking')), 5000))
        ]) as any;
        
        const fetchedScores: PlayerScore[] = [];
        querySnapshot.forEach((doc: any) => {
          fetchedScores.push({ id: doc.id, ...doc.data() } as PlayerScore);
        });
        setScores(fetchedScores);
      } catch (error) {
        console.error("Error fetching leaderboard:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchScores();
  }, []);

  return (
    <div className="w-full max-w-4xl mx-auto p-6 bg-white/10 backdrop-blur-md rounded-2xl shadow-2xl border border-white/20">
      <h2 className="text-3xl font-black text-center mb-8 text-white tracking-tight">
        🏆 Ranking Global
      </h2>
      
      {loading ? (
        <div className="flex justify-center p-8">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-white"></div>
        </div>
      ) : (
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse">
            <thead>
              <tr className="border-b border-white/20">
                <th className="p-4 text-white/80 font-semibold w-24 text-center">Posição</th>
                <th className="p-4 text-white/80 font-semibold">Gênio</th>
                <th className="p-4 text-white/80 font-semibold text-right">Pontuação</th>
              </tr>
            </thead>
            <tbody>
              {scores.map((player, index) => (
                <tr 
                  key={player.id} 
                  className={`border-b border-white/10 transition-colors hover:bg-white/5
                    ${index === 0 ? 'bg-amber-500/20 text-amber-300' : ''}
                    ${index === 1 ? 'bg-slate-300/10 text-slate-300' : ''}
                    ${index === 2 ? 'bg-orange-700/20 text-orange-300' : ''}
                    ${index > 2 ? 'text-white' : ''}
                  `}
                >
                  <td className="p-4 text-center font-bold">
                    {index === 0 ? '🥇 1º' : index === 1 ? '🥈 2º' : index === 2 ? '🥉 3º' : `${index + 1}º`}
                  </td>
                  <td className="p-4 font-medium flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-white/20 flex items-center justify-center text-sm font-bold">
                      {player.nickname.charAt(0).toUpperCase()}
                    </div>
                    {player.nickname}
                  </td>
                  <td className="p-4 text-right font-black tracking-wider">
                    {player.score.toLocaleString()} pts
                  </td>
                </tr>
              ))}
              
              {scores.length === 0 && (
                <tr>
                  <td colSpan={3} className="p-8 text-center text-white/60">
                    Nenhum Gênio registrado ainda. Seja o primeiro!
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
};

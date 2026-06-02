import { Star, Download, Shield, Award } from 'lucide-react';
import { Badge } from '@/components/ui/badge';

interface TrustBadgesProps {
  variant?: 'horizontal' | 'vertical';
  showAll?: boolean;
}

const TrustBadges = ({ variant = 'horizontal', showAll = true }: TrustBadgesProps) => {
  const badges = [
    {
      icon: Star,
      label: '4.8★ Avaliação',
      description: '15.420 avaliações',
      color: 'text-yellow-500',
      bgColor: 'bg-yellow-500/10'
    },
    {
      icon: Download,
      label: '50.000+',
      description: 'Downloads',
      color: 'text-green-500',
      bgColor: 'bg-green-500/10'
    },
    {
      icon: Shield,
      label: 'Seguro',
      description: 'Para Crianças',
      color: 'text-blue-500',
      bgColor: 'bg-blue-500/10'
    },
    {
      icon: Award,
      label: 'Escolha',
      description: 'dos Editores',
      color: 'text-purple-500',
      bgColor: 'bg-purple-500/10'
    }
  ];

  const displayBadges = showAll ? badges : badges.slice(0, 2);

  if (variant === 'vertical') {
    return (
      <div className="flex flex-col gap-3">
        {displayBadges.map((badge, index) => (
          <div
            key={index}
            className={`flex items-center gap-3 p-3 rounded-lg ${badge.bgColor} border border-border/50 hover:border-primary/50 transition-all duration-300`}
          >
            <div className={`p-2 rounded-full bg-background ${badge.color}`}>
              <badge.icon className="w-5 h-5" />
            </div>
            <div>
              <div className={`font-bold ${badge.color}`}>{badge.label}</div>
              <div className="text-xs text-muted-foreground">{badge.description}</div>
            </div>
          </div>
        ))}
      </div>
    );
  }

  return (
    <div className="flex flex-wrap items-center justify-center gap-4">
      {displayBadges.map((badge, index) => (
        <Badge
          key={index}
          variant="outline"
          className={`px-4 py-2 ${badge.bgColor} border-border/50 hover:border-primary/50 transition-all duration-300`}
        >
          <badge.icon className={`w-4 h-4 mr-2 ${badge.color}`} />
          <span className="font-semibold">{badge.label}</span>
          <span className="ml-1 text-xs text-muted-foreground">{badge.description}</span>
        </Badge>
      ))}
    </div>
  );
};

export default TrustBadges;

import { Link } from "react-router-dom";
import { Youtube } from "lucide-react";

// TikTok SVG Icon
const TikTokIcon = ({ className }: { className?: string }) => (
  <svg 
    xmlns="http://www.w3.org/2000/svg" 
    viewBox="0 0 24 24" 
    fill="none" 
    stroke="currentColor" 
    strokeWidth="2" 
    strokeLinecap="round" 
    strokeLinejoin="round" 
    className={className}
  >
    <path d="M9 12a4 4 0 1 0 4 4V4a5 5 0 0 0 5 5v3a4 4 0 0 1-1.5-.3A7.96 7.96 0 0 1 17 14v.5a7.5 7.5 0 1 1-6.5-7.44v3.08A3.5 3.5 0 1 0 13 14V4h-4v8Z" />
  </svg>
);

const Footer = () => {
  const jogosLinks = [
    { title: "Quebra-cabeças Matemáticos", path: "/quebra-cabecas-matematicos" },
    { title: "Jogos de Memória", path: "/jogos-memoria" },
    { title: "Treine seu Cérebro", path: "/desafios-logica" },
  ];

  const legalLinks = [
    { title: "Política de Privacidade", path: "https://geniozinho.com.br/politica-privacidade", isExternal: true },
    { title: "Termos e Condições", path: "/termos-condicoes", isExternal: false },
    { title: "Política de Cookies", path: "/politica-de-cookies", isExternal: false }
  ];

  return (
    <footer className="bg-slate-950 border-t border-white/5 pt-16 pb-8">
      <div className="container mx-auto px-4">
        
        <div className="grid grid-cols-1 md:grid-cols-4 gap-10 mb-12">
          {/* Logo e Sobre */}
          <div className="md:col-span-2 text-center md:text-left">
            <Link to="/" className="inline-block font-poppins font-bold text-2xl mb-4 text-white">
              Gêniozinho
            </Link>
            <p className="text-slate-400 text-sm leading-relaxed max-w-sm mx-auto md:mx-0">
              Transforme seu tempo livre em crescimento intelectual. Desafios mentais combinados com aprendizado para exercitar cada parte do seu cérebro.
            </p>
          </div>

          {/* Links: Jogos */}
          <div className="text-center md:text-left">
            <h3 className="font-poppins font-semibold text-lg mb-4 text-white">Jogos</h3>
            <ul className="space-y-3">
              {jogosLinks.map((link) => (
                <li key={link.path}>
                  <Link
                    to={link.path}
                    className="text-slate-400 text-sm hover:text-white transition-colors duration-200 font-inter"
                  >
                    {link.title}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Links: Legal */}
          <div className="text-center md:text-left">
            <h3 className="font-poppins font-semibold text-lg mb-4 text-white">Legal</h3>
            <ul className="space-y-3">
              {legalLinks.map((link) => (
                <li key={link.title}>
                  {link.isExternal ? (
                    <a
                      href={link.path}
                      className="text-slate-400 text-sm hover:text-white transition-colors duration-200 font-inter"
                    >
                      {link.title}
                    </a>
                  ) : (
                    <Link
                      to={link.path}
                      className="text-slate-400 text-sm hover:text-white transition-colors duration-200 font-inter"
                    >
                      {link.title}
                    </Link>
                  )}
                </li>
              ))}
            </ul>
          </div>
        </div>

        {/* Guia do Player Partnership & Footer bottom */}
        <div className="border-t border-white/5 pt-8 flex flex-col md:flex-row items-center justify-between gap-6">
          <div className="flex flex-col items-center md:items-start">
            <span className="text-sm font-semibold text-white mb-2">Com o apoio de Guia do Player:</span>
            <div className="flex items-center space-x-4">
              <a
                href="https://www.youtube.com/@guiadoplayeroficial"
                target="_blank"
                rel="noopener noreferrer"
                aria-label="YouTube do Guia do Player Oficial"
                className="w-10 h-10 bg-slate-900 rounded-full flex items-center justify-center hover:bg-amber-500 hover:text-slate-950 text-slate-400 shadow-sm transition-all duration-200 hover:scale-105"
              >
                <Youtube className="w-5 h-5" />
              </a>
              <a
                href="https://www.tiktok.com/@guiadoplayeroficial"
                target="_blank"
                rel="noopener noreferrer"
                aria-label="TikTok do Guia do Player Oficial"
                className="w-10 h-10 bg-slate-900 rounded-full flex items-center justify-center hover:bg-amber-500 hover:text-slate-950 text-slate-400 shadow-sm transition-all duration-200 hover:scale-105"
              >
                <TikTokIcon className="w-5 h-5" />
              </a>
            </div>
          </div>

          <p className="text-slate-500 font-inter text-sm">
            © {new Date().getFullYear()} Gêniozinho. Todos os direitos reservados.
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
import { useState } from "react";
import { Link } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Menu, X, Smartphone } from "lucide-react";
import Logo from "./Logo";

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const menuItems = [
    // { title: "Home", path: "/" },
    { title: "Quebra-cabeças Matemáticos", path: "/quebra-cabecas-matematicos" },
    { title: "Jogos de Memória", path: "/jogos-memoria" },
    { title: "Treine seu cérebro", path: "/desafios-logica" },
    { title: "FAQ", path: "/perguntas-frequentes" }
  ];

  return (
    <header className="fixed top-0 left-0 right-0 bg-slate-950/80 backdrop-blur-md border-b border-white/10 z-50">
      <div className="container mx-auto px-4 py-3">
        <div className="flex items-center justify-between">
          {/* Logo */}
          <Link to="/" className="flex items-center space-x-2">
            <Logo className="w-10 h-10 text-amber-400" />
            <span className="font-poppins font-bold text-xl text-white">Gêniozinho</span>
          </Link>

          {/* Desktop Navigation */}
          <nav className="hidden lg:flex items-center space-x-6">
            {menuItems.map((item) => (
              <Link
                key={item.path}
                to={item.path}
                className="text-slate-300 hover:text-white transition-colors duration-200 font-medium"
              >
                {item.title}
              </Link>
            ))}
          </nav>

          {/* CTA Button */}
          <div className="hidden lg:block">
            <a 
              href="https://play.google.com/store/apps/details?id=br.com.digitoinovacao.geniozinho&pcampaignid=web_share"
              target="_blank"
              rel="noopener noreferrer"
            >
              <Button className="rounded-full bg-amber-500 hover:bg-amber-600 text-slate-950 font-semibold border-0">
                <Smartphone className="w-4 h-4 mr-2" />
                Baixe o App
              </Button>
            </a>
          </div>

          {/* Mobile Menu Button */}
          <button
            className="lg:hidden p-2"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            {isMenuOpen ? (
              <X className="w-6 h-6 text-white" />
            ) : (
              <Menu className="w-6 h-6 text-white" />
            )}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <div className="lg:hidden mt-4 pb-4 border-t border-white/10 pt-4">
            <nav className="flex flex-col space-y-3">
              {menuItems.map((item) => (
                <Link
                  key={item.path}
                  to={item.path}
                  className="text-slate-300 hover:text-white transition-colors duration-200 font-medium py-2"
                  onClick={() => setIsMenuOpen(false)}
                >
                  {item.title}
                </Link>
              ))}
              <a 
                href="https://play.google.com/store/apps/details?id=br.com.digitoinovacao.geniozinho&pcampaignid=web_share"
                target="_blank"
                rel="noopener noreferrer"
                className="w-full"
              >
                <Button className="w-full mt-4 rounded-full bg-amber-500 hover:bg-amber-600 text-slate-950 font-semibold">
                  <Smartphone className="w-4 h-4 mr-2" />
                  Baixe o App
                </Button>
              </a>
            </nav>
          </div>
        )}
      </div>
    </header>
  );
};

export default Header;
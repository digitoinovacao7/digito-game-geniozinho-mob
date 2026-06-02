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
    <header className="fixed top-0 left-0 right-0 bg-background/80 backdrop-blur-sm border-b z-50">
      <div className="container mx-auto px-4 py-3">
        <div className="flex items-center justify-between">
          {/* Logo */}
          <Link to="/" className="flex items-center space-x-2">
            <Logo className="w-10 h-10 text-primary" />
            <span className="font-poppins font-bold text-xl text-foreground">Gêniozinho</span>
          </Link>

          {/* Desktop Navigation */}
          <nav className="hidden lg:flex items-center space-x-6">
            {menuItems.map((item) => (
              <Link
                key={item.path}
                to={item.path}
                className="text-muted-foreground hover:text-primary transition-colors duration-200 font-medium"
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
              <Button variant="outline" className="rounded-full">
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
              <X className="w-6 h-6 text-foreground" />
            ) : (
              <Menu className="w-6 h-6 text-foreground" />
            )}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <div className="lg:hidden mt-4 pb-4 border-t pt-4">
            <nav className="flex flex-col space-y-3">
              {menuItems.map((item) => (
                <Link
                  key={item.path}
                  to={item.path}
                  className="text-muted-foreground hover:text-primary transition-colors duration-200 font-medium py-2"
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
                <Button variant="outline" className="w-full mt-4 rounded-full">
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
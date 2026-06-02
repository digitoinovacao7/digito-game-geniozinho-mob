import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { HelmetProvider } from "react-helmet-async";
import Index from "./pages/Index";
import QuebraCabecasMatematicos from "./pages/QuebraCabecasMatematicos";
import JogosMemoria from "./pages/JogosMemoria";
import DesafiosLogica from "./pages/DesafiosLogica";
import CalculoMental from "./pages/CalculoMental";
import JogosTemáticos from "./pages/JogosTemáticos";
import Sobre from "./pages/Sobre";
import Contato from "./pages/Contato";
import PoliticaPrivacidade from "./pages/PoliticaPrivacidade";
import TermosCondicoes from "./pages/TermosCondicoes";
import PoliticaCookies from "./pages/PoliticaCookies";
import PerguntasFrequentes from "./pages/PerguntasFrequentes";
import ScrollToTop from "./components/ScrollToTop";
import ScrollToTopButton from "./components/ScrollToTopButton";
import WhatsAppButton from "./components/WhatsAppButton";
import NotFound from "./pages/NotFound";

const queryClient = new QueryClient();

const App = () => (
  <HelmetProvider>
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <Toaster />
        <Sonner />
        <BrowserRouter>
          <ScrollToTop />
          <Routes>
            <Route path="/" element={<Index />} />
            <Route path="/quebra-cabecas-matematicos" element={<QuebraCabecasMatematicos />} />
            <Route path="/jogos-memoria" element={<JogosMemoria />} />
            <Route path="/desafios-logica" element={<DesafiosLogica />} />
            <Route path="/calculo-mental" element={<CalculoMental />} />
            <Route path="/jogos-tematicos" element={<JogosTemáticos />} />
            <Route path="/sobre" element={<Sobre />} />
            <Route path="/contato" element={<Contato />} />
            <Route path="/politica-privacidade" element={<PoliticaPrivacidade />} />
            <Route path="/termos-condicoes" element={<TermosCondicoes />} />
            <Route path="/politica-de-cookies" element={<PoliticaCookies />} />
            <Route path="/perguntas-frequentes" element={<PerguntasFrequentes />} />
            <Route path="*" element={<NotFound />} />
          </Routes>
          <ScrollToTopButton />
          <WhatsAppButton />
        </BrowserRouter>
      </TooltipProvider>
    </QueryClientProvider>
  </HelmetProvider>
);

export default App;
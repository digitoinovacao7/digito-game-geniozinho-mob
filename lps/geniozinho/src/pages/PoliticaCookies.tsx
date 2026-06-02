import Header from "@/components/Header";
import Footer from "@/components/Footer";
import useSEO from "@/hooks/useSEO";

const PoliticaCookies = () => {
  useSEO({
    title: "Política de Cookies - Gêniozinho",
    description: "Entenda como o Gêniozinho utiliza cookies para melhorar sua experiência em nosso site e aplicativo.",
    path: "/politica-de-cookies"
  });

  return (
    <div className="min-h-screen bg-gray-50">
      <Header />
      <main className="container mx-auto px-4 py-12 pt-28 max-w-4xl">
        <div className="bg-white p-8 rounded-lg shadow-md">
          <h1 className="font-poppins font-bold text-3xl lg:text-4xl text-gray-900 mb-6">
            Política de Cookies
          </h1>
          <div className="font-inter text-gray-700 space-y-4 leading-relaxed">
            <p>
              <strong>Última atualização:</strong> 30 de setembro de 2025
            </p>
            <p>
              Bem-vindo à Política de Cookies do Gêniozinho. Este documento explica como nós utilizamos cookies e tecnologias similares para reconhecer você quando visita nosso site. Ele explica o que são essas tecnologias e por que as usamos, bem como seus direitos de controlar o uso que fazemos delas.
            </p>

            <h2 className="font-poppins font-semibold text-2xl text-gray-800 pt-4 pb-2">
              O que são cookies?
            </h2>
            <p>
              Cookies são pequenos arquivos de dados que são colocados no seu computador ou dispositivo móvel quando você visita um site. Os cookies são amplamente utilizados pelos proprietários de sites para fazer com que seus sites funcionem, ou para trabalhar de forma mais eficiente, bem como para fornecer informações de relatório.
            </p>

            <h2 className="font-poppins font-semibold text-2xl text-gray-800 pt-4 pb-2">
              Por que usamos cookies?
            </h2>
            <p>
              Nós usamos cookies por várias razões. Alguns cookies são necessários por razões técnicas para que nosso site funcione, e nós nos referimos a eles como cookies "essenciais" ou "estritamente necessários". Outros cookies também nos permitem rastrear e direcionar os interesses de nossos usuários para aprimorar a experiência em nossas Propriedades Online. Usamos cookies para:
            </p>
            <ul className="list-disc list-inside space-y-2 pl-4">
              <li><strong>Funcionalidade do Site:</strong> Para garantir que funcionalidades como login, preferências de idioma e configurações de tema funcionem corretamente.</li>
              <li><strong>Análise e Desempenho:</strong> Para entender como nosso site é usado, medir a eficácia de nossas campanhas de marketing e nos ajudar a personalizar e melhorar nosso site para você.</li>
              <li><strong>Publicidade:</strong> Esses cookies são usados para tornar as mensagens publicitárias mais relevantes para você.</li>
            </ul>

            <h2 className="font-poppins font-semibold text-2xl text-gray-800 pt-4 pb-2">
              Cookies que utilizamos
            </h2>
            <p>
              <strong>Google Analytics:</strong> Usamos o Google Analytics para coletar informações sobre como os visitantes usam nosso site. Nós usamos essas informações para compilar relatórios e nos ajudar a melhorar o site. Os cookies coletam informações de forma anônima, incluindo o número de visitantes do site, de onde os visitantes vieram e as páginas que visitaram.
            </p>
            <p>
              Para mais informações sobre os cookies do Google Analytics, consulte a documentação oficial do Google.
            </p>

            <h2 className="font-poppins font-semibold text-2xl text-gray-800 pt-4 pb-2">
              Como posso controlar os cookies?
            </h2>
            <p>
              Você tem o direito de decidir se aceita ou rejeita cookies. Você pode exercer suas preferências de cookies alterando as configurações do seu navegador. A maioria dos navegadores permite que você recuse a aceitação de cookies e que exclua os cookies existentes.
            </p>
            <p>
              Se você optar por não aceitar cookies, ainda poderá usar nosso site, embora seu acesso a algumas funcionalidades e áreas possa ser restrito.
            </p>

            <h2 className="font-poppins font-semibold text-2xl text-gray-800 pt-4 pb-2">
              Alterações nesta Política de Cookies
            </h2>
            <p>
              Podemos atualizar esta Política de Cookies de tempos em tempos para refletir, por exemplo, alterações nos cookies que usamos ou por outras razões operacionais, legais ou regulamentares. Por favor, revisite esta Política de Cookies regularmente para se manter informado sobre o nosso uso de cookies e tecnologias relacionadas.
            </p>

            <h2 className="font-poppins font-semibold text-2xl text-gray-800 pt-4 pb-2">
              Contato
            </h2>
            <p>
              Se você tiver alguma dúvida sobre nosso uso de cookies ou outras tecnologias, entre em contato conosco através da nossa <a href="/contato" className="text-yellow-600 hover:underline">página de contato</a>.
            </p>
          </div>
        </div>
      </main>
      <Footer />
    </div>
  );
};

export default PoliticaCookies;
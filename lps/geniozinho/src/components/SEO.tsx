import { Helmet } from 'react-helmet-async';

export interface SEOProps {
  title?: string;
  description?: string;
  keywords?: string;
  image?: string;
  url?: string;
  type?: 'website' | 'article' | 'product';
  author?: string;
  publishedTime?: string;
  modifiedTime?: string;
  schema?: 'WebApplication' | 'MobileApplication' | 'Game' | 'Article' | 'WebPage';
}

const SEO = ({
  title = 'Gêniozinho — Desafie sua Mente, Aprenda Brincando',
  description = 'Explore jogos de lógica, memória, cálculo mental e quebra-cabeças matemáticos. Transforme seu tempo livre em crescimento intelectual com o Gêniozinho!',
  keywords = 'jogos educativos, jogos de lógica, quebra-cabeças, cálculo mental, jogos de memória, raciocínio lógico, educação infantil, aprendizado divertido',
  image = 'https://geniozinho.com/og-image.png',
  url = 'https://geniozinho.com',
  type = 'website',
  author = 'Gêniozinho',
  publishedTime,
  modifiedTime,
  schema = 'WebApplication'
}: SEOProps) => {
  const fullTitle = title.includes('Gêniozinho') ? title : `${title} | Gêniozinho`;
  
  // Schema.org JSON-LD
  const getSchemaMarkup = () => {
    const baseSchema = {
      '@context': 'https://schema.org',
      '@type': schema,
      name: 'Gêniozinho',
      description: description,
      url: url,
      image: image,
      author: {
        '@type': 'Organization',
        name: author
      }
    };

    // Adicionar campos específicos para aplicação
    if (schema === 'WebApplication' || schema === 'MobileApplication') {
      return {
        ...baseSchema,
        applicationCategory: 'EducationalApplication',
        operatingSystem: schema === 'MobileApplication' ? 'Android' : 'Web',
        offers: {
          '@type': 'Offer',
          price: '0',
          priceCurrency: 'BRL'
        },
        aggregateRating: {
          '@type': 'AggregateRating',
          ratingValue: '4.8',
          ratingCount: '15420',
          bestRating: '5',
          worstRating: '1'
        },
        contentRating: 'Livre para todos os públicos',
        inLanguage: 'pt-BR',
        featureList: [
          'Jogos de Memória',
          'Quebra-cabeças Matemáticos',
          'Desafios de Lógica',
          'Cálculo Mental',
          'Modo Offline',
          'Sem Anúncios (Premium)'
        ]
      };
    }

    // Para jogos
    if (schema === 'Game') {
      return {
        ...baseSchema,
        '@type': 'VideoGame',
        gameItem: {
          '@type': 'Thing',
          name: title
        },
        playMode: 'SinglePlayer',
        genre: ['Educational', 'Puzzle', 'Brain Training']
      };
    }

    // Para artigos
    if (schema === 'Article') {
      return {
        ...baseSchema,
        headline: title,
        datePublished: publishedTime,
        dateModified: modifiedTime || publishedTime,
        publisher: {
          '@type': 'Organization',
          name: 'Gêniozinho',
          logo: {
            '@type': 'ImageObject',
            url: 'https://geniozinho.com/lovable-uploads/73c4103c-fc4e-49ff-b71d-f7802817a1fe.png'
          }
        }
      };
    }

    return baseSchema;
  };

  return (
    <Helmet>
      {/* Basic Meta Tags */}
      <html lang="pt-BR" />
      <title>{fullTitle}</title>
      <meta name="description" content={description} />
      <meta name="keywords" content={keywords} />
      <meta name="author" content={author} />
      <link rel="canonical" href={url} />

      {/* Open Graph / Facebook */}
      <meta property="og:type" content={type} />
      <meta property="og:url" content={url} />
      <meta property="og:title" content={fullTitle} />
      <meta property="og:description" content={description} />
      <meta property="og:image" content={image} />
      <meta property="og:image:width" content="1200" />
      <meta property="og:image:height" content="630" />
      <meta property="og:locale" content="pt_BR" />
      <meta property="og:site_name" content="Gêniozinho" />
      
      {publishedTime && <meta property="article:published_time" content={publishedTime} />}
      {modifiedTime && <meta property="article:modified_time" content={modifiedTime} />}

      {/* Twitter Card */}
      <meta name="twitter:card" content="summary_large_image" />
      <meta name="twitter:url" content={url} />
      <meta name="twitter:title" content={fullTitle} />
      <meta name="twitter:description" content={description} />
      <meta name="twitter:image" content={image} />
      <meta name="twitter:creator" content="@geniozinho" />
      <meta name="twitter:site" content="@geniozinho" />

      {/* Mobile App Meta Tags */}
      <meta name="mobile-web-app-capable" content="yes" />
      <meta name="apple-mobile-web-app-capable" content="yes" />
      <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
      <meta name="apple-mobile-web-app-title" content="Gêniozinho" />
      <meta name="application-name" content="Gêniozinho" />
      <meta name="theme-color" content="#8B5CF6" />

      {/* Additional SEO Tags */}
      <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1" />
      <meta name="googlebot" content="index, follow" />
      <meta name="google" content="notranslate" />
      <meta name="format-detection" content="telephone=no" />

      {/* Schema.org JSON-LD */}
      <script type="application/ld+json">
        {JSON.stringify(getSchemaMarkup())}
      </script>

      {/* Breadcrumb Schema (se aplicável) */}
      {url !== 'https://geniozinho.com' && (
        <script type="application/ld+json">
          {JSON.stringify({
            '@context': 'https://schema.org',
            '@type': 'BreadcrumbList',
            itemListElement: [
              {
                '@type': 'ListItem',
                position: 1,
                name: 'Home',
                item: 'https://geniozinho.com'
              },
              {
                '@type': 'ListItem',
                position: 2,
                name: title,
                item: url
              }
            ]
          })}
        </script>
      )}

      {/* Organization Schema */}
      <script type="application/ld+json">
        {JSON.stringify({
          '@context': 'https://schema.org',
          '@type': 'Organization',
          name: 'Gêniozinho',
          url: 'https://geniozinho.com',
          logo: 'https://geniozinho.com/lovable-uploads/73c4103c-fc4e-49ff-b71d-f7802817a1fe.png',
          sameAs: [
            'https://www.facebook.com/geniozinho',
            'https://www.instagram.com/geniozinho',
            'https://twitter.com/geniozinho'
          ],
          contactPoint: {
            '@type': 'ContactPoint',
            contactType: 'Customer Service',
            availableLanguage: ['Portuguese']
          }
        })}
      </script>
    </Helmet>
  );
};

export default SEO;

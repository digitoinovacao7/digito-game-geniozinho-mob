import { useEffect } from "react";

interface SEOOptions {
  title: string;
  description?: string;
  path?: string; // canonical path (e.g., "/jogos-memoria")
}

// Simple SEO helper without external dependencies
export default function useSEO({ title, description, path }: SEOOptions) {
  useEffect(() => {
    // Title
    document.title = title;

    // Meta description
    if (description) {
      let meta = document.querySelector("meta[name='description']") as HTMLMetaElement | null;
      if (!meta) {
        meta = document.createElement("meta");
        meta.setAttribute("name", "description");
        document.head.appendChild(meta);
      }
      meta.setAttribute("content", description);
    }

    // Canonical tag
    if (path) {
      const href = `${window.location.origin}${path}`;
      let link = document.querySelector("link[rel='canonical']") as HTMLLinkElement | null;
      if (!link) {
        link = document.createElement("link");
        link.setAttribute("rel", "canonical");
        document.head.appendChild(link);
      }
      link.setAttribute("href", href);
    }
  }, [title, description, path]);
}

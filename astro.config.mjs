// @ts-check
import { defineConfig } from 'astro/config';

import tailwindcss from '@tailwindcss/vite';
import sitemap from '@astrojs/sitemap';
import partytown from '@astrojs/partytown';

import mdx from '@astrojs/mdx';

// https://astro.build/config
export default defineConfig({
  site: 'https://pavelyuruts.com',
  vite: {
    plugins: [tailwindcss()]
  },

  integrations: [
    mdx(),
    sitemap({
      filter: (page) => page !== 'https://pavelyuruts.com/portfolio/dehet-app/privacy-policy'
        && page !== 'https://pavelyuruts.com/portfolio/dehet-app/terms-of-use',
    }),
    partytown({
      config: {
        forward: ["dataLayer.push"],
      },
    }),
  ]
});
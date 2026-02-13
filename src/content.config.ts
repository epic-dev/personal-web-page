import { defineCollection } from "astro:content"
import { file } from "astro/loaders"
import { z } from "astro/zod"

const featuresZod = z.object({
  title: z.string(),
  description: z.string(),
  icon: z.string(),
  coming_soon: z.boolean().optional().default(false),
})

const workflowZod = z.object({
  title: z.string(),
  description: z.string(),
  icon: z.string(),
})

const features = defineCollection({
  loader: file("src/pages/portfolio/dehet-app/data/features.yaml"),
  schema: featuresZod,
})

const workflow = defineCollection({
  loader: file("src/pages/portfolio/dehet-app/data/workflow.yaml"),
  schema: workflowZod,
})

const pricing = defineCollection({
  loader: file("src/pages/portfolio/dehet-app/data/pricing.yaml"),
  schema: z.object({
    id: z.string(),
    name: z.string(),
    price: z.string().optional(),
    annual_price: z.string().optional(),
    one_time_price: z.string().optional(),
    features: z.array(z.string()),
    button: z.object({
      text: z.string(),
      url: z.string(),
    }),
    asterisk: z.string().optional(),
    highlighted: z.boolean().optional(),
  }),
})

export const collections = {
  features,
  workflow,
  pricing,
}
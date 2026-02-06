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

export const collections = {
  features,
  workflow,
}
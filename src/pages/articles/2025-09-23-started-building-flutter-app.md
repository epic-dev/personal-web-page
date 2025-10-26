---
layout: '../../layouts/article.astro'
title: '[Day 1] Started crafting my first Flutter app'
pubDate: 2025-09-23
description: 'This is the first post of my new Astro blog.'
author: 'Pavel Yuruts'
tags: ["astro", "blogging", "learning in public"]

topImage: 
  src: '/images/coding-day1.webp'
  alt: coding-day-1

setup: |
  import { Picture } from "astro-imagetools/components";
---

I've got an idea to help myself learn Dutch. What, where or even how to start? Since I'm a software developer the solution is simple -- let's build an application.

The initial MVP of my first mobile app took me a couple of evenings and numerous cups of coffee. I've chosen Flutter which gave me flexibility to build app for both platforms and full control of what is going on the screen.

So, let's dive in and get closer to the full functional mobile app.

### The idea

Learning Dutch is not that easy and it's not about learning just words and expand your vocabulary. It's also following the rules of grammar.
But sometimes some rules are not obvious or come naturally if you were born in the Netherlands. So, for me as an expat those rules has to be learned by heart.
I mean definitely there are strict rules of where to use De or Het articles but for some of the words you have to just memorise them.

### The soultion

I won't dive into the rules much but it is worth to mention that there are two type of articles in Dutch. As like in English - definite and indefinite. However in Dutch the definite articles consist of two articles De or Het.

So, as I already mentioned some of the words has to be memorised which article they should be used with. The regular way to memorise the word is to read it multiple times and repeat the process next day and later. But what if we can use another method? What about a spatial memory?

For some people it could be easier to remember something if they memorised where it's happend. Imagine you have all the Dutch words with De article on the left side of the screen and Het on the right.

By swiping the card to the correct side might give you an ability to better memorise the combination. As you might see it's not usual memoization of words with articles. The app leverages spatial memory -- meaning you swipe the card with the word in the correct direction. 

![screenshot-1](/images/2025-09-23.png)


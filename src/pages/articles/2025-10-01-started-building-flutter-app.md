---
layout: '../../layouts/article.astro'
title: '[Day 2] Principles'
pubDate: 2025-10-01
description: 'This is the second post of my new Astro blog.'
author: 'Pavel Yuruts'
tags: ["astro", "blogging", "learning in public"]

topImage: 
  src: '/images/coding-day1.webp'
  alt: coding-day-1

setup: |
  import { Picture } from "astro-imagetools/components";
---

I like clean architecture and meaningful solutions. But as it often happened the devil hides in the details. 
From the very beginning I've started thinking about two versions of the app. On a high level they are Free and Pro.

Free app should run with limited functionality, only the core idea which make the app useful, limited set of words to learn. The words will appear randomly and not categorised by topics.
The Pro vesion should include metrics, to allow users to track their progress, set achievemnts and goals. It should has extended set of words categorized by topics. Users should be able to choose the topic to learn the words from.

Okay, let's start with some proof of concept to not to drown in the details.


### Framework

As I mentioned in [previous article](/articles/2025-09-23-started-building-flutter-app) I've chosen Flutter. One codebase - multiple platforms. Flutter community becomes bigger and bigger each day, there are dozens of the widgets and plugins to build beutiful apps.

Flutter also allows me to build different versions of the app based on 'flavors'. Each flavor is jus a set of configurations (bundle IDs, app names, feature flags, etc.). And it became the basis of the project allowing me to play with different settings depending on app version, include/exclude services and functionalities.

### Architecture and services

The app is small and simple and I wanted to keep that simplicity but also wanted to make a room for future maintenance and scale. 
Keeping that in mind I started building the app according to the principles of the clean architecture - separating code into layers, keep components decoupled as much as possible.
Basically, the app has three layers at this moment - domain, presentation and data.

### Domain

The smallest layer in the Free version of the app. The only use case is to swipe the card to the correct side and store the date and time of the latest swipe.
Possibly will be altered during the app development.

### Data

The app is going to work offline, no internet connection needed. User data will be stored on their devices.
All data in the app it's just user settings and words. New device - new setup.

### Presentation

The most interesting layer 'cause this is what users see and interact with. I selected Provider as a state manager for the presentation layer. It allows me to separate user interface with the code that manages the state. Its transparent nature ideally aligns with the concept of the app architecture.



To be continued...

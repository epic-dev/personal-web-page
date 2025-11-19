import defaultTheme from '@tailwindcss/defaultTheme'

export default {
    theme: {
      fontFamily: {
        sans: ['Inter', ...defaultTheme.fontFamily.sans]
      },
      extend: {
        keyframes: {
          fadeIn: {
            from: { opacity: 0, transform: rotateX(0) },
            to: { opacity: 1, transform: 'rotateX(30deg)' },
          },
        },
        animation: {
          fadein: "fadeIn 1.5s ease-in-out forwards",
        },
        animationDelay: {
          '100': '100ms',
          '200': '200ms',
          '300': '300ms',
          '400': '400ms',
          '500': '500ms',
        },
      },
    },
  };
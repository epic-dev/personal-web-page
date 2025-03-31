export default {
    theme: {
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
      },
    },
  };
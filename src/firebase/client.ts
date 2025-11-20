// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAx7tFc1HSH_KKe-lRD3aheMMXU3JR1-sg",
  authDomain: "personal-web-page-1f740.firebaseapp.com",
  projectId: "personal-web-page-1f740",
  storageBucket: "personal-web-page-1f740.firebasestorage.app",
  messagingSenderId: "1080693382343",
  appId: "1:1080693382343:web:3fb6beabe2ec20a2fef2e2",
  measurementId: "G-LQSRGN2WB9"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
export const analytics = getAnalytics(app);
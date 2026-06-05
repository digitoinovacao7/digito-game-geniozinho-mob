import { initializeApp } from "firebase/app";
import { getFirestore } from "firebase/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyD9wWQhiPwZJ7L6ggOtpDxdS92jklQbPjc",
  authDomain: "geniozinho-adf35.firebaseapp.com",
  projectId: "geniozinho-adf35",
  storageBucket: "geniozinho-adf35.firebasestorage.app",
  messagingSenderId: "174614489763",
  appId: "1:174614489763:web:e1ac307bdba3da7e90ad16",
  measurementId: "G-WE303YPQX9"
};

const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);

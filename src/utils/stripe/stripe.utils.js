import { loadStripe } from '@stripe/stripe-js';
// require('dotenv').config('../../.env');
export const stripePromise = loadStripe(
  'pk_test_51L34krKDUjjADCBIBiBzR2GzavumHitefT6T6GvZiyw6bXMicuUpuL2XaGC15OwsaaCTEJUcDzVVAfHNI7KWjVed00x7lGufgZ'
);

// Browser-safe project configuration. This is a Supabase publishable key, not a secret key.
window.SEE_PAY_SUPABASE_CONFIG = {
  url: 'https://bttdrxencafnfzlkcnjl.supabase.co',
  publishableKey: 'sb_publishable_pXqy_hCpcWluWZgtRSG8hQ_AaOxJwpu',
  platformDomain: 'seepay.shop'
};

// Safe to expose: Paystack TEST public key from the supplied keys PDF.
// The current redirect checkout is initialized server-side and does not need this key.
// Never put a Paystack sk_test_ or sk_live_ secret key in browser code.
window.SEE_PAY_PAYMENT_CONFIG = {
  provider: 'paystack',
  publicKey: 'pk_test_6f4adddb729b95938e0cbbbe3df70641c7870fc4',
  mode: 'test'
};
// Never put a Supabase secret/service-role key or Paystack secret key in this file.

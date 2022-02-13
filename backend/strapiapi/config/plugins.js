module.exports = ({ env }) => ({
  email: {
    config: {
      provider: "nodemailer",
      providerOptions: {
        host: env("SMTP_HOST", "smtp.gmail.com"),
        port: env("SMTP_PORT", 465),
        auth: {
          user: env("SMTP_USERNAME", "arielferrera1992@gmail.com"),
          pass: env("SMTP_PASSWORD", "fbcurquqverulnrs"),
        },
        // ... any custom nodemailer options
      },
      settings: {
        defaultFrom: "arielferrera1992@gmail.com",
        defaultReplyTo: "arielferrera1992@gmail.com",
      },
    },
  },
});


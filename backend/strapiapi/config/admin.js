module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '1d39735398577d74c995ebea2e6fa125'),
  },
});

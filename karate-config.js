function fn(){
    var config = {};
    // Base URL
    config.baseUrl = 'https://gorest.co.in/public/v2';
    // Token: preferir variable de entorno GOREST_TOKEN, si no toma el token dado
    config.token = java.lang.System.getenv('GOREST_TOKEN') || '700d0c7a86eb84028bf5cd204b11587f812f9d7cd880dc4edbdbd1d407ae9954';
    return config;
    }
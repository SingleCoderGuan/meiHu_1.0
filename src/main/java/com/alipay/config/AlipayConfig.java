package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
    //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016091400509928";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCUfSimdu60a2jCNf+1+5wJTcoBBwi0Yr1X7/9LA9uQrUzWKWh4MaYzJXOBpCqw+cPiYnCFxj8nFNfYWsp9oF+EsHGq4oLc4ke4gkzVR3KCpYo5l6CFtMh/a8d9NAfVl6jweN+YcE2UlgNgPT3mIwJb5NTWv7rQpgvypeNmxkcvxOgS3GTJtwyEzNm7eR12b7WsrKxG4Vt1onocGH/VwwEE4QwMW6N03TeqAfxxxCL56HfF3lMIMGX7UKOMHo1QxdvboDrCeSc+zhZarzbDDHVGASCPgYeuWnta1fyV1J1vdUKw3HimzV7+cCcoPetvntdVK8oXL/TVWR4vJgInW4iDAgMBAAECggEAW+6NP1q8+QjS6ALEmWf4uC3oFfDD6+KB9bLJ7SirRIx22NT0MA4VJu9V7vqzz7QjGcL2hWwy50BZTkMPwO2Mlbsj9Leea6DQ5KQPa7B7bfWNeZCtunot8+3HqXWQMCZgWtmLHXbSIV8rIedorlYYfMpVF8vGnq1fElCwVI4HvsOJq0T8X3H5Fm8bA0KL7TA3Impp6sSUE97JOWjyIGKjYv7YF0/dQuOElcouD4wiu3+LPrrObb3rV0HuT/1qFSGUcUBKJDMtDD82YL31mGmLVrd/qV0cF4Kuqd5FWt5uSOhg7WabM33zHpUKfEdiy4CavSdQyUsz9GjWB9OSHK/CWQKBgQDHeQbXkrZ34P9dbbXskcEzti6uGiLw7Tqhe404xF5v4O1kzLlPQiEmT8lszVED61v+fN1z7+XOWXtdqVURSANCDKfjP0SRW+iXvGT6gdDHtn0rMu+tn+t74OKhCp5B3QKByxGFgMTmE8/Ywu/f80yuUAb2Ed4hdVlsPUht/36OzwKBgQC+kXOIVCfG50xjWSDYWaYiGGa1ndw1q7ApsBUyEyX3rNy5ics/V1e1gYXoZabmZs7OGxCmaJzoxmZtc7hEFg/zAq7N72BdO38SXRMsBMUqY3cFoLsHnKjKQp5Rw3RvGOOXExvwQ7yBI/bRqKUWaf8G/twE65v6NHQMaoB/en84DQKBgE4GPjHmlm8v2FOQTX/6x2rV0U6StKYu9ScjL+tLjHEQt2sdVUL2aAcXYH+plA4HaxWRfAIUjXx4rfPF/5th4rxcPPN71PNS0xk/PPRsAOGNtUpHg08T5cWwApXhlGPI8mkYqILjCqHAkCWGotOj1JO+g+qOtKe7wj2/fuxf6v4rAoGAQI8R7qtj1lRhYn69S84DJCXUFc7m3R/OzDCk3ZPzFtbu58QwoMK8Kfc5ICPfyMonYVd16ooiLhGYfZfoYth+irrr8UQZBzyyrcvuRMlQ6i1MExICim+eFvc+n0Bx33k1EOceXeT0pWNDqH9TfiZmiT4p11jiPH8smVAzO/yJwLkCgYAp128tBSXdIK0b+44fG1hXNqVxSOC1ffG5eFralGqg3YJ2WMiHD5KtpzU+LcLQKRjR+Z0jdvGmWeoAwWjCg9mNbkEKB9w7BnKWgQCqtEKQlnLoIx6m6mGvKBH5UqQaoYqM9+neW3teNQsfvZYOxD59PcPUy1jYOfLcXC6ufCvacw==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlH0opnbutGtowjX/tfucCU3KAQcItGK9V+//SwPbkK1M1iloeDGmMyVzgaQqsPnD4mJwhcY/JxTX2FrKfaBfhLBxquKC3OJHuIJM1UdygqWKOZeghbTIf2vHfTQH1Zeo8HjfmHBNlJYDYD095iMCW+TU1r+60KYL8qXjZsZHL8ToEtxkybcMhMzZu3kddm+1rKysRuFbdaJ6HBh/1cMBBOEMDFujdN03qgH8ccQi+eh3xd5TCDBl+1CjjB6NUMXb26A6wnknPs4WWq82wwx1RgEgj4GHrlp7WtX8ldSdb3VCsNx4ps1e/nAnKD3rb57XVSvKFy/01VkeLyYCJ1uIgwIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/meiHu_1.0/jsp/index.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";



}

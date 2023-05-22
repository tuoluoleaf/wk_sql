-- 用户密码：HEX(AES_ENCRYPT(#{password},#{username}))

select HEX(AES_ENCRYPT('abc123456','admin')) from dual;